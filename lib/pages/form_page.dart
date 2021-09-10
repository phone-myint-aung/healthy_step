import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:healthy_step/models/user_model.dart';
import 'package:healthy_step/router/router.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FormPage extends StatefulWidget {
  const FormPage({
    Key? key,
  }) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  late Box<UserName> nameBox;
  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  bool isSI = true;
  bool isMale = true;
  @override
  void initState() {
    super.initState();
    nameBox = Hive.box<UserName>('NameBox');
    nameController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
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
                Column(
                  children: [
                    Container(
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
                            padding: EdgeInsets.symmetric(
                                vertical: 12, horizontal: 24),
                            decoration: BoxDecoration(
                              color: Color(0xFF304878),
                              borderRadius: BorderRadius.circular(35),
                            ),
                            child: TextField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              textCapitalization: TextCapitalization.words,
                              style: TextStyle(fontSize: 24),
                              decoration: InputDecoration(
                                hintText: 'Enter your name',
                                border: InputBorder.none,
                                hintStyle: TextStyle(fontSize: 24),
                                suffixIcon: nameController.text.isEmpty
                                    ? Container(
                                        child: Container(width: 0),
                                      )
                                    : IconButton(
                                        icon: Icon(
                                          Icons.close,
                                          color: Colors.red,
                                          size: 25,
                                        ),
                                        onPressed: () => nameController.clear(),
                                      ),
                              ),
                              cursorColor: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 16),
                            child: Text(
                              'Unit',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSI = true;
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      decoration: BoxDecoration(
                                        color: (isSI)
                                            ? Color(0xFF304878)
                                            : Color(0xFF304878)
                                                .withOpacity(0.4),
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'kg/cm',
                                          style: TextStyle(fontSize: 24),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Flexible(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSI = false;
                                      });
                                    },
                                    child: Container(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16),
                                      decoration: BoxDecoration(
                                        color: isSI
                                            ? Color(0xFF304878).withOpacity(0.4)
                                            : Color(0xFF304878),
                                        borderRadius: BorderRadius.circular(35),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'lbs/ft',
                                          style: TextStyle(
                                            fontSize: 24,
                                          ),
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
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                              child: TextFieldForUnit(weightController,
                                  'Weight', (isSI) ? 'kg' : 'lbs')),
                          SizedBox(width: 20),
                          Flexible(
                              child: TextFieldForUnit(heightController,
                                  'Height', (isSI) ? 'cm' : 'ft')),
                        ],
                      ),
                    ),
                    Container(
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
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMale = true;
                                    });
                                  },
                                  child: GenderButton(
                                      Icons.male,
                                      'Male',
                                      Colors.blue,
                                      (isMale)
                                          ? Color(0xFF304878)
                                          : Color(0xFF304878).withOpacity(0.4)),
                                ),
                              ),
                              SizedBox(width: 20),
                              Flexible(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isMale = false;
                                    });
                                  },
                                  child: GenderButton(
                                    Icons.female,
                                    'Female',
                                    Colors.pink,
                                    (isMale)
                                        ? Color(0xFF304878).withOpacity(0.4)
                                        : Color(0xFF304878),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              onPressed: () {
                                AutoRouter.of(context).push(MainRoute(pageIndex: 3));
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
                              onPressed: () async {
                                if (nameController.text.isNotEmpty &&
                                    weightController.text.isNotEmpty &&
                                    heightController.text.isNotEmpty) {
                                  if (double.tryParse(weightController.text.toString()) ==
                                          null ||
                                      double.tryParse(heightController.text.toString()) ==
                                          null) {
                                    setState(() {
                                      weightController.clear();
                                      heightController.clear();
                                    });
                                    print(
                                        'weight and height field contain some character');
                                  } else {
                                    await nameBox.put(
                                      0,
                                      UserName()
                                        ..name = nameController.text
                                        ..weight =
                                            double.parse(weightController.text)
                                        ..height =
                                            double.parse(heightController.text)
                                        ..isSIUnit = isSI
                                        ..isMale = isMale,
                                    );
                                   AutoRouter.of(context).push(MainRoute(pageIndex: 3)); 
                                  }
                                } else
                                  print('fill all field');
                              },
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderButton extends StatelessWidget {
  const GenderButton(
    this.icon,
    this.text,
    this.iconColor,
    this.containerColor, {
    Key? key,
  }) : super(key: key);
  final IconData icon;
  final String text;
  final Color iconColor;
  final Color containerColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: containerColor,
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
    );
  }
}

class TextFieldForUnit extends StatefulWidget {
  const TextFieldForUnit(
    this.controller,
    this.title,
    this.hintText, {
    Key? key,
  }) : super(key: key);
  final TextEditingController controller;
  final String title;
  final String hintText;
  @override
  _TextFieldForUnitState createState() => _TextFieldForUnitState();
}

class _TextFieldForUnitState extends State<TextFieldForUnit> {
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
              widget.title,
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
                Expanded(
                  child: TextField(
                    controller: widget.controller,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 24),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 24),
                    ),
                    cursorColor: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
