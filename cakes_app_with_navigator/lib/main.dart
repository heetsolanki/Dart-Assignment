import 'package:flutter/material.dart';

String blackforest = 'https://www.flurys.com/cdn/shop/products/BlackForestCake_3.jpg?v=1676363141&width=1024';
String biscoff = 'https://saltandbaker.com/wp-content/uploads/2021/08/Biscoff-caramel-cheesecake-cake-featured.jpg';
String redvelvet = 'https://assets.giftalove.com/resources/common/giftimages/largeimage/tempting-red-velvet-cake.jpg';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
      routes: {
        '/home': (context) => const HomePage(),
        '/products': (context) => ProductsPage(),
        '/cakeDetails': (context) => CakeDetailsPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override 

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cakes App with Navigation",
        style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.deepPurpleAccent,
        leading: Icon(Icons.cake),
        elevation: 20.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Cakes App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 35, right: 35),
              child: Text(
              'Indulge in the finest selection of freshly baked cakes at Sweet Delights! From classic flavors to custom-designed treats, we offer delicious cakes for every occasion—birthdays, weddings, and celebrations. Made with love and the finest ingredients, our cakes bring joy to every bite. Visit us today and satisfy your sweet cravings!',
              textAlign: TextAlign.justify,
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 50, right: 50, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/products');
                  });
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                child: Text("Products"),
                ),
                SizedBox(width: 50,),
                ElevatedButton(onPressed: () {
                  setState(() {
                    Navigator.pushNamed(context, '/cakeDetails');
                  });
                }, 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
                child: Text("Cake Details"),
                ),
              ],
            )
            )
          ],
        ),
      ),
    );
  }
}

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends  State<ProductsPage> {
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cakes App with Navigation",
        style: TextStyle(fontWeight: FontWeight.w600),),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 20.0,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: EdgeInsets.all(16),
          children: [
        Column(
          children: [
            Image.network(blackforest, height: 150, width: 150),
            SizedBox(height: 10),
            Text(
          'Black Forest Cake',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
          textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            Image.network(biscoff, height: 150, width: 150),
            SizedBox(height: 10),
            Text(
          'Biscoff Cake',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
          textAlign: TextAlign.center,
            ),
          ],
        ),
        Column(
          children: [
            Image.network(redvelvet, height: 150, width: 150),
            SizedBox(height: 10),
            Text(
          'Red Velvet Cake',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurpleAccent,
          ),
          textAlign: TextAlign.center,
            ),
          ],
        ),
        Center(
          child: ElevatedButton(
            onPressed: () {
          setState(() {
            Navigator.pushNamed(context, '/cakeDetails');
          });
            },
            style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.deepPurpleAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            child: Text("Cake Details"),
          ),
        ),
          ],
        ),
      ),
        );
      }
    }

class CakeDetailsPage extends StatefulWidget {
  const CakeDetailsPage({super.key});

  @override
  State<CakeDetailsPage> createState() => _CakeDetailsPageState();
}

class _CakeDetailsPageState extends State<CakeDetailsPage> {
  String? selectedCake;
  final TextEditingController quantityController = TextEditingController();
  double totalPrice = 0.0;

  final Map<String, double> cakePrices = {
    "Black Forest Cake": 1600.0,
    "Biscoff Cake": 2000.0,
    "Red Velvet Cake": 2400.0,
  };

  @override
  Widget build(BuildContext content) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cakes App with Navigation",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 20.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Select a Cake",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              items: [
                DropdownMenuItem(
                    value: "Black Forest Cake", child: Text("Black Forest Cake")),
                DropdownMenuItem(value: "Biscoff Cake", child: Text("Biscoff Cake")),
                DropdownMenuItem(
                    value: "Red Velvet Cake", child: Text("Red Velvet Cake")),
              ],
              onChanged: (value) {
                setState(() {
                  selectedCake = value!;
                });
              },
              value: selectedCake,
              hint: Text("Choose a cake"),
            ),
            SizedBox(height: 20),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Quantity",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  int quantity = int.tryParse(quantityController.text) ?? 0;
                  double pricePerCake = cakePrices[selectedCake] ?? 0.0;
                  totalPrice = quantity * pricePerCake;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurpleAccent,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              child: Text("Calculate Total Price"),
            ),
            SizedBox(height: 20),
            Text(
              "Total Price: ₹${totalPrice.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}