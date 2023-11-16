import '../database.dart';

class PedidoTable extends SupabaseTable<PedidoRow> {
  @override
  String get tableName => 'pedido';

  @override
  PedidoRow createRow(Map<String, dynamic> data) => PedidoRow(data);
}

class PedidoRow extends SupabaseDataRow {
  PedidoRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => PedidoTable();

  int get idPedido => getField<int>('id_pedido')!;
  set idPedido(int value) => setField<int>('id_pedido', value);

  double get valorTotalPedido => getField<double>('valor_total_pedido')!;
  set valorTotalPedido(double value) =>
      setField<double>('valor_total_pedido', value);

  String? get observacao => getField<String>('observacao');
  set observacao(String? value) => setField<String>('observacao', value);

  int? get idMesa => getField<int>('id_mesa');
  set idMesa(int? value) => setField<int>('id_mesa', value);
}
