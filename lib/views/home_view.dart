import 'package:flutter/material.dart';
import '../widgets/custom_navbar.dart';
import '../widgets/custom_carousel.dart';
import 'timeline_view.dart';
import 'profile_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int navIndex = 0;

  final List<Map<String, String>> lastAccess = [
    {
      "img": "assets/images/atm.jpeg",
      "title": "Atomic Habits",
      "overview":
          "Panduan membentuk kebiasaan baru lewat perubahan kecil yang berdampak besar."
    },
    {
      "img": "assets/images/my.jpeg",
      "title": "The Psychology of Money",
      "overview": "Cara manusia berpikir dan membuat keputusan tentang uang."
    },
    {
      "img": "assets/images/sp.jpg",
      "title": "Sapiens",
      "overview": "Perjalanan evolusi manusia dari zaman kuno hingga modern."
    },
  ];

  final List<String> rekomendasi = [
    "assets/images/1.jpeg",
    "assets/images/2.jpeg",
    "assets/images/3.jpeg",
    "assets/images/4.jpg",
  ];

  final List<Map<String, String>> popular = [
    {
      "img": "assets/images/lt.jpeg",
      "title": "Laut Bercerita",
      "overview": "Cerita unik pejuang negara.",
      "publisher": "Gramedia Pustaka Utama",
      "status": "Tersedia",
      "rating": "5",
    },
    {
      "img": "assets/images/mi.jpeg",
      "title": "Seporsi Mi Ayam",
      "overview": "Kisah hangat tentang makna hidup.",
      "publisher": "Gramedia Pustaka Utama",
      "status": "Dipinjam",
      "rating": "4",
    },
    {
      "img": "assets/images/hujan.jpeg",
      "title": "Hujan",
      "overview": "Cerita lembut tentang kehilangan dan harapan.",
      "publisher": "Gramedia Pustaka Utama",
      "status": "Tersedia",
      "rating": "5",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final pages = [
      _buildHome(),
      const TimelineView(),
      const ProfileView(),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      appBar: navIndex == 0
          ? AppBar(
              backgroundColor: const Color.fromARGB(221, 218, 179, 222),
              title: const Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            )
          : null,
      body: pages[navIndex],
      bottomNavigationBar: CustomNavbar(
        index: navIndex,
        onTap: (i) => setState(() => navIndex = i),
      ),
    );
  }

  Widget _buildHome() {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            TextField(
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: const Icon(Icons.search, color: Color(0xFF7D6BC3)),
                filled: true,
                fillColor: const Color(0xFFF2ECFF),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 18),

            
            const MyCustomCarousel(),

            const SizedBox(height: 22),

            
            const Text(
              "Terakhir Diakses",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5E4B8B),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 240,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: lastAccess.length,
                itemBuilder: (context, i) {
                  final item = lastAccess[i];
                  return Container(
                    width: 170,
                    margin: const EdgeInsets.only(right: 14),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF6F1FF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE6DBFF)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item["img"]!,
                            height: 130,
                            width: 160,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item["title"]!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF4D3A7A),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item["overview"]!,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6D5AA9),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            
            const Text(
              "Rekomendasi",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5E4B8B),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: rekomendasi.length,
                itemBuilder: (context, i) {
                  return Container(
                    width: 115,
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE6DBFF)),
                      color: const Color(0xFFF5F0FF),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5,
                          color: Colors.black.withOpacity(0.05),
                        )
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        rekomendasi[i],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),

            
            const Text(
              "Populer",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5E4B8B),
              ),
            ),
            const SizedBox(height: 10),

            SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: popular.length,
                itemBuilder: (context, i) {
                  final item = popular[i];
                  return Container(
                    width: 190,
                    margin: const EdgeInsets.only(right: 14),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5F0FF),
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: const Color(0xFFE3D9FF)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.06),
                          blurRadius: 6,
                          offset: const Offset(1, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            item["img"]!,
                            width: double.infinity,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Text(
                          item["title"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color(0xFF48357A),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item["overview"]!,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xFF6E5CA8),
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: List.generate(
                            5,
                            (index) => Icon(
                              index < int.tryParse(item["rating"] ?? "0")!
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 16,
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Penerbit: ${item["publisher"]}",
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 11,
                            color: Color(0xFF7D6BC3),
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Status: ${item["status"]}",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                            color: item["status"] == "Tersedia"
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
