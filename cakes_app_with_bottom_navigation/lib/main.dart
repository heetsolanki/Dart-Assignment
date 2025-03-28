import 'package:flutter/material.dart';

String blackforest = 'https://www.flurys.com/cdn/shop/products/BlackForestCake_3.jpg?v=1676363141&width=1024';
String biscoff = 'https://saltandbaker.com/wp-content/uploads/2021/08/Biscoff-caramel-cheesecake-cake-featured.jpg';
String redvelvet = 'https://assets.giftalove.com/resources/common/giftimages/largeimage/tempting-red-velvet-cake.jpg';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const ProductsPage(),
    const CakeDetailsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cake),
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Details',
          ),
        ],
        selectedItemColor: Colors.deepPurpleAccent,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cakes App with Navigation",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        leading: const Icon(Icons.cake),
        elevation: 20.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              'Welcome to the Cakes App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: Text(
                'Indulge in the finest selection of freshly baked cakes at Sweet Delights! From classic flavors to custom-designed treats, we offer delicious cakes for every occasion—birthdays, weddings, and celebrations. Made with love and the finest ingredients, our cakes bring joy to every bite. Visit us today and satisfy your sweet cravings!',
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Cakes App with Navigation",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.deepPurpleAccent,
        elevation: 20.0,
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          padding: const EdgeInsets.all(16),
          children: [
            Column(
              children: [
                Image.network(blackforest, height: 150, width: 150),
                const SizedBox(height: 10),
                const Text(
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
                const SizedBox(height: 10),
                const Text(
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
                const SizedBox(height: 10),
                const Text(
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
        title: const Text(
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
            const Text(
              "Select a Cake",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurpleAccent,
              ),
            ),
            const SizedBox(height: 10),
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              ),
              items: const [
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
              hint: const Text("Choose a cake"),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
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
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              child: const Text("Calculate Total Price"),
            ),
            const SizedBox(height: 20),
            Text(
              "Total Price: ₹${totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
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
