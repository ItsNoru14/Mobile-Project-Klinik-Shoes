class HistoryDetailModel {
  final String orderId;
  final String orderedAt;
  final String estTime;
  final String deliveredAt;
  final String address;
  final String name;
  final String treatmentType;
  final int pairs;
  final int deliveryFee;
  final int price;
  final String paymentMethod;
  final String note;

  HistoryDetailModel({
    required this.orderId,
    required this.orderedAt,
    required this.estTime,
    required this.deliveredAt,
    required this.address,
    required this.name,
    required this.treatmentType,
    required this.pairs,
    required this.deliveryFee,
    required this.price,
    required this.paymentMethod,
    required this.note,
  });
}