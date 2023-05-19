const ApiError = require("../exeptions/api-error");

module.exports = function (req, res, next) {
    try {
       const {Admin} = req.user
       console.log(Admin)
       if(!Admin) return next(ApiError.Forbidden())
       next()
    } catch (e) {
        return next(ApiError.UnauthorizedError());
    }
}
