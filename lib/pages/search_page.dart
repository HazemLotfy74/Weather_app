import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/Cubit/weather_cubit.dart';


class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onChanged: (data)
            {
            },
            onSubmitted: (data) async {
              BlocProvider.of<WeatherCubit>(context).getWeather(cityName: data);
              BlocProvider.of<WeatherCubit>(context).cityName=data;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              label: const Text('search'),
              suffixIcon: GestureDetector(

                child: const Icon(Icons.search)),
              border: const OutlineInputBorder(),
              hintText: 'Enter a city',
            ),
          ),
        ),
      ),
    );
  }
}

