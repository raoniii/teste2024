import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2024/views/tarefas_details_view.dart';
import 'package:teste2024/views/tarefas_view.dart';


import 'models/Tarefa.dart';
import 'nav_cubit.dart';

class AppNavigator extends StatelessWidget {

  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavCubit, Tarefa?>(builder: ((context, tarefa) {
      return Navigator(
        pages: [
          MaterialPage(child: TarefasView()),
          if (tarefa != null)
            MaterialPage(child: TarefaDetailsView(tarefa: tarefa))
        ],
        onPopPage: (route, result) {
          BlocProvider.of<NavCubit>(context).popToTarefa();
          return route.didPop(result);
        },
      );
    }));
  }
}
