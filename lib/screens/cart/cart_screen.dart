import 'package:flutter/material.dart';
import '../../cart.dart';

class CartPage extends StatelessWidget {
  const CartPage({this.data});
  final Cartprovider data;
  getTotalPrice() {
    double total = 0;
    data
      ..cartitems.forEach((element) {
        total += element['price'];
      });
    return total;
  }

  @override
  Widget build(BuildContext context) {
    print(data.cartitems);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 30),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: Text(
                          'Ordered Products',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 16),
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Product')),
                            DataColumn(label: Text('Price')),
                          ],
                          rows: data.cartitems.map<DataRow>((e) {
                            return DataRow(cells: [
                              DataCell(Text(e['title'])),
                              DataCell(Text('${e['price']}')),
                            ]);
                          }).toList(),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16, top: 30),
                            child: Text(
                              'Total Price',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 16, top: 30),
                            child: Text(
                              '\$${getTotalPrice()}',
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          )
                        ],
                      )
                    ]),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: FlatButton(
                  child: Text('Buy',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.black,
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
