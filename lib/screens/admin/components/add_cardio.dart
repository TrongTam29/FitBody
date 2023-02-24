import 'package:flutter/material.dart';

class AddCardio extends StatelessWidget {
  const AddCardio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = TextStyle(fontSize: 18, color: Colors.black);
    TextEditingController name = TextEditingController();
    TextEditingController image = TextEditingController();
    TextEditingController link = TextEditingController();
    TextEditingController duration = TextEditingController();
    TextEditingController exerTime = TextEditingController();
    TextEditingController breakTime = TextEditingController();
    TextEditingController focus = TextEditingController();
    return SingleChildScrollView(
      child: SafeArea(
          child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          ListTile(
            leading: Text(
              'Name',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: name,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Image',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: image,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Link',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: link,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Duration',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: duration,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'ExerTime',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: exerTime,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Break',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: breakTime,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Focus',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: focus,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      )),
    );
  }
}
