import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Interest Calculator App ',
      home: SiFrom(),
    ));

class SiFrom extends StatefulWidget {
  @override
  _SiFromState createState() => _SiFromState();
}

class _SiFromState extends State<SiFrom> {
  final double _minimumPadding = 5.0;
  var _currencies = ["Tk", "Dollars", "Pounds"];

  @override
  Widget build(BuildContext context) {
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
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Principal',
                      hintText: 'Enter Principal e.g. 1000',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Interest',
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
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Term',
                          hintText: 'Enter Term number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                        child: DropdownButton<String>(
                      items: _currencies.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      value: "Tk",
                      onChanged: (String newValueSelected) {},
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
                            child: Text('Calculate'),
                            elevation: 6.0,
                            onPressed: () {})),
                    Expanded(
                        child: RaisedButton(
                            child: Text('Reset'),
                            elevation: 6.0,
                            onPressed: () {})),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumPadding*2.0),
              child:Center(
                child: Text('To Do',style: TextStyle(fontSize: 20.0),),
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
}
