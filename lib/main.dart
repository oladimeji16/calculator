import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String output = '0';

  String _output = '0';
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';




  buttonPressed(String buttonText){
    if(buttonText == 'CLEAR') {
       _output = '0';
       num1 = 0.0;
       num2 = 0.0;
       operand = '';
    } else if(buttonText == '+'|| buttonText == '-'|| buttonText == '/'|| buttonText == 'X'){
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if(buttonText == '.'){
      if(_output.contains('.')){
        print('Already contains a decimal');
        return;
      } else{
        _output = _output + buttonText;
      }
    } else if(buttonText == '=') {
      num2 = double.parse(output);

      if(operand == '+'){
        _output = (num1 + num2).toString();
      }
      if(operand == '-'){
        _output = (num1 - num2).toString();
      }
      if(operand == 'X'){
        _output = (num1 * num2).toString();
      }
      if(operand == '/'){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = '';
    } else {
      _output = _output + buttonText;
    }
    print(_output);
    setState(() => output = double.parse(_output).toStringAsFixed(2));


  }

  Widget numButton(String buttonText){

    return  Expanded(
        child: FlatButton(
          padding: EdgeInsets.all(24.0),
          child: Text(buttonText,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          onPressed: (){buttonPressed(buttonText);},

        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.centerRight,
                  padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0,),
                    child: Text(output,
                    style: TextStyle(
                      fontSize: 48.0,
                      fontWeight: FontWeight.bold,
                    ),)
                ),

                Expanded(
                    child: SizedBox(height: 30.0,),
                ),

                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        numButton('7'),
                        numButton('8'),
                        numButton('9'),
                        numButton('/'),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        numButton('4'),
                        numButton('5'),
                        numButton('6'),
                        numButton('X'),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        numButton('1'),
                        numButton('2'),
                        numButton('3'),
                        numButton('-'),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        numButton('.'),
                        numButton('0'),
                        numButton('00'),
                        numButton('+'),
                      ],
                    ),

                    Row(
                      children: <Widget>[
                        numButton('CLEAR'),
                        numButton('='),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
