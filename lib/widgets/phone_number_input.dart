import 'package:contacts/models/country_model.dart';
import 'package:contacts/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class PhoneNumberInput extends StatefulWidget {
  final String? number;
  final String? initialCountryCode;
  final ValueChanged<({String? number, CountryModel? country})> onSave;

  const PhoneNumberInput({
    super.key,
    this.number,
    this.initialCountryCode,
    required this.onSave,
  });

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  late CountryModel selectedCountry;
  late final TextEditingController numberController;

  final _maskFormatter = MaskTextInputFormatter(
    mask: '(###) ###-####',
    filter: {"#": RegExp(r'[0-9]')},
  );
  @override
  void initState() {
    super.initState();
    selectedCountry = countries.firstWhere(
      (country) => country.code == widget.initialCountryCode,
      orElse: () => countries.firstWhere((c) => c.code == '+1'),
    );

    final formattedNumber = _maskFormatter.maskText(widget.number ?? '');
    numberController = TextEditingController(text: formattedNumber);
  }

  @override
  void didUpdateWidget(covariant PhoneNumberInput oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialCountryCode != oldWidget.initialCountryCode) {
      setState(() {
        selectedCountry = countries.firstWhere(
          (country) => country.code == widget.initialCountryCode,
          orElse: () => countries.firstWhere((c) => c.code == '+1'),
        );
      });
    }

    if (widget.number != oldWidget.number) {
      final formattedNumber = _maskFormatter.maskText(widget.number ?? '');
      numberController.value = numberController.value.copyWith(
        text: formattedNumber,
        selection: TextSelection.collapsed(offset: formattedNumber.length),
      );
    }
  }

  @override
  void dispose() {
    numberController.dispose();
    super.dispose();
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
              onChanged: (CountryModel? newValue) {
                if (newValue != null) {
                  setState(() {
                    selectedCountry = newValue;
                  });
                }
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
              controller: numberController,
              keyboardType: TextInputType.phone,
              inputFormatters: [_maskFormatter],
              validator: (value) {
                final rawText = numberController.text.replaceAll(
                  RegExp(r'[^0-9]'),
                  '',
                );
                if (rawText.length != 10) {
                  return "Please enter a valid 10-digit number.";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Enter number',
                hintText: '(###) ###-####',
                border: InputBorder.none,
              ),
              onSaved: (value) {
                widget.onSave((
                  number: _maskFormatter.getUnmaskedText(),
                  country: selectedCountry,
                ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
