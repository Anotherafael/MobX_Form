import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../controller.dart';

class BodyWidget extends StatelessWidget {
  _textField({String label, onChanged, String Function() errorText}) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: label,
        errorText: errorText == null ? null : errorText(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Controller();

    return SingleChildScrollView(
      child: Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Observer(
            builder: (_) {
              return _textField(
                label: 'nome',
                onChanged: controller.client.changeName,
                errorText: controller.validateName,
              );
            },
          ),
          SizedBox(height: 20),
          Observer(
            builder: (_) {
              return _textField(
                label: 'email',
                onChanged: controller.client.changeEmail,
                errorText: controller.validateEmail,
              );
            },
          ),
          SizedBox(height: 20),
          Observer(builder: (_) {
            return RaisedButton(
              disabledColor: Colors.grey,
              color: Colors.blue,
              onPressed: controller.isValid ? () {} : null,
              child: Text('Salvar'),
            );
          }),
        ],
      ),
    )
    );
  }
}