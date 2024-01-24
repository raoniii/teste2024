import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2024/controller/tarefa/tarefa_repository.dart';

import '../../models/Tarefa.dart';

abstract class TarefasState {}

class LoadingTarefas extends TarefasState {}

class ListTarefasSuccess extends TarefasState {
  final List<Tarefa> tarefas;

  ListTarefasSuccess({required this.tarefas});
}

class ListTarefasFailure extends TarefasState {
  final Exception exception;

  ListTarefasFailure({required this.exception});
}

abstract class TarefasEvent {}

class LoadTarefasEvent extends TarefasEvent {}

class PullToRefreshEvent extends TarefasEvent {}

class LoadingTarefasState extends TarefasState {}

class LoadedTarefasState extends TarefasState {
  late List<Tarefa> tarefas;

  LoadedTarefasState({required this.tarefas});
}

class FailedToLoadTarefasState extends TarefasState {
  late Error error;

  FailedToLoadTarefasState({required this.error});
}

class TarefasCubit extends Cubit<TarefasState> {
  final _tarefasRepo = TarefaRepository();

  TarefasCubit() : super(LoadingTarefas());

  void getTarefas() async {
    if (state is ListTarefasSuccess == false) {
      emit(LoadingTarefas());
    }

    try {
      final tarefas = await _tarefasRepo.getTarefas();
      emit(ListTarefasSuccess(tarefas: tarefas));
    } catch (e) {
      emit(ListTarefasFailure(exception: Exception()));
    }
  }

  void createTarefas(String titulo, String infor) async {
    await _tarefasRepo.createTarefa(titulo, infor);
  }

  void editorTarefas(Tarefa tarefa, String titulo, String infor) async {
    await _tarefasRepo.editorTarefa(tarefa.id, titulo, infor);
  }


  void updateTarefasIsComplete(Tarefa tarefa, bool IsComplete) async {
    await _tarefasRepo.updateTarefaIsComplete(tarefa, IsComplete);
  }

  void updateTarefasInfor(Tarefa tarefa, String Infor) async {
    await _tarefasRepo.updateTarefaInfor(tarefa, Infor);
  }

  void observeTarefa() {
    final tarefasStream = _tarefasRepo.observeTarefas();
    tarefasStream.listen((_) => getTarefas());
  }

  void deleteTarefas(Tarefa tarefa) async {
    await _tarefasRepo.deleteTarefa(tarefa);
  }
}

@override
class TarefasBloc extends Bloc<TarefasEvent, TarefasState> {
  final _tarefasRepo = TarefaRepository();

  TarefasBloc() : super(LoadedTarefasState(tarefas: [])) {
    on((event, emit) async {
      try {
        List<Tarefa>? data =
            (await _tarefasRepo.observeTarefas().toList()).cast<Tarefa>();

        if (event is PullToRefreshEvent || event is LoadTarefasEvent) {
          emit(LoadedTarefasState(tarefas: data));
        }
      } on Error catch (e) {
        emit(FailedToLoadTarefasState(error: e));
      }
    });
  }
}
