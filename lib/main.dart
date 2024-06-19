import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:signed/listview/UserRepository.dart';
import 'package:signed/view/SplashScreen.dart';
import 'CounterProvider.dart';
import 'Login/ApiService.dart';
import 'Login/LoginRepository.dart';
import 'Login/LoginViewModel.dart';
import 'PreferenceUtils/PreferenceUtils.dart';
import 'Programs.dart';
import 'listview/UserViewModel.dart';

void main() async  {

  final Dio dio = Dio();
  // Create ApiService instance with the Dio instance
  final ApiService apiService = ApiService(dio: dio);

  // Create LoginRepository instance with the ApiService instance
  final LoginRepository loginRepository = LoginRepository(apiService: apiService);
  final UserRepository userrepository = UserRepository(apiService: apiService);
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceUtils.init();
  runApp(
    // Step 2: Wrap your app with MultiProvider
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider<LoginViewModel>(create: (context) => LoginViewModel(userRepository: loginRepository),),
        ChangeNotifierProvider<UserViewModel>(create: (context) => UserViewModel(userRepository: userrepository)),

      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     // home: Programs(),
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
  /*    initialRoute: getInitialPage(),
      onGenerateRoute: RouteGenerator.generateRoute,*/
    );
  }
 // String getInitialPage() => AppRoutes.login;
}
