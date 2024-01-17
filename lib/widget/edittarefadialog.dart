import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditTarefaDialog extends StatefulWidget {
  final String initialText;
  final Function(String) onSave;

  EditTarefaDialog({required this.initialText, required this.onSave});

  @override
  _EditTarefaDialogState createState() => _EditTarefaDialogState();
}

class _EditTarefaDialogState extends State<EditTarefaDialog> {
  late TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController(text: widget.initialText);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Editar Tarefa'),
      content: TextField(
        controller: _textEditingController,
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancelar'),
        ),
        ElevatedButton(
          onPressed: () {
            final newText = _textEditingController.text;
            widget.onSave(newText);
            Navigator.of(context).pop();
          },
          child: Text('Salvar'),
        ),
      ],
    );
  }
}
