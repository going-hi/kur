import React from "react";
import "../styles/globalStyles.css";
import UsersTableItem from "./UsersTableItem";
const UsersTable = (props) => {
  return (
    <div>
      <h3>Все пользователи</h3>
      <table className={"table"}>
        <thead>
          <tr>
            <th>UserID</th>
            <th>Login</th>
            <th>Email</th>
            <th>FIO</th>
            <th>Activation</th>
            <th>Admin</th>
            <th>Заказы</th>
          </tr>
        </thead>
        <tbody>
          {props.users.map(({ ...props }, index) => {
            return <UsersTableItem props={props} key={props.UserID} />;
          })}
        </tbody>
      </table>
    </div>
  );
};

export default UsersTable;
