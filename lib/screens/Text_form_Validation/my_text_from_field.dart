import 'package:flutter/material.dart';

class MyTextFormField extends FormField<String> {
  MyTextFormField({
    super.onSaved,
    super.validator,
  }) : super(
          builder: (field) {
            final InputDecoration effectiveDecoration =
                (const InputDecoration()).applyDefaults(
                    Theme.of(field.context).inputDecorationTheme);
            // print("my texts field is ${field}");
            void onChangedHandler(String value) {
              field.didChange(value);
            }

            print(field.errorText);

            return TextField(
              onChanged: onChangedHandler,
              decoration:
                  effectiveDecoration.copyWith(errorText: field.errorText),
            );
          },
          initialValue: '',
        );
}

class MyCheckbox extends FormField<bool> {
  MyCheckbox({super.onSaved})
      : super(
            initialValue: false,
            builder: (field) {
              void onChangedHandler(value) {
                field.didChange(value);
              }

              return Checkbox(
                value: field.value,
                onChanged: (value) {
                  onChangedHandler(value);
                },
              );
            });
}
