class ChatPharmacy{
  final String pharmacyName;
  final String openTime;
  final String ImageUrl;
  final bool isSelected;

  ChatPharmacy({
    required this.ImageUrl,
    required this.pharmacyName,
    required this.openTime,
    this.isSelected = false
  });
}