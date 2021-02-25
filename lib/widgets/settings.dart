import 'package:bloc_test/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: <Widget>[
          BlocBuilder<SettingsBloc, SettingsState>(
            builder: (context, state) {
              return ListTile(
                title: Text('Temperature Units'),
                isThreeLine: true,
                subtitle:
                    Text('Use metric measurements for temperature units.'),
                trailing: Switch(
                  value: state.temperatureUnits == TemperatureUnits.celsius,
                  onChanged: (e) => BlocProvider.of<SettingsBloc>(context)
                      .add(TempratureUnitToggled()),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
