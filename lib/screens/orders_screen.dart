import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final firestore = FirebaseFirestore.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];
  bool showSpinner = true;

  getTotalPrice(items) {
    double total = 0;
    items.forEach((element) {
      total += element['price'];
    });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'My Orders',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: size.width,
          child: Center(
            child: _buildList(size),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    fetchOrders();
  }

  Future fetchOrders() async {
    var doc = await firestore.collection('users').doc(firebaseUser.uid).get();
    setState(() {
      orders = doc.data()['orders'];
      showSpinner = false;
    });
  }

  _buildList(Size size) {
    return ModalProgressHUD(
      inAsyncCall: showSpinner,
      child: Column(
        children: orders
            .map<Widget>(
              (e) => Container(
                margin: EdgeInsets.only(top: 30),
                padding: EdgeInsets.all(10),
                width: size.width * 0.9,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[400]),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text('Delivered'),
                        Spacer(),
                        Text(
                            '${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(e['date'].toDate().toString()))}'),
                      ],
                    ),
                    Container(
                      width: size.width,
                      margin: EdgeInsets.only(top: 5, bottom: 5),
                      child: DataTable(
                          headingTextStyle: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                          dataTextStyle:
                              TextStyle(fontSize: 12, color: Colors.black),
                          columns: [
                            DataColumn(label: Text('Product')),
                            DataColumn(label: Text('Price')),
                            DataColumn(label: Text('Quantity')),
                          ],
                          rows: e['items']
                              .map<DataRow>((item) => DataRow(cells: [
                                    DataCell(Text(item['title'])),
                                    DataCell(Text('${item['price']}')),
                                    DataCell(Text('${item['quantity']}')),
                                  ]))
                              .toList()),
                    ),
                    Row(
                      children: [
                        Text('Total Price'),
                        Spacer(),
                        Text('\$${getTotalPrice(e['items'])}'),
                      ],
                    ),
                  ],
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
