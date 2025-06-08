  import 'dart:convert';

  import 'package:ecommercedzaky/allproduct.dart';
  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  import 'package:http/http.dart' as http;

  class EditProduct extends StatefulWidget {
    final Map<String, dynamic> product;
    const EditProduct({super.key, required this.product});

    

    @override
    State<EditProduct> createState() => _EditProductState();
  }

  class _EditProductState extends State<EditProduct> {
    final _id = TextEditingController();
    final _name = TextEditingController();
    final _price = TextEditingController();
    final _stock = TextEditingController();
    final _vendors = TextEditingController();
    final _promo = TextEditingController();
    final _description = TextEditingController();
    final _category = TextEditingController();
    final _images = TextEditingController();

    @override
    void initState(){
      super.initState();
      _id.text = widget.product['id'].toString();
      _name.text = widget.product['name'].toString();
      _price.text = widget.product['price'].toString();
      _stock.text = widget.product['stock'].toString();
      _vendors.text = widget.product['vendors'].toString();
      _promo.text = widget.product['promo'].toString();
      _description.text = widget.product['description'].toString();
      _category.text = widget.product['category'].toString();
      _images.text = widget.product['images'].toString();
    }

    Future<void> editProduct() async {
    String urlEditProduct = 
        "http://10.0.2.2/backend_ecommerce/updateproduct.php";
      try {
        var resEditProduct = await http.post(Uri.parse(urlEditProduct),body: {
          "id":_id.text,
          "name":_name.text,
          "price":_price.text,
          "stock":_stock.text,
          "vendors":_vendors.text,
          "promo":_promo.text,
          "description":_description.text,
          "category":_category.text,
          "images":_images.text});

          var bodyEditProduct = json.decode(resEditProduct.body);
          if (bodyEditProduct['Success'] == true) {
            if (kDebugMode) {
              print("New Product Successfully Update");
            }
            else {
              if (kDebugMode) {
                print("New Product Failed Update");
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
          "Edit Product",
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
                controller: _id,
                decoration: InputDecoration(
                  hintText: "ID:",
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
                  hintText: "Categoy:",
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
                  ElevatedButton(onPressed:editProduct, style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade400),
                    child: const Text(
                      "Edit Product",
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