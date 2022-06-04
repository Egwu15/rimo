import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_picker_dropdown.dart';
import 'package:country_pickers/utils/utils.dart';
import 'package:flutter/material.dart';

import '../colors.dart';

typedef StringCallback = void Function(String val);

class CountryPicker extends StatelessWidget {
  const CountryPicker({Key? key, required this.callback}) : super(key: key);

  final StringCallback callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2.0, color: ColorsDefault.blue),
          borderRadius: BorderRadius.circular(
            10.0,
          )),
      child: CountryPickerDropdown(
        iconSize: 0.0,
        initialValue: 'AR',
        itemBuilder: _buildDropdownItem,
        priorityList: [
          CountryPickerUtils.getCountryByIsoCode('GB'),
          CountryPickerUtils.getCountryByIsoCode('CN'),
        ],
        sortComparator: (Country a, Country b) =>
            a.isoCode.compareTo(b.isoCode),
        onValuePicked: (Country country) {
          callback("+${country.phoneCode}");
        },
      ),
    );
  }
}

Widget _buildDropdownItem(Country country) => Row(
      children: <Widget>[
        // CountryPickerUtils.getDefaultFlagImage(country),
        const SizedBox(
          width: 8.0,
        ),
        Text(
          "${country.isoCode} (+${country.phoneCode})",
        ),
      ],
    );
