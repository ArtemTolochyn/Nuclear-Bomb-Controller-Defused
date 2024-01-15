import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nbc/controller/attackController.dart';
import 'package:nbc/mobile/widgets/attackList.dart';
import 'package:nbc/mobile/widgets/attackSelector.dart';
import 'package:nbc/mobile/widgets/attackWidget.dart';
import 'package:nbc/mobile/widgets/logo.dart';
import 'package:nbc/state/attackState.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController textEditingController = TextEditingController();

  AttackState attackState = AttackState(attackType: AttackType.boosted);

  late AttackController attackController;



  @override
  void initState() {
    attackController = AttackController(attackState: attackState);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color.fromRGBO(255, 239, 239, 1),
      systemNavigationBarDividerColor: Color.fromRGBO(255, 239, 239, 1),
    ));

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: AttackSelector(
                    attackState: attackState,
                  )
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Logo(),

                      AttackWidget(
                        attackController: attackController,
                        textEditingController: textEditingController,
                        update: () => {setState(() {})
                        },
                      )
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AttackList(attackController: attackController, )
                )
              ],
            ),
          )
        ),
      )
    );
  }
}