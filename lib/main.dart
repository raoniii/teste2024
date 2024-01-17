
import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2024/controller/tarefa/tarefa_cubit.dart';
import 'package:teste2024/views/loading_view.dart';
import 'package:teste2024/views/tarefas_view.dart';

import 'amplifyconfiguration.dart';
import 'app_navigator.dart';
import 'models/ModelProvider.dart';
import 'nav_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(useMaterial3: true),
        home: BlocProvider(
            create: (context) => TarefasCubit()
              ..getTarefas()
              ..observeTarefa(),
            child: _amplifyConfigured ? TarefasView() : LoadingView()));
  }



 // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       home: MultiBlocProvider(providers: [
  //         BlocProvider(create: (context) => NavCubit()),
  //         BlocProvider(
  //           create: (context) => TarefasBloc()..add(LoadTarefasEvent()),
  //         )
  //       ], child:  _amplifyConfigured ? AppNavigator() : LoadingView()));
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       theme: ThemeData.light(useMaterial3: true),
  //       home: BlocProvider(
  //           create: (context) => Form1Cubit()
  //             ..getForm1()
  //             ..observeForm1(),
  //           child: _amplifyConfigured ? Form1View() : LoadingView()));
  // }

  void _configureAmplify() async {
    // Once Plugins are added, configure Amplify
    try {
      await Future.wait([
        Amplify.addPlugin(
            AmplifyDataStore(modelProvider: ModelProvider.instance)),
        Amplify.addPlugin(AmplifyAPI()),
      ]);
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } catch (e) {
      print(e);
    }
  }
}
