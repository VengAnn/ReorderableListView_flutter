import 'package:flutter/material.dart';

class AppDetail extends StatefulWidget {
  const AppDetail({super.key});

  @override
  State<AppDetail> createState() => _AppDetailState();
}

class _AppDetailState extends State<AppDetail> {
  var ls = ['Veng Ann', 'vi Rak', 'Than', 'Rong', 'Kim'];
  @override
  Widget build(BuildContext context) {
    //
    return ReorderableListView.builder(
      itemBuilder: _itemBuilder,
      itemCount: ls.length,
      onReorder: _UpdateItem,
    );
  }

  //
  void _UpdateItem(int oldIndex, int newIndex) {
    var item = ls.removeAt(oldIndex);
    if (newIndex > oldIndex) newIndex--;
    ls.insert(newIndex, item);
  }

  //
  Widget _itemBuilder(BuildContext context, int index) {
    return ListTile(
      key: ValueKey(index),
      title: Text(ls[index]),
    );
  }
}
