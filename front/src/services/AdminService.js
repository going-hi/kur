import $api from "../http";

const AdminService = () => {
  const fetchUsers = async () => {
    return $api.get("/users");
  };

  const changeRole = async (id, isAdmin) => {
    return await $api.post("/set-role", { id, isAdmin });
  };

  return { fetchUsers, changeRole };
};

export default AdminService;
