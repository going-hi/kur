import $api from "../http";
import React from "react";

const ProductService = () => {
  const product = async (name, idProd) => {
    return $api.post("/product", { name, idProd });
  };

  const takeProductByID = async (id) => {
    const pr = await $api.get(`/products/${id}`);
    console.log(pr.data[0]);
    return pr;
  };

  const createOrder = async (user_id, product_id, FIO, address) => {
    return $api.post("/create-order", { user_id, product_id, FIO, address });
  };

  const takeOrders = async (id) => {
    return $api.get(`/orders/${id}`);
  };

  return { takeProductByID, createOrder, takeOrders };
};

export default ProductService;
