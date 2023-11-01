import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CoffeeTile extends StatelessWidget {

  final String coffeeImagePath;
  final String coffeeName;
  final String coffeePrice ;
  const CoffeeTile({super.key ,
  required this.coffeeImagePath,
  required this.coffeeName,
  required this.coffeePrice});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 16),
      child: Container(
        width: 160,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.black54),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Coffe Image Type
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Image.asset(coffeeImagePath),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    coffeeName,
                    style: GoogleFonts.bebasNeue(
                      fontSize: 26,
                    ),
                  ),
                  Text(
                    'With Almond Milk',
                    style: GoogleFonts.pacifico(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '\$' + coffeePrice,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(9)),
                        child: Icon(Icons.add),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
