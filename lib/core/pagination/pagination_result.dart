import 'package:cloud_firestore/cloud_firestore.dart';

class PaginationResult<T> {
  final List<T> item;
  final DocumentSnapshot? lastDocument;
  final bool hasMoreData;

  const PaginationResult({
    required this.item,
    this.lastDocument,
    required this.hasMoreData,
  });
}
