class UserResponse {
  late List<Map<String, dynamic>> data;

  UserResponse(List<Map<String, dynamic>> response) {
    data = List<Map<String, dynamic>>.from(response);
  }
}