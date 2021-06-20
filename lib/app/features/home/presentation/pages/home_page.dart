import 'package:flutter_clean_modular/app/features/home/presentation/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_clean_modular/app/features/home/presentation/cubit/home_cubit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit _cubit;

  @override
  void initState() {
    _cubit = Modular.get<HomeCubit>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _cubit,
      builder: (context, state) {
        return Scaffold(
          body: _buildFromState(state),
        );
      },
    );
  }

  Widget _buildFromState(HomeState state) {
    if (state is HomeLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is HomeSuccess) {
      return Center(
        child: Text('${state.message}!'),
      );
    } else {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Olá! '),
            TextButton(
              onPressed: () => _cubit.fetchData(),
              child: Text('Carregar'),
            )
          ],
        ),
      );
    }
  }
}
