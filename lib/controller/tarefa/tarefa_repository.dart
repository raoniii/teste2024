import 'package:amplify_flutter/amplify_flutter.dart';

import '/models/Tarefa.dart';


class TarefaRepository {
  Future<List<Tarefa>> getTarefas() async {
    try {
      final tarefas = await Amplify.DataStore.query(Tarefa.classType);
      return tarefas;
    } catch (e) {
      throw e;
    }
  }

  Future<List<Tarefa>> getTarefasUnica(String userId) async {
    try {
      final tarefas = await Amplify.DataStore.query(Tarefa.classType,where: Tarefa.ID.eq(userId),);
      return tarefas;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createTarefa(String titulo, String infor) async {
    final newTarefa = Tarefa(titulo: titulo,infor: infor, IsComplete: false);
    try {
      await Amplify.DataStore.save(newTarefa);
    } catch (e) {
      throw e;
    }
  }

  Future<void> editorTarefa(String id, String titulo, String infor) async {
    final existingTarefa = Tarefa(id: id, titulo: titulo, infor: infor, IsComplete: false);
    try {
      await Amplify.DataStore.save(existingTarefa);
    } catch (e) {
      throw e;
    }
  }


  Future<void> updateTarefaInfor(Tarefa tarefa, String infor) async {
    final updatedTarefa = tarefa.copyWith(infor: infor);
    try {
      await Amplify.DataStore.save(updatedTarefa);
    } catch (e) {
      throw e;
    }
  }


  Future<void> updateTarefaIsComplete(Tarefa tarefa, bool IsComplete) async {
    final updatedTarefa = tarefa.copyWith(IsComplete: IsComplete);
    try {
      await Amplify.DataStore.save(updatedTarefa);
    } catch (e) {
      throw e;
    }
  }

  Future<void> deleteTarefa(Tarefa tarefa) async {
    try {
      await Amplify.DataStore.delete(tarefa);
    } catch (e) {
      throw e;
    }
  }

  Stream observeTarefas() {
    return Amplify.DataStore.observe(Tarefa.classType);
  }

}