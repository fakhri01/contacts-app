import 'package:contacts/models/country_model.dart';
import 'package:contacts/util/constants.dart';
import 'package:flutter/material.dart';

class PhoneNumberInput extends StatefulWidget {
  final String? number;
  final ValueChanged<String?> onSave;
  const PhoneNumberInput({super.key, this.number, required this.onSave});

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  late CountryModel selectedCountry;
  @override
  void initState() {
    super.initState();
    selectedCountry = countries.last;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(width: 1, color: textSecondary),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton<CountryModel>(
              value: selectedCountry,
              icon: Icon(
                Icons.keyboard_arrow_down_outlined,
                color: textSecondary,
              ),
              onChanged: (CountryModel? newValue) => {
                if (newValue != null)
                  setState(() {
                    selectedCountry = newValue;
                  }),
              },
              items: countries.map<DropdownMenuItem<CountryModel>>((
                CountryModel country,
              ) {
                return DropdownMenuItem<CountryModel>(
                  value: country,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Text(country.flag!, style: TextStyle(fontSize: 22)),
                        SizedBox(width: 8),
                        Text(country.code!, style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextFormField(
              keyboardType: TextInputType.phone,
              initialValue: widget.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter a valid number";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Enter number',
                border: InputBorder.none,
              ),
              onSaved: widget.onSave,
            ),
          ),
        ],
      ),
    );
  }
}
