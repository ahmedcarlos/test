import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyText.dart';
class SecondScreen extends StatelessWidget{
  @override
  Widget build (BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return new MaterialApp(

      home: Scaffold(
        appBar:AppBar(
          title: Text('Carlos',style: TextStyle(color: Colors.pinkAccent),),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.menu,color: Colors.pinkAccent,),
              onPressed: (){},
            )
          ],
          leading: IconButton(
            icon:Icon (Icons.arrow_back,
            color: Colors.pinkAccent,
            ),
              onPressed: (){
                  Navigator.of(context).push(MaterialPageRoute(builder:(BuildContext context)=>MyText(),));
              },
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,

        ) ,

        body:Container(
padding:EdgeInsets.all(10),
          margin: EdgeInsets.all(1),
          width: screenWidth,
          height: screenHeight,
          decoration: BoxDecoration(
              color: Colors.blueGrey[900],
            border:Border.all(
              color:Colors.red,width: 5
            )
          ),

          child: Column(
            
       //     mainAxisAlignment: MainAxisAlignment.start,
         //   crossAxisAlignment: CrossAxisAlignment.start,
//textDirection: TextDirection.ltr,
          //verticalDirection: VerticalDirection.down,

            children: <Widget>[
              Text('ahmed ',style: TextStyle(color: Colors.blue,)),
              Text('carlos' ,style: TextStyle(color: Colors.blue),),
              Text('${MediaQuery.of(context).size.width.toInt()}',style: TextStyle(color: Colors.blue),),
              Image.asset('images/1.jpg'),
              Card(
                color: Colors.pinkAccent,
                child: Text('ahmed',style: TextStyle(fontSize: 30,color: Colors.blue,),),
              ),
              FlatButton(
                child: Text('click Me',style: TextStyle(fontSize: 20,color: Colors.pinkAccent)),
                onPressed: (){},
                color: Colors.tealAccent,
                colorBrightness: Brightness.dark,
              ),
              FlatButton.icon(
                  onPressed: (){}, icon:Icon(Icons.favorite,color: Colors.blue,), label: Text('ahmed'),
                color: Colors.deepPurpleAccent
                ,
              ),
              RaisedButton(
                color: Colors.lightGreen,
                child: Text("Press to show message",style: TextStyle(color: Colors.pink),),
                elevation: 10,
                onPressed: ()=>show(context)
              )
            ],
          ),
        )
      ),
    );
  }}
  void show (BuildContext context){
  var alertDialog =AlertDialog(
    title: Text("Wellcome that is me",style: TextStyle(color: Colors.red),),
    content: Text("my first alert Dialog",style: TextStyle(color: Colors.pinkAccent),),
    backgroundColor: Colors.deepPurple,
  );
  showDialog(
      context:context,
    builder:(BuildContext context)=>alertDialog
    );
  }