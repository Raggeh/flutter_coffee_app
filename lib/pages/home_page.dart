// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:coffee_app/util/coffee_tile.dart';
import 'package:coffee_app/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeetype = [
    ['coppacino', true],
    ['black tea', false],
    ['coffee with milk', false],
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (var i = 0; i < coffeetype.length; i++) {
        coffeetype[i][1] = false;
      }
      coffeetype[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // right Appbar Icon
        leading: Icon(Icons.menu),
        actions: [
          // letf Appbar Icon
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black87,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 0, right: 15, bottom: 0),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.black54,
            tabBackgroundColor: Colors.grey.shade900,
            padding: EdgeInsets.all(10),
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.favorite,
                text: 'Likes',
              ),
              GButton(
                icon: Icons.notifications,
                text: 'Notification',
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          // FIND THE BEST COFFEE FOR YOU
          Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Text(
              'FIND THE BEST COFFEE FOR YOU ',
              style: GoogleFonts.bebasNeue(
                fontSize: 40,
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Find Your Coffee ',
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey)),
              ),
            ),
          ),

          SizedBox(height: 7),

          Container(
              height: 30,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: coffeetype.length,
                itemBuilder: (context, index) {
                  return CoffeType(
                      coffeeType: coffeetype[index][0],
                      isSelected: coffeetype[index][1],
                      onTap: () {
                        coffeeTypeSelected(index);
                      });
                },
              )),

          SizedBox(
            height: 5,
          ),

          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cf1.png',
                  coffeeName: 'Latte',
                  coffeePrice: '4.0',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cf2.png',
                  coffeeName: 'Black Tea',
                  coffeePrice: '2.0',
                ),
                CoffeeTile(
                  coffeeImagePath: 'lib/images/cf3.png',
                  coffeeName: 'Coffee With Milk',
                  coffeePrice: '5.5',
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
