import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_kegiatan_harian/model/model.dart';
import '../bloc.dart';

part 'daftar_kegiatan_event.dart';
part 'daftar_kegiatan_state.dart';

class DaftarKegiatanBloc
    extends Bloc<DaftarKegiatanEvent, DaftarKegiatanState> {
  final DetailKegiatanBloc detailKegiatanBloc;
  late StreamSubscription detailKegiatanSub;

  DaftarKegiatanBloc({required this.detailKegiatanBloc})
      : super(const DaftarKegiatanState()) {
    detailKegiatanSub = detailKegiatanBloc.stream.listen((state) {
      if (state.status == DetailKegiatanStatus.berhasil) {
        if (state is BuatKegiatanBaru) {
          add(KegiatanDitambahkan(state.kegiatanBaru));
        } else if (state is UbahKegiatan) {
          add(KegiatanDiperbarui(state.kegiatan));
        }
      }
    });
  }

  DaftarKegiatanState _mapKegiatanDitambahkanToState(
      KegiatanDitambahkan event, DaftarKegiatanState state) {
    List<Kegiatan> daftarKegiatan = List.from(state.daftarKegiatan);
    daftarKegiatan.add(event.kegiatanBaru);
    return DaftarKegiatanState.berisi(daftarKegiatan);
  }

  DaftarKegiatanState _mapKegiatanDiperbaruiToState(
      KegiatanDiperbarui event, DaftarKegiatanState state) {
    List<Kegiatan> daftarKegiatan = List.from(state.daftarKegiatan);

    int index = daftarKegiatan.indexOf(daftarKegiatan
        .firstWhere((kegiatan) => kegiatan.id == event.kegiatanDiperbarui.id));
    daftarKegiatan[index] = event.kegiatanDiperbarui;

    return DaftarKegiatanState.berisi(daftarKegiatan);
  }

  DaftarKegiatanState _mapKegiatanDihapusToState(
      KegiatanDihapus event, DaftarKegiatanState state) {
    List<Kegiatan> daftarKegiatan = List.from(state.daftarKegiatan);

    daftarKegiatan.remove(event.kegiatanDihapus);
    return DaftarKegiatanState.berisi(daftarKegiatan);
  }

  DaftarKegiatanState _mapUbahStatusKegiatanToState(
      UbahStatusKegiatan event, DaftarKegiatanState state) {
    List<Kegiatan> daftarKegiatan = List.from(state.daftarKegiatan);

    int index = daftarKegiatan.indexOf(daftarKegiatan
        .firstWhere((kegiatan) => kegiatan.id == event.idKegiatan));
    daftarKegiatan[index] =
        daftarKegiatan[index].copyWith(status: event.statusBaru);
    return DaftarKegiatanState.berisi(daftarKegiatan);
  }

  @override
  Stream<DaftarKegiatanState> mapEventToState(
      DaftarKegiatanEvent event) async* {
    if (event is KegiatanDitambahkan) {
      yield _mapKegiatanDitambahkanToState(event, state);
    } else if (event is KegiatanDiperbarui) {
      yield _mapKegiatanDiperbaruiToState(event, state);
    } else if (event is KegiatanDihapus) {
      yield _mapKegiatanDihapusToState(event, state);
    } else if (event is UbahStatusKegiatan) {
      yield _mapUbahStatusKegiatanToState(event, state);
    }
  }

  @override
  Future<void> close() {
    detailKegiatanSub.cancel();
    return super.close();
  }
}
