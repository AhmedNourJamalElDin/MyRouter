import 'package:flutter/material.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: DataTable(
        columns: [
          DataColumn(
            label: Text("Column 1"),
          ),
          DataColumn(
            label: Text("Column 2"),
          ),
          DataColumn(
            label: Text("Actions"),
          ),
        ],
        rows: [
          for (int i = 0; i < 10; i++)
            DataRow(
              cells: [
                DataCell(Text("OK 1")),
                DataCell(Text("OK 2")),
                DataCell(Text("OK 3")),
              ],
            ),
          DataRow(
            cells: [
              DataCell(Text("OK 1")),
              DataCell(Text("OK 2")),
              DataCell(
                IconButton(
                  icon: Icon(Icons.save),
                  onPressed: () {
                    print('saved!');
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
