import 'dart:async';
import 'dart:convert';

import 'package:ecommercedzaky/electronic.dart';
import 'package:ecommercedzaky/gridmanclothes.dart';
import 'package:ecommercedzaky/gridmanshoes.dart';
import 'package:ecommercedzaky/gridwomenclothe.dart';
import 'package:ecommercedzaky/gridwomenshoes.dart';
import 'package:ecommercedzaky/onboardingpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController bannerController = PageController();
  final searchController = TextEditingController();
  int indexBanner = 0;
  Timer? timer;
  List dataProduct = [];

  

  @override
  void initState() {
    super.initState();
    bannerController.addListener(() {
      setState(() {
        indexBanner = bannerController.page?.round() ?? 0;
      });
    });
    bannerOnboarding();
    getAllproduct();
  }

  Future<void> getAllproduct() async {
    String urlAllProduct =
        "http://10.0.3.2/backend_ecommerce/allproduct.php";
    try {
      var response = await http.get(Uri.parse(urlAllProduct));
      dataProduct = jsonDecode(response.body);
      setState(() {
        dataProduct = jsonDecode(response.body);
      });
    } catch (exc) {
      if (kDebugMode) {
        print(exc);
      }
    }
  }

  void bannerOnboarding() {
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (indexBanner < 3) {
        indexBanner++;
      } else {
        indexBanner = 0;
      }
      bannerController.animateToPage(indexBanner,
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    });
  }

  @override
  void dispose() {
    bannerController.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> bannerList = [
      './lib/assets/ecommerce.jpg',
      './lib/assets/ecommerce2.jpg',
      './lib/assets/ecommerce3.jpg',
      './lib/assets/ecommerce4.jpg'
    ];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue.shade400,
          leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnboardingPage()));
            },
            icon: const Icon(
              CupertinoIcons.arrow_left,
              size: 22,
              color: Colors.white,
            ),
          ),
          title: const Text("Dzaky Shop"),
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
            ),
          ],
        ),

        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                      hintText: 'Search Product',
                      prefixIcon: const Icon(
                        Icons.search,
                        size: 20,
                        color: Colors.black,
                      ),
                      suffixIcon: const Icon(
                        Icons.filter_list,
                        size: 20,
                        color: Colors.black,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide.none),
                      filled: true,
                      fillColor: const Color.fromRGBO(223, 237, 241, 0.855)),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: PageView.builder(
                  controller: bannerController,
                  itemCount: bannerList.length,
                  itemBuilder: (context, index) {
                    return Image.asset(
                      bannerList[index],
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Card(
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GridElectronic()));
                          },
                          child: SizedBox(
                            width: 60,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  './lib/assets/electronict.png',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Electronict',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GridManClothes()));
                          },
                          child: SizedBox(
                            width: 60,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  './lib/assets/clothesman.png',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Man Clothes',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GridWomenClothes()));
                          },
                          child: SizedBox(
                            width: 60,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  './lib/assets/clotheswoman.png',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Woman Clothes',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GridManShoes()));
                          },
                          child: SizedBox(
                            width: 60,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  './lib/assets/shoesman.png',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Man Shoes',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        child: InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const GridWomenShoes()));
                          },
                          child: SizedBox(
                            width: 60,
                            height: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Image.asset(
                                  './lib/assets/shoeswoman.png',
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                                const SizedBox(height: 5),
                                const Text(
                                  'Woman Shoes',
                                  style: TextStyle(
                                      fontSize: 8,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Title(
                color: Colors.black,
                child: const Text(
                  "All Product",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 1000,
                  child: GridView.builder(
                  reverse: false,
                  scrollDirection: Axis.vertical,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: dataProduct.length,
                  itemBuilder: (context, index) {
                  final itemData = dataProduct[index];                    
                    return GestureDetector(
                      onTap: () {},
                      child: Card(
                        child: Column(children: [
                          Image.network(
                            '${itemData['images']}',
                            height: 110,
                            width: 150,
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
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                            child: Text(
                              itemData['name'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
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
                                // const SizedBox(width: 8),
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
                          ),
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
        );
  }
}
