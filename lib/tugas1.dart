import 'package:flutter/material.dart';

//================ Pet Home Page =================
class PetHomePage extends StatelessWidget {
  const PetHomePage({super.key});

  void openDetail(BuildContext context, Pet pet) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(pet: pet),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Pet> pets = [
      Pet(
        name: 'Luna',
        type: 'British Shorthair',
        age: '3 Bulan',
        status: 'DIVAKSIN',
        image: 'assets/kucing.jpg',
        description:
            'Luna adalah anak kucing yang sangat tenang dan suka bermain-main. Dia sudah terbiasa dengan lingkungan apartemen.',
      ),
      Pet(
        name: 'Buddy',
        type: 'Golden Retriever',
        age: '5 Bulan',
        status: 'DIVAKSIN',
        image: 'assets/anjing.jpg',
        description:
            'Buddy adalah anjing yang aktif, ramah, dan suka bermain. Cocok untuk keluarga yang menyukai hewan ceria.',
      ),
      Pet(
        name: 'Milo',
        type: 'Netherland Dwarf',
        age: '2 Bulan',
        status: 'SEHAT',
        image: 'assets/kelinci.jpg',
        description:
            'Milo adalah kelinci kecil yang lucu dan jinak. Ia suka makan wortel dan cocok dipelihara di rumah.',
      ),
      Pet(
        name: 'Rio',
        type: 'Lovebird',
        age: '4 Bulan',
        status: 'SEHAT',
        image: 'assets/burung.jpg',
        description:
            'Rio adalah burung yang ceria dan aktif berkicau. Cocok untuk pecinta burung hias rumahan.',
      ),
      Pet(
        name: 'Coco',
        type: 'Persian Cat',
        age: '6 Bulan',
        status: 'DIVAKSIN',
        image: 'assets/kucing2.jpg',
        description:
            'Coco adalah kucing persia yang manja dan suka dielus. Ia cocok untuk pemilik yang sabar dan penyayang.',
      ),
      Pet(
        name: 'Max',
        type: 'Siberian Husky',
        age: '8 Bulan',
        status: 'SEHAT',
        image: 'assets/anjing2.jpg',
        description:
            'Max adalah anjing husky yang aktif, pintar, dan senang berjalan-jalan. Cocok untuk keluarga yang memiliki halaman luas.',
      ),
      Pet(
        name: 'Snowy',
        type: 'Anggora',
        age: '4 Bulan',
        status: 'DIVAKSIN',
        image: 'assets/kucing3.jpg',
        description:
            'Snowy adalah kucing anggora berbulu lembut dan bersih. Ia sangat ramah dengan manusia dan mudah beradaptasi.',
      ),
      Pet(
        name: 'Boni',
        type: 'Hamster Syrian',
        age: '1 Bulan',
        status: 'SEHAT',
        image: 'assets/hamster.jpg',
        description:
            'Boni adalah hamster kecil yang lucu dan aktif. Ia cocok dipelihara di kandang kecil dan mudah dirawat.',
      ),
      Pet(
        name: 'Kiko',
        type: 'Iguana Hijau',
        age: '10 Bulan',
        status: 'SEHAT',
        image: 'assets/iguana.jpg',
        description:
            'Kiko adalah iguana hijau yang tenang dan unik. Cocok untuk pecinta reptil yang sudah memahami perawatan hewan eksotis.',
      ),
      Pet(
        name: 'Goldie',
        type: 'Ikan Mas Koki',
        age: '3 Bulan',
        status: 'SEHAT',
        image: 'assets/ikan.jpg',
        description:
            'Goldie adalah ikan mas koki yang cantik dan aktif berenang. Cocok untuk menghiasi akuarium di rumah.',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFEFF8F8),
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 300,
            child: Column(
              children: [
                const SizedBox(height: 25),

                // Banner atas
                Container(
                  width: 280,
                  height: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage('assets/pet_banner.jpg'),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        blurRadius: 4,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Container(
                    padding: const EdgeInsets.only(left: 12, bottom: 10),
                    alignment: Alignment.bottomLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        colors: [
                          Colors.black.withOpacity(0.45),
                          Colors.transparent,
                        ],
                      ),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'PetAdopt',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Find Your Favorite Pet',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Daftar Hewan Adopsi',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF243B57),
                  ),
                ),

                const SizedBox(height: 15),

                Expanded(
                  child: GridView.builder(
                    padding: const EdgeInsets.only(bottom: 20),
                    itemCount: pets.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 18,
                      crossAxisSpacing: 35,
                      childAspectRatio: 1.35,
                    ),
                    itemBuilder: (context, index) {
                      final pet = pets[index];

                      return PetButton(
                        title: pet.name,
                        subtitle: pet.type,
                        icon: pet.icon,
                        onTap: () => openDetail(context, pet),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//================ Pet Button =================
class PetButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback onTap;

  const PetButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(5),
      child: Container(
        width: 90,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFFEFF8F8),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.black54,
            width: 1.2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.20),
              blurRadius: 2,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: const Color(0xFFE96E6E),
              size: 22,
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            Text(
              subtitle,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 9,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//================ Detail Page =================
class DetailPage extends StatelessWidget {
  final Pet pet;

  const DetailPage({super.key, required this.pet});

  void showAdoptionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: const Icon(
            Icons.calendar_month,
            color: Colors.redAccent,
            size: 32,
          ),
          title: const Text(
            'Jadwalkan Kunjungan?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          content: Text(
            'Ingin menjadwalkan pertemuan dengan ${pet.name} di shelter untuk proses adopsi?',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 13),
          ),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade400,
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 8,
                ),
              ),
              child: const Text(
                'Batal',
                style: TextStyle(color: Colors.white),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Permintaan adopsi ${pet.name} dikirim!',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 8,
                ),
              ),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF8F8),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  pet.image,
                  width: double.infinity,
                  height: 180,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  top: 10,
                  left: 10,
                  child: InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    pet.name,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF7BE36B),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      pet.status,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                '${pet.type} • ${pet.age}',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                'Tentang ${pet.name}',
                style: const TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 6),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                pet.description,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                  height: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 28),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: SizedBox(
                width: double.infinity,
                height: 42,
                child: ElevatedButton(
                  onPressed: () {
                    showAdoptionDialog(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF243B57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  child: const Text(
                    'AJUKAN ADOPSI',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
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

//================ Pet Model =================
class Pet {
  final String name;
  final String type;
  final String age;
  final String status;
  final String image;
  final String description;
  final IconData icon;

  Pet({
    required this.name,
    required this.type,
    required this.age,
    required this.status,
    required this.image,
    required this.description,
  }) : icon = _getIcon(type);

  static IconData _getIcon(String type) {
    final lowerType = type.toLowerCase();

    if (lowerType.contains('cat') ||
        lowerType.contains('shorthair') ||
        lowerType.contains('persian') ||
        lowerType.contains('anggora')) {
      return Icons.pets;
    } else if (lowerType.contains('retriever') ||
        lowerType.contains('husky')) {
      return Icons.cruelty_free;
    } else if (lowerType.contains('rabbit') ||
        lowerType.contains('dwarf')) {
      return Icons.pets;
    } else if (lowerType.contains('lovebird')) {
      return Icons.flutter_dash;
    } else if (lowerType.contains('hamster')) {
      return Icons.pets;
    } else if (lowerType.contains('iguana')) {
      return Icons.pets;
    } else if (lowerType.contains('ikan')) {
      return Icons.water;
    } else {
      return Icons.pets;
    }
  }
}