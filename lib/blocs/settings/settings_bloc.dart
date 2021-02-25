import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc()
      : super(SettingsState(temperatureUnits: TemperatureUnits.celsius));

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is TempratureUnitToggled) {
      yield SettingsState(
          temperatureUnits: (state.temperatureUnits == TemperatureUnits.celsius)
              ? TemperatureUnits.farenheit
              : TemperatureUnits.celsius);
    }
  }
}
