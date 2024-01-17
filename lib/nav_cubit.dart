import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2024/models/Tarefa.dart';

class NavCubit extends Cubit<Tarefa?> {
  NavCubit() : super(null);

  void showTarefaDetails(Tarefa tarefa) => emit(tarefa);

  void popToTarefa() => emit(null);
}
