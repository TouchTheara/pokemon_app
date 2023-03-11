import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../model/home_model.dart';

class CardPokemon extends StatefulWidget {
  const CardPokemon({Key? key, this.listHome}) : super(key: key);
  final List<HomeModel>? listHome;

  @override
  State<CardPokemon> createState() => _CardPokemonState();
}

class _CardPokemonState extends State<CardPokemon> {
  String id = '';
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.listHome!.length,
      itemBuilder: (context, index) {
        final value = widget.listHome![index];
        return InkWell(
          onTap: () {
            context.push('/detail', extra: value);
          },
          child: Container(
            color: Colors.grey.shade100,
            margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              margin: const EdgeInsets.all(2.0),
              padding: const EdgeInsets.all(15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(
                    imageUrl: "${value.imageurl}",
                    height: 65,
                    width: 65,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${value.name}",
                        style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(TextSpan(children: [
                        const TextSpan(
                          text: "ID: ",
                        ),
                        TextSpan(
                            text: "${value.id}",
                            style: TextStyle(color: Colors.blue.shade400))
                      ])),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          ...value.typeofpokemon!
                              .map(
                                (e) => Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Container(
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: Colors.blue.shade400),
                                      child: Text(
                                        e,
                                        style: const TextStyle(
                                            color: Colors.white),
                                      )),
                                ),
                              )
                              .toList()
                        ],
                      )
                    ],
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      setState(() {
                        value.fav = !value.fav;
                      });
                      debugPrint("==============+>>$id");
                    },
                    child: value.fav
                        ? const Icon(
                            Icons.favorite,
                            color: Colors.redAccent,
                          )
                        : Icon(
                            Icons.favorite,
                            color: Colors.grey.shade400,
                          ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
