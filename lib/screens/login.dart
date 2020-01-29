import 'package:flutter/material.dart';
import 'package:login_app/screens/loginsuccess.dart';


class login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    //
    return loginstate();
  }
}

class loginstate extends State<login> {
  @override

  var key = GlobalKey<FormState>();
  final minimumpadding = 2.0;
  TextEditingController usernamecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();


  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.title;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Now'),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: EdgeInsets.all(minimumpadding * 2.0),
          child: ListView(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(45.0),
              ),
              imageasset(),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumpadding * 2.0, bottom: minimumpadding * 2.0,left:minimumpadding*10 ,right: minimumpadding*10),
                  child: TextFormField(
controller : usernamecontroller,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Username Please';
                      }
                      if(value!= "deep")
                      {
                        return "Please Enter Correct Username";
                      }
                    },
                    style: textStyle,
                    decoration: InputDecoration(
                        errorStyle:
                        TextStyle(color: Colors.red, fontSize: 15.0),
                        labelText: 'Username',
                        labelStyle: textStyle,
                        hintText: 'Enter Username',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  )),
              Padding(
                  padding: EdgeInsets.only(
                      top: minimumpadding * 2.0, bottom: minimumpadding * 2.0,left:minimumpadding*10 ,right: minimumpadding*10),
                  child: TextFormField(
                    controller: passwordcontroller,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter Password Please';
                      }
                      if(value!= "deep")
                        {
                          return "Please Enter Correct Password";
                        }
                    },
                    style: textStyle,
                    decoration: InputDecoration(
                        errorStyle:
                        TextStyle(color: Colors.red, fontSize: 15.0),
                        labelText: 'Password',
                        labelStyle: textStyle,
                        hintText: 'Enter Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        )),
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 125.0,left: 125.0, top: 10.0),
                  child: ButtonTheme(
                      height: 50,

                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(color: Colors.white70),
                        ),
                        color: Colors.deepPurple,
                        textColor: Colors.white70,
                        child: Text(
                          'Login',
                          textScaleFactor: 1.5,
                        ),
                        onPressed: () {
                          setState(() {
                            if (key.currentState.validate()) {
                              loginsuccessfull();
                            }
                          });
                        },
                      )))
            ],
          ),
        ),
      ),
    );
  }

  void loginsuccessfull() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return loginsuccess();
    }));
  }

  Widget imageasset() {
    AssetImage assetImage = AssetImage('images/icons8-lock-200.png');
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );

    return Container(
      child: image,
      margin: EdgeInsets.all(minimumpadding * 10.0),
    );
  }
}
