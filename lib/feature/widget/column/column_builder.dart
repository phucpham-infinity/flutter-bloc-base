import 'package:flutter/material.dart';

class ColumnBuilder extends StatelessWidget {
  final List data;
  final Function itemBuilder;
  final Widget separatorItem;
  const ColumnBuilder({
    Key? key,
    required this.data,
    required this.itemBuilder,
    this.separatorItem = const SizedBox(height: 10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        data.length,
        (index) {
          final isEnd = index != data.length - 1;
          return Column(
            children: [itemBuilder(index), if (isEnd) separatorItem],
          );
        },
      ),
    );
  }
}
