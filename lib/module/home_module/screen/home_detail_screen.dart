import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pokemon_app/module/home_module/model/home_model.dart';
import 'package:pokemon_app/module/home_module/widget/child_row_withlist.dart';

import '../widget/child_row.dart';

class HomeDetailScreen extends StatelessWidget {
  const HomeDetailScreen({Key? key, required this.homeModel}) : super(key: key);
  final HomeModel homeModel;

  @override
  Widget build(BuildContext context) {
    final controller = ScrollController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: CustomScrollView(
        controller: controller,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.grey.shade100,
            leading: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: () {
                  Navigator.pop(context);
                },
                child: Platform.isIOS
                    ? Container(
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400.withOpacity(0.6),
                            shape: BoxShape.circle),
                        child: const Padding(
                          padding: EdgeInsets.only(left: 6),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 22,
                          ),
                        ))
                    : Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade400.withOpacity(0.6),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 22,
                        )),
              ),
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {},
                  child: Container(
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade400.withOpacity(0.6),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.more_vert,
                        size: 22,
                      )),
                ),
              )
            ],
            pinned: false,
            snap: false,
            floating: true,
            expandedHeight: height * 0.24,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(''),
              background: Image.network(
                homeModel.imageurl != '' && homeModel.imageurl != null
                    ? "${homeModel.imageurl}"
                    : 'https://upload.wikimedia.org/wikipedia/commons/b/b9/No_Cover.jpg',
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${homeModel.name}",
                        style: TextStyle(
                            color: Colors.blue.shade400,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        margin: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "${homeModel.category}",
                          style: TextStyle(
                              color: Colors.blue.shade400,
                              fontSize: 16,
                              fontWeight: FontWeight.normal),
                        ),
                      ),
                    ],
                  ),
                  buildChildRow(key: 'Height', value: '${homeModel.height}'),
                  buildChildRow(key: 'Weight', value: "${homeModel.weight}"),
                  buildChildRow(key: 'HP', value: "${homeModel.hp}"),
                  buildChildRow(key: 'Speed', value: "${homeModel.speed}"),
                  buildChildRow(key: 'Attack', value: "${homeModel.attack}"),
                  buildChildRow(key: 'Defense', value: "${homeModel.defense}"),
                  buildChildRow(
                      key: 'Special Attack',
                      value: "${homeModel.specialAttack}"),
                  buildChildRow(
                      key: 'Special Defense',
                      value: "${homeModel.specialDefense}"),
                  buildChildRow(
                      key: 'Male Percentage',
                      value: "${homeModel.malePercentage}"),
                  buildChildRow(
                      key: 'Female Percentage',
                      value: "${homeModel.femalePercentage}"),
                  buildChildRow(
                      key: 'Egg Groups', value: "${homeModel.eggGroups}"),
                  buildChildRow(
                      key: 'Evolved From', value: "${homeModel.evolvedfrom}"),
                  buildChildRow(key: 'Base Exp', value: "${homeModel.baseExp}"),
                  buildChildRow(
                      key: 'Total',
                      value: "${homeModel.total}",
                      style: const TextStyle(color: Colors.red)),
                  buildChildRowWithList(
                      key: 'Abilities',
                      valueList: homeModel.abilities,
                      style: const TextStyle(color: Colors.red)),
                  buildChildRowWithList(
                    key: 'Weaknesses',
                    valueList: homeModel.weaknesses,
                  ),
                  buildChildRowWithList(
                    key: 'Evolutions',
                    valueList: homeModel.evolutions,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Row(
                      children: [
                        const Text("Type: ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        const SizedBox(
                          width: 10,
                        ),
                        ...homeModel.typeofpokemon!
                            .map(
                              (e) => Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Colors.blue.shade300),
                                    child: Text(
                                      e,
                                      style:
                                          const TextStyle(color: Colors.white),
                                    )),
                              ),
                            )
                            .toList()
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text.rich(
                      TextSpan(
                        children: [
                          const TextSpan(
                              text: "Discription: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          TextSpan(
                              text: "${homeModel.xdescription}",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
