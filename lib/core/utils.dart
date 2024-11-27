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

void selectDateTime(
    BuildContext context, Null Function(dynamic value) onChange) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime(1990),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  );
  if (picked != null) {
    // Actualiza la fecha de nacimiento
    print("my-logs $picked");
    onChange(picked);
  }
}


void scrollToForm(GlobalKey key, ScrollController scrollController) {
  final context = key.currentContext;
  if (context != null) {
    final box = context.findRenderObject() as RenderBox;
    // Obtiene la posición para desplazar
    final offset = box.localToGlobal(Offset.zero).dy;

    // Desplazarse a la posición del formulario
    scrollController.animateTo(
      offset - 10,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}