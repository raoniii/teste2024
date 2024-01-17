
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2024/controller/form1/form1_repository.dart';

import '../../models/FormTeste1.dart';

abstract class Form1State {}

class LoadingForm1 extends Form1State {}

class ListForm1Success extends Form1State {
  final List<FormTeste1> form1;

  ListForm1Success({required this.form1});
}

class ListForm1Failure extends Form1State {
  final Exception exception;

  ListForm1Failure({required this.exception});
}

class Form1Cubit extends Cubit<Form1State> {
  final _form1Repo = FormTeste1Repository();

  Form1Cubit() : super(LoadingForm1());

  void getForm1() async {
    if (state is ListForm1Success == false) {
      emit(LoadingForm1());
    }

    try {
      final form1 = await _form1Repo.getFormTeste1();
      emit(ListForm1Success(form1: form1));
    } catch (e) {
      emit(ListForm1Failure(exception: Exception()));
    }
  }

  void getFinalizedForm1() async {
    if (state is ListForm1Success == false) {
      emit(LoadingForm1());
    }

    try {
      final form1 = await _form1Repo.getFinalizedFormTeste1();
      emit(ListForm1Success(form1: form1));
    } catch (e) {
      emit(ListForm1Failure(exception: Exception()));
    }
  }

  void createForm1(String nome, String infor, String tipoteste,
      String descricao,  String bddLong) async {
    await _form1Repo.createFormTeste1Item(
        nome, infor, tipoteste, descricao, bddLong);
  }

  void createForm12(String nome, String infor, String tipoteste,
      String descricao, bool finalizado, String bddLong) async {
    await _form1Repo.createFormTeste12Item(
        nome, infor, tipoteste, descricao, finalizado, bddLong);
  }

  void updateForm1Finalizado(FormTeste1 form1, bool finalizado) async {
    await _form1Repo.updateFormTeste1Finalizado(form1, finalizado);
  }



  void observeForm1() {
    final form1Stream = _form1Repo.observeFormTeste1Items();
    form1Stream.listen((_) => getForm1());
  }

  void deleteTarefas(FormTeste1 form1) async {
    await _form1Repo.deleteFormTeste1Item(form1);
  }
}
