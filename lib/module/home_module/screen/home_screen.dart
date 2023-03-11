import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon_app/blocs/home/home_bloc.dart';
import 'package:pokemon_app/blocs/home/home_event.dart';
import 'package:pokemon_app/blocs/home/home_state.dart';

import '../widget/card_pokemon.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final HomeBloc newsBloc = HomeBloc();
    newsBloc.add(GetHomeList());
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Pokemon App',
          ),
          backgroundColor: Colors.blue.shade400),
      body: Container(
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
    );
  }
}

Widget buildLoading() => const Center(child: CircularProgressIndicator());
