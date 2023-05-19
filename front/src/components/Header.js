import React, { useEffect, useState } from "react";
import { Navbar, Nav, Container } from "react-bootstrap";
import "../styles/globalStyles.css";
import FormAuth from "./FormAuth";
import Modal from "react-modal";
import FormRegister from "./FormRegister";
import { useDispatch, useSelector } from "react-redux";
import { useNavigate } from "react-router-dom";
import AuthService from "../services/AuthService";
import { loginUser, setAuth } from "../actions/actions";
import FormRecoveryCode from "./FormRecoveryCode";
import FormRecoveryPassword from "./FormRecoveryPassword";

const Header = () => {
  const { curUser, isAuth } = useSelector((state) => state);
  const [isOpen, setIsOpen] = useState(false);
  const [authForm, setAuthForm] = useState(`auth`);
  const navigate = useNavigate();
  const { logout } = AuthService();
  const dispatch = useDispatch();

  useEffect(() => {
    if (curUser) closeModal();
  }, [curUser]);

  function openModal() {
    setIsOpen(true);
  }

  function closeModal() {
    setIsOpen(false);
  }

  function currentStateModal() {
    if (authForm === `auth`) {
      return (
        <>
          <div style={{ position: "absolute", top: "2%" }}>
            <h1 className={"auth_1"}>Авторизация</h1>
          </div>
          <div>
            <FormAuth />
            <div className="center">
              <button onClick={() => setAuthForm(`register`)} className="auth">
                Зарегистрироваться
              </button>
              <button
                onClick={() => setAuthForm(`recovery-code`)}
                className="auth"
              >
                Восстановить пароль
              </button>
            </div>
          </div>
        </>
      );
    }

    if (authForm === `register`) {
      return (
        <>
          <div style={{ position: "absolute", top: "2%" }}>
            <h1 className={"registration"}>Регистрация</h1>
          </div>
          <FormRegister />
        </>
      );
    }

    if (authForm === `recovery-code`) {
      return (
        <>
          <div style={{ position: "absolute", top: "2%" }}>
            <h1 className={"registration"}>Восстановление пароля</h1>
          </div>
          <FormRecoveryCode setAuthForm={setAuthForm} />
        </>
      );
    }
    if (authForm === `recovery-password`) {
      return (
        <>
          <div style={{ position: "absolute", top: "2%" }}>
            <h1 className={"registration"}>Восстановление пароля</h1>
          </div>
          <FormRecoveryPassword setAuthForm={setAuthForm} />
        </>
      );
    }
  }

  return (
    <header>
      <Navbar bg="light" variant="light" expand="lg" collapseOnSelect>
        <Container>
          <Navbar.Brand href="/">
            <img src={require("../img/logo.png")} width="90" />
          </Navbar.Brand>
          <Navbar.Toggle aria-controls="basic-navbar-nav" />
          <Navbar.Collapse id="basic-navbar-nav">
            <Nav className="ms-auto">
              <Modal
                ariaHideApp={false}
                isOpen={isOpen}
                onAfterOpen={() => (document.body.style.overflow = "hidden")}
                onRequestClose={() => {
                  document.body.style.overflow = "auto";
                  closeModal();
                  setAuthForm(`auth`);
                }}
                style={{
                  content: {
                    width: "50%",
                    height: "75%",
                    top: "50%",
                    left: "50%",
                    transform: "translate(-50%, -50%)",
                    borderWeight: "110px",
                    borderColor: "#C7357A",
                    display: "flex",
                    alignItems: "center",
                    justifyContent: "center",
                    position: "relative",
                    boxShadow: "0 0 15px rgba(0,0,0,.25)",
                  },
                  overlay: {
                    backgroundColor: "rgba(0,0,0,.4)",
                    backdropFilter: "blur(1px)",
                  },
                }}
              >
                {currentStateModal()}
              </Modal>
              <Nav.Link href="/For_whom">Для кого</Nav.Link>
              <Nav.Link href="/Catalog">Каталог</Nav.Link>
              {curUser && isAuth && curUser.Admin ? (
                <Nav.Link href="/admin">Админ-панель</Nav.Link>
              ) : null}
              {curUser && isAuth ? (
                <Nav.Link onClick={() => navigate("/Profile")}>
                  Профиль
                </Nav.Link>
              ) : (
                <button onClick={openModal} className={"vhod"}>
                  Войти
                </button>
              )}
              {curUser && isAuth ? (
                <button
                  onClick={() => {
                    logout();
                    dispatch(loginUser({}));
                    dispatch(setAuth(false));
                    navigate("/");
                    setAuthForm(false);
                  }}
                  className={"vhod"}
                >
                  Выйти
                </button>
              ) : null}
            </Nav>
          </Navbar.Collapse>
        </Container>
      </Navbar>
    </header>
  );
};

export default Header;
