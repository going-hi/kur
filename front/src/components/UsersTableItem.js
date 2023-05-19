import React, { useState } from "react";
import AdminService from "../services/AdminService";

const UsersTableItem = ({ props }) => {
  const { changeRole } = AdminService();
  const [role, setRole] = useState(props.Admin);

  function handleClick() {
    setRole(!role);
    console.log(role);
    changeRole(+props.UserID, !role);
  }

  return (
    <tr>
      <td>{props.UserID}</td>
      <td>{props.Login}</td>
      <td>{props.Email}</td>
      <td>{props.FIO}</td>
      <td>{props.Activation ? "Да" : "Нет"}</td>
      <td className="click" onClick={() => handleClick()}>
        {role ? "Да" : "Нет"}
      </td>
      {props.orders[0] ? (
        <>
          <td>
            <thead>
              <tr>
                <th style={{ border: `none`, borderRadius: 0 }}>Name</th>
                <th style={{ border: `none`, borderRadius: 0 }}>Price</th>
                <th style={{ border: `none`, borderRadius: 0 }}>Date</th>
              </tr>
            </thead>
            <tbody>
              {props.orders.map((order) => {
                return (
                  <tr>
                    <td style={{ border: `none` }}>{order.Name}</td>
                    <td style={{ border: `none` }}>{order.Price}</td>
                    <td style={{ border: `none` }}>{order.date}</td>
                  </tr>
                );
              })}
            </tbody>
          </td>
        </>
      ) : (
        <>
          <td style={{ textAlign: "center" }}>Заказов нет</td>
        </>
      )}
    </tr>
  );
};

export default UsersTableItem;
