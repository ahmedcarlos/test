import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyText.dart';
class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => MyText(),
                ));
              },
            ),
            title: Text("Long list"),
          ),
          body: getListViews()),
    );
  }
}
List<String> getListElements() {
  var items = List<String>.generate(10000, (counter) => "person $counter");
  return items;
}
Widget getListViews() {
  var listItem = getListElements();
  var listViews = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text(listItem[index]),
      onTap: (){
         debugPrint('${listItem[index]} was tapping ');
         showSnackBar(context,listItem[index]);
      },
    );
  });
  return listViews;
}
void showSnackBar(BuildContext context,String item){
  var snackBar= SnackBar(
    content: Text("you press $item"),
    action: SnackBarAction(
      label: "UNDO",
      onPressed: (){
        debugPrint('$item was undo successful ');
      },
    ),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}
