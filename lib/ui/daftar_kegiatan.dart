import 'package:app_kegiatan_harian/model/kegiatan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/bloc.dart';
import 'ui.dart';

class DaftarKegiatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Kegiatan'),
      ),
      body: BlocBuilder<DaftarKegiatanBloc, DaftarKegiatanState>(
        builder: (context, state) {
          if (state.daftarKegiatan.length > 0) {
            return _DaftarKegiatan(state: state);
          } else {
            return Center(child: Text('Belum ada kegiatan yang dibuat'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<DetailKegiatanBloc>(context).add(BuatKegiatanEvent());
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailKegiatan()));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _DaftarKegiatan extends StatelessWidget {
  final DaftarKegiatanState state;
  const _DaftarKegiatan({
    required this.state,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: state.daftarKegiatan.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              BlocProvider.of<DetailKegiatanBloc>(context)
                  .add(UbahKegiatanEvent(state.daftarKegiatan[index]));
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DetailKegiatan()));
            },
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                BlocProvider.of<DaftarKegiatanBloc>(context)
                    .add(KegiatanDihapus(state.daftarKegiatan[index]));
              },
            ),
            leading: Checkbox(
              onChanged: (value) {
                if (value ?? false) {
                  BlocProvider.of<DaftarKegiatanBloc>(context).add(
                      UbahStatusKegiatan(state.daftarKegiatan[index].id,
                          KegiatanStatus.selesai));
                } else {
                  BlocProvider.of<DaftarKegiatanBloc>(context).add(
                      UbahStatusKegiatan(state.daftarKegiatan[index].id,
                          KegiatanStatus.belum));
                }
              },
              value:
                  state.daftarKegiatan[index].status == KegiatanStatus.selesai,
            ),
            title: Text(state.daftarKegiatan[index].judul),
            subtitle: Text(state.daftarKegiatan[index].deskripsi),
          );
        });
  }
}
