const knex = require("../DB/db.js");
let express = require("express");
let router = express.Router();

const bcrypt = require("bcrypt");
const uuid = require("uuid");
const mailService = require("../service/mail-service");
const tokenService = require("../service/token-service");

const userDTO = require("../dtos/user-dto");

const ApiError = require("../exeptions/api-error");

const { body, validationResult } = require("express-validator");

const authMiddleware = require("../middlewares/auth-middleware");

//all-user-routes
// router.get("/photo/:PhotoID", async (req, res) => {  const id = req.params.PhotoID || 0;
//
//     try {
//         const photo = await ("photo").where("PhotoID", id).first();
//         res.setHeader("Content-Type", photo.type);
//         res.sendFile(photo.path);  }
//     catch (error) {
//         console.error(error);
//         res.sendStatus(500);
//     }});

router.get("/products", async (req, res, next) => {
  try {
    const products = await knex.select("*").from("Products");
    res.send(products);
  } catch (e) {
    next(e);
  }
});

router.get("/products/:id", async (req, res) => {
  try {
    const id = req.params.id;
    const product = await knex
      .select("*")
      .from("Products")
      .where("ProductID", id);
    res.send(product);
  } catch (e) {
    next(e);
  }
});

//authorization-routes

router.post("/set-password/:id", async (req, res, next) => {
  try {
    const userID = req.params.id;
    const hashPassword = await bcrypt.hash(req.body.password, 3);
    await knex("Users")
      .update("Password", hashPassword)
      .where("UserID", userID);
    res.send("Ура");
  } catch (e) {
    next(e);
  }
});

// * Запрос на сброс пароля
router.post("/recovery-code", async (req, res, next) => {
  try {
    const { email } = req.body;
    const currentUser = (
      await knex.select("*").from("Users").where("Email", email)
    )[0];
    const code = Math.floor(100000 + Math.random() * 900000);
    await knex("Users")
      .update("code", code)
      .where("UserID", currentUser.UserID);
    await mailService.sendCode(email, code);
    res.status(204).end();
  } catch (e) {
    next(e);
  }
});

// body для запроса
//  {
//     "code": number,
//     "password": "string"
// }

router.post("/recovery", authMiddleware, async (req, res, next) => {
  try {
    // * password - новый пароль
    const { code, password } = req.body;
    const currentUser = (
      await knex.select("*").from("Users").where("code", code)
    )[0];
    if (!currentUser) throw ApiError.UnauthorizedError();
    if (+code !== currentUser.code) throw ApiError.BadRequest("Неверный код");
    const hashPassword = await bcrypt.hash(password, 3);
    const updateData = {
      Password: hashPassword,
      code: null,
    };
    await knex("Users").update(updateData).where("UserID", currentUser.UserID);
    res.status(204).end();
  } catch (e) {
    next(e);
  }
});


router.post(
  "/registration",

  async (req, res, next) => {
    const users = await knex.select("Email", "Login").from("Users");

    try {
      const hasDuplicates = await users.some(function (currentObject) {
        const email = currentObject.Email.toLowerCase() === req.body.email;
        const login = currentObject.Login.toLowerCase() === req.body.login;
        return email || login;
      });

      if (hasDuplicates) {
        throw ApiError.BadRequest(`Пользователь уже зарегестрирован`);
      }

      const hashPassword = await bcrypt.hash(req.body.password, 3);
      const activationLink = uuid.v4();

      await knex("Users").insert({
        Login: req.body.login,
        Password: hashPassword,
        FIO: req.body.fio,
        Email: req.body.email,
        ActivationLink: activationLink,
      });

      await mailService.sendActivationMail(
        req.body.email,
        `${process.env.API_URL}/api/activate/${activationLink}`
      );

      const currentUser = await knex
        .select("*")
        .from("Users")
        .where("Login", req.body.login);

      const userdto = new userDTO(currentUser[0]);
      const tokens = tokenService.generateTokens({ ...userdto });
      await tokenService.saveToken(userdto.UserID, tokens.refreshToken);

      res.cookie("refreshToken", tokens.refreshToken, {
        maxAge: 30 * 24 * 60 * 60 * 1000,
        httpOnly: true,
      });
      res.send({ ...tokens, user: userdto });
    } catch (e) {
      next(e);
    }
  }
);
router.post("/login", async (req, res, next) => {
  try {
    const user = await knex
      .select("*")
      .from("Users")
      .where("Email", req.body.email);

    if (!user[0]) {
      throw ApiError.BadRequest("Пользователь с такой эл. почтой не найден");
    }

    const isPassEquals = await bcrypt.compare(
      req.body.password,
      user[0].Password
    );
    if (!isPassEquals) {
      throw ApiError.BadRequest("Неверный пароль");
    }

    const userdto = new userDTO(user[0]);
    const tokens = tokenService.generateTokens({ ...userdto });
    await tokenService.saveToken(userdto.UserID, tokens.refreshToken);

    res.cookie("refreshToken", tokens.refreshToken, {
      maxAge: 30 * 24 * 60 * 60 * 1000,
      httpOnly: true,
    });
    res.send({ ...tokens, user: userdto });
  } catch (e) {
    next(e);
  }
});
router.post("/logout", async (req, res, next) => {
  try {
    const { refreshToken } = req.cookies;
    await tokenService.removeToken(refreshToken);
    res.clearCookie("refreshToken");
    return res.send("Логаут успешен");
  } catch (e) {
    next(e);
  }
});
router.get("/activate/:link", async (req, res, next) => {
  try {
    const user = await knex
      .select("ActivationLink")
      .from("Users")
      .where("ActivationLink", req.params.link);

    if (!user) {
      throw ApiError.BadRequest("Неккоректная ссылка активации");
    }

    await knex
      .select("Activation")
      .from("Users")
      .where("ActivationLink", req.params.link)
      .update("Activation", true);

    return res.redirect(process.env.CLIENT_URL);
  } catch (e) {
    next(e);
  }
});
router.get("/refresh", async (req, res, next) => {
  try {
    const { refreshToken } = req.cookies;

    if (!refreshToken) {
      throw ApiError.UnauthorizedError();
    }

    const userData = tokenService.validateRefreshToken(refreshToken);
    const tokenFromDB = await tokenService.findToken(refreshToken);
    if (!userData || !tokenFromDB) {
      throw ApiError.UnauthorizedError();
    }

    console.log(userData);
    const user = await knex
      .select("*")
      .from("Users")
      .where("UserID", userData.UserID);

    const userdto = new userDTO(user[0]);
    const tokens = tokenService.generateTokens({ ...userdto });
    await tokenService.saveToken(userdto.UserID, tokens.refreshToken);

    res.cookie("refreshToken", tokens.refreshToken, {
      maxAge: 30 * 24 * 60 * 60 * 1000,
      httpOnly: true,
    });
    res.send({ ...tokens, user: userdto });
  } catch (e) {
    next(e);
  }
});

//test-endpoints

router.get("/users", authMiddleware, async (req, res, next) => {
  try {
    const users = await knex.select("*").from("Users");

    res.send(users);
  } catch (e) {
    next(e);
  }
});

//cart-endpoints

router.post("/create-order", async (req, res, next) => {
  try {
    const id = uuid.v4();
    await knex("orders").insert({
      id: id,
      user_id: req.body.user_id,
      product_id: req.body.product_id,
      address: req.body.address,
      status_id: 1,
      FIO: req.body.FIO,
    });

    setTimeout(async () => {
      await knex("orders").update("status_id", 2).where("id", id);
    }, 15000);

    setTimeout(async () => {
      await knex("orders").update("status_id", 3).where("id", id);
    }, 30000);

    res.send("URA!!!!!");
  } catch (e) {
    next(e);
  }
});

router.get("/orders/:id", authMiddleware, async (req, res, next) => {
  try {
    const userID = req.params.id;
    const orders = await knex
      .select("*")
      .from("orders")
      .leftJoin("statuses", "orders.status_id", "statuses.id")
      .leftJoin("Products", "orders.product_id", "Products.ProductID")
      .where("user_id", userID);

    res.send(orders);
  } catch (e) {
    next(e);
  }
});

router.post("/cart", authMiddleware, async (req, res, next) => {
  try {
    const cart = await knex
      .select("*")
      .from("cart")
      .where("user_id", req.body.id);

    if (!cart[0]) await knex("cart").insert({ user_id: req.body.id });

    res.send(cart);
  } catch (e) {
    next(e);
  }
});

module.exports = router;
