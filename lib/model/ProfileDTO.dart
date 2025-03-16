class ProfileDTO {
  final String name;
  final String imageName;
  final String phone;
  final String email;
  bool biometric;
  final String address;

  ProfileDTO({
    required this.name,
    required this.imageName,
    required this.phone,
    required this.email,
    required this.biometric,
    required this.address,
  });
}
