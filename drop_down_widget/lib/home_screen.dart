import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedItem = "Value 1";
  final List<String> itemType = [
    "Value 1",
    "Value 2",
    "Value 3",
    "Value 4",
  ];
  void setItemType(value) {
    selectedItem = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xff03001e),
              Color(0xff7303c0),
              Color(0xffec38bc),
              Color(0xfffdeff9),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Center(
                  child: Text(
                    "Custom Drop Down Widget",
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
            const SizedBox(
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(10),
                ),
                //padding: EdgeInsets.only(left: Get.width * 0.01),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      icon: const Icon(
                        Icons.keyboard_double_arrow_down_outlined,
                        size: 20,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.white.withOpacity(0.70),
                      borderRadius: BorderRadius.circular(10),
                      items: itemType.map((String caste) {
                        return DropdownMenuItem<String>(
                          value: caste,
                          child: Text(
                            caste,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        );
                      }).toList(),
                      value: selectedItem,
                      onChanged: (value) {
                        setItemType(value);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
