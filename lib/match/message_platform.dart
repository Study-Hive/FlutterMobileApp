import 'package:flutter/material.dart';

class MessageMain extends StatelessWidget {
  const MessageMain({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          width: size.width * 0.9,
          height: size.height * 0.85,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    ClipOval(
                      child: Image.asset("images/matchedperson.jpg", width: 50, height: 50,)
                      ,),
                      SizedBox(width: 10,),
                      Text("Anna", style: Theme.of(context).textTheme.headline3)
                    ],
                  ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  TextField(
                    style: Theme.of(context).textTheme.headline3,
                    decoration: InputDecoration(
                      constraints: BoxConstraints(maxWidth: 0.65 * size.width)
                    ),
                  ),
                IconButton(icon: Icon(Icons.send), onPressed: () {},)
            ],
          ),
              )
        ]
        ),
      ),
    ));
  }
}