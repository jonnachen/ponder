library routes;

const String mode = "staging";
const String path = mode == "staging"
    ? "https://shielded-hollows-00058.herokuapp.com/api/"
    : "http://localhost:3000/api/";
