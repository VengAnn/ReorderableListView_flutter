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
  void _deleteIndex(int index) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Are you want to delete?'),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        ls.removeAt(index);
                        Navigator.of(context).pop();
                      });
                    },
                    child: Text(
                      'Yes',
                    ),
                  ),
                ),
                //
                Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No'),
                  ),
                ),
              ],
            ),
          );
        });
  }

  //
  void _EditIndex(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: TextFormField(
              initialValue: ls[index],
              onFieldSubmitted: (value) {
                setState(() {
                  ls[index] = value;
                  Navigator.of(context).pop();
                });
              },
            ),
          );
        });
  }

  //
  Widget _itemBuilder(BuildContext context, int index) {
    return Card(
      key: ValueKey(index),
      //
      elevation: 10,
      //
      shadowColor: Colors.black,
      //
      color: index.isEven ? Colors.blue : Colors.red,
      child: ListTile(
        leading: Icon(
          Icons.message,
        ),
        title: Text(ls[index]),
        //
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => _EditIndex(index),
              icon: Icon(Icons.edit),
            ),
            //
            IconButton(
              onPressed: () => _deleteIndex(index),
              icon: Icon(Icons.delete),
            ),
          ],
        ),
      ),
    );
  }
}
