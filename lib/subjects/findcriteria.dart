import 'package:flutter/material.dart';
import 'package:studyhive/style.dart';
import 'package:studyhive/match/match.dart';
class FindSubjectOptions extends StatelessWidget {
  FindSubjectOptions({ Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Spacer(flex: 2),
            Row(children: [
              Spacer(flex: 1,),
              Text("Study Hive", style: Theme.of(context).textTheme.headline2),
              Spacer(flex: 2,),]),
            Spacer(flex: 2),
            Text("Time To Study!", style: Theme.of(context).textTheme.headline3,),
            Spacer(flex: 2),
            DropDownSearch(),
            Spacer(flex: 3),
            FindBuddyBtn(name: 'Find Studymate!', func: MatchedView()),
            Spacer(flex: 5),
          ],
        )
      )
    );
  }
}

class DropDownSearch extends StatefulWidget {
  const DropDownSearch({ Key? key }) : super(key: key);

  @override
  _DropDownSearchState createState() => _DropDownSearchState();
}

class _DropDownSearchState extends State<DropDownSearch> {
  String? picked;
  final List<String> subjects = 
  ['Math', 'Science', 'English', 'History', 'Foreign Language', 'Geography', 'Business'];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 1),
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: DropdownButton<String>(
        hint: const SizedBox(
          width: double.infinity,
          child: Text("Pick a course to find a study buddy",
          textAlign: TextAlign.center,)),
        value: picked,
        isExpanded: true,
        onChanged: (value) => setState(() {
          picked = value;}),
        items: subjects.map(buildMenuItem).toList(),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) =>
    DropdownMenuItem(value: item, child: SizedBox(width: double.infinity, child: Text(item,
     style: Theme.of(context).textTheme.headline3, textAlign: TextAlign.center)));
}

class FindBuddyBtn extends StatelessWidget {
  Widget func;
  String name;

  FindBuddyBtn({ Key? key, required this.name, required this.func}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.06,
      width: size.width * 0.4,
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