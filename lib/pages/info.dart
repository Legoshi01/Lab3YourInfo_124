import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lab3yourinfo_124/models/music.dart';
import 'package:lab3yourinfo_124/models/course.dart';
// import 'package:inputwidgets/models/drink.dart';
// import 'package:inputwidgets/models/food.dart';

class register extends StatefulWidget {
  const register({Key? key}) : super(key: key);

  @override
  _InputwidgetsState createState() => _InputwidgetsState();
}

class _InputwidgetsState extends State<register> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _username = TextEditingController();
  TextEditingController _pasw = TextEditingController();

  String? groupcourse;
  List<Course>? courses;

  List checkMusic = [];
  List<Music>? musics;
//DD
  List<ListItem>? types = ListItem.getItem();
  late List<DropdownMenuItem<ListItem>> _dropdownMenuItem;
  late ListItem _selectedTypeItem;

//
  @override
  void initState() {
    super.initState();
    courses = Course.getCourse();
    musics = Music.getMusic();
    _dropdownMenuItem = createDropdownMenuItem(types!);
    _selectedTypeItem = _dropdownMenuItem[0].value!;

    print(courses);
  }

  List<DropdownMenuItem<ListItem>> createDropdownMenuItem(
      List<ListItem> types) {
    List<DropdownMenuItem<ListItem>> items = [];

    for (var item in types) {
      items.add(DropdownMenuItem(
        child: Text(item.name!),
        value: item,
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('Input Widgets')),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          decoration: BoxDecoration(
              // gradient: LinearGradient(
              //     begin: Alignment.centerLeft,
              //     end: Alignment.centerRight,
              //     colors: [Colors.white, Colors.blue, Colors.purple]
              //     )

              //     gradient: RadialGradient(
              //   colors: [Colors.yellow, Colors.deepPurple],
              // )
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.topCenter,
                  // Add one stop for each color
                  // Values should increase from 0.0 to 1.0
                  stops: [
                0.1,
                0.5,
                0.8,
                0.9
              ],
                  colors: [
                Colors.indigo,
                Colors.indigoAccent,
                Colors.blue,
                Colors.blueAccent
              ])),
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                    child: Text('Register',
                        style: GoogleFonts.itim(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 30)))),
              ),
              textfield(),
              textfieldpasw(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                    child: Text('Course',
                        style: GoogleFonts.itim(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 30)))),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Column(
                    children: createRadioCourse(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 8, 20),
                child: Center(
                    child: Text('สาขา: $groupcourse',
                        style: GoogleFonts.itim(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 20)))),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Center(
                    child: Text('Faculty',
                        style: GoogleFonts.itim(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 30)))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                child: dropdown(),
              ),
              Center(
                  child: Text('คณะ: ${_selectedTypeItem.name}',
                      style: GoogleFonts.itim(
                          textStyle:
                              TextStyle(color: Colors.white, fontSize: 20)))),

              // Text(groupfood.toString()),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                child: Center(
                    child: Text('Favorite Music',
                        style: GoogleFonts.itim(
                            textStyle:
                                TextStyle(color: Colors.white, fontSize: 30)))),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(8, 10, 8, 10),
                child: Column(
                  children: createCheckboxMusic(),
                ),
              ),
              submitBT(),
            ],
          ),
        ),
      ),
    );
  }

  Center dropdown() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
          child: DropdownButton(
            items: _dropdownMenuItem,
            value: _selectedTypeItem,
            onChanged: (ListItem? value) {
              setState(() {
                _selectedTypeItem = value!;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget submitBT() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(150, 5, 150, 5),
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print(_username.text + '  ' + _pasw.text);
          }
        },
        child: Text('Register'),
      ),
    );
  }

  Widget textfield() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: TextFormField(
          style: TextStyle(color: Colors.teal),
          controller: _username,
          validator: (vaLue) {
            if (vaLue!.isEmpty) {
              return "please enter name";
            }
            return null;
          },
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              labelText: 'Name',
              prefixIcon: Icon(
                Icons.person,
                color: Colors.teal,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(32)),
              )),
        ),
      ),
    );
  }

  Widget textfieldpasw() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      child: TextFormField(
        obscureText: true,
        obscuringCharacter: '*',
        controller: _pasw,
        validator: (vaLue) {
          if (vaLue!.isEmpty) {
            return "please enter your StudentId";
          }
          return null;
        },
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            labelText: 'StudentId',
            prefixIcon: Icon(
              Icons.vpn_key,
              color: Colors.teal[400],
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(32)),
            )),
      ),
    );
  }

  List<Widget> createRadioCourse() {
    List<Widget> listCourse = [];

    for (var course in courses!) {
      listCourse.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 15),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
            ),
            // decoration: BoxDecoration(color: Colors.white),
            child: Container(
              child: RadioListTile<dynamic>(
                title: Text(
                  course.courseName!,
                  style: GoogleFonts.kanit(
                      textStyle: TextStyle(color: Colors.black)),
                ),
                value: course.courseValue!,
                groupValue: groupcourse,
                onChanged: (value) {
                  setState(() {
                    groupcourse = value;
                  });
                },
              ),
            ),
          ),
        ),
      );
    }

    return listCourse;
  }

  List<Widget> createCheckboxMusic() {
    List<Widget> listMusic = [];

    for (var drink in musics!) {
      listMusic.add(
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white,
            ),
            child: CheckboxListTile(
              value: drink.checked,
              title: Text(drink.musicname!),
              // subtitle: Text('${drink.price} บาท'),
              onChanged: (value) {
                setState(() {
                  drink.checked = value;
                });
              },
            ),
          ),
        ),
      );
    }
    return listMusic;
  }
}

class ListItem {
  int? value;
  String? name;

  ListItem(this.value, this.name);

  static getItem() {
    return [
      ListItem(1, 'คณะศึกษาศาสตร์'),
      ListItem(2, 'คณะวิทยาศาสตร์'),
      ListItem(3, 'คณะวิทยาการสุขภาพและการกีฬา'),
      ListItem(4, 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
      ListItem(5, 'คณะนิติศาสตร์'),
      ListItem(6, 'คณะวิศวกรรมศาสตร์'),
      ListItem(7, 'คณะพยาบาลศาสตร์'),
      ListItem(8, 'คณะอุตสาหกรรมเกษตรและชีวภาพ'),
    ];
  }

  // void add(DropdownMenuItem dropdownMenuItem) {}
}
