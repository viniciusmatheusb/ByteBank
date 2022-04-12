class Contatos {
  final int? id;
  final String? nome;
  final int? numeroConta;

  Contatos(
    this.id,
    this.nome,
    this.numeroConta,
  );

  @override
  String toString() {
    return 'Contato {id: $id, Nome: $nome, Número da Conta: $numeroConta}';
  }
}
