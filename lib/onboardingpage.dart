import 'package:ecommercedzaky/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController onboardController = PageController();
  int indexPage = 0;
  List<Map<String, String>> pageList = [
    {
      "title": "Dzaky Store",
      "image":
          "https://cdn.pricebook.co.id/article/603c93feb92c2e294e8b4567/603c93feb92c2e294e8b4567_1726572897.jpg",
      "subtitle": "Selamat Datang Di Toko Online kami"
    },
    {
      "title": "Dzaky Store",
      "image":
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//89/MTA-43641600/brd-00340_third-day-mtj56-kaos-oversize-distro-pria-polos-putih_full01.jpg",
      "subtitle": "Menyediakan barang berkualitas dan original"
    },
    {
      "title": "Dzaky Store",
      "image":
          "https://images.tokopedia.net/img/cache/700/hDjmkQ/2021/11/27/444a5c2f-4c6e-4e7b-895f-319c894b8444.jpg",
      "subtitle": "Harga murah meriah"
    },
    {
      "title": "Dzaky Store",
      "image":
          "https://id-test-11.slatic.net/p/2e4393fefd585b5f6fe9c03f17fe17ef.png",
      "subtitle": "Sudah terjamin kualitasnya"
    },
    {
      "title": "Get Started",
      "image":
          "https://www.static-src.com/wcsstore/Indraprastha/images/catalog/full//108/MTA-66751569/no-brand_sepatu-wanita-cewe-slip-on-balet-teplek-flat-shoes-termurah_full02.jpg",
      "subtitle": "Ayo cari barang yang anda butuhkan di toko kami!"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView.builder(
              controller: onboardController,
              onPageChanged: (page) {
                setState(() {
                  indexPage = page;
                });
              },
              itemCount: pageList.length,
              itemBuilder: (context, index) {
                return OnboardingData(
                  title: pageList[index]['title']!,
                  image: pageList[index]['image']!,
                  subtitle: pageList[index]['subtitle']!,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                indexPage == pageList.length - 1
                    ? TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomePage()));
                        },
                        child: const Text(
                          "Get Started",
                          style: TextStyle(color: Colors.grey, fontSize: 15),
                        ),
                      )
                    : const Text(''),
                Row(
                  children: List.generate(
                    pageList.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: indexPage == index ? Colors.red : Colors.grey),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      if (indexPage == pageList.length - 1) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomePage()));
                      } else {
                        onboardController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeIn);
                      }
                    },
                    icon: const Icon(CupertinoIcons.arrow_right))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingData extends StatelessWidget {
  final String title;
  final String image;
  final String subtitle;

  const OnboardingData(
      {super.key,
      required this.title,
      required this.image,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          image,
          height: 350,
          width: 300,
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
        const SizedBox(
          height: 20,
        ),
        Text(
          title,
          style: const TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black54),
        ),
        const SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}
