import 'dart:convert';

import 'package:ecommercedzaky/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridWomenShoes extends StatefulWidget {
  const GridWomenShoes({super.key});

  @override
  State<GridWomenShoes> createState() => _GridWomenShoesState();
}

class _GridWomenShoesState extends State<GridWomenShoes> {
  List<dynamic> dataWoman = [];
  Future<void> getWomanShoes() async {
    String urlAllWomanShoes =
        "http://10.0.2.2/backend_ecommerce/womanshoes.php";
    try {
      var response = await http.get(Uri.parse(urlAllWomanShoes));
      dataWoman = jsonDecode(response.body);
      setState(() {
        dataWoman = jsonDecode(response.body);
      });
    } catch (exc) {
      if (kDebugMode) {
        print(exc);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getWomanShoes();
  }

  void itemDataTap(int index) {
    final itemData = dataWoman[index];
    if (kDebugMode) {
      print("Product Name : $itemData['name']");
    }
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => DetilScreen(item: itemData)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        leading: IconButton(
          onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const HomePage()));
            },
          icon: const Icon(
            CupertinoIcons.arrow_left,
            size: 22,
            color: Colors.white,
          ),
        ),
        title: const Text("Woman Shoes"),
        centerTitle: true,
       actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.cart,
                size: 22,
                color: Colors.white,
              )),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.profile_circled,
              size: 22,
              color: Colors.white,
            ),
          ),
        ],
      ),

      body: Center(
        child: GridView.builder(
            reverse: false,
            scrollDirection: Axis.vertical,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0),
            itemCount: dataWoman.length,
            itemBuilder: (context, index) {
              final itemData = dataWoman[index];
              return GestureDetector(
                onTap: () {
                  itemDataTap(index);
                },
                child: Card(
                  child: Column(
                    children: [
                      Image.network(
                        itemData['images'],
                        height: 100,
                        width: 120,
                        fit: BoxFit.fill,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return const Text("Error Loading Product Images",
                              textAlign: TextAlign.justify);
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: Text(
                          itemData['name'],
                          style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                            Text(
                              'Rp '
                              '${itemData['price'].toString()}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                             Row(
                              children: [
                               const Icon(Icons.favorite, 
                                size: 10,
                                color: Colors.red,),
                                Text( 'Rp '
                              '${itemData['promo'].toString()}',
                               style: const TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                              )
                              ],
                              
                            ),
                            
                          ]
                          )
                          ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}

class DetilScreen extends StatelessWidget {
  final dynamic item;

  const DetilScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          item['name'],
          style: const TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
            child: Image.network(
              item['images'],
              width: 350,
              height: 400,
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(30, 0, 10, 5),
            child: Text(
              "Product Description",
              style: TextStyle(
                  color: Colors.black54,
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 10, 5),
            child: Text(
              item['description'],
              style: const TextStyle(
                  fontSize: 13,
                  color: Colors.black54,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 5, 10, 0),
                child: Text(
                  'Rp' '${item['price'].toString()}',
                  style: const TextStyle(
                      color: Colors.blue,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(150, 10, 0, 0),
                child: Icon(
                  Icons.favorite,
                  size: 10,
                  color: Colors.red,
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Text(
                    'Rp'
                    '${item['promo'].toString()}',
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  )),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 40, 0, 0),
            child: SizedBox(
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Add to cart", 
                style: TextStyle(
                  fontSize: 17, color: Colors.black
                ),),
              ),
            ),
          )
        ],
      ),
    );
  }
}

