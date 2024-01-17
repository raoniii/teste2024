import 'dart:ffi';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste2024/controller/form1/form1_cubit.dart';

import '../models/FormTeste1.dart';
import 'loading_view.dart';
import 'nav_drawer.dart';

class Form1View extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Form1ViewState();
}

class _Form1ViewState extends State<Form1View> {
  final _nomeController = TextEditingController();
  final _inforController = TextEditingController();
  final _tipotesteController = TextEditingController();
  final _descricaoController = TextEditingController();
  late bool _finalizadoController = false;

  final _bddLongoController = TextEditingController();
  final playeradd = AudioPlayer();
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _navBar(),
      drawer: NavDrawer(),
      bottomNavigationBar: _btnBar(),
      floatingActionButton: _floatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Card(
        child: BlocBuilder<Form1Cubit, Form1State>(
          builder: (context, state) {
            if (state is ListForm1Success) {
              return state.form1.isEmpty
                  ? _emptyForm1View()
                  : _form1ListView(state.form1);
            } else if (state is ListForm1Failure) {
              return _exceptionView(state.exception);
            } else {
              return LoadingView();
            }
          },
        ),
      ),
    );
  }

  Widget _exceptionView(Exception exception) {
    return Center(child: Text(exception.toString()));
  }

  BottomNavigationBar _btnBar() {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Finalizados',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.bar_chart),
          label: 'Gráficos',

        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.deepPurple,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  AppBar _navBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () => showModalBottomSheet(
          context: context,
          builder: (BuildContext context) => ListTile(
            leading: Icon(Icons.person),
            title: Text("Minha conta"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
        ),
      ),
      title: Text('Lista do form1'),
      actions: [
        Icon(Icons.favorite),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(Icons.search),
        ),
        Icon(Icons.more_vert),

      ],
      backgroundColor: Colors.deepPurple,
    );
  }

  Widget _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
            context: context, builder: (context) => _newForm1View());
      },
      child: Icon(Icons.add),
    );
  }

  Widget _emptyForm1View() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Sem tarefas para fazer2',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 18),
          Text(
            'Comece adicionando uma nova tarefa',
            style: TextStyle(
              fontSize: 21,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _newForm1View() {
    return DefaultTabController(
      length: 4, // Número de abas
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Dados Gerais'),
              Tab(text: 'Opções'),
              Tab(text: 'BDD'),
              Tab(text: 'Aceite'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Conteúdo da primeira aba
                Column(
                  children: [
                    CheckboxListTile(
                      title: const Text('Finalizado'),
                      secondary: const Icon(Icons.gavel),
                      controlAffinity: ListTileControlAffinity.leading,
                      value: _finalizadoController,
                      onChanged: (_value) {
                        setState(() => _finalizadoController = _value!);
                      },
                    ),
                    TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(hintText: 'Nome da tarefa'),
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.next,
                    ),
                    TextField(
                      controller: _inforController,
                      decoration:
                          InputDecoration(hintText: 'Informação da tarefa'),
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
                // Conteúdo da segunda aba
                Column(
                  children: [
                    TextField(
                      controller: _tipotesteController,
                      decoration: InputDecoration(hintText: 'Tipo de teste'),
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.next,
                    ),
                    TextField(
                      controller: _descricaoController,
                      decoration: InputDecoration(hintText: 'Descricao'),
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
                Column(
                  children: [
                    //CRIA OPCAO PARA BDD TALVEZ
                    TextField(
                      controller: _bddLongoController,
                      decoration: InputDecoration(
                        hintText: 'Digite aqui',
                        prefixText: '\n\nDADO:\n\nQUANDO:\n\nENTÃO:',
                        prefixStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      maxLines: 5,
                      textAlign: TextAlign.center,
                      textInputAction: TextInputAction.next,
                    ),
                  ],
                ),
                Column(
                  children: [],
                )
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple, // background (button) color
              foregroundColor: Colors.white, // foreground (text) color
            ),
            onPressed: () {
              // adiciona a validação para não salvar tarefas em branco
              if (_nomeController.text.trim().isEmpty ||
                  _inforController.text.trim().isEmpty ||
                  _tipotesteController.text.trim().isEmpty ||
                  _descricaoController.text.trim().isEmpty ||
                  _bddLongoController.text.trim().isEmpty) {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Erro"),
                      content:
                          Text("Preencha os campos antes de salvar a tarefa."),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              } else {
                BlocProvider.of<Form1Cubit>(context).createForm12(
                  _nomeController.text,
                  _inforController.text,
                  _tipotesteController.text,
                  _descricaoController.text,
                  _finalizadoController,
                  _bddLongoController.text,
                );
                _nomeController.text = '';
                _inforController.text = '';
                _tipotesteController.text = '';
                _descricaoController.text = '';
                _finalizadoController = false;
                _bddLongoController.text = '';

                playeradd.play(AssetSource('sound.wav'));

                Navigator.of(context).pop();
              }
            },
            child: Text('Salvar Tarefa'),
          ),
        ],
      ),
    );
  }

  Widget _form1ListView(List<FormTeste1> forms1) {
    return ListView.builder(
      itemCount: forms1.length,
      itemBuilder: (context, index) {
        final form1 = forms1[index];
        return Dismissible(
          key: Key(form1.id.toString()),
          confirmDismiss: (direction) async {
            if (!form1.finalizado) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Erro"),
                    content: Text(
                        "Esta form1 não pode ser excluída porque não está concluída."),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Text('OK'),
                      ),
                    ],
                  );
                },
              );
              return false;
            } else {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Confirmação"),
                    content: Text("Deseja excluir este item?"),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text("Cancelar"),
                      ),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: Text("Excluir"),
                      ),
                    ],
                  );
                },
              );
            }
          },
          onDismissed: (direction) {
            BlocProvider.of<Form1Cubit>(context).deleteTarefas(form1);
          },
          child: Card(
            child: CheckboxListTile(
              title: Text(form1.nome),
              subtitle: Text(form1.tipoteste),
              value: form1.finalizado,
              onChanged: (newValue) {
                BlocProvider.of<Form1Cubit>(context)
                    .updateForm1Finalizado(form1, newValue!);
              },
            ),
          ),
        );
      },
    );
  }

  Widget _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountEmail: Text("user@mail.com"),
            accountName: Text("Seu zé"),
            currentAccountPicture: CircleAvatar(
              child: Text("SZ"),
            ),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Minha conta"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
          ListTile(
            leading: Icon(Icons.shopping_basket),
            title: Text("Meus pedidos"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text("Favoritos"),
            onTap: () {
              Navigator.pop(context);
              //Navegar para outra página
            },
          ),
        ],
      ),
    );
  }
}
