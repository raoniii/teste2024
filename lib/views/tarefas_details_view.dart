import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../controller/tarefa/tarefa_cubit.dart';
import '../models/Tarefa.dart';
import '../widget/edittarefadialog.dart';

class TarefaDetailsView extends StatelessWidget {
  final Tarefa tarefa;

  const TarefaDetailsView({Key? key, required this.tarefa}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tarefa.titulo),
      ),
      body: Center(
        child: Card(
          elevation: 10.0, // Aumenta a elevação para dar uma sensação de carta
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
                16.0), // Borda arredondada para se parecer com uma carta
          ),
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Descriçã1o:',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  tarefa.infor,
                  style: TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Status:',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Checkbox(
                      value: tarefa.IsComplete,
                      onChanged: (newValue) {
                        BlocProvider.of<TarefasCubit>(context)
                            .updateTarefasIsComplete(tarefa, newValue!);
                      },
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    print("clique no botao editar");
                    _startEditing(context);
                  },
                  child: Text('Editar Tarefa'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _startEditing(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {

        return EditTarefaDialog(
          initialText: tarefa.infor,

          onSave: (String newText) {
            print("clique em salvar");
            BlocProvider.of<TarefasCubit>(context)
                .updateTarefasInfor(tarefa, newText);
          },
        );
      },
    );
  }
}
