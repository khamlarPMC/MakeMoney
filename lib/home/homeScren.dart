import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7FFC74),
        title: const Text(
          "MakeMoney",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(width: 24),
                    Container(
                      width: 64,
                      height: 60,
                      decoration: BoxDecoration(
                          color: const Color(0xff7FFC74),
                          borderRadius: BorderRadiusDirectional.circular(9)),
                      child: const Image(
                        fit: BoxFit.cover,
                        width: 20,
                        height: 20,
                        image: AssetImage(
                          'assets/images/daily1.png',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Text("mysell"),
                    const Spacer(),
                    const Column(
                      children: [
                        Text("mysell"),
                        Text("mysell"),
                      ],
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ],
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
