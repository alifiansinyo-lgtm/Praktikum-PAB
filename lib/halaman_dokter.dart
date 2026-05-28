import 'package:flutter/material.dart';
import 'detail_dokter.dart';

class MainNavigationPage extends StatefulWidget {
  const MainNavigationPage({super.key});

  @override
  State<MainNavigationPage> createState() => _MainNavigationPageState();
}

class _MainNavigationPageState extends State<MainNavigationPage> {
  int _selectedIndex = 0;

  void ubahHalaman(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HalamanDokterContent(),              
      RiwayatGridPage(onBoxTap: () => ubahHalaman(3)), 
      const ProfilePage(),                      
      RiwayatDetailPage(onBackTap: () => ubahHalaman(1)), 
    ];

    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A2A3A), 
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex > 2 ? 1 : _selectedIndex, 
        onTap: (index) {
          ubahHalaman(index);
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }
}

class HalamanDokterContent extends StatelessWidget {
  const HalamanDokterContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PRAKTIKUM PAB', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Banner Atas
              Container(
                width: double.infinity,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFFE3F2FD),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Tubuh sehat, investasi terbaik masa depan',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1A237E)),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15)),
                        child: Image.asset('assets/8419285e09006fae7beb3be72f562a87.jpg', fit: BoxFit.cover),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              
              // Menu Pilihan Dokter
              _buildCategoryMenu(context, 'Dokter Umum', Icons.medical_services_outlined, 
                  'dr. syakila amarta', 'Dokter Umum', 
                  'assets/Tahapan-Pendidikan-Dokter-Panduan-Lengkap-Buat-Calon-Mahasiswa-Fakultas-Kedokteran.jpg'),

              _buildCategoryMenu(context, 'Dokter Gigi', Icons.badge_outlined, 
                  'drg. imron handoko', 'Dokter Gigi', 
                  'assets/1684739343-Dokter-Reproduksi-Pria-(1).jpg'),

              _buildCategoryMenu(context, 'Dokter Anak', Icons.child_care, 
                  'dr. mikaila loretta', 'Dokter Anak', 
                  'assets/pilihan-karir-non-klinis-untuk-dokter-di-indonesia-0-alomedika.jpg'),

              _buildCategoryMenu(context, 'Dokter Hewan', Icons.pets, 
                  'drh. Rian Pratama', 'Dokter Hewan', 
                  'assets/dokter-ddbb4a601beae7cf629f69d309116498.jpg'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryMenu(BuildContext context, String title, IconData icon, String namaDokter, String spesialis, String fotoAsset) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        onPressed: () {
          Navigator.push(
            context, 
            MaterialPageRoute(
              builder: (context) => DetailDokter(
                nama: namaDokter,
                spesialisasi: spesialis,
                foto: fotoAsset,
              ),
            ),
          );
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: const Color(0xFFEDF7FD),
          side: const BorderSide(color: Color(0xFFB3E5FC), width: 1.5),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFF0288D1), size: 22),
            const SizedBox(width: 16),
            Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black87)),
          ],
        ),
      ),
    );
  }
}

class RiwayatGridPage extends StatelessWidget {
  final VoidCallback onBoxTap;
  const RiwayatGridPage({super.key, required this.onBoxTap}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PRAKTIKUM PAB', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: 6, 
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,         
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.85,    
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: onBoxTap, 
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[300], 
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class RiwayatDetailPage extends StatelessWidget {
  final VoidCallback onBackTap;
  const RiwayatDetailPage({super.key, required this.onBackTap}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('PRAKTIKUM PAB', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: onBackTap, 
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4))
                  ]
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  elevation: 0,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text(
                  'Play',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key}); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 220,
              decoration: const BoxDecoration(
                color: Color(0xFFE3F2FD),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(160),
                  bottomRight: Radius.circular(160),
                ),
              ),
            ),
          ),

          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1A2A3A),
                  ),
                ),
                const SizedBox(height: 30),

                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.grey.shade300, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person_outline,
                      size: 60,
                      color: Color(0xFF0288D1),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // List Data Profil
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 45.0),
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        _buildProfileItem(Icons.person_outline, 'Alifian Kurnia Absari'),
                        _buildProfileItem(Icons.phone_android_outlined, '1462300175'),
                        _buildProfileItem(Icons.mail_outline, 'sinyofian@gmail.com'),
                        _buildProfileItem(Icons.location_on_outlined, 'Surabaya'),
                        _buildProfileItem(Icons.camera_alt_outlined, 'alifiankurniaa'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: const Color(0xFF0288D1),
            size: 26,
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}