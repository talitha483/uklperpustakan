import 'package:flutter/material.dart';
import '../controllers/book_controller.dart';
import '../models/book_model.dart';
import 'detail_view.dart';

class TimelineView extends StatefulWidget {
  const TimelineView({super.key});

  @override
  State<TimelineView> createState() => _TimelineViewState();
}

class _TimelineViewState extends State<TimelineView> {
  final BookController bookController = BookController();

  
  void _showError(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.redAccent,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  void _showSuccess(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.green,
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  
  void _addBook() async {
    final titleC = TextEditingController();
    final publisherC = TextEditingController();
    final overviewC = TextEditingController();
    final posterC = TextEditingController();
    final voteC = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Tambah Buku"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: titleC, decoration: const InputDecoration(labelText: "Judul")),
              TextField(controller: publisherC, decoration: const InputDecoration(labelText: "Publisher")),
              TextField(controller: overviewC, decoration: const InputDecoration(labelText: "Overview")),
              TextField(controller: posterC, decoration: const InputDecoration(labelText: "Asset Path / URL")),
              TextField(controller: voteC, decoration: const InputDecoration(labelText: "Rating (0-5)")),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal")),
          ElevatedButton(
            onPressed: () {
              if (titleC.text.isEmpty ||
                  publisherC.text.isEmpty ||
                  overviewC.text.isEmpty ||
                  posterC.text.isEmpty ||
                  voteC.text.isEmpty) {
                _showError("Semua field harus diisi!");
                return;
              }

              setState(() {
                bookController.addBook(
                  BookModel(
                    title: titleC.text,
                    publisher: publisherC.text,
                    overview: overviewC.text,
                    status: "Tersedia",
                    voteAverage: int.tryParse(voteC.text) ?? 0,
                    posterPath: posterC.text,
                  ),
                );
              });

              _showSuccess("Buku baru berhasil ditambahkan!");
              Navigator.pop(context);
            },
            child: const Text("Tambah"),
          ),
        ],
      ),
    );
  }

 
  void _editBook(int index) async {
    BookModel book = bookController.bookList[index];

    final titleC = TextEditingController(text: book.title);
    final publisherC = TextEditingController(text: book.publisher);
    final overviewC = TextEditingController(text: book.overview);
    final posterC = TextEditingController(text: book.posterPath);
    final voteC = TextEditingController(text: book.voteAverage.toString());

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Edit Buku"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(controller: titleC, decoration: const InputDecoration(labelText: "Judul")),
              TextField(controller: publisherC, decoration: const InputDecoration(labelText: "Publisher")),
              TextField(controller: overviewC, decoration: const InputDecoration(labelText: "Overview")),
              TextField(controller: posterC, decoration: const InputDecoration(labelText: "Asset Path / URL")),
              TextField(controller: voteC, decoration: const InputDecoration(labelText: "Rating (0-5)")),
            ],
          ),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal")),
          ElevatedButton(
            onPressed: () {
              if (titleC.text.isEmpty ||
                  publisherC.text.isEmpty ||
                  overviewC.text.isEmpty ||
                  posterC.text.isEmpty ||
                  voteC.text.isEmpty) {
                _showError("Semua field harus diisi!");
                return;
              }

              setState(() {
                bookController.updateBook(
                  index,
                  BookModel(
                    title: titleC.text,
                    publisher: publisherC.text,
                    overview: overviewC.text,
                    status: book.status,
                    voteAverage: int.tryParse(voteC.text) ?? 0,
                    posterPath: posterC.text,
                  ),
                );
              });

              _showSuccess("Buku berhasil diperbarui!");
              Navigator.pop(context);
            },
            child: const Text("Simpan"),
          ),
        ],
      ),
    );
  }

  
  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Hapus Buku"),
        content: const Text("Anda yakin ingin menghapus buku ini?"),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel")),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            onPressed: () {
              setState(() {
                bookController.deleteBook(index);
              });

              Navigator.pop(context);
              _showSuccess("Buku berhasil dihapus!");
            },
            child: const Text("Hapus"),
          ),
        ],
      ),
    );
  }

  
  Widget _buildBookImage(String path) {
    if (path.startsWith('http')) {
      return Image.network(
        path,
        width: 120,
        height: 180,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 120,
          height: 180,
          color: Colors.grey.shade300,
          child: const Icon(Icons.broken_image),
        ),
      );
    } else {
      return Image.asset(
        path,
        width: 120,
        height: 180,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => Container(
          width: 120,
          height: 180,
          color: Colors.grey.shade300,
          child: const Icon(Icons.broken_image),
        ),
      );
    }
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F4FF),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(221, 218, 179, 222),
        title: const Text("Linimasa"),
        actions: [
          IconButton(onPressed: _addBook, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: bookController.bookList.length,
        itemBuilder: (context, index) {
          final BookModel book = bookController.bookList[index];

          return Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 5,
                  offset: const Offset(1, 3),
                )
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: _buildBookImage(book.posterPath),
                ),
                const SizedBox(width: 12),

                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        book.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(height: 4),

                      Text(
                        book.publisher,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12, color: Colors.grey),
                      ),
                      const SizedBox(height: 6),

                      Text(
                        book.overview,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 12, color: Color(0xFF6E5CA8)),
                      ),
                      const SizedBox(height: 8),

                      Row(
                        children: List.generate(
                          5,
                          (i) => Icon(
                            i < book.voteAverage
                                ? Icons.star
                                : Icons.star_border,
                            color: Colors.amber,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            onPressed: () => _editBook(index),
                            child: const Text(
                              "Edit",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                          const SizedBox(width: 6),

                          ElevatedButton(
                            onPressed: () => _confirmDelete(index),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text(
                              "Hapus",
                              style: TextStyle(fontSize: 12),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
