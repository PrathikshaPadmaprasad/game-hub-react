import axios from "axios";

export default axios.create({
  baseURL: "https://api.rawg.io/api",
  params: {
    key: "9166157c9e0b432b93924c1872e69dce",
  },
});
