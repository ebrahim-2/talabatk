import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:talabatk/screens/cart/Map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../cart.dart';

final firestore = FirebaseFirestore.instance;
final firebaseUser = FirebaseAuth.instance.currentUser;

class CartScreen extends StatefulWidget {
  const CartScreen({this.data});
  final Cartprovider data;

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  getTotalPrice() {
    double total = 0;
    widget.data
      ..cartitems.forEach((element) {
        total += element['price'];
      });
    return total;
  }

  List<Marker> markers = [];
  double zoom = 10;

  updateMarker(newMarker) {
    setState(() {
      markers = [];
      markers.add(newMarker);
    });
  }

  updateZoom(double newZoom) {
    setState(() {
      zoom = newZoom;
    });
  }

  fetchLocation() async {
    await firestore
        .collection('users')
        .doc(firebaseUser.uid)
        .get()
        .then((document) {
      if (document.data() != null) {
        var location = document.data()['location'];
        zoom = document.data()['zoom'];
        markers.add(
          Marker(
            markerId: MarkerId(location['markerId']),
            position: LatLng(
              location['position'][0],
              location['position'][1],
            ),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                        margin: EdgeInsets.only(left: 16, bottom: 30),
                        child: Text(
                          'Ordered Products',
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                      if (widget.data.cartitems.length > 0)
                        Container(
                          child: DataTable(
                            dataTextStyle: TextStyle(fontSize: 12),
                            columns: [
                              DataColumn(label: Text('Product')),
                              DataColumn(label: Text('Price')),
                              DataColumn(label: Text('Quantity')),
                              DataColumn(label: Text('Total Price')),
                            ],
                            rows: widget.data.cartitems.map<DataRow>((e) {
                              return DataRow(cells: [
                                DataCell(Text(e['title'])),
                                DataCell(Text('${e['price']}')),
                                DataCell(Text('${e['quantity']}')),
                                DataCell(Text('${e['totalPrice']}')),
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
              SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  height: 310,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]),
                      borderRadius: BorderRadius.circular(10)),
                  width: size.width * 0.9,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 15, left: 15),
                        child: Text('Add Location',
                            style: Theme.of(context).textTheme.headline6),
                      ),
                      Spacer(),
                      FutureBuilder(
                          future: fetchLocation(),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: Text('Please wait its loading...'));
                            } else {
                              if (snapshot.hasError)
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              else
                                return Container(
                                  child: MyCustomMap(
                                    markers: markers,
                                    updateZoom: updateZoom,
                                    cameraPosition: CameraPosition(
                                      target: markers.length > 0
                                          ? markers[0].position
                                          : LatLng(33.312805, 44.361488),
                                      zoom: zoom,
                                    ),
                                    zoomControlsEnabled: false,
                                    handleTap: (LatLng tappedPoint) {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => MapSample(
                                              updateMarker: updateMarker,
                                              updateZoom: updateZoom,
                                              cameraPosition: CameraPosition(
                                                target: markers.length > 0
                                                    ? markers[0].position
                                                    : LatLng(
                                                        33.312805, 44.361488),
                                                zoom: zoom,
                                              )),
                                        ),
                                      );
                                    },
                                  ),
                                  height: 250,
                                ); // snapshot.data  :- get your object which is pass from your downloadData() function
                            }
                          })
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                child: FlatButton(
                  child: Text('Buy And Deliver',
                      style: TextStyle(
                        color: Colors.white,
                      )),
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
