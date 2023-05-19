import { ErrorMessage, Field, Form, Formik } from "formik";
import * as Yup from "yup";
import AuthService from "../services/AuthService";
import React, { useEffect, useState } from "react";
import "../styles/globalStyles.css";
import { useDispatch } from "react-redux";
import { loginUser, setAuth } from "../actions/actions";

const FormRecoveryCode = ({ setAuthForm }) => {
  // const dispatch = useDispatch()
  const { recoveryCode } = AuthService();
  const [error, setError] = useState("");

  const handleSubmit = async (email) => {
    try {
      await recoveryCode(email);
      setAuthForm(`recovery-password`);
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
        email: "",
      }}
      validationSchema={Yup.object({
        email: Yup.string()
          .email("Некорректная эл. почта!")
          .required("Обязательное поле!"),
      })}
      onSubmit={(values) => console.log(JSON.stringify(values))}
    >
      {({ values, isValid, dirty, isSubmitting, resetForm }) => (
        <>
          <Form>
            <div>
              <div style={{ display: "flex", justifyContent: "center" }}>
                <div style={{ display: "grid" }}>
                  <label className={"input"}>Эл. почта</label>
                  <Field
                    name={"email"}
                    className="custom-input"
                    id={"email"}
                    placeholder="&nbsp;"
                  />

                  <ErrorMessage
                    className={"errorMessage"}
                    name={"email"}
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

export default FormRecoveryCode;
