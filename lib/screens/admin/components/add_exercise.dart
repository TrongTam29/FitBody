import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/constants.dart';
import 'package:my_app/model/exercise/exercise_controller.dart';

class AddExercise extends StatefulWidget {
  const AddExercise();

  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  ExerciseController exerciseController = Get.put(ExerciseController());
  var textStyle = TextStyle(fontSize: 18, color: Colors.black);
  TextEditingController nameController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  TextEditingController repController = TextEditingController();
  TextEditingController setController = TextEditingController();
  TextEditingController breakTimeController = TextEditingController();
  TextEditingController detailController = TextEditingController();
  TextEditingController muscleGroupIDController = TextEditingController();
  String name = '';
  String image = '';
  String link = '';
  String rep = '';
  String set = '';
  String breakTime = '';
  String detail = '';
  int? muscleId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
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
                controller: nameController,
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
                controller: imageController,
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
                controller: linkController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Reps',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: repController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Sets',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: setController,
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
                controller: breakTimeController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'Detail',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: detailController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          ListTile(
            leading: Text(
              'MuscleGroup ID',
              style: textStyle,
            ),
            title: SizedBox(
              width: 100,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)),
                    hintText: 'Enter a search term'),
                controller: muscleGroupIDController,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              name = nameController.text;
              image = imageController.text;
              link = linkController.text;
              rep = repController.text;
              set = setController.text;
              breakTime = breakTimeController.text;
              detail = detailController.text;
              muscleId = int.parse((muscleGroupIDController.text).toString());
              setState(() {
                exerciseController.postExercise(name, link, image, rep, set,
                    breakTime, detail, muscleId ?? 1);
              });
            },
            child: Text('Done'),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(kPrimaryColor),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: BorderSide(color: Colors.white))),
              padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(vertical: 15, horizontal: 45)),
            ),
          ),
        ],
      )),
    );
  }
}
