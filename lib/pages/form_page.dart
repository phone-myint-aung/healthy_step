import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthy_step/router/router.gr.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
  }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      radius: 50,
                    ),
                    Icon(
                      Icons.add,
                      color: Colors.green,
                      size: 35,
                    ),
                  ],
                ),
              ),
              Form(
                child: Column(
                  children: [
                    TextFieldWithText(),
                    TextFieldWithText(),
                    TextFieldWithText(),
                    MaleFemaleSelector(),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                AutoRouter.of(context).push(MainRoute());
                              },
                              child: Center(
                                  child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              )),
                            ),
                          ),
                          SizedBox(width: 30),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  'Confirm',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MaleFemaleSelector extends StatelessWidget {
  const MaleFemaleSelector({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 18),
            child: Text(
              'Select Gender',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              GenderButton(Icons.male, 'Male', Colors.blue),
              SizedBox(width: 20),
              GenderButton(Icons.female, 'Female', Colors.pink),
            ],
          ),
        ],
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton(
    this.icon,
    this.text,
    this.iconColor, {
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          color: Color(0xFF304878),
          borderRadius: BorderRadius.circular(35),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color: iconColor,
            ),
            SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFieldWithText extends StatelessWidget {
  const TextFieldWithText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16),
            child: Text(
              'Name',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
            decoration: BoxDecoration(
              color: Color(0xFF304878),
              borderRadius: BorderRadius.circular(35),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 5,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                (true) ? DrowdownMatrix() : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrowdownMatrix extends StatefulWidget {
  const DrowdownMatrix({
    Key? key,
  }) : super(key: key);

  @override
  _DrowdownMatrixState createState() => _DrowdownMatrixState();
}

class _DrowdownMatrixState extends State<DrowdownMatrix> {
  List<String> list = ['kg', 'lbs'];
  String dropdownValue = 'kg';
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        dropdownColor: Color(0xFF304878),
        isExpanded: true,
        style: TextStyle(fontSize: 18, color: Colors.white.withOpacity(.6)),
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (newString) {
          setState(() {
            dropdownValue = newString!;
          });
        },
      ),
    );
  }
}
