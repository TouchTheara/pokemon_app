import 'package:flutter/material.dart';

Widget buildChildRow({String? key, String? value, TextStyle? style}) {
  return value != ''
      ? Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                    text: "$key: ",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 15)),
                TextSpan(
                    text: "$value",
                    style: style ?? TextStyle(color: Colors.blue.shade400)),
              ],
            ),
            textAlign: TextAlign.justify,
          ),
        )
      : Container();
}
