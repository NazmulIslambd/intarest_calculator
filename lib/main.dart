import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App ',
      home: SiFrom(),
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        accentColor: Colors.blueAccent,
        brightness: Brightness.dark,
      ),
    ));

class SiFrom extends StatefulWidget {
  @override
  _SiFromState createState() => _SiFromState();
}

class _SiFromState extends State<SiFrom> {
  final double _minimumPadding = 5.0;
  var _currencies = ["Tk", "Dollars", "Pounds"];
  var _currentItemSelected = "Tk";
  TextEditingController principalController = TextEditingController();
  TextEditingController interestController = TextEditingController();
  TextEditingController termController = TextEditingController();

  var display = "";

  void initState(){
    super.initState();
    _currentItemSelected =_currencies[0];
  }


  @override
  Widget build(BuildContext context) {
    // text theme declare here
    TextStyle textStyle = Theme.of(context).textTheme.headline6;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Simple Interest Calculator"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            getImageAsset(),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  controller: principalController,
                  style: textStyle,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      labelStyle: textStyle,
                      hintText: 'Enter Principal e.g. 1000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  controller: interestController,
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: 'Interest',
                      labelStyle: textStyle,
                      hintText: 'Enter Interest e.g. 10.0',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                          controller: termController,
                      style: textStyle,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          labelStyle: textStyle,
                          hintText: 'Enter Term number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      style: textStyle,
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: _currentItemSelected,
                      onChanged: (String newValueSelected) {
                        //  push method
                        _onDropDownSelected(newValueSelected);

                      },
                    ))
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding * 5.0, bottom: _minimumPadding * 5.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).accentColor,
                            textColor: Theme.of(context).primaryColorDark,
                            child: Text(
                              'Calculate',
                              textScaleFactor: 1.5,
                            ),
                            elevation: 6.0,
                            onPressed: () {
                              setState(() {
                               this.display =_calculateTotalReturns();
                              });

                            })),
                    Expanded(
                        child: RaisedButton(
                            color: Theme.of(context).primaryColorDark,
                            textColor: Theme.of(context).primaryColorLight,
                            child: Text(
                              'Reset',
                              textScaleFactor: 1.5,
                            ),
                            elevation: 6.0,
                            onPressed: () {
                              setState(() {
                                _reset();
                              });
                            })),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2.0),
              child: Center(
                child: Text(
                  this.display,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/money.png');
    Image image = Image(
      image: assetImage,
      width: 125,
      height: 125,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 10.0),
    );
  }

  //  here function create for dropdown item selected
  void _onDropDownSelected(String newValueSelected){
    setState(() {
      this._currentItemSelected =newValueSelected;
    });
  }


  String _calculateTotalReturns(){
    double principal = double.parse(principalController.text);
    double interest = double.parse(interestController.text);
    double term = double.parse(termController.text);

    double totalAmountPayable = principal +(principal *interest*term) /100;

    String result = 'After $term years, your investment will be worth $totalAmountPayable $_currentItemSelected';
    return result;
  }
  void _reset(){
    principalController.text='';
    interestController.text = '';
    termController.text='';
    _currentItemSelected=_currencies[0];
    display ='';
  }
}
