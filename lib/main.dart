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
  String searchbar = '';
  int _counter0 = 0;
  int _counter1 = 0;
  int _counter2 = 0;

  void _incrementCounter0() {
    setState(() {
      _counter0++;
    });
  }

  void _decrementCounter0() {
    setState(() {
      _counter0--;
    });
  }

  void _incrementCounter1() {
    setState(() {
      _counter1++;
    });
  }

  void _decrementCounter1() {
    setState(() {
      _counter1--;
    });
  }

  void _incrementCounter2() {
    setState(() {
      _counter2++;
    });
  }

  void _decrementCounter2() {
    setState(() {
      _counter2--;
    });
  }

  final LinearGradient _color = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromRGBO(0, 126, 165, 1),
      Color.fromRGBO(0, 208, 253, 1),
    ],
  );
  final LinearGradient _colorwhite = const LinearGradient(
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    colors: [
      Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(255, 255, 255, 1),
    ],
  );

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

  int selectedBox = 0;

  _services() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _serviceBox(
            "Laundry Wash & Iron", Icons.shopping_bag, selectedBox == 1, 1),
        _serviceBox("Dry- Cleaning", Icons.wash, selectedBox == 2, 2),
        _serviceBox("Steam Press", Icons.wallet_membership_rounded,
            selectedBox == 3, 3),
        _serviceBox("Shoe & Leather Care", Icons.shop_2, selectedBox == 4, 4),
      ],
    );
  }

  _serviceBox(String text, IconData icon, bool setColor, int num) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.22,
      child: InkWell(
        onTap: () {
          setState(() {
            selectedBox = num;
          });
        },
        child: Column(
          children: [
            Material(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              elevation: 4,
              child: Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                  gradient: setColor ? _color : _colorwhite,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Icon(
                  icon,
                  color: setColor ? Colors.white : Colors.black87,
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
      ),
    );
  }

  int selectedCategory = 0;

  _categories() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      // width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _categoryBox("women", selectedCategory == 1, 1),
          _categoryBox("men", selectedCategory == 2, 2),
          _categoryBox("kids", selectedCategory == 3, 3),
          _categoryBox("household", selectedCategory == 4, 4),
        ],
      ),
    );
  }

  _categoryBox(String text, bool setColor, int num) {
    return Container(
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        gradient: setColor ? _color : _colorwhite,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
        // borderRadius:BorderRadius.all(
        //         Radius.circular(20.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedCategory = num;
          });
        },
        child: Text(text.toUpperCase()),
        style: ElevatedButton.styleFrom(
          primary: setColor ? Colors.transparent : Colors.white,
          onPrimary: setColor ? Colors.white : Colors.blue,
          shadowColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.all(
              Radius.circular(20.0),
            ),
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
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: _color,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        color: Colors.blue,
      ),
      child: TextFormField(
        onSaved: (val) => searchbar = val!,
        validator: (val) {},
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
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
      width: MediaQuery.of(context).size.width * 0.85,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue),
        gradient: _color,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        // borderRadius:BorderRadius.all(
        //         Radius.circular(20.0),
      ),
      child: Card(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
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

  int productquantity = 0;

  _productList() {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.9,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _products(
            "productName",
            250,
            "https://i.stack.imgur.com/qMRcJ.png",
            productquantity == 1,
            1,
            _counter0,
          ),
          _products(
            "productName",
            250,
            "https://i.stack.imgur.com/qMRcJ.png",
            productquantity == 2,
            2,
            _counter1,
          ),
          _products(
            "productName",
            250,
            "https://i.stack.imgur.com/qMRcJ.png",
            productquantity == 3,
            3,
            _counter2,
          ),
        ],
      ),
    );
  }

  _products(String productName, int productPrice, String url,
      bool productQuantity, int quantity, int count) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
        SizedBox(
          // width: MediaQuery.of(context).size.width * 0.2,
          child: productQuantity
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: quantity == 1
                            ? _decrementCounter0
                            : quantity == 2
                                ? _decrementCounter1
                                : _decrementCounter2,
                        icon: const Icon(
                          Icons.remove_circle,
                          color: Colors.blue,
                        )),
                    Text(
                      '$count',
                    ),
                    IconButton(
                        onPressed: quantity == 1
                            ? _incrementCounter0
                            : quantity == 2
                                ? _incrementCounter1
                                : _incrementCounter2,
                        icon: const Icon(
                          Icons.add_circle,
                          color: Colors.blue,
                        ))
                  ],
                )
              : Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        onPrimary: Colors.blue,
                        shadowColor: Colors.transparent,
                        shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.blue),
                          borderRadius: BorderRadius.all(
                            Radius.circular(10.0),
                          ),
                        ),
                      ),
                      onPressed: () {
                        setState(() {
                          count = count + 1;
                          productquantity = quantity;
                        });
                      },
                      child: const Text("Add  +")),
                ),
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
          padding: const EdgeInsets.all(3),
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue),
            gradient: _color,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            // borderRadius:BorderRadius.all(
            //         Radius.circular(20.0),
          ),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(10),
          //   color: Colors.blue,
          //   border: Border.all(
          //     width: 2,
          //     color: Colors.blue,
          //   ),
          // ),
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
