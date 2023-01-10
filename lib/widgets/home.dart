import 'package:convertor/widgets/length.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final List<dynamic> _titles = ["Length", "Area", "Volume", "Mass", "Temperature", "Data"];
  final List<dynamic> _icons = [Icons.horizontal_rule_rounded, Icons.ac_unit, Icons.square, Icons.monitor_weight, Icons.thermostat, Icons.data_usage];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Convertor"),
      ),
      backgroundColor: Colors.blueAccent,
      body: GridView.builder(
        itemCount: 6,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: GestureDetector(
              onTap: () {
                _changeScreen(index);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                  )
                ),
                child: Column(
                  children: [
                    Icon(
                      // icons[index],
                      _icons[index],
                      size: 150.0,
                    ),
                    Text(
                      _titles[index],
                      style: const TextStyle(
                        fontSize: 30.0,
                      ),
                    ),
                  ],
                ),
              ),
            )
          );
        },
      ),
    );
  }

  void _changeScreen(int index) {
    switch (index) {
      case 0: {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Length()),
        );
        break;
      }
      default: break;
    }
  }
}
