import '../database.dart';

class ProdutoTable extends SupabaseTable<ProdutoRow> {
  @override
  String get tableName => 'produto';

  @override
  ProdutoRow createRow(Map<String, dynamic> data) => ProdutoRow(data);
}

class ProdutoRow extends SupabaseDataRow {
  ProdutoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => ProdutoTable();

  int get idProduto => getField<int>('id_produto')!;
  set idProduto(int value) => setField<int>('id_produto', value);

  String get nome => getField<String>('nome')!;
  set nome(String value) => setField<String>('nome', value);

  double? get valorUnitario => getField<double>('valor_unitario');
  set valorUnitario(double? value) => setField<double>('valor_unitario', value);

  String? get descricao => getField<String>('descricao');
  set descricao(String? value) => setField<String>('descricao', value);
}
