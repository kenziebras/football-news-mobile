import 'package:flutter/material.dart';
// Sesuaikan path ini dengan lokasi file menu.dart Anda setelah dipindah
import 'package:football_news/screens/menu.dart';
import 'package:football_news/screens/newslist_form.dart'; 
import 'package:football_news/screens/news_entry_list.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue, // 
            ),
            child: Column(
              children: [
                Text(
                  'Football News', // 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30, // 
                    fontWeight: FontWeight.bold, // 
                    color: Colors.white, // 
                  ),
                ),
                Padding(padding: EdgeInsets.all(10)), // 
                Text(
                  "Seluruh berita sepak bola terkini di sini!", // 
                  // TODO: Tambahkan gaya teks (center, 15, putih, normal) 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
          
          // --- ROUTING ---
          ListTile(
            leading: const Icon(Icons.home_outlined), // 
            title: const Text('Home'), // 
            onTap: () {
              // Navigasi ke halaman utama (MyHomePage) 
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  // Gunakan nama kelas halaman utama Anda
                  builder: (context) => MyHomePage(colorScheme: Theme.of(context).colorScheme), 
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.post_add), // 
            title: const Text('Add News'), // 
            onTap: () {
              //TODO: Buatlah routing ke NewsFormPage di sini 
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const NewsFormPage()),
              );
            },
          ),
          ListTile(
              leading: const Icon(Icons.add_reaction_rounded),
              title: const Text('News List'),
              onTap: () {
                  // Route to news list page
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const NewsEntryListPage()),
                  );
              },
          ),
          // TODO: Buat ListTile baru untuk ke halaman melihat news 
        ],
      ),
    );
  }
}