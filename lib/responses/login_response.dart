class LoginResponse {
  late String token;
  late String status;

  LoginResponse(Map<String, dynamic> response) {
    token = response["token"];
    status = response["status"];
  } 
}