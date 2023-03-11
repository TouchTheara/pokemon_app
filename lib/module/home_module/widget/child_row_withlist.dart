import 'package:flutter/material.dart';

Widget buildChildRowWithList({String? key, List? valueList, TextStyle? style}) {
  return valueList!.isNotEmpty && valueList != []
      ? Container(
          padding: const EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              Text("$key: ",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15)),
              const SizedBox(
                width: 10,
              ),
              ...valueList
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(right: 8),
                      child: Text(
                        e,
                        style:
                            style ?? TextStyle(color: Colors.blueGrey.shade400),
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
        )
      : Container();
}
