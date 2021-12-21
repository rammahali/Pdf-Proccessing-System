import 'package:flutter/material.dart';

class TableResult extends StatefulWidget {
  const TableResult({Key? key}) : super(key: key);

  @override
  _TableResultState createState() => _TableResultState();
}

class _TableResultState extends State<TableResult> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 14,
      ),
      height: 80,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white60,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        children: [],
      ),
    );
  }
}
