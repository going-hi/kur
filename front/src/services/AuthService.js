import $api from "../http";
import React from "react";

const AuthService = () => {
  const login = async (email, password) => {
    return $api.post("/login", { email, password });
  };

  const registration = async (login, password, fio, email) => {
    return $api.post("/registration", { login, password, fio, email });
  };

  const logout = async () => {
    return $api.post("/logout");
  };

  const setPassword = async (id, password) => {
    return $api.post(`/set-password/${id}`, { password });
  };

  const recoveryCode = async (email) => {
    return $api.post(`/recovery-code/`, { email });
  };

  const recoveryPassword = async (code, password) => {
    return await $api.post(`/recovery/`, { code, password });
  };

  return {
    login,
    registration,
    logout,
    setPassword,
    recoveryCode,
    recoveryPassword,
  };
};

export default AuthService;
