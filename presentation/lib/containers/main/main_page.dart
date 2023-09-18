import 'package:domain/domain.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/containers/commons/env/bloc/env_bloc.dart';
import 'package:presentation/containers/commons/messages/bloc/message_bloc.dart';
import 'package:presentation/containers/main/bloc/main_bloc.dart';
import 'package:presentation/containers/main/widgets/products_grid.dart';
import 'package:presentation/routes/routes.dart';
import 'package:presentation/styles/theme.dart';
import 'package:presentation/widgets/text.dart';
import 'package:presentation/widgets/text_icon_button.dart';
import 'package:presentation/widgets/text_button.dart';
import 'package:presentation/widgets/toast.dart';

class MainPage extends StatefulWidget {
  final String? url;
  const MainPage({super.key, this.url});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late MainBloc _mainBloc;
  late MessageBloc _messageBloc;
  Map<String, String> env = {};

  @override
  void initState() {
    var envBloc = context.read<EnvBloc>();
    env = envBloc.state.env;
    _mainBloc = context.read<MainBloc>();
    _mainBloc.add(LoadProductsEvent());
    _messageBloc = context.read<MessageBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, MainState>(
      listener: (context, state) {
        if (state.hasError) {
          _messageBloc
              .add(ShowErrorMessageEvent((state.exception as dynamic).message));
        }
      },
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('CodeShow')),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  _mainBloc.add(LoadProductsEvent());
                },
                child: state.products == {}
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final category = state.products.keys.elementAt(index);
                          final products = state.products[category]!;

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: TextWidget(
                                  '${category?.name}',
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ProductsGrid(
                                products: products,
                              )
                            ],
                          );
                        },
                      ),
              ),
            ),
          );
        },
      ),
    );
  }
}
