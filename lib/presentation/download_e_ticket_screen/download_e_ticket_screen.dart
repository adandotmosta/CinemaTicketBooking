import 'package:cinema_ticket_booking_app/core/app_export.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_leading_image.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/appbar_title.dart';
import 'package:cinema_ticket_booking_app/widgets/app_bar/custom_app_bar.dart';
import 'package:cinema_ticket_booking_app/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as fs;
import 'package:readmore/readmore.dart';
import 'package:sqflite/sqflite.dart';
import '../../databases/DBHelper.dart';

class DBTickets {
  static const tableName = 'Ticket';
  static const sqlCode = '''
    CREATE TABLE IF NOT EXISTS Ticket (
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      film_name TEXT,
      date TEXT,
      seats TEXT,
      location TEXT,
      time TEXT,
      payment_status TEXT,
      order_number TEXT
    );
  ''';

  static Future<List<Map<String, dynamic>>> getAllTickets() async {
    try {
      final database = await DBHelper.getDatabase();
      var res = await database.rawQuery('SELECT * FROM $tableName');
      return res;
    } catch (error) {
      print('Error in getAllTickets: $error');
      throw error;
    }
  }

  static Future<int> getAllCount() async {
    final database = await DBHelper.getDatabase();
    var res = await database.rawQuery('SELECT COUNT(id) as cc FROM $tableName');
    return res[0]['cc'] ?? 0;
  }

  static Future<bool> syncTickets(List<Map<String, dynamic>> remoteData) async {
    List localData = await getAllTickets();
    Map indexRemote = {};
    List localIds = [];

    for (Map item in localData) {
      indexRemote[item['order_number']] = item['id'];
      localIds.add(item['id']);
    }

    for (Map item in remoteData) {
      String orderNumber = item['order_number'];
      String filmName = item['film_name'];
      String date = item['date'];
      String seats = item['seats'];
      String location = item['location'];
      String time = item['time'];
      String paymentStatus = item['payment_status'];

      if (indexRemote.containsKey(orderNumber)) {
        int localId = indexRemote[orderNumber];
        await updateRecord(localId, {
          'film_name': filmName,
          'date': date,
          'seats': seats,
          'location': location,
          'time': time,
          'payment_status': paymentStatus,
        });
        localIds.remove(localId);
      } else {
        await insertRecord({
          'film_name': filmName,
          'date': date,
          'seats': seats,
          'location': location,
          'time': time,
          'payment_status': paymentStatus,
          'order_number': orderNumber,
        });
      }
    }

    for (int localId in localIds) await deleteRecord(localId);

    return true;
  }

  static Future<bool> updateRecord(int id, Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    database.update(tableName, data, where: 'id=?', whereArgs: [id]);
    return true;
  }

  static Future<int> insertRecord(Map<String, dynamic> data) async {
    final database = await DBHelper.getDatabase();
    return await database.insert(tableName, data, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  static Future<bool> deleteRecord(int id) async {
    final database = await DBHelper.getDatabase();
    database.rawQuery('DELETE FROM $tableName WHERE id=?', [id]);
    return true;
  }
}


class DownloadETicketScreen extends StatelessWidget {
  const DownloadETicketScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(vertical: 29.v),
          child: Column(
            children: [
              _buildBtnBackColumn(context),
              SizedBox(
                height: 527.v,
                width: double.maxFinite,
                child: FutureBuilder<List<Map<String, dynamic>>>(
                  future: DBTickets.getAllTickets(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      List<Map<String, dynamic>> tickets = snapshot.data ?? [];
                      if (tickets.isEmpty) {
                        return Text('No tickets available.');
                      } else {
                        return _buildFilmShangChiHorizontalScroll(context, tickets[0]);
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: _buildDownloadETicketButton(context),
      ),
    );
  }


  /// Section Widget
  Widget _buildBtnBackColumn(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(
          height: 30.v,
          leadingWidth: 56.h,
          leading: AppbarLeadingImage(
            imagePath: ImageConstant.imgBtnBack,
            margin: EdgeInsets.only(
              left: 30.h,
              top: 2.v,
              bottom: 1.v,
            ),
          ),
          centerTitle: true,
          title: AppbarTitle(
            text: "E-Ticket",
          ),
        ),
        SizedBox(height: 30.v),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: 30.h),
            child: Text(
              "Instruction",
              style: CustomTextStyles.titleLarge_1,
            ),
          ),
        ),
        SizedBox(height: 12.v),
        Container(
          width: 315.h,
          margin: EdgeInsets.symmetric(horizontal: 30.h),
          child: Text(
            "Come to the cinema, show and scan the barcode to the space provided. Continue to comply with health protocols.",
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.justify,
            style: CustomTextStyles.bodyMediumPoppinsBluegray200Light.copyWith(
              height: 1.57,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFilmShangChiHorizontalScroll(
      BuildContext context,
      Map<String, dynamic> ticketData,
      ) {
    return Align(
      alignment: Alignment.centerRight,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.only(
          left: 30.h,
          top: 39.v,
          bottom: 44.v,
        ),
        child: IntrinsicWidth(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 21.h,
                    vertical: 19.v,
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: fs.Svg(
                        ImageConstant.imgETicket1,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 8.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 34.h,
                        ),
                        child: _buildFilmShangChi(
                          context,
                          filmShangChiText: "Film: ${ticketData['film_name']}",
                          eTicketText: "e-ticket",
                        ),
                      ),
                      SizedBox(height: 27.v),
                      Container(
                        width: 207.h,
                        margin: EdgeInsets.only(
                          left: 8.h,
                          right: 56.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 1.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Date",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 3.v),
                                  Text(
                                    ticketData['date'] ?? 'N/A',
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Seats",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    ticketData['seats'] ?? 'N/A',
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 28.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 52.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  ticketData['location'] ?? 'N/A',
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Time",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 4.v),
                                Text(
                                  ticketData['time'] ?? 'N/A',
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 30.v),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.h,
                          right: 39.h,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: 2.v),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment",
                                    style: theme.textTheme.titleSmall,
                                  ),
                                  SizedBox(height: 1.v),
                                  Text(
                                    ticketData['payment_status'] ?? 'N/A',
                                    style: CustomTextStyles.titleSmallBlack900,
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Order",
                                  style: theme.textTheme.titleSmall,
                                ),
                                SizedBox(height: 3.v),
                                Text(
                                  ticketData['order_number'] ?? 'N/A',
                                  style: CustomTextStyles.titleSmallBlack900,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // ... (remaining code)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  /// Section Widget
  Widget _buildDownloadETicketButton(BuildContext context) {
    return CustomElevatedButton(
      text: "Download E-Ticket",
      margin: EdgeInsets.only(
        left: 30.h,
        right: 30.h,
        bottom: 29.v,
      ),
    );
  }

  /// Common widget
  Widget _buildFilmShangChi(
    BuildContext context, {
    required String filmShangChiText,
    required String eTicketText,
  }) {
    return Row(
      children: [
        Text(
          filmShangChiText,
          style: CustomTextStyles.titleMediumBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 30.h),
          child: Text(
            eTicketText,
            style: CustomTextStyles.titleMediumRed40002.copyWith(
              color: appTheme.red40002,
            ),
          ),
        ),
      ],
    );
  }

  /// Common widget
  Widget _buildNineteen(
    BuildContext context, {
    required String orderLabel,
    required String orderValue,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          orderLabel,
          style: theme.textTheme.titleSmall!.copyWith(
            color: appTheme.gray60004,
          ),
        ),
        SizedBox(height: 4.v),
        Text(
          orderValue,
          style: CustomTextStyles.titleSmallBlack900.copyWith(
            color: appTheme.black900,
          ),
        ),
      ],
    );
  }
}
