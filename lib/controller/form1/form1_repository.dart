import 'package:amplify_flutter/amplify_flutter.dart';

import '../../models/FormTeste1.dart';

class FormTeste1Repository {
  Future<List<FormTeste1>> getFormTeste1() async {
    try {
      final form1Items = await Amplify.DataStore.query(FormTeste1.classType);
      return form1Items;
    } catch (e) {
      throw e;
    }
  }

  Future<void> createFormTeste1Item(
    String nome,
    String infor,
    String tipoteste,
    String descricao,
    String bddLongo,
  ) async {
    final newItem = FormTeste1(
      nome: nome,
      infor: infor,
      tipoteste: tipoteste,
      descricao: descricao,
      finalizado: false,
      bddLongo: bddLongo,
    );
    try {
      await Amplify.DataStore.save(newItem);
    } catch (e) {
      throw e;
    }
  }

  Future<void> createFormTeste12Item(
    String nome,
    String infor,
    String tipoteste,
    String descricao,
    bool finalizado,
    String bddLongo,
  ) async {
    final newItem = FormTeste1(
      nome: nome,
      infor: infor,
      tipoteste: tipoteste,
      descricao: descricao,
      finalizado: false,
      bddLongo: bddLongo,
    );
    try {
      await Amplify.DataStore.save(newItem);
    } catch (e) {
      throw e;
    }
  }

  Future<List<FormTeste1>> getFinalizedFormTeste1() async {
    try {
      final queryResult = await Amplify.DataStore.query(
        FormTeste1.classType,
        where: FormTeste1.FINALIZADO.eq(true),
      );
      return queryResult;
    } catch (e) {
      throw e;
    }
  }

  Future<void> updateFormTeste1Finalizado(
      FormTeste1 form1Item, bool finalizado) async {
    final updatedForm1 = form1Item.copyWith(finalizado: finalizado);
    try {
      await Amplify.DataStore.save(updatedForm1);
    } catch (e) {
      throw e;
    }
  }


  Future<void> deleteFormTeste1Item(FormTeste1 form1Item) async {
    try {
      await Amplify.DataStore.delete(form1Item);
    } catch (e) {
      throw e;
    }
  }

  Stream observeFormTeste1Items() {
    return Amplify.DataStore.observe(FormTeste1.classType);
  }
}
