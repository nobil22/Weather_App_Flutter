import 'package:bloc/bloc.dart';

import 'package:weather_app/cubit/weather_cubit/weather_state.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherService) : super(WeatherInitial());
  WeatherService weatherService;
  WeatherModel? weathermodel;
  String? cityName;

  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weathermodel = await weatherService.getWeather(cityName: cityName);
      emit(WeatherSuccess(weatherModel:weathermodel!));
    } catch (e) {
      emit(WeatherFailer());
    }
  }
}
