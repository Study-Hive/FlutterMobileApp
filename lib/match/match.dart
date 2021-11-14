import 'package:studyhive/match/message_platform.dart';
import 'package:flutter/material.dart';
import 'package:studyhive/style.dart';
class MatchedView extends StatelessWidget {
  const MatchedView({ Key? key }) : super(key: key);

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
            SizedBox(height: 20,),
            MatchedInformation(context, 'images/matchedperson.jpg', 'Anna', 'Boston'),
            ClickForMoreInfo(context),
            Spacer(flex: 1,)
          ],
        )
      )
    );
  }

  Widget MatchedInformation(context, String imageLoction, String name, String location) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.8,
      height: size.height * 0.7,
      decoration: BoxDecoration(
        image: const DecorationImage(
          image: AssetImage("images/matchedperson.jpg"),
          fit: BoxFit.fitHeight
        ),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Column(
        children: <Widget>[
          Spacer(),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Row(children: [
              Text("$name,", style: Theme.of(context).textTheme.subtitle2),
              SizedBox(width: 10,),
              Text(location, style: Theme.of(context).textTheme.subtitle2),]),
          )
          ],
      )
    );
  }
  Widget ClickForMoreInfo(context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => MessageMain()),
      ),
      child: Container(
        width: size.width * 0.5,
        height: size.width * 0.1,
        margin: EdgeInsets.all(10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: defaultBtnColor,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Message", style: Theme.of(context).textTheme.subtitle1)],),
      )
    );
  }
}