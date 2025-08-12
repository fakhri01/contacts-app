class CountryModel {
  final String? name;
  final String? code;
  final String? flag;

  CountryModel({required this.name, required this.code, required this.flag});
}

final List<CountryModel> countries = [
  CountryModel(name: 'United States', code: '+1', flag: '🇺🇸'),
  CountryModel(name: 'United Kingdom', code: '+44', flag: '🇬🇧'),
  CountryModel(name: 'Canada', code: '+1', flag: '🇨🇦'),
  CountryModel(name: 'Germany', code: '+49', flag: '🇩🇪'),
  CountryModel(name: 'France', code: '+33', flag: '🇫🇷'),
  CountryModel(name: 'Japan', code: '+81', flag: '🇯🇵'),
  CountryModel(name: 'India', code: '+91', flag: '🇮🇳'),
  CountryModel(name: 'Turkey', code: '+90', flag: '🇹🇷'),
  CountryModel(name: 'Brazil', code: '+55', flag: '🇧🇷'),
  CountryModel(name: 'Azerbaijan', code: '+994', flag: '🇦🇿'),
];
