import 'package:cinema_project/screens/FoodChoosing.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Seats extends StatefulWidget {
  var time;
  dynamic movie;
  var chosen;
  var seat;
  Seats(this.movie, this.time, this.chosen, {Key key}) : super(key: key);

  @override
  _SeatsState createState() => new _SeatsState();
}

class _SeatsState extends State<Seats> {
  List<int> _selectedItems = List();
  int price = 30;
  int sum = 0;
  String selectedSeatsText = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff828EFB),
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Seats",
          style: GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        titleSpacing: 6,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: 420,
            width: 350,
            transform: Matrix4.translationValues(25, 65, 1),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.pink,
                spreadRadius: 1,
                blurRadius: 0,
                offset: Offset(-7, 8), // changes position of shadow
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(45)),
            child: Column(
              children: [
                Container(transform: Matrix4.translationValues(0, 40, 1), child: Text("Screen")),
                Container(
                  width: 250,
                  transform: Matrix4.translationValues(0, 50, 1),
                  child: Divider(
                    height: 10,
                    color: Colors.pink,
                    thickness: 3,
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0, 100, 1),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: GridView.count(
                      crossAxisSpacing: 20,
                      shrinkWrap: true,
                      crossAxisCount: 6,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1,
                      children: List.generate(seats.length, (index) {
                        return Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if(_selectedItems.contains(index)==false){
                                  sum = sum + price;
                                  _selectedItems.add(index);
                                  selectedSeatsText = "";
                                  _selectedItems.forEach((element) {
                                    if (selectedSeatsText != "") selectedSeatsText += " , ";
                                    selectedSeatsText += (seats[element]);

                                  });
                                }else{
                                  sum = sum - price;
                                  _selectedItems.remove(index);
                                  selectedSeatsText = "";
                                  _selectedItems.forEach((element) {
                                    if (selectedSeatsText != "") selectedSeatsText += " , ";
                                    selectedSeatsText += (seats[element]);

                                  });
                                }
                              });
                            },
                            color: _selectedItems.contains(index) ? Colors.pink : Color(0xff828EFB),
                            child: Text(
                              seats[index],
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0, 160, 1),
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0), side: BorderSide(color: Colors.pink)),
                      color: Colors.white,
                      child: Text(
                        'Ticket Summery',
                        style: TextStyle(color: Colors.pink),
                      ),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                              contentPadding: EdgeInsets.only(bottom: 0, left: 5),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(32.0))),
                              actions: [
                                FlatButton(
                                  textColor: Colors.pink,
                                  onPressed: () => Navigator.pop(context),
                                  child: Text('CLOSE'),
                                )
                              ],
                              insetPadding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                              title: Text("TicketSummery", textAlign: TextAlign.center, style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.pink)),
                              content: Container(
                                width: 100,
                                height: 100,
                                child: ListView(
                                  children: [
                                    Text("Movie: " + "${widget.movie}", style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black)),
                                    Text("Time:  " + widget.time, style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black)),
                                    Text("Date:  " + DateFormat.yMd().format(widget.chosen), style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black)),
                                    Text("Seats:  " + selectedSeatsText + "  Price: " + "$sum", style: GoogleFonts.poppins(fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black)),
                                  ],
                                ),
                              )),
                        );
                      }),
                ),
              ],
            ),
          ),
          Container(
              transform: Matrix4.translationValues(25, 125, 1),
              child: RaisedButton(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40.0), side: BorderSide(color: Colors.pink)),
                color: Colors.pink[400],
                child: Text(
                  'Procced to Food',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ChoosingFood("${widget.movie}", widget.time, widget.chosen, selectedSeatsText, "$sum");
                  }));
                },
              )),
        ],
      ),
    );
  }
}

List<String> seats = [
  'A1',
  'A2',
  'A3',
  'A4',
  'A5',
  'B1',
  'B2',
  'B3',
  'B4',
  'B5',
  'C1',
  'C2',
  'C3',
  'C4',
  'D1',
  'D2',
  'D3',
  'D4',
  'D5',
  'E1',
  'E2',
  'E3',
  'E4',
  'E5',
];

void main() {


  ///Please update theme as per your need if required.
  runApp(Seats());
}