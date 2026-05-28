import 'package:flutter/material.dart';

class DetailDokter extends StatelessWidget {
  final String nama;
  final String spesialisasi;
  final String foto;

  const DetailDokter({
    super.key,
    required this.nama,
    required this.spesialisasi,
    required this.foto,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border, color: Colors.red), onPressed: () {}),
          const SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 250, 
              decoration: BoxDecoration(
                color: const Color(0xFFECEFF1), 
                borderRadius: BorderRadius.circular(16),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  foto, 
                  fit: BoxFit.cover, 
                  alignment: Alignment.topCenter, 
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(nama, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            Text(spesialisasi, style: const TextStyle(fontSize: 16, color: Colors.blueGrey)),
            const SizedBox(height: 24),
            const Text('JADWAL PRAKTIK', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
            const Text('Mon - Fri, 9.00 AM - 5.00 PM'),
            const SizedBox(height: 24),
            const Text('BIOGRAFI SINGKAT', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
            Text(
              'Dokter spesialis $spesialisasi dengan pengalaman lebih dari 10 tahun di bidang klinis...', 
              style: const TextStyle(color: Colors.black54, height: 1.4)
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Row(children: List.generate(4, (index) => const Icon(Icons.star, color: Colors.amber, size: 20))),
                const Icon(Icons.star_half, color: Colors.amber, size: 20),
                const SizedBox(width: 8),
                const Text('4.5', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () => _showConfirmationDialog(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF102A43),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Buat Janji Temu', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A2A3A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {
          Navigator.pop(context);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'), // <-- DISAMAKAN JADI RIWAYAT
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(color: Color(0xFFE1F5FE), shape: BoxShape.circle),
                  child: const Icon(Icons.calendar_today_rounded, color: Color(0xFF039BE5), size: 30),
                ),
                const SizedBox(height: 16),
                const Text('Konfirmasi Janji Temu', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Text(
                  'Ingin menjadwalkan konsultasi dengan $nama?', 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(fontSize: 14, color: Colors.black54)
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: const BorderSide(color: Colors.grey))),
                        child: const Text('Batal', style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF039BE5), padding: const EdgeInsets.symmetric(vertical: 12), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
                        child: const Text('OK', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}