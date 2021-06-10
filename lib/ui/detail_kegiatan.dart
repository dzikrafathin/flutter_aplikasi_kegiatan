import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/bloc.dart';
import '../model/model.dart';

class DetailKegiatan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<DetailKegiatanBloc>(context).add(SimpanKegiatan());
          Navigator.pop(context);
        },
        child: Icon(Icons.check),
      ),
      body: BlocBuilder<DetailKegiatanBloc, DetailKegiatanState>(
        bloc: BlocProvider.of<DetailKegiatanBloc>(context),
        builder: (context, state) {
          if (state is BuatKegiatanBaru) {
            return _FormDetailKegiatanBaru(kegiatan: state.kegiatanBaru);
          } else if (state is UbahKegiatan) {
            return _FormDetailKegiatanBaru(kegiatan: state.kegiatan);
          } else {
            return Center(
              child: Text('Entah terjadi kenapa sama ni aplikasi'),
            );
          }
        },
      ),
      appBar: AppBar(
        title: BlocBuilder<DetailKegiatanBloc, DetailKegiatanState>(
          bloc: BlocProvider.of<DetailKegiatanBloc>(context),
          builder: (context, state) {
            if (state is BuatKegiatanBaru) {
              return Text('Buat Kegiatan Baru');
            } else if (state is UbahKegiatan) {
              return Text('Ubah Detail Kegiatan');
            } else {
              return Text('Waduh!');
            }
          },
        ),
      ),
    );
  }
}

class _FormDetailKegiatanBaru extends StatelessWidget {
  final Kegiatan kegiatan;

  const _FormDetailKegiatanBaru({
    required this.kegiatan,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(10.0),
      children: [
        TextFormField(
          onChanged: (judul) {
            BlocProvider.of<DetailKegiatanBloc>(context)
                .add(JudulBerubah(judul));
          },
          initialValue: kegiatan.judul,
          decoration: InputDecoration(labelText: 'Judul Kegiatan'),
        ),
        TextFormField(
          onChanged: (deskripsi) {
            BlocProvider.of<DetailKegiatanBloc>(context)
                .add(DeskripsiBerubah(deskripsi));
          },
          initialValue: kegiatan.deskripsi,
          maxLines: 5,
          decoration: InputDecoration(labelText: 'Deskripsi Kegiatan'),
        )
      ],
    );
  }
}
