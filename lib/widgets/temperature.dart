import 'package:flutter/material.dart';

const List<String> list = <String>["Celsius", "Fahrenheit", "Kelvin"];

class Temperature extends StatefulWidget {
  const Temperature({Key? key}) : super(key: key);

  @override
  State<Temperature> createState() => _TemperatureState();
}

class _TemperatureState extends State<Temperature> {

  final _formKey = GlobalKey<FormState>();
  String? dropDownValue1 = list.first;
  String? dropDownValue2 = list.first;
  String? finalValue = "";
  String? inputValue = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertor - Temperature"),
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
                          finalValue = convertor();
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

  double convertToCelsius(double inpVal) {
    double cls = inpVal;
    if (dropDownValue1?.compareTo("Fahrenheit") == 0) {
      cls = (inpVal - 32) / 1.8;
    } else if (dropDownValue1?.compareTo("Kelvin") == 0) {
      cls = inpVal - 273.15;
    }
    return cls;
  }

  double convertFromCelsius(double inpVal) {
    double cls = inpVal;
    if (dropDownValue2?.compareTo("Fahrenheit") == 0) {
      cls = (inpVal * 1.8) + 32;
    } else if (dropDownValue2?.compareTo("Kelvin") == 0) {
      cls = inpVal + 273.15;
    }
    return cls;
  }

  String convertor() {
    double inpVal = double.parse(inputValue!);
    if (dropDownValue1?.compareTo(dropDownValue2!) == 0) {
      return inpVal.toString();
    }
    double mtr = convertToCelsius(inpVal);
    double outVal = convertFromCelsius(mtr);
    return outVal.toString();
  }

}
