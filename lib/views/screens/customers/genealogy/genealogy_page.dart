import 'package:flutter/material.dart';
import 'package:hoavien_app/views/widgets/custom_title_text.dart';

class GenealogyPage extends StatelessWidget {
  const GenealogyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTitleText(
          title: 'Gia phả',
        ),
      ),
    );
  }
}
