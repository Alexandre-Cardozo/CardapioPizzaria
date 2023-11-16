import '../database.dart';

class MesaTable extends SupabaseTable<MesaRow> {
  @override
  String get tableName => 'mesa';

  @override
  MesaRow createRow(Map<String, dynamic> data) => MesaRow(data);
}

class MesaRow extends SupabaseDataRow {
  MesaRow(Map<String, dynamic> data) : super(data);

  @override
  SupabaseTable get table => MesaTable();

  int get id => getField<int>('id')!;
  set id(int value) => setField<int>('id', value);

  int? get numero => getField<int>('numero');
  set numero(int? value) => setField<int>('numero', value);
}
