import 'package:flutter/material.dart';

class SaveItemHeader extends StatelessWidget {
  final Size size;
  const SaveItemHeader({required this.size, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: 50,
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'Saved Items',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(right: 16), child: Text('More')),
          )
        ],
      ),
    );
  }
}
