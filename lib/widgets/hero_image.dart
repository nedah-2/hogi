import 'package:flutter/material.dart';
import 'package:hogi_milk/providers/data_provider.dart';
import 'package:provider/provider.dart';

class HeroImage extends StatefulWidget {
  const HeroImage({super.key});

  @override
  State<HeroImage> createState() => _HeroImageState();
}

class _HeroImageState extends State<HeroImage> {
  @override
  Widget build(BuildContext context) {
    final dataManager = Provider.of<DataManager>(context, listen: true);
    final Map images = dataManager.images;
    return Consumer<DataManager>(
      builder: (context, data, child) {
        if (data.images['img1'] == null) {
          return Container(height: 520, color: Colors.grey.shade100);
        }
        // Use yourProvider to access the data or methods provided by your provider
        return SizedBox(
          width: double.infinity,
          height: 520,
          child: Image.network(
            images['img1'],
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
