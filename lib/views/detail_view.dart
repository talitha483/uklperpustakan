import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookDetailView extends StatelessWidget {
  final BookModel book;
  const BookDetailView({super.key, required this.book});

  
  Widget loadImage(String path) {
    if (path.startsWith("http") || path.startsWith("https")) {
      return Image.network(
        path,
        width: 200,
        height: 280,
        fit: BoxFit.cover,
      );
    } else {
      return Image.asset(
        path,
        width: 200,
        height: 280,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 218, 179, 222),
        title: const Text("Detail Buku"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: loadImage(book.posterPath),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              book.title,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Penerbit: ${book.publisher}",
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 12),
            Text(
              book.overview,
              style: const TextStyle(fontSize: 14, color: Color(0xFF6E5CA8)),
            ),
            const SizedBox(height: 12),
            Row(
              children: List.generate(
                5,
                (i) => Icon(
                  i < book.voteAverage ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 24,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Status: ${book.status}",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: book.status == "Tersedia" ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
