import 'package:flutter/material.dart';
import 'halaman_dokter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: TugasPraktikum(),
    );
  }
}

class TugasPraktikum extends StatelessWidget {
  const TugasPraktikum({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, 
      body: Center( 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          children: [
            const Text(
              'Welcome to',
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 5), 
            const Text(
              'PRAKTIKUM PAB 2023',
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 30), 
            const Text(
              '1462300175',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/catalog-1752938743565.webp',
              height: 200, 
              width: 200,  
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 20),
            const Text(
              'Alifian Kurnia Absari',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: 200, 
              height: 45, 
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MainNavigationPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF8AE0AA), 
                  elevation: 0, 
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                child: const Text(
                  'Masuk',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}