//import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class FirstScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FirstScreenState();
  }
}
class FirstScreenState extends State<FirstScreen> {
  String name ="";
  var _currencies =['ahmed' , 'mohamed' ,'khalid','Others'];
  var _currenciesItem ='ahmed';
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carlos'),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
         TextField(
              autocorrect: true,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              autofocus: false,
              maxLength: 50,
              maxLines: null,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
              ),
           onChanged:(String userInput){
                setState(() {
                  name=userInput;
                });
           },
            ),
            DropdownButton(
              items: _currencies.map((String dropStringItem){
                return DropdownMenuItem<String>(

                  value:dropStringItem,

                  child:Text(dropStringItem),
                );
              }).toList(),
              onChanged: (String newValueSelected){
setState(() {
  name=newValueSelected;
  this._currenciesItem=newValueSelected;
});
              },
              value: _currenciesItem,
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Text("your name is $name",style: TextStyle(color: Colors.green),),
            )
          ],
        ),
      ),
    );
  }
}
