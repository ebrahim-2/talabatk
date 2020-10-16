import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';

final firestore = FirebaseFirestore.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

class OrdersScreen extends StatefulWidget {
  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  List orders = [];

  getTotalPrice(items) {
    double total = 0;
    items.forEach((element) {
      total += element['totalPrice'];
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
        child: Column(
          children: [
            Container(
              width: size.width,
              height: size.height,
              child: Center(
                child: FutureBuilder(
                  future: fetchOrders(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return CircularProgressIndicator();
                    }
                    if (orders.length > 0) {
                      return _buildList(size);
                    }
                    return Text(
                      "There is no orders",
                      style: Theme.of(context).textTheme.headline6,
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  Future fetchOrders() async {
    var doc = await firestore.collection('users').doc(firebaseUser.uid).get();
    if (doc.data()['orders'] != null) {
      orders = doc.data()['orders'];
    }
  }

  _buildList(Size size) {
    return ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          return Container(
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
                        '${DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.parse(orders[index]['date'].toDate().toString()))}'),
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
                      rows: orders[index]['items']
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
                    Text('\$${getTotalPrice(orders[index]['items'])}'),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
