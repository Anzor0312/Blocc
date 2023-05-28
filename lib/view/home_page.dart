import 'package:blocc/cubit/home_states.dart';
import 'package:blocc/service/local/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text("Users App"),
            ),
            body: Builder(builder: (context) {
              if (state is HomeLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is HomeErrorState) {
                return Center(
                  child: Text(state.error),
                );
              } else if (state is HomeCompleteState) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(state.users[index].name.toString()),
                    );
                  },
                  itemCount: state.users.length,
                );
              } else {
                return const SizedBox();
              }
            }),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                await AuthService.login();
              },
            ),
          );
        },
      ),
    );
  }
}
