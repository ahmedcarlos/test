import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/FifthScreen.dart';
import 'package:flutter_app/ThirdScreen.dart';
import 'secondscreen.dart';
import 'FirstScreen.dart';
import 'ThirdScreen.dart';
import 'FourthScreen.dart';
import 'FifthScreen.dart';
class MyText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyTextState();
  }
}
  class MyTextState extends State<MyText>{
    bool chick =false;
    String name='Light Mood';
    ThemeData theme =ThemeData.light();
    int value=0;
  @override
  Widget build(BuildContext context) {
    //  var screenWidth = MediaQuery.of(context).size.width;
    //  var screenHeight = MediaQuery.of(context).size.height;
    return new MaterialApp(
        theme: theme,
        home: Scaffold(
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text('Menu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 30, color: Color.fromRGBO(200, 0, 0, 1))),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                "Exit",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                exit(0);
              }
            ),
            SwitchListTile(
              value: chick,
              title:Text(name),
              onChanged: (value){
                setState(() {
                chick=value;
                if(value==true){
                theme =ThemeData.dark();
                name='Dark Mood';}
                else{
    theme =ThemeData.light();
    name='Light Mood';
                }
              });},
            )
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Carlos First App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        backgroundColor: Colors.green,
        elevation: 0.0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(5),
          children: <Widget>[
            //    BackButton(color: Colors.red,),
            Card(

           child: ListTile(
              trailing: Icon(
                Icons.favorite,
                color: Colors.blue
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
              title: Text('FirstScreen',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  )),
              subtitle: Text("text fild"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => FirstScreen(),
                ));
              },
            )),
            Card(
            child:ListTile(
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: FlutterLogo(
                    colors: Colors.red,
                  ),
                ),
                title: Text('SecondScreen',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic)),
                subtitle: Text("Button , images , Border and card "),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => SecondScreen(),
                    ),
                  );
                })),
            Card(
            child:ListTile(
              trailing: Icon(
                Icons.favorite,
                color: Colors.green,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.home),
              ),
              title: Text('ThirdScreen',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontStyle: FontStyle.italic)),
              subtitle: Text("Long list "),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ThirdScreen(),
                ));
              },
            )),
            Card(
            child:ListTile(
                trailing: Icon(
                  Icons.favorite,
                  color: Colors.amber,
                ),
                leading: CircleAvatar(
                  backgroundColor: Colors.grey[300],
                  child: Icon(Icons.account_balance,color: Colors.black,)
                ),
                title: Text('FourthScreen',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        fontStyle: FontStyle.italic)),
                subtitle: Text("Simple Interest Calculator"),
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) => FourthScreen(),
                    ),
                  );
                }
            )),
Card(
          child:  ListTile(
              trailing: Icon(
                Icons.favorite,
                color: Colors.black,
              ),
              leading: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(
                  Icons.note_add,
                ),
              ),
              title: Text('FifthScreen',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                  )),
              subtitle: Text("Notes Database"),
              onTap: () {
               Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => FifthScreen(),));
              },
            )),
            Divider(),
            ListTile(
                title: Center(
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child:
                        RaisedButton(child: Text('Ok'), onPressed: () {})))),
          ],
        ),

        /*
            top: (screenHeight / 2) + 250,
            left: screenWidth / 2 + 150,
            width: 50,
            height: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(25)),
                child: RaisedButton(
                  color: Colors.amberAccent,
                  onPressed: () {},
                )))*/
      ),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: value,
      onTap: (int value){
        setState(() {
          this.value=value;
        });

      },
      selectedFontSize: 20,
      showUnselectedLabels: false,
      items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        title: Text('foo')
      ),BottomNavigationBarItem(
          icon: Icon(Icons.home),
            title: Text('baar')
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
            title: Text('xyz')
        )
      ],

    ),
    floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child:Icon(Icons.add),
      tooltip: "this button to add new Screen",
    ),
    )
    );
  }
}