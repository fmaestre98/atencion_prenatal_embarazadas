import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void safePrint(dynamic value) {
  if (kDebugMode) {
    print('my-logs $value');
  }
}



Widget buildRadioGroup(
    String question, bool? value, Function(String?) onChanged) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(question),
      Row(
        children: [
          Radio<String>(
            toggleable: true,
            value: 'Sí',
            groupValue: getValueFromBool(value),
            onChanged: onChanged,
          ),
          const Text('Sí'),
          Radio<String>(
            toggleable: true,
            value: 'No',
            groupValue: getValueFromBool(value),
            onChanged: onChanged,
          ),
          const Text('No'),
        ],
      ),
    ],
  );
}

Widget buildObservationField(String? initialValue, Function(String?) onChanged ) {
  return TextFormField(
    initialValue: initialValue,
    decoration: const InputDecoration(
      labelText: 'Observaciones',
      border: OutlineInputBorder(),
    ),
    maxLines: 3,
    onChanged: onChanged,

  );
}

String? getValueFromBool(bool? value) {
  return value == true ? 'Sí' : (value == false ? 'No' : null);
}