import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/MyText.dart';
class FourthScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FourthScreenState();
  }
}

class FourthScreenState extends State<FourthScreen> {
  var _currencies = ['Rupess', 'Dollars', 'Pounds'];
  var name = 'Rupess';
  var disPlayResult = '';
  var _formKey = GlobalKey<FormState>();
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.indigo,
            accentColor: Colors.indigo),
        home: Scaffold(
          //resizeToAvoidBottomPadding: false,
          appBar: AppBar(
            title: Text("Simple Interest Calculator"),
            elevation: 0.0,
            leading: IconButton(
              icon:Icon (Icons.arrow_back,),
              onPressed: (){
                Navigator.of(context).pop();
              },
            ),

          ),
          body: Form(
            key: _formKey,
            //  margin: EdgeInsets.all(15.0),
            child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ListView(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 25),
                      child: Image.asset(
                        'images/1.jpg',
                        width: 125.0,
                        height: 125.0,
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: TextFormField(
                          controller: principalController,
                          style: textStyle,
                          keyboardType: TextInputType.number,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please Enter principal amount';
                            }
                          },
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              labelStyle: textStyle,
                              labelText: 'Principal',
                              hintText: 'Enter Principal e.g 12000',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              )),
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: TextFormField(
                          controller: roiController,
                          style: textStyle,
                          keyboardType: TextInputType.number,
                          // ignore: missing_return
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'please Enter principal amount';
                            }
                          },
                          decoration: InputDecoration(
                              errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontSize: 15.0,
                              ),
                              labelStyle: textStyle,
                              labelText: 'Rate of Interest',
                              hintText: 'In percent',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ))),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                              child: TextFormField(
                                  controller: termController,
                                  style: textStyle,
                                  keyboardType: TextInputType.number,
                                  // ignore: missing_return
                                  validator: (String value) {
                                    if (value.isEmpty) {
                                      return 'please Enter principal amount';
                                    }
                                  },
                                  decoration: InputDecoration(
                                      errorStyle: TextStyle(
                                        color: Colors.redAccent,
                                        fontSize: 15.0,
                                      ),
                                      labelStyle: textStyle,
                                      labelText: 'Term',
                                      hintText: 'Time in years',
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      )))),
                          Container(width: 25),
                          Expanded(
                              child: DropdownButton<String>(
                            items: _currencies.map((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                            value: name,
                            onChanged: (String newValueSelected) {
                              setState(() {
                                name = newValueSelected;
                              });
                            },
                          ))
                        ],
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 5, bottom: 5),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: RaisedButton(
                                color: Colors.indigo,
                                textColor: Colors.black,
                                child: Text(
                                  'Calculate',
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (_formKey.currentState.validate()) {
                                      this.disPlayResult =
                                          _calculateTotalReturns();
                                    }
                                  });
                                },
                              ),
                            ),
                            Expanded(
                              child: RaisedButton(
                                color: Colors.black,
                                textColor: Colors.white,
                                child: Text(
                                  'Reset',
                                  textScaleFactor: 1.5,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _reset();
                                  });
                                },
                              ),
                            )
                          ],
                        )),
                    Padding(
                        padding: EdgeInsets.all(10),
                        child: Center(
                          child: Text(
                            this.disPlayResult,
                            style: textStyle,
                          ),
                        ))
                  ],
                )),
          ),
        ));
  }

  String _calculateTotalReturns() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);
    double totalAmountPayable = principal + (principal * roi * term) / 100;
    String result =
        'After $term years , your investment will be worth $totalAmountPayable $name';
    return result;
  }

  void _reset() {
    principalController.text = '';
    roiController.text = '';
    termController.text = '';
    disPlayResult = '';
    name = _currencies[0];
  }
}
