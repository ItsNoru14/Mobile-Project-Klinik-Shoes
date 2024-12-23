import 'package:flutter/material.dart';
import 'package:klinik_shoes_project/module/history_detail/controller/history_detail_controller.dart';
import 'package:klinik_shoes_project/model/history_detail_model.dart';

class HistoryDetailView extends StatelessWidget {
  final HistoryDetailController controller = HistoryDetailController();

  @override
  Widget build(BuildContext context) {
    final HistoryDetailModel detail = controller.getHistoryDetail();

    return Scaffold(
      appBar: AppBar(
        title: Text('History Detail'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ordered at : ${detail.orderedAt}'),
            Text('Est. time : ${detail.estTime}'),
            Text('Delivered : ${detail.deliveredAt}'),
            Divider(),
            Text(
              'Delivery Address :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(detail.name),
            Text(detail.address),
            Divider(),
            Row(
              children: [
                Image.asset(
                  'asset/whitening_logo.png', // Replace with actual image URL
                  width: 100,
                  height: 100,
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detail.treatmentType),
                    Text('Pairs : ${detail.pairs}'),
                    Text('Delivery fee : Rp.${detail.deliveryFee}'),
                    Text('Price : Rp.${detail.price}'),
                  ],
                ),
              ],
            ),
            Divider(),
            Text(
              'Total Price : Rp.${detail.deliveryFee + detail.price}',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Divider(),
            Text('Order Id : ${detail.orderId}'),
            Text('Payment Method : ${detail.paymentMethod}'),
            Text('Note : ${detail.note}'),
            Divider(),
            Text(
              'Need help?',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            TextButton(
              onPressed: () {
                // Add call functionality
              },
              child: Text('Call our call Center'),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Add review functionality
                },
                child: Text('Review Us'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}