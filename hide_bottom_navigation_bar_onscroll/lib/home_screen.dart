import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBuilder(
        animation: scrollController,
        builder: (context, child) {
          return AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: scrollController.position.userScrollDirection ==
                    ScrollDirection.reverse
                ? 0
                : 80,
            child: child,
          );
        },
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(Icons.home, color: Color(0xff4A00E0)),
            Icon(Icons.map, color: Color(0xff4A00E0)),
            Icon(Icons.settings, color: Color(0xff4A00E0)),
            Icon(Icons.person, color: Color(0xff4A00E0)),
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff8E2DE2),
              Color(0xff4A00E0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              const SizedBox(height: 100),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const Center(
                    child: Text(
                      "Hide Bottom Navigation Bar On Scroll",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ...List.generate(
                50,
                (index) {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(child: Text("$index")),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
