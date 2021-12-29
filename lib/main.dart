import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _searchbar = '';
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: Colors.white,
        leadingWidth: 30,
        leading: const IconButton(
          onPressed: null,
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.blue,
            size: 30,
          ),
        ),
        title: _title(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _services(),
              _categories(),
              _mainBox(),
              _addToCart(),
            ],
          ),
        ),
      ),
    );
  }

  _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _iconCircle(Icons.card_travel_outlined),
        _iconCircle(Icons.shop),
        _iconCircle(Icons.calendar_today),
        _iconCircle(Icons.mobile_friendly),
      ],
    );
  }

  _iconCircle(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.blue)),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }

  _services() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _serviceBox("Laundry Wash & Iron", Icons.shopping_bag),
        _serviceBox("Dry- Cleaning", Icons.wash),
        _serviceBox("Steam Press", Icons.wallet_membership_rounded),
        _serviceBox("Shoe & Leather Care", Icons.shop_2),
      ],
    );
  }

  _serviceBox(String text, IconData icon) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.22,
      child: Column(
        children: [
          Material(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20.0))),
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                // shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.blue),
              ),
              child: Icon(
                icon,
                color: Colors.black,
                size: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.blue,
                fontSize: 13.5,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  _categories() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      // width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _categoryBox("women"),
          _categoryBox("men"),
          _categoryBox("kids"),
          _categoryBox("household"),
        ],
      ),
    );
  }

  _categoryBox(String text) {
    return ElevatedButton(
      onPressed: () {},
      child: Text(text.toUpperCase()),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
            // side: const BorderSide(color: Colors.red),
          ),
        ),
      ),
    );
  }

  _mainBox() {
    return Material(
      elevation: 10,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        width: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          // shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: 2, color: Colors.white),
        ),
        child: Column(
          children: [
            _searchbox(),
            _expandedBoxs("Daily Wear"),
            _expandedBoxs("Ethnic Wear"),
            _expandedBoxs("Winter Wear"),
          ],
        ),
      ),
    );
  }

  Widget _searchbox() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        onSaved: (val) => _searchbar = val!,
        validator: (val) {},
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
          hintText: "Search Your regular items",
          labelStyle: const TextStyle(
            fontFamily: 'proxima',
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  _expandedBoxs(String boxTitle) {
    return Container(
      margin: const EdgeInsets.all(2),
      width: MediaQuery.of(context).size.width * 0.8,
      child: Card(
        color: Colors.blue,
        child: ExpandablePanel(
          header: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Text(
              boxTitle,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          expanded: _productList(),
          collapsed: const SizedBox(height: 0),
        ),
      ),
    );
  }

  _productList() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _products("productName", 250, "https://i.stack.imgur.com/qMRcJ.png"),
          _products("productName", 250, "https://i.stack.imgur.com/qMRcJ.png"),
          _products("productName", 250, "https://i.stack.imgur.com/qMRcJ.png"),
        ],
      ),
    );
  }

  _products(String productName, int productPrice, String url) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(left: 4, right: 10, bottom: 4, top: 4),
              width: 50,
              height: 50,
              child: Image(
                image: NetworkImage(url),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName),
                Text("${productPrice.toString()} / piece"),
              ],
            ),
          ],
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Text("Add  +"),
        )
      ],
    );
  }

  _addToCart() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        elevation: 2,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            border: Border.all(width: 2, color: Colors.blue),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: const Text(
                      "2 (items)",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  const Divider(
                    thickness: 2,
                    height: 2,
                    color: Colors.black,
                  ),
                  const Text(
                    "Rs. 0000",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
