import 'package:flutter/material.dart';
// Impor halaman form 
import 'package:football_news/screens/newslist_form.dart'; 
import 'package:football_news/screens/news_entry_list.dart';
import 'package:football_news/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';


// Kelas Model Data Anda (dipindahkan dari menu.dart)
class ItemHomepage {
  final String name;
  final IconData icon;

  ItemHomepage(this.name, this.icon);
}

// Widget Card Anda (dipindahkan dari menu.dart dan dimodifikasi)
class ItemCard extends StatelessWidget {
  final ItemHomepage item; 
  const ItemCard(this.item, {super.key}); 

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        // Modifikasi onTap 
        onTap: () async {
          // Menampilkan pesan SnackBar (kode Anda yang sudah ada) 
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(content: Text("Kamu telah menekan tombol ${item.name}!"))
            );
          
          // Tambahkan Navigasi 
          // Cek nama item (sesuai data di menu.dart Anda)
          if (item.name == "Add News") {
            // TODO: Gunakan Navigator.push untuk ke NewsFormPage 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const NewsFormPage()),
            );
          } else if (item.name == "See Football News") {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewsEntryListPage()
                  ),
              );
          } // Add this after your previous if statements
          else if (item.name == "Logout") {
              // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
              // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
              // If you using chrome,  use URL http://localhost:8000
              
              final response = await request.logout(
                  "http://localhost:8000/auth/logout/");
              String message = response["message"];
              if (context.mounted) {
                  if (response['status']) {
                      String uname = response["username"];
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("$message See you again, $uname."),
                      ));
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                  } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(message),
                          ),
                      );
                  }
              }
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}