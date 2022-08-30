class FakeUser {
  late final int id;
  late final String firstName;
  late final String lastName;
  late final String email;
  late final String avatar;

  FakeUser({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.avatar,
  });

  @override
  String toString() {
    return "$id/$firstName/$lastName/$email/$avatar";
  }
}
