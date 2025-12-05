import '../models/book_model.dart';

class BookController {
  final List<BookModel> bookList = [
    BookModel(
      title: "Atomic Habits",
      publisher: "Gramedia",
      overview: "Atomic Habits adalah buku yang membahas bagaimana kebiasaan kecil dapat memberikan hasil yang luar biasa jika dilakukan secara konsisten. Buku ini menjelaskan konsep 1% better everyday, yaitu peningkatan kecil yang jika terus dilakukan akan memberikan perubahan besar dalam hidup. Melalui contoh nyata dan strategi praktis, pembaca diajak memahami cara membangun kebiasaan baik, menghancurkan kebiasaan buruk, serta menciptakan sistem yang membuat hidup lebih tertata dan produktif.",
      status: "Tersedia",
      voteAverage: 5,
      posterPath: "assets/images/atm.jpeg",
    ),
    BookModel(
      title: "The Psychology of Money",
      publisher: "Gramedia",
      overview: "The Psychology of Money menjelaskan bagaimana manusia sering mengambil keputusan keuangan bukan berdasarkan logika, tetapi berdasarkan emosi dan pengalaman hidup. Buku ini memberikan berbagai kisah nyata yang menggambarkan bagaimana cara orang berpikir tentang uang, risiko, investasi, dan kebebasan finansial. Pembaca diajak memahami bahwa mengelola uang bukan hanya soal matematika, tetapi tentang perilaku, kebiasaan, dan pola pikir yang tepat agar dapat mencapai tujuan finansial jangka panjang.",
      status: "Tersedia",
      voteAverage: 4,
      posterPath: "assets/images/my.jpeg",
    ),
    BookModel(
      title: "Sapiens",
      publisher: "Gramedia",
      overview: "Sapiens adalah perjalanan sejarah panjang manusia mulai dari era prasejarah, Revolusi Kognitif, Revolusi Pertanian, hingga era modern. Buku ini menggambarkan bagaimana Homo sapiens berkembang menjadi spesies dominan di bumi melalui kemampuan bercerita, bekerja sama, serta menciptakan struktur sosial. Dengan gaya penyampaian yang menarik, Sapiens membantu pembaca memahami asal-usul peradaban, perkembangan budaya, hingga dampak manusia terhadap dunia saat ini",
      status: "Dipinjam",
      voteAverage: 5,
      posterPath: "assets/images/sp.jpg",
    ),
  ];

  void addBook(BookModel book) => bookList.add(book);
  void deleteBook(int index) => bookList.removeAt(index);
  void updateBook(int index, BookModel book) => bookList[index] = book;
}
