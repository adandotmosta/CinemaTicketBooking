import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dynamic Grid Example'),
        ),
        body: DynamicGrid(),
      ),
    );
  }
}

class DynamicGrid extends StatefulWidget {
  @override
  _DynamicGridState createState() => _DynamicGridState();
}

class _DynamicGridState extends State<DynamicGrid> {
  final List<List<String>> seatMatrix = [
    ['A1', 'A2', 'A3', 'A4', 'A5', 'A6'],
    ['B1', 'B2', 'B3', 'B4', 'B5', 'B6'],
    ['C1', 'C2', 'C3', 'C4', 'C5', 'C6'],
    // Add more rows as needed
  ];

  final Map<String, int> selectedItems = {};

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: seatMatrix.length,
      itemBuilder: (context, index) {
        List<String> rowSeats = seatMatrix[index];

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(rowSeats.length, (rowIndex) {
            String seat = rowSeats[rowIndex];

            Color buttonColor;
            switch (selectedItems[seat]) {
              case 0:
                buttonColor = Colors.black;
                break;
              case 1:
                buttonColor = Colors.blue;
                break;
              case 2:
                buttonColor = Colors.red;
                break;
              default:
                buttonColor = Colors.black;
                break;
            }

            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(15.adaptSize, 15.adaptSize),
                backgroundColor: buttonColor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                print('$seat changed');
                print('$seat state = ${selectedItems[seat]}');
                setState(() {
                  selectedItems[seat] = selectedItems[seat] == 0 ? 1 : 0;
                });
              },
              child: Text(seat),
            );
          }),
        );
      },
    );
  }
}

extension SizeExtension on num {
  double get adaptSize => this * 10; // You can adjust the multiplier as needed
}
