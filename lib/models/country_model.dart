class CountryModel {
  final String? id;
  final String? name;
  final String? code;
  final String? flag;

  CountryModel({
    required this.id,
    required this.name,
    required this.code,
    required this.flag,
  });
}

final List<CountryModel> countries = [
  CountryModel(name: 'United States', code: '+1', flag: '🇺🇸', id: 'US'),
  CountryModel(name: 'United Kingdom', code: '+44', flag: '🇬🇧', id: 'UK'),
  CountryModel(name: 'Canada', code: '+1', flag: '🇨🇦', id: 'CA'),
  CountryModel(name: 'Germany', code: '+49', flag: '🇩🇪', id: 'DE'),
  CountryModel(name: 'France', code: '+33', flag: '🇫🇷', id: 'FR'),
  CountryModel(name: 'Japan', code: '+81', flag: '🇯🇵', id: 'JP'),
  CountryModel(name: 'India', code: '+91', flag: '🇮🇳', id: 'IN'),
  CountryModel(name: 'Turkey', code: '+90', flag: '🇹🇷', id: 'TR'),
  CountryModel(name: 'Brazil', code: '+55', flag: '🇧🇷', id: 'BR'),
  CountryModel(name: 'Azerbaijan', code: '+994', flag: '🇦🇿', id: 'AZ'),
];
