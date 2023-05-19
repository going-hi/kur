import { ErrorMessage, Field, Form, Formik } from "formik";
import * as Yup from "yup";
import AuthService from "../services/AuthService";
import React, { useEffect, useState } from "react";
import "../styles/globalStyles.css";

const FormRecoveryPassword = ({ setAuthForm }) => {
  const { recoveryPassword } = AuthService();
  const [error, setError] = useState("");

  const handleSubmit = async (code, password) => {
    try {
      const res = await recoveryPassword(code, password);
      console.log(res);
      setAuthForm(`auth`);
      document.body.style.overflow = "auto";
    } catch (e) {
      setError(e.response.data.message);
    }
  };

  useEffect(() => {
    return () => {
      setError("");
    };
  }, []);

  return (
    <Formik
      initialValues={{
        password: "",
        code: "",
      }}
      validationSchema={Yup.object({
        password: Yup.string()
          .min(6, "Длина пароля должна быть больше 6 символов!")
          .required("Обязательное поле!"),
        code: Yup.string().required("Обязательное поле!"),
      })}
      onSubmit={(values) => console.log(JSON.stringify(values))}
    >
      {({ values, isValid, dirty, isSubmitting, resetForm }) => (
        <>
          <Form>
            <div>
              <div style={{ display: "flex", justifyContent: "center" }}>
                <div style={{ display: "grid" }}>
                  <label className={"input"}>Пароль</label>
                  <Field
                    name={"password"}
                    className="custom-input"
                    id={"email"}
                    password="&nbsp;"
                  />

                  <ErrorMessage
                    className={"errorMessage"}
                    name={"password"}
                    component={"div"}
                  />
                  <label className={"input"}>Код</label>
                  <Field
                    name={"code"}
                    className="custom-input"
                    id={"code"}
                    placeholder="&nbsp;"
                  />

                  <ErrorMessage
                    className={"errorMessage"}
                    name={"code"}
                    component={"div"}
                  />
                </div>
              </div>
            </div>
            {error.length > 0 ? (
              <p
                className={"errorMessage"}
                style={{ textAlign: "center", paddingTop: "1rem" }}
              >
                {error}
              </p>
            ) : null}
            <div className="center">
              <button
                type={"submit"}
                disabled={!(isValid && dirty) || isSubmitting}
                onClick={async () => {
                  isSubmitting = true;
                  await handleSubmit(values.email, values.password);
                  setTimeout(() => resetForm(), 500);
                }}
                className="register-button"
              >
                Подтвердить
              </button>
            </div>
          </Form>
        </>
      )}
    </Formik>
  );
};

export default FormRecoveryPassword;
