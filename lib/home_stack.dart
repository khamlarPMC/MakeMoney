import 'package:flutter/material.dart';

class HomeStack extends StatefulWidget {
  const HomeStack({super.key});

  @override
  State<HomeStack> createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: Container(
        height: 80,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(246, 246, 247, 1),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(173, 172, 172, 1),
              blurRadius: 20.0,
              spreadRadius: 5.0,
              offset: Offset(15.0, 15.0),
            )
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Container(
                  color: _selectedIndex == 0 ? Colors.grey[200] : Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.home,
                        size: 30,
                      ),
                      Text(
                        "Home",
                        style: _selectedIndex == 0
                            ? const TextStyle(
                                fontSize: 10.0, fontWeight: FontWeight.bold)
                            : TextStyle(
                                fontSize: 10.0, color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 14)
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  setState(() {
                    _selectedIndex = 1;
                  });
                },
                child: Container(
                  color: _selectedIndex == 1 ? Colors.grey[200] : Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //  SizedBox(height: 13),
                      const Image(
                        image: AssetImage('assets/images/Gold_logo.png'),
                        width: 24,
                        height: 30,
                      ),
                      Text("wallet",
                          style: _selectedIndex == 1
                              ? const TextStyle(
                                  fontSize: 10.0, fontWeight: FontWeight.bold)
                              : TextStyle(
                                  fontSize: 10.0, color: Colors.grey[600])),
                      const SizedBox(height: 14)
                    ],
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
