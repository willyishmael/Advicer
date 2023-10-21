import 'package:advicer/app/pages/advice/cubit/advice_cubit.dart';
import 'package:advicer/data/remote/advicer_api.dart';
import 'package:advicer/data/repositories/advice_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class Injector {
  
  // sl = Service Locator
  final sl = GetIt.I;

  Future<void> init() async {
    sl.registerFactory(() => AdviceCubit(advicerRepository: sl()));
    sl.registerFactory<AdvicerRepositoryProtocol>(
        () => AdvicerRepository(advicerApi: sl()));
    sl.registerFactory<AdvicerAPIProtocol>(() => AdvicerAPI(client: sl()));
    sl.registerFactory(() => http.Client());
  }
}
