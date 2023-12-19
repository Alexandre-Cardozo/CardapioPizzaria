import 'package:pizza_hut/shared/i_model.dart';

class TableUser extends IModel<TableUser> {
  String tableId = '';
  String numberTable = '';

  TableUser({
    this.tableId = '',
    this.numberTable = '',
  });

  @override
  factory TableUser.empty() => TableUser(
        tableId: '',
        numberTable: '',
      );

  @override
  TableUser fromMap(Map<String, dynamic> map) => TableUser(
        tableId: map['tableId'],
        numberTable: map['numberTable'],
      );

  @override
  Map<String, dynamic> toMap() => <String, dynamic>{
        'tableId': tableId,
        'numberTable': numberTable,
      };

  @override
  String toString() {
    return 'TableUser{tableId: $tableId, numberTable: $numberTable}';
  }

}
