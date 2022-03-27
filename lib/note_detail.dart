import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_app/models/note.dart';
import 'package:flutter_app/utils/database_helper.dart';
import 'package:intl/intl.dart';

class NoteDetail extends StatefulWidget{

 final String appBarTitle;
  final Note note;
  NoteDetail(this.note,this.appBarTitle);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NoteDetailState(this.note,this.appBarTitle);
  }
}
class NoteDetailState extends State<NoteDetail>{
  Note note;
  String appBarTitle;
  var level =['high','low'];
  String _currenciesItem= 'high';
  NoteDetailState(this.note,this.appBarTitle);
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  DatabaseHelper helper =DatabaseHelper();
  @override
  Widget build(BuildContext context) {

    TextStyle textStyle = Theme.of(context).textTheme.title;
  double defaultPadding =5.0;
titleController.text=note.title;
descriptionController.text=note.description;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: (){
              moveToLastScreen();
            },
          ),
        ),
        body:
        Padding(
          padding: EdgeInsets.only(top: defaultPadding,left: defaultPadding,right: defaultPadding),
       child: ListView(
          children: <Widget>[
            ListTile(
         title:Padding(
              padding: EdgeInsets.all(defaultPadding),
        child:DropdownButton(
              items: level.map((String item){
           return DropdownMenuItem<String>(
           value: item,
             child: Text(item),
           );
                },).toList(),
        style: textStyle,
          value: getPriorityAsString(note.priority),
        onChanged: (String itemSelected){
                setState(() {
                updatePriorityAsInt(itemSelected);
                }
                );
        },

      ))),
Padding(
  padding: EdgeInsets.all(defaultPadding),
child:TextField(
  controller: titleController,
   style: textStyle,
   decoration: InputDecoration(
     labelText: 'Title',
     hintText: 'Enter Title',
     labelStyle: textStyle,
     border:OutlineInputBorder(
       borderRadius: BorderRadius.circular(5)
     )
   ),
  onChanged: (value){
    updateTitle();
  },
)),
            Padding(
                padding: EdgeInsets.all(defaultPadding),
                child:TextField(
                  controller: descriptionController,
                  style: textStyle,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    hintText: 'Enter Description',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5)
                    )
                  ),
                  onChanged: (value){
                    updateDescription();
                  },
                )),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                children: <Widget>[
                  Expanded(
                  child:RaisedButton(
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                     child: Text('Save',textScaleFactor: 1.5,),
                    onPressed: (){
                       setState(() {
                         _save();
                       });
                    },
                  )),
                  Container(
                    width: 20,
                  ),
                  Expanded(
                  child:RaisedButton(
                    child: Text('Delete',textScaleFactor: 1.5,),
                    color: Colors.deepPurple,
                    textColor: Colors.white,
                    onPressed: (){
                      setState(() {
                        _delete();
                      });
                    },
                  )),
                ],
              ),
            )
          ],
      )),
    )
      );
  }
  void updatePriorityAsInt(String value){
    switch(value){
      case 'High' :
        note.priority=1;
        break;
      case 'Low' :
        note.priority=2;
        break;
    }
  }
  String getPriorityAsString(int value){
    String priority;
    switch(value){
      case 1 :
        priority = level[0];break;
      case 2 :
        priority = level[1];break;
    }
    return priority;
  }
  //update title
void updateTitle(){
    note.title=titleController.text;
}
void updateDescription(){
    note.description=descriptionController.text;
}
void _save()async{
  moveToLastScreen();
     note.date=DateFormat.yMMMd().format(DateTime.now());
    int result;
    if(note.id!=null){// update
result=await helper.updateNote(note);
    }else{//insert
result=await helper.insertNote(note);
    }
    if(result!=0){//Success
      _showAlertDialog('Status','Note Saved Successfully');
    }else {//failure
      _showAlertDialog('Statise','Problem with Saving Note');
    }
}
void _showAlertDialog(String title,String message){
    AlertDialog alertDialog =AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(context: context,builder: (_)=>alertDialog);
}
void moveToLastScreen(){
    Navigator.pop(context,true);
}
void _delete() async{
    moveToLastScreen();
    if(note.id==null){
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }
 int result= await helper.deleteNote(note.id);
if(result!=0){
  _showAlertDialog('Status', 'Note Deleted Successfully');
}else{
_showAlertDialog('Status', 'Error Occred while Delerd Note');
}
  }
}

