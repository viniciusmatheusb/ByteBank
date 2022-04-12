import 'package:bytebank/banco_de_dados/dao/contato_dao.dart';
import 'package:bytebank/modelos/contatos.dart';
import 'package:bytebank/telas/formulario_contato.dart';
import 'package:flutter/material.dart';

class ListaDeContato extends StatefulWidget {
  const ListaDeContato({Key? key}) : super(key: key);

  @override
  State<ListaDeContato> createState() => _ListaDeContatoState();
}

class _ListaDeContatoState extends State<ListaDeContato> {
  final ContatoDAO _dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Contatos'),
      ),
      body: FutureBuilder<List<Contatos>>(
          initialData: const [],
          future: _dao.retornaTodosContatos(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      CircularProgressIndicator(),
                      Text('Carregando'),
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                final List<Contatos> contatos = snapshot.data as List<Contatos>;
                return ListView.builder(
                  itemBuilder: (context, index) {
                    final contato = contatos[index];
                    return _ContatoItem(contato);
                  },
                  itemCount: contatos.length,
                );
            }
            return const Text('Error');
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => const FormularioDeContato()))
              .then((value) => setState(() {}));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class _ContatoItem extends StatelessWidget {
  final Contatos contatos;
  const _ContatoItem(this.contatos);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          contatos.nome.toString(),
          style: const TextStyle(fontSize: 24.0),
        ),
        subtitle: Text(
          contatos.numeroConta.toString(),
          style: const TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }
}
