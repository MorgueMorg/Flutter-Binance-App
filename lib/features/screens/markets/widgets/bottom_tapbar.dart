import 'package:flutter/material.dart';

class BottomTapBar extends StatelessWidget {
  const BottomTapBar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.fromLTRB(6.0, 8.0, 6.0, 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              'Name / Vol',
              style: TextStyle(
                fontSize: size.width / 26.0,
                color: Colors.grey.shade400,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Last Price',
                  style: TextStyle(
                    fontSize: size.width / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.keyboard_double_arrow_up_sharp,
                  color: Colors.grey.shade400,
                  size: size.width / 26.0,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  '24h Change',
                  style: TextStyle(
                    fontSize: size.width / 30.0,
                    color: Colors.grey.shade400,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  width: 4.0,
                ),
                Icon(
                  Icons.keyboard_double_arrow_down_sharp,
                  color: Colors.grey.shade400,
                  size: size.width / 26.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
