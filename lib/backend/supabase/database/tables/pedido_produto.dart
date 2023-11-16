import '../database.dart';

class PedidoProdutoTable extends SupabaseTable<PedidoProdutoRow> {
  @override
  String get tableName => 'pedido_produto';

  @override
  PedidoProdutoRow createRow(Map<String, dynamic> data) =>
      PedidoProdutoRow(data);
}

class PedidoProdutoRow extends SupabaseDataRow {
  PedidoProdutoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PedidoProdutoTable();

  int get idProduto => getField<int>('id_produto')!;
  set idProduto(int value) => setField<int>('id_produto', value);

  int get idPedido => getField<int>('id_pedido')!;
  set idPedido(int value) => setField<int>('id_pedido', value);
}
