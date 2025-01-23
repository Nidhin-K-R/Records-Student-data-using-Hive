import 'package:flutter/material.dart';
import 'package:hive_practice_1/homescreen.dart';

import 'package:hive_practice_1/main.dart';
import 'package:hive_practice_1/student.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _hobbyController = TextEditingController();
  TextEditingController _schoolController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Records"),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              setState(() {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (ctx) => HomeScreen()));
              });
            },
            icon: Icon(Icons.arrow_back)),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  boxPersons.clear();
                });
              },
              icon: Icon(
                Icons.delete_forever,
                color: Colors.red,
              ))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: boxPersons.length,
              itemBuilder: (context, index) {
                Student student = boxPersons.getAt(index)!;
                return InkWell(
                  onTap: () {
                    setState(() {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shadowColor: Colors.grey,
                              content: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          "https://static.vecteezy.com/system/resources/previews/031/610/037/non_2x/a-of-a-3d-cartoon-little-boy-in-class-world-students-day-images-ai-generative-photo.jpg"),
                                      radius: 50,
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    actions: [
                                                      TextField(
                                                        controller:
                                                            _nameController,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              boxPersons.putAt(
                                                                  index,
                                                                  Student(
                                                                      name: _nameController
                                                                          .text,
                                                                      age: student
                                                                          .age,
                                                                      hobby: student
                                                                          .hobby,
                                                                      school: student
                                                                          .school));
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (ctx) =>
                                                                              Screen()));
                                                            });
                                                          },
                                                          child: Text("Add")),
                                                    ],
                                                  );
                                                });
                                          });
                                        },
                                        child: Text('Name : ${student.name}')),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    actions: [
                                                      TextField(
                                                        controller:
                                                            _ageController,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              boxPersons.putAt(
                                                                  index,
                                                                  Student(
                                                                      name: student
                                                                          .name,
                                                                      age: _ageController
                                                                          .text,
                                                                      hobby: student
                                                                          .hobby,
                                                                      school: student
                                                                          .school));
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (ctx) =>
                                                                              Screen()));
                                                            });
                                                          },
                                                          child: Text("Add")),
                                                    ],
                                                  );
                                                });
                                          });
                                        },
                                        child: Text('Age : ${student.age}')),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    actions: [
                                                      TextField(
                                                        controller:
                                                            _hobbyController,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              boxPersons.putAt(
                                                                  index,
                                                                  Student(
                                                                      name: student
                                                                          .name,
                                                                      age: student
                                                                          .age,
                                                                      hobby: _hobbyController
                                                                          .text,
                                                                      school: student
                                                                          .school));
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (ctx) =>
                                                                              Screen()));
                                                            });
                                                          },
                                                          child: Text("Add")),
                                                    ],
                                                  );
                                                });
                                          });
                                        },
                                        child:
                                            Text('Hobby : ${student.hobby}')),
                                    TextButton(
                                        onPressed: () {
                                          setState(() {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    actions: [
                                                      TextField(
                                                        controller:
                                                            _schoolController,
                                                      ),
                                                      ElevatedButton(
                                                          onPressed: () {
                                                            setState(() {
                                                              boxPersons.putAt(
                                                                  index,
                                                                  Student(
                                                                    name: student
                                                                        .name,
                                                                    age: student
                                                                        .age,
                                                                    hobby: student
                                                                        .hobby,
                                                                    school:
                                                                        _schoolController
                                                                            .text,
                                                                  ));
                                                              Navigator.pushReplacement(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (ctx) =>
                                                                              Screen()));
                                                            });
                                                          },
                                                          child: Text("Add")),
                                                    ],
                                                  );
                                                });
                                          });
                                        },
                                        child:
                                            Text('School : ${student.school}')),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.arrow_back,
                                            )),
                                        IconButton(
                                            onPressed: () {
                                              setState(() {
                                                boxPersons.deleteAt(index);
                                                Navigator.pop(context);
                                              });
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: Colors.red,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: CircleAvatar(
                            child: Icon(Icons.person),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Text(
                              student.name,
                              style: TextStyle(fontSize: 18),
                            )),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
