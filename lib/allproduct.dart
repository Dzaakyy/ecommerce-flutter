import 'dart:convert';
// import 'dart:ffi';

import 'package:ecommercedzaky/editproduct.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'package:cupertino_icons/cupertino_icons.dart';
import 'addproduct.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({super.key});

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  final searchController = TextEditingController();
  List listAllProduct = [];


  @override
  void initState() {
    super.initState();
    getAllProduct();
  }

  Future<void> getAllProduct() async {
    String urlAllproduct = "http://10.0.2.2/backend_ecommerce/allproduct.php";
    try {
      var response = await http.get(Uri.parse(urlAllproduct));
      listAllProduct = jsonDecode(response.body);
      setState(() {
        listAllProduct = jsonDecode(response.body);
      });
    } catch (exc) {
      if (kDebugMode) {
        print(exc);
      }
    }
  }

  Future<void> deleteProduct(String id) async {
    String urlDelete = "http://10.0.2.2/backend_ecommerce/deleteproduct.php";
    try {
      var respponseDelete =
          await http.post(Uri.parse(urlDelete), body: {"id": id});
      var bodyDelete = jsonDecode(respponseDelete.body);
      if (bodyDelete['Success'] == true) {
        if (kDebugMode) {
          print("Product Succesfully Deleted");
        }
        setState(() {
          {
            listAllProduct.remove((product) => product['id'] == id);
          }
        });
      } else {
        if (kDebugMode) {
          print("Product failed to deleted");
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  Future<void> searchPorductItems() async {
    final search = searchController.text;
    if (search.isEmpty) {
      return;
    }
    String urlSearch =
        "http://10.0.2.2/backend_ecommerce/searchproduct.php?search=$search";
    try {
      var responseSearch = await http.get(Uri.parse(urlSearch));
      final List listSearch = jsonDecode(responseSearch.body);
      setState(() {
        listAllProduct = listSearch; 
      });
    } catch (exc) {
      if (kDebugMode) {
        print("Failed to load Products");
      }
    }
  }

  void updateProduct(Map<String, dynamic> product) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => EditProduct(product: product)),
    ).then((updated) {
      if (updated != null && updated) {
        getAllProduct();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade400,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.person,
            size: 22,
            color: Colors.white,
          ),
        ),
        title: const Text("Dzaky Shop"),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search, size: 22, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon:
                const Icon(Icons.notifications, size: 22, color: Colors.white),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(3, 10, 3, 30),
        child: Column(
          children: <Widget>[
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                labelText: "Search for a product",
                hintText: "Search:",
                labelStyle: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
                hintStyle: const TextStyle(color: Colors.blue, fontSize: 15),
                suffixIcon: const Align(
                  widthFactor: 1.0,
                  child: Icon(Icons.search, color: Colors.red, size: 20),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 3.0,
                      color: Colors.red.shade400,
                      style: BorderStyle.solid),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
              ),
              onChanged: (search) => searchPorductItems(),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: listAllProduct.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(3),
                    child: ListTile(
                      leading: ClipOval(
                        child: Image.network(
                          height: 120,
                          width: 70,
                          '${listAllProduct[index]['images']}',
                          fit: BoxFit.fill,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              return child;
                            } else {
                              return CircularProgressIndicator(
                                value: loadingProgress.expectedTotalBytes !=
                                        null
                                    ? loadingProgress.cumulativeBytesLoaded /
                                        (loadingProgress.expectedTotalBytes ??
                                            1)
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
                      ),
                      title: Text(
                        listAllProduct[index]['name'],
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      subtitle: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              listAllProduct[index]['description'],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              listAllProduct[index]['vendors'],
                              style: const TextStyle(
                                  color: Colors.blue,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: <Widget>[
                              Text(
                                'Rp. ' '${listAllProduct[index]['price']}',
                                style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal),
                              ),
                              const SizedBox(width: 20),
                              Text(
                                'Stock : ' '${listAllProduct[index]['stock']}',
                                style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: Column(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              deleteProduct(
                                  (listAllProduct[index]["id"].toString()));
                              getAllProduct();
                            },
                            child: const Icon(CupertinoIcons.delete,
                                size: 15, color: Colors.red),
                          ),
                          const SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                             updateProduct(listAllProduct[index]);
                            },
                            child: const Icon(
                                CupertinoIcons.arrow_2_circlepath_circle_fill,
                                size: 15,
                                color: Colors.orange),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const AddNewProduct()));
        },
        mini: true,
        backgroundColor: Colors.blue.shade400,
        splashColor: Colors.blue.shade100,
        child: const Icon(Icons.add, size: 24, color: Colors.white),
      ),
    );
  }
}
