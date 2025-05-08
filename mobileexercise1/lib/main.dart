import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Gadget {
  final String name;
  final String image;
  final double price;

  Gadget({
    required this.name,
    required this.image,
    required this.price,
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gadget Mart',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF1C1B1F),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Gadget> gadgets = [
    Gadget(name: "USB Drive", image: "assets/usb.png", price: 12.99),
    Gadget(name: "iPhone", image: "assets/iphone.png", price: 999.99),
    Gadget(name: "Laptop", image: "assets/laptop.png", price: 1299.00),
    Gadget(name: "Bluetooth Speaker", image: "assets/speaker.png", price: 79.49),
  ];

  final List<Gadget> cart = [];

  void addToCart(Gadget gadget) {
    setState(() {
      cart.add(gadget);
    });
  }

  void clearCart() {
    setState(() {
      cart.clear();
    });
  }

  double get total => cart.fold(0, (sum, item) => sum + item.price);

  int calculateCrossAxisCount(double width) {
    if (width > 1000) return 4;
    if (width > 600) return 3;
    return 2;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GADGET MART"),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final crossAxisCount = calculateCrossAxisCount(constraints.maxWidth);

          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(12),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    childAspectRatio: 0.75,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: gadgets.length,
                  itemBuilder: (context, index) {
                    final gadget = gadgets[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A292E),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            child: Image.asset(
                              gadget.image,
                              fit: BoxFit.contain,
                              width: double.infinity,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            gadget.name,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "\$${gadget.price.toStringAsFixed(2)}",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          ElevatedButton(
                            onPressed: () => addToCart(gadget),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: const Text(
                              'Add to Cart',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Items: ${cart.length}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      "Total: \$${total.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: clearCart,
                      child: const Text(
                        "Clear",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}