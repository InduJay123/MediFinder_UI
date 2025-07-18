class SearchHistoryItem {
  final String medicineName;
  final String imageUrl;
  final DateTime searchedAt;
  final bool availability;

  SearchHistoryItem({
    required this.medicineName,
    required this.imageUrl,
    required this.searchedAt,
    required this.availability,
  });
}