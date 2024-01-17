import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2024/controller/tarefa/tarefa_cubit.dart';

import '../models/Tarefa.dart';



class EditScreen extends StatelessWidget {
  final int index;

  const EditScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TarefasCubit(), // Modifique para TarefasCubit se necessário
      child: Builder(
        builder: (context) {
          return BlocBuilder<TarefasBloc, TarefasState>(
            builder: (context, state) {
              if (state is LoadingTarefas) {
                return Scaffold(
                  appBar: AppBar(title: Text('Editar Tarefa')),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Tarefa: ${[]}'),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            // Adicione lógica para editar a tarefa aqui
                          },
                          child: Text('Salvar Edições'),
                        ),
                      ],
                    ),
                  ),
                );
              }
              return Container();
            },
          );
        },
      ),
    );
  }
}
