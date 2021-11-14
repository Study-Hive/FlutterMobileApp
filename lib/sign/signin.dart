import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:studyhive/style.dart';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:studyhive/subjects/findcriteria.dart';

class SignIn extends StatelessWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 2,),
            Row(children: [
            Spacer(flex: 1,),
            Text("Study Hive", style: Theme.of(context).textTheme.headline2),
            Spacer(flex: 2,),
            ]),
            Spacer(flex: 1,),
            Text("Login", style: Theme.of(context).textTheme.headline2,),
            Spacer(flex: 1),
            LoginForm(),
            Spacer(flex: 3),
          ],
        )
      )
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({ Key? key }) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final key = GlobalKey<FormState>();
  String id = '';
  String pw = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          buildID(),
          SizedBox(height: 30,),
          buildPassword(),
          SizedBox(height: 40,),
          submit(context)
        ],
      ),
    );
  }

  Widget buildID() {
    return TextFormField(
      style: Theme.of(context).textTheme.headline4,
      decoration: const InputDecoration(
        labelText: 'id',
        border: OutlineInputBorder(),),
        keyboardType: TextInputType.text,
        validator: (value) {
          if(value!.length < 4) {
            return 'Enter at least 4 character';
          }
          else {
            return null;
          }
        },
        onChanged: (value) => setState(() => id = value),
    );
  }
  Widget buildPassword() {
    return TextFormField(
      style: Theme.of(context).textTheme.headline4,
      decoration: const InputDecoration(
        labelText: 'password',
        border: OutlineInputBorder(),),
        keyboardType: TextInputType.text,
        obscureText: true,
        validator: (value) {
          if(value!.length < 4) {
            return 'Enter at least 4 character';
          }
          else {
            return null;
          }
        },
        onChanged: (value) => setState(() => pw = value),
    );
  }
    Widget submit(context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.7,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: defaultBtnColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextButton(
        child: Text("Submit", style: Theme.of(context).textTheme.subtitle1,),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context)=> FindSubjectOptions())
          );
        }
      )
    );
  }
  // Widget submit(context) {
  //   Size size = MediaQuery.of(context).size;
  //   return Container(
  //     height: size.height * 0.06,
  //     width: size.width * 0.7,
  //     alignment: Alignment.center,
  //     decoration: BoxDecoration(
  //       color: defaultBtnColor,
  //       borderRadius: BorderRadius.circular(15)
  //     ),
  //     child: TextButton(
  //       child: Text("Submit", style: Theme.of(context).textTheme.subtitle1,),
  //       onPressed: () {
  //         final isValid = key.currentState!.validate();
  //         if(isValid) {
  //           FutureBuilder<Map<String, String>>(
  //             future: checkUserInformation(id, pw),
  //             builder: (context, snapshot){
  //               if(snapshot.connectionState == ConnectionState.done)
  //               {
  //                 return FindSubjectOptions(data: snapshot.data);
  //               }
  //               else {
  //                 return CircularProgressIndicator();
  //               }
  //           }
  //         );
  //         }
  //         else {
  //           debugPrint("You are not eligible to submit");
  //         }
  //       },
  //     )
  //   );
  // }
  // Future<Map<String, String>> checkUserInformation(id, pw) async{
  //   var encoded = jsonEncode({'id': id, 'pw': pw});
  //   Uri uri = Uri.parse('127.0.0.1:5000/post');
  //   final response = await post(uri, body: encoded);
  //   return jsonDecode(response.body);
  // }
}