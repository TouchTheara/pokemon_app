import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/module/home_module/widget/card_pokemon.dart';

import '../../blocs/home/home_bloc.dart';
import '../../blocs/home/home_event.dart';
import '../../blocs/home/home_state.dart';
import '../home_module/screen/home_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc newsBloc = HomeBloc();
    newsBloc.add(GetHomeList());

    final textController = TextEditingController();
    String initValue = '';
    return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.grey.shade100,
          title: const Text(
            "Search",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            AnimSearchBar(
                rtl: true,
                onSubmitted: (value) {
                  textController.text = value;
                },
                width: 400,
                textController: textController,
                onSuffixTap: () {
                  textController.clear();
                }),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: Container(
              margin: const EdgeInsets.all(8.0),
              child: BlocProvider(
                create: (_) => newsBloc,
                child: BlocListener<HomeBloc, HomeState>(
                  listener: (context, state) {
                    if (state is HomeError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message!),
                        ),
                      );
                    }
                  },
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeInitial || state is HomeLoading) {
                        return buildLoading();
                      } else if (state is HomeLoaded) {
                        return CardPokemon(
                          listHome: state.listHome,
                        );
                      } else if (state is HomeError) {
                        return Container();
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}

_buildEmptyState() {
  return const Center(child: Center(child: Text("Search Plz....")));
}
