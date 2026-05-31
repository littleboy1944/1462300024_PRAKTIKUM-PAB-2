import 'package:flutter/material.dart';
import 'tugas1.dart';
import 'bottom_nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

// ================= MAIN PAGE DENGAN BOTTOM NAV =================
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  late final List<Widget> pages;

  @override
  void initState() {
    super.initState();

    pages = [
      HomePage(
        onMasuk: () {
          setState(() {
            selectedIndex = 1;
          });
        },
      ),
      const PetHomePage(),
      const ProfilePage(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // IndexedStack membuat halaman tetap tersimpan
      body: IndexedStack(
        index: selectedIndex,
        children: pages,
      ),

      bottomNavigationBar: PetBottomNavBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
    );
  }
}

// ================= HALAMAN AWAL =================
class HomePage extends StatelessWidget {
  final VoidCallback onMasuk;

  const HomePage({
    super.key,
    required this.onMasuk,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 250,
        height: 500,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "PRAKTIKUM PAB 2023",
              style: TextStyle(
                fontSize: 18,
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "1462300024",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Image.asset(
              'assets/images/foto.png',
              width: 150,
              height: 150,
            ),

            const SizedBox(height: 30),

            const Text(
              "Muhammad Lintang Fajar",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 40),

            ElevatedButton(
              onPressed: onMasuk,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ================= HALAMAN PROFILE PENGADOPSI =================
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController teleponController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController instagramController = TextEditingController();

  String nama = '';
  String alamat = '';
  String telepon = '';
  String email = '';
  String instagram = '';

  bool dataTersimpan = false;

  void simpanProfil() {
    setState(() {
      nama = namaController.text;
      alamat = alamatController.text;
      telepon = teleponController.text;
      email = emailController.text;
      instagram = instagramController.text;
      dataTersimpan = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Profil pengadopsi berhasil disimpan'),
      ),
    );
  }

  @override
  void dispose() {
    namaController.dispose();
    alamatController.dispose();
    teleponController.dispose();
    emailController.dispose();
    instagramController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF8F8),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 25),
          child: Center(
            child: Container(
              width: 310,
              padding: const EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.18),
                    blurRadius: 6,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 45,
                    backgroundColor: Color(0xFF243B57),
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 55,
                    ),
                  ),

                  const SizedBox(height: 14),

                  const Text(
                    'Profil Pengadopsi',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF243B57),
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    'Isi data profil calon pengadopsi',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 22),

                  inputField(
                    controller: namaController,
                    label: 'Nama Lengkap',
                    icon: Icons.person,
                  ),

                  inputField(
                    controller: alamatController,
                    label: 'Alamat',
                    icon: Icons.home,
                    maxLines: 2,
                  ),

                  inputField(
                    controller: teleponController,
                    label: 'No Telepon',
                    icon: Icons.phone,
                    keyboardType: TextInputType.phone,
                  ),

                  inputField(
                    controller: emailController,
                    label: 'Email',
                    icon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),

                  inputField(
                    controller: instagramController,
                    label: 'Instagram',
                    icon: Icons.camera_alt,
                  ),

                  const SizedBox(height: 14),

                  SizedBox(
                    width: double.infinity,
                    height: 42,
                    child: ElevatedButton(
                      onPressed: simpanProfil,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF243B57),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'SIMPAN PROFIL',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  if (dataTersimpan) ...[
                    const SizedBox(height: 22),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF8F8),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Center(
                            child: Text(
                              'Data Profil',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF243B57),
                              ),
                            ),
                          ),

                          const SizedBox(height: 12),

                          profileDataItem(
                            icon: Icons.person,
                            title: 'Nama',
                            value: nama,
                          ),

                          profileDataItem(
                            icon: Icons.home,
                            title: 'Alamat',
                            value: alamat,
                          ),

                          profileDataItem(
                            icon: Icons.phone,
                            title: 'No Telepon',
                            value: telepon,
                          ),

                          profileDataItem(
                            icon: Icons.email,
                            title: 'Email',
                            value: email,
                          ),

                          profileDataItem(
                            icon: Icons.camera_alt,
                            title: 'Instagram',
                            value: instagram,
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget inputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    int maxLines = 1,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        maxLines: maxLines,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: const Color(0xFFE96E6E),
          ),
          labelText: label,
          labelStyle: const TextStyle(fontSize: 13),
          filled: true,
          fillColor: const Color(0xFFEFF8F8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.black12,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(0xFF243B57),
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }

  Widget profileDataItem({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFFE96E6E),
            size: 22,
          ),

          const SizedBox(width: 10),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                Text(
                  value.isEmpty ? '-' : value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}