import 'package:clean_app/core/config/observe.dart';
import 'package:clean_app/firebase_options.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'config_dependencies.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<GetIt> configDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  Bloc.observer = SimpleBlocObserver();
  await EasyLocalization.ensureInitialized();
  return getIt.init();
}
