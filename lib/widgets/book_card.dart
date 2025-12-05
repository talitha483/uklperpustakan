import 'package:flutter/material.dart';
import '../models/book_model.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  final VoidCallback onDetail;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const BookCard({
    super.key,
    required this.book,
    required this.onDetail,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onDetail,
      child: Container(
        width: 180,
        margin: const EdgeInsets.only(right: 14, bottom: 12),
        padding: const EdgeInsets.all(12),
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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: book.posterPath.startsWith('http')
                  ? Image.network(
                      book.posterPath,
                      width: 160,
                      height: 120,
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => Container(
                        width: 160,
                        height: 120,
                        color: Colors.grey.shade300,
                        child: const Icon(Icons.broken_image),
                      ),
                    )
                  : Image.asset(
                      book.posterPath,
                      width: 160,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
            ),

            const SizedBox(height: 8),

            
            SizedBox(
              height: 36,
              child: Text(
                book.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Color(0xFF48357A),
                ),
              ),
            ),

            const SizedBox(height: 6),

            
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (onEdit != null)
                  SizedBox(
                    height: 28,
                    child: ElevatedButton(
                      onPressed: onEdit,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: const Text(
                        "Edit",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),

                if (onDelete != null)
                  SizedBox(
                    height: 28,
                    child: ElevatedButton(
                      onPressed: onDelete,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                      ),
                      child: const Text(
                        "Hapus",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
