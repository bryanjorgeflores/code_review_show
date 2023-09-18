import 'package:domain/di/locator.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:presentation/styles/theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:presentation/routes/routes.dart';
import 'package:presentation/containers/commons/messages/bloc/message_bloc.dart';
import 'package:presentation/containers/commons/env/bloc/env_bloc.dart';
import 'package:presentation/containers/main/bloc/main_bloc.dart';

class AppPage extends StatefulWidget {
  final Map<String, String> env;
  const AppPage({Key? key, required this.env}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late EnvBloc envBloc;

  @override
  void initState() {
    super.initState();
    envBloc = EnvBloc()..add(SetEnvEvent(env: widget.env));
  }

  List<BlocProvider> providers(BuildContext mainContext) {
    return [
      BlocProvider<EnvBloc>(create: (BuildContext context) => envBloc),
      BlocProvider<MessageBloc>(
          create: (BuildContext context) => MessageBloc()),
      BlocProvider<MainBloc>(
          create: (BuildContext context) =>
              MainBloc(mainRepository: getIt<MainRepository>())),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: providers(context),
      child: BlocListener<MessageBloc, MessageState>(
        listener: (context, state) {
          if (state is MessageError) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: red,
                textColor: white,
                fontSize: 16.0);
          }
          if (state is MessageSuccess) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: green,
                textColor: white,
                fontSize: 16.0);
          }
          if (state is MessageWarning) {
            Fluttertoast.showToast(
                msg: state.message,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: orange,
                textColor: white,
                fontSize: 16.0);
          }
        },
        child: MaterialApp(
          title: 'Code Review Show',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          darkTheme: ThemeData.dark(useMaterial3: true),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: const [
            Locale('es', ''),
          ],
          routes: Routes.generateRoutes(),
          initialRoute: Routes.main,
          onUnknownRoute: Routes.generateNotFoundRoute(),
        ),
      ),
    );
  }
}
