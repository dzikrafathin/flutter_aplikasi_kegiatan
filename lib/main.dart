import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc.dart';
import 'ui/ui.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<DetailKegiatanBloc>(
              create: (context) => DetailKegiatanBloc()),
          BlocProvider<DaftarKegiatanBloc>(
              create: (context) => DaftarKegiatanBloc(
                  detailKegiatanBloc:
                      BlocProvider.of<DetailKegiatanBloc>(context)))
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: DaftarKegiatan(),
        ));
  }
}

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MultiBlocProvider(
//         providers: [
//           BlocProvider<DetailKegiatanBloc>(
//               create: (context) => DetailKegiatanBloc()),
//           BlocProvider<DaftarKegiatanBloc>(
//               create: (context) => DaftarKegiatanBloc(
//                   detailKegiatanBloc:
//                       BlocProvider.of<DetailKegiatanBloc>(context)))
//         ],
//         child: DaftarKegiatan(),
//       ),
//     );
//   }
// }
