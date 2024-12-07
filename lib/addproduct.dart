// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'allproduct.dart';


class AddNewProduct extends StatefulWidget {
  const AddNewProduct({super.key});

  @override
  State<AddNewProduct> createState() => _AddNewProductState();
}

class _AddNewProductState extends State<AddNewProduct> {
  final _name = TextEditingController();
  final _price = TextEditingController();
  final _stock = TextEditingController();
  final _vendors = TextEditingController();
  final _promo = TextEditingController();
  final _description = TextEditingController();
  final _category = TextEditingController();
  final _images = TextEditingController();
  Future<void> addNewProduct() async {
   String urlNewProduct = 
      "http://10.0.3.2/backend_ecommerce/addproduct.php";
    try {
      var resAddProduct = await http.post(Uri.parse(urlNewProduct),body: {
        "name":_name.text.toString(),
        "price":_price.text.toString(),
        "stock":_stock.text.toString(),
        "vendors":_vendors.text.toString(),
        "promo":_promo.text.toString(),
        "description":_description.text.toString(),
        "category":_category.text.toString(),
        "images":_images.text.toString()});

        var bodyAddProduct = json.decode(resAddProduct.body);
        if (bodyAddProduct == true) {
          if (kDebugMode) {
            print("New Product Successfully Added");
          }
          else {
            if (kDebugMode) {
              print("New Product Failed Added");
            }
          }
          
        }
    } catch (exc) {
      if (kDebugMode) {
        print(exc);
      }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue.shade400,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const AllProduct()));
          },
          icon: const Icon(Icons.arrow_back),
          iconSize: 18,
          color: Colors.white,
        ),
        title: const Text(
          "New Product",
          style: TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 2),
              child: TextField(
                controller: _name,
                decoration: InputDecoration(
                  hintText: "Product Name:",
                  hintStyle: const TextStyle(color: Colors.blue,fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.home, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
              Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 2),
              child: TextField(
                controller: _price,
                decoration: InputDecoration(
                  hintText: "Price:",
                  hintStyle: const TextStyle(color: Colors.blue,fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.attach_money, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 2),
              child: TextField(
                controller: _vendors,
                decoration: InputDecoration(
                  hintText: "Vendor:",
                  hintStyle: const TextStyle(color: Colors.blue,fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.book, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 2),
              child: TextField(
                controller: _stock,
                decoration: InputDecoration(
                  hintText: "Product Stock:",
                  hintStyle: const TextStyle(color: Colors.blue,fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.shopping_bag, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 2),
              child: TextField(
                controller: _promo,
                decoration: InputDecoration(
                  hintText: "Promo:",
                  hintStyle: const TextStyle(color: Colors.blue,fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.discount, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 2),
              child: TextField(
                controller: _description,
                decoration: InputDecoration(
                  hintText: "Description:",
                  hintStyle: const TextStyle(color: Colors.blue, fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.textsms_outlined, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 2),
              child: TextField(
                controller: _category,
                decoration: InputDecoration(
                  hintText: "Category:",
                  hintStyle: const TextStyle(color: Colors.blue, fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.textsms_outlined, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 0, 30, 30),
              child: TextField(
                controller: _images,
                decoration: InputDecoration(
                  hintText: "Image URL:",
                  hintStyle: const TextStyle(color: Colors.blue,fontSize: 15),
                  prefixIcon: const Align(
                    widthFactor: 1.0,
                    child: Icon(Icons.image, color: Colors.red, size: 20),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                        width: 3.0,
                        color: Colors.red.shade400,
                        style: BorderStyle.solid),
                        borderRadius: const BorderRadius.all(Radius.circular(20),),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 150,
              child: 
                  ElevatedButton(onPressed:addNewProduct, style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400),
                    child: const Text(
                      "Add Product",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 15),
                    ),
                  ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}
