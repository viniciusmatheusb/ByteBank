import 'package:bytebank/banco_de_dados/dao/contato_dao.dart';
import 'package:bytebank/modelos/contatos.dart';
import 'package:flutter/material.dart';

class FormularioDeContato extends StatefulWidget {
  const FormularioDeContato({Key? key}) : super(key: key);

  @override
  State<FormularioDeContato> createState() => _FormularioDeContatoState();
}

class _FormularioDeContatoState extends State<FormularioDeContato> {
  final TextEditingController _nomeControlador = TextEditingController();

  final TextEditingController _numeroContaControlador = TextEditingController();
  final ContatoDAO _dao = ContatoDAO();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nomeControlador,
              decoration: const InputDecoration(labelText: 'Nome Completo'),
              style: const TextStyle(fontSize: 24.0),
            ),
            TextField(
              controller: _numeroContaControlador,
              decoration: const InputDecoration(labelText: 'Número da Conta'),
              style: const TextStyle(fontSize: 24.0),
              keyboardType: TextInputType.number,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                  child: const Text('Criar Contato'),
                  onPressed: () {
                    final String? nome = _nomeControlador.text;
                    final int? numeroConta =
                        int.tryParse(_numeroContaControlador.text);

                    final Contatos novoContato = Contatos(3, nome, numeroConta);
                    _dao
                        .salvarContato(novoContato)
                        .then((id) => Navigator.pop(context));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
