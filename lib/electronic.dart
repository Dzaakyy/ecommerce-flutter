import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GridElectronic extends StatefulWidget {
  const GridElectronic({super.key});

  @override
  State<GridElectronic> createState() => _GridElectronicState();
}

class _GridElectronicState extends State<GridElectronic> {
  List<dynamic> dataElectronicts = [];

  Future<void> getDataElectronic() async {
    String urlelectronicproduct =
        "http://10.0.3.2/backend_ecommerce/categoryelectronic.php";
    try {
      var response = await http.get(Uri.parse(urlelectronicproduct));
      dataElectronicts = jsonDecode(response.body);
      setState(() {
        dataElectronicts = jsonDecode(response.body);
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
    getDataElectronic();
  }

  void itemDAtaTap(int index) {
    final itemData = dataElectronicts[index];
    if (kDebugMode) {
      print("Product Name : $itemData['name]");
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DetilScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            CupertinoIcons.arrow_left,
            size: 22,
            color: Colors.white,
          ),
        ),
        title: const Text(
          "Electronic Products",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.info,
              size: 22,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              CupertinoIcons.cart,
              size: 22,
              color: Colors.white,
            ),
          )
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
            itemCount: dataElectronicts.length,
            itemBuilder: (context, index) {
              final itemData = dataElectronicts[index];
              return GestureDetector(
                onTap: () {
                  itemDAtaTap(index);
                },
                child: Card(
                  child: Column(children: [
                    Image.network(
                      itemData['images'],
                      height: 125,
                      width: 150,
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
                        return const Text(
                          "Error Loading Product Images",
                          textAlign: TextAlign.justify,
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Text(
                        itemData['name'],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Rp.' '${itemData['price']}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                           Row(
                            children: [
                              const Icon(
                                Icons.favorite,
                                size: 10,
                                color: Colors.red,
                              ),
                                 Text(
                            'Rp.' '${itemData['promo']}',
                            style: const TextStyle(
                                color: Colors.green,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                            ],
                          ),
                       
                        ],
                      ),
                    )
                  ]),
                ),
              );
            }),
      ),
    );
  }
}

class DetilScreen extends StatelessWidget {
  const DetilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        title: const Text(
          "Detail Product",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
