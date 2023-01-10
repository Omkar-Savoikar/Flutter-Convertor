import 'package:flutter/material.dart';

const List<String> list = <String>["Centimeter", "Meter", "Kilometer"];

class Length extends StatefulWidget {
  const Length({Key? key}) : super(key: key);

  @override
  State<Length> createState() => _LengthState();
}

class _LengthState extends State<Length> {

  final _formKey = GlobalKey<FormState>();
  String? dropDownValue1 = list.first;
  String? dropDownValue2 = list.first;
  String? finalValue = "";
  String? inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertor - Length"),
      ),
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.red,
            ),
          ),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                      value: dropDownValue1,
                      elevation: 16,
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropDownValue1 = value!;
                        });
                      }
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(left: 20.0),
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        cursorHeight: 0,
                        decoration: const InputDecoration(
                          border: UnderlineInputBorder(),
                        ),
                        maxLength: 10,
                        autofocus: true,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          setState(() {
                            inputValue = value;
                            // inputValue = value as int?;
                          });
                        },
                      ),
                    ),
                  ),
                  DropdownButton <String>(
                      value: dropDownValue2,
                      elevation: 16,
                      items: list.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          dropDownValue2 = value;
                        });
                      }
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: Center(
                      child: Text(
                        finalValue!,
                        // finalValue.toString(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        _formKey.currentState?.save();
                        setState(() {
                          finalValue =
                              convertor();
                        });
                      },
                      child: const Text("Submit"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  double convertToMeter(double inpVal) {
    double mtr = inpVal;
    if (dropDownValue1?.compareTo("Kilometer") == 0) {
      mtr = inpVal * 1000;
    } else if (dropDownValue1?.compareTo("Centimeter") == 0) {
      mtr = (inpVal / 100);
    }
    return mtr;
  }

  double convertFromMeter(double inpVal) {
    double mtr = inpVal;
    if (dropDownValue2?.compareTo("Kilometer") == 0) {
      mtr = inpVal / 1000;
    } else if (dropDownValue2?.compareTo("Centimeter") == 0) {
      mtr = (inpVal * 100);
    }
    return mtr;
  }

  String convertor() {
    double inpVal = double.parse(inputValue!);
    if (dropDownValue1?.compareTo(dropDownValue2!) == 0) {
      return inpVal.toString();
    }
    double mtr = convertToMeter(inpVal);
    double outVal = convertFromMeter(mtr);
    return outVal.toString();
  }
  
}
