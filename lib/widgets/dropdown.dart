import 'package:flutter/material.dart';

class DropDownList extends StatelessWidget {
  const DropDownList({
    Key? key,
    required this.selectedDropDown,
    required this.listSuhu,
    required this.onChanged,
  }) : super(key: key);

  final String selectedDropDown;
  final List<String> listSuhu;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      value: selectedDropDown,
      items: listSuhu.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
