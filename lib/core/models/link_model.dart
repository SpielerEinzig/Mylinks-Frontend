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

  LinkModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        shorUrl = json['shortURL'],
        longUrl = json['shortURL'],
        qrCode = json['QRCodeImage'],
        clickCount = json['linkClickCount'],
        created = DateTime.parse(json['createdAt']);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkModel && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
