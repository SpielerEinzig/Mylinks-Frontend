class LinkModel {
  String id;
  String shorUrl;
  String longUrl;
  String qrCode;
  int clickCount;
  DateTime created;

  LinkModel({
    required this.id,
    required this.created,
    required this.clickCount,
    required this.longUrl,
    required this.qrCode,
    required this.shorUrl,
  });
}
