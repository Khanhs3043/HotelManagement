import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:manahotel/screens/homeScreen.dart';
import '../ui/myTheme.dart';

class loginScreen extends StatefulWidget{
  @override
  _loginScreenState createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen>{
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Provider.of<MyTheme>(context, listen: false).color1,
      body: Column(
        children: [
          Text('ABC Hotel'),
          TextField(
            controller: usernameController,
            decoration: InputDecoration(
              labelText: 'Username',
            ),
          ),
          SizedBox(height: 15,),
          TextField(
            controller: passwordController,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
          SizedBox(height: 15,),
          ElevatedButton(
            onPressed: (){
              String username = usernameController.text;
              String password = passwordController.text;

              if(username == 'abc' && password == '123'){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()));
                print('Login Successful!');
              } else{
                print('Login failed');
              }
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}