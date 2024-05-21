import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List product = [
  {"title": "Macbook", "price": "100 000"},
  {"title": "iPhone 14", "price": "120 000"},
  {"title": "Samsung Galaxy S21", "price": "90 000"},
  {"title": "Dell XPS 13", "price": "110 000"},
  {"title": "Sony WH-1000", "price": "30 000"},
  {"title": "Apple Watch Series 7", "price": "50 000"},
  {"title": "iPad Pro 11-inch", "price": "80 000"},
  {"title": "Google Pixel 6", "price": "70 000"},
  {"title": "Microsoft Surface Pro 7", "price": "100 000"},
  {"title": "Bose QuietComfort 35 II", "price": "35 000"},
  {"title": "Amazon Echo Show 8", "price": "20 000"}
];

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final searchController = TextEditingController();
  int check = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leadingWidth: 300,
          leading: Padding(
            padding: const EdgeInsets.only(left: 20, top: 10),
            child: TextFormField(
              controller: searchController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(Icons.search)),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                label: const Text(
                  "Search",
                ),
              ),
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    product = product.reversed.toList();
                  });
                },
                icon: const Icon(
                  CupertinoIcons.arrow_up_arrow_down,
                  size: 25,
                )),
            PopupMenuButton(
                icon: check == 1
                    ? const Icon(
                        CupertinoIcons.square_stack_fill,
                        size: 30,
                      )
                    : check == 2
                        ? const Icon(
                            CupertinoIcons.list_bullet,
                            size: 30,
                          )
                        : const Icon(
                            CupertinoIcons.table_fill,
                            size: 30,
                          ),
                itemBuilder: (ctx) {
                  return [
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          check = 1;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Galareya",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                    check == 1 ? FontWeight.w900 : null),
                          ),
                          const SizedBox(width: 60),
                          (check == 1)
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                  size: 30,
                                )
                              : const SizedBox(width: 0)
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          check = 2;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ro'yxat",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                    check == 2 ? FontWeight.w900 : null),
                          ),
                          const SizedBox(width: 60),
                          (check == 2)
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                  size: 30,
                                )
                              : const SizedBox(width: 0)
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {
                        setState(() {
                          check = 3;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Plitka",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight:
                                    check == 3 ? FontWeight.w900 : null),
                          ),
                          const SizedBox(width: 80),
                          (check == 3)
                              ? const Icon(
                                  Icons.check,
                                  color: Colors.blue,
                                  size: 30,
                                )
                              : const SizedBox(width: 0)
                        ],
                      ),
                    ),
                  ];
                }),
            const SizedBox(width: 10),
          ],
        ),
        body: check == 1
            ? galarey(searchController.text)
            : (check == 2)
                ? list(searchController.text)
                : plitka(searchController.text),
      ),
    );
  }
}

Widget galarey(String searchItem) {
  return SingleChildScrollView(
    padding: const EdgeInsets.all(20),
    child: Column(
      children: [
        for (var i = 0; i < product.length; i++)
          product[i]['title'].contains(searchItem)
              ? Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),
                    clipBehavior: Clip.hardEdge,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 300,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/car.jpg"),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  color: Colors.teal[300],
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 2, bottom: 2),
                                  child: const Text(
                                    "Top",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Text(
                                      product[i]['title'],
                                      style: const TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  const Icon(
                                    CupertinoIcons.heart,
                                    size: 27,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[400]),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 3, bottom: 3),
                                child: const Text(
                                  "Yangi",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${product[i]['price']} so'm",
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Tashkent, Uchtepa tumani",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey[800]),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox()
      ],
    ),
  );
}

Widget list(String searchItem) {
  return ListView(
    padding: const EdgeInsets.all(20),
    children: [
      for (var i = 0; i < product.length; i++)
        product[i]['title'].contains(searchItem)
            ? Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  height: 260,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white),
                  clipBehavior: Clip.hardEdge,
                  width: double.infinity,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 14,
                        child: Container(
                          width: 200,
                          height: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage("assets/car.jpg"),
                                  fit: BoxFit.cover)),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  color: Colors.teal[300],
                                  padding: const EdgeInsets.only(
                                      right: 10, left: 10, top: 2, bottom: 2),
                                  child: const Text(
                                    "Top",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 15,
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          product[i]['title'],
                                          softWrap: true,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const Icon(
                                    CupertinoIcons.heart,
                                    size: 27,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.grey[400]),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 3, bottom: 3),
                                child: const Text(
                                  "Yangi",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 10),
                              Text(
                                "${product[i]['price']} so'm",
                                style: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Tashkent,",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[800]),
                                  ),
                                  Text(
                                    "Uchtepa tumani",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.grey[800]),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : const SizedBox()
    ],
  );
}

Widget plitka(String searchItem) {
  List box = [];
  for (var element in product) {
    if (element['title'].contains(searchItem)) {
      box.add(element);
    }
  }
  return GridView(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 5,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 2.12),
    children: [
      for (var i = 0; i < box.length; i++)
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15), color: Colors.white),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                  height: 190,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/car.jpg"),
                          fit: BoxFit.cover)),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          color: Colors.teal[300],
                          padding: const EdgeInsets.only(
                              right: 10, left: 10, top: 2, bottom: 2),
                          child: const Text(
                            "Top",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    box[i]['title'],
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.heart,
                              size: 27,
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey[400]),
                          padding: const EdgeInsets.only(
                              left: 10, right: 10, top: 3, bottom: 3),
                          child: const Text(
                            "Yangi",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w400),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "${box[i]['price']} so'm",
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tashkent,",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[800]),
                            ),
                            Text(
                              "Uchtepa tumani",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[800]),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    ],
  );
}
