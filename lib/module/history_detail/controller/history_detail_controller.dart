import 'package:klinik_shoes_project/model/history_detail_model.dart';

class HistoryDetailController {
  HistoryDetailModel getHistoryDetail() {
    return HistoryDetailModel(
      orderId: '0000000001',
      orderedAt: '02-12-2024',
      estTime: '04-12-2024',
      deliveredAt: '04-12-2024',
      address:
          'Jl. Begawan, No 2, Tlogomas, Kec. Lowokwaru, Kota Malang, Jawa Timur',
      name: 'Dimas Arief W.',
      treatmentType: 'Whitening Treatment',
      pairs: 1,
      deliveryFee: 5000,
      price: 50000,
      paymentMethod: 'ShopeePay',
      note: '-',
    );
  }
}