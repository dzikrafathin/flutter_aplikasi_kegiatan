import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:app_kegiatan_harian/model/model.dart';
import 'package:uuid/uuid.dart';

part 'detail_kegiatan_event.dart';
part 'detail_kegiatan_state.dart';

class DetailKegiatanBloc
    extends Bloc<DetailKegiatanEvent, DetailKegiatanState> {
  DetailKegiatanBloc() : super(BuatKegiatanBaru());

  DetailKegiatanState _mapJudulBerubahToState(
      JudulBerubah event, DetailKegiatanState state) {
    if (state is BuatKegiatanBaru) {
      return state.copyWith(
          kegiatanBaru: state.kegiatanBaru.copyWith(judul: event.judul));
    } else if (state is UbahKegiatan) {
      return state.copyWith(
          kegiatan: state.kegiatan.copyWith(judul: event.judul));
    }
    throw Exception();
  }

  DetailKegiatanState _mapDeskripsiBerubahToState(
      DeskripsiBerubah event, DetailKegiatanState state) {
    if (state is BuatKegiatanBaru) {
      return state.copyWith(
          kegiatanBaru:
              state.kegiatanBaru.copyWith(deskripsi: event.deskripsi));
    } else if (state is UbahKegiatan) {
      return state.copyWith(
          kegiatan: state.kegiatan.copyWith(deskripsi: event.deskripsi));
    }
    throw Exception();
  }

  DetailKegiatanState _mapSimpanKegiatanToState(
      SimpanKegiatan event, DetailKegiatanState state) {
    if (state is BuatKegiatanBaru) {
      return state.copyWith(status: DetailKegiatanStatus.berhasil);
    } else if (state is UbahKegiatan) {
      return state.copyWith(status: DetailKegiatanStatus.berhasil);
    }
    throw Exception();
  }

  @override
  Stream<DetailKegiatanState> mapEventToState(
      DetailKegiatanEvent event) async* {
    if (event is JudulBerubah) {
      yield _mapJudulBerubahToState(event, state);
    } else if (event is DeskripsiBerubah) {
      yield _mapDeskripsiBerubahToState(event, state);
    } else if (event is SimpanKegiatan) {
      yield _mapSimpanKegiatanToState(event, state);
    } else if (event is BuatKegiatanEvent) {
      final id = Uuid().v1();
      yield BuatKegiatanBaru(kegiatanBaru: Kegiatan(id: id));
    } else if (event is UbahKegiatanEvent) {
      yield UbahKegiatan(kegiatan: event.kegiatan);
    }
  }
}
