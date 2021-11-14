import 'package:flutter/material.dart';
import 'package:studyhive/style.dart';
import 'package:studyhive/sign/signin.dart';

class Introduction extends StatelessWidget {
  Introduction({ Key? key }) : super(key: key);

  String quote = """Want to socialize but don’t know how to step ahead?\n
  Join us in becoming more social and acheiving productivity at the same time!\n
  We are going to help you socialize with others!\nSign up now!""";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Spacer(flex: 3),
          Row(children: [
            Spacer(flex: 1,),
            Text("Study Hive", style: Theme.of(context).textTheme.headline2),
            Spacer(flex: 2,),
            ]),
            Spacer(flex: 1),
          Image.asset("images/socialize.jpg", width: size.width * 0.7,),
          Container(
            width: size.width * 0.7,
            child: Text(quote, style: Theme.of(context).textTheme.headline4,)
          ),
          Spacer(flex: 1),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            SignBtn(name: "Sign Up", func: SignIn()),
            SignBtn(name: "Sign In", func: SignIn()),]),
            Spacer(flex: 1),
          ]),
        )
      );
  }
}

class SignBtn extends StatelessWidget {
  Widget func;
  String name;

  SignBtn({ Key? key, required this.name, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.25,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: defaultBtnColor,
        borderRadius: BorderRadius.circular(15)
      ),
      child: TextButton(
        child: Text(name, style: Theme.of(context).textTheme.subtitle1,),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => func)
          );
        },
      )
    );
  }
}