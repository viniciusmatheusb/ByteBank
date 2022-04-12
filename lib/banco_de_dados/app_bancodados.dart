import 'package:bytebank/banco_de_dados/dao/contato_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> criarBancoDeDados() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContatoDAO.tableSql);
    },
    version: 1,
    //     onDowngrade: onDatabaseDowngradeDelete,
  );

  // return getDatabasesPath().then((dbPath) {
  //   final String path = join(dbPath, 'bytebank.db');
  //   return openDatabase(
  //     path,
  //     onCreate: (db, version) {
  //       db.execute('CREATE TABLE tbContatos('
  //           'id INTEGER PRIMARY KEY, '
  //           'nome TEXT,'
  //           'numeroConta INTEGER);');
  //     },
  //     version: 1,
  //     onDowngrade: onDatabaseDowngradeDelete,
  //   );
  // });
}
