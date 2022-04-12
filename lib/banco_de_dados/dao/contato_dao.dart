import 'package:bytebank/modelos/contatos.dart';
import 'package:sqflite/sqflite.dart';

import '../app_bancodados.dart';

class ContatoDAO {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_nome TEXT,'
      '$_numeroConta INTEGER);';

  static const String _tableName = 'tbContatos';
  static const String _id = 'id';
  static const String _nome = 'nome';
  static const String _numeroConta = 'numeroConta';

  Future<int> salvarContato(Contatos contatos) async {
    final Database db = await criarBancoDeDados();
    Map<String, dynamic> contatoMap = _toMap(contatos);
    return db.insert(_tableName, contatoMap);

    // return criarBancoDeDados().then((db) {
    //   final Map<String, dynamic> contatoMap = {};
    //   contatoMap['nome'] = contatos.nome;
    //   contatoMap['numeroConta'] = contatos.numeroConta;
    //   return db.insert('tbContatos', contatoMap);
    // });
  }

  Map<String, dynamic> _toMap(Contatos contatos) {
    final Map<String, dynamic> contatoMap = {};
    contatoMap[_nome] = contatos.nome;
    contatoMap[_numeroConta] = contatos.numeroConta;
    return contatoMap;
  }

  Future<List<Contatos>> retornaTodosContatos() async {
    final Database db = await criarBancoDeDados();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contatos> contatos = _toList(result);
    return contatos;

    // return criarBancoDeDados().then((db) {
    //   return db.query('tbContatos').then((mapas) {
    //     final List<Contatos> contatos = [];
    //     for (Map<String, dynamic> map in mapas) {
    //       final Contatos contato = Contatos(
    //         map['id'],
    //         map['nome'],
    //         map['numeroConta'],
    //       );
    //       contatos.add(contato);
    //     }
    //     return contatos;
    //   });
    // });
  }

  List<Contatos> _toList(List<Map<String, dynamic>> result) {
    final List<Contatos> contatos = [];
    for (Map<String, dynamic> linha in result) {
      final Contatos contato = Contatos(
        linha[_id],
        linha[_nome],
        linha[_numeroConta],
      );
      contatos.add(contato);
    }
    return contatos;
  }
}
