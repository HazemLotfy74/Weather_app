import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';
part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  String? cityName;

  void getWeather({required String cityName})async{
    emit(WeatherLoading());
    try{
     weatherModel =await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel: weatherModel!));
    }
    on Exception {
      emit(WeatherFailure());
    }
  }
}
