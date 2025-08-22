class ContactsModel {
  final int id;
  final String? name;
  final String? email;
  final String? number;
  final String? flag;
  final String? countryCode;
  final String? countryName;

  ContactsModel({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.flag,
    required this.countryCode,
    this.countryName,
  });
}
