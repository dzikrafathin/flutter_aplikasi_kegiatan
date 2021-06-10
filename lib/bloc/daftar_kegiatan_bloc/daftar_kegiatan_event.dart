part of 'daftar_kegiatan_bloc.dart';

abstract class DaftarKegiatanEvent extends Equatable {
  const DaftarKegiatanEvent();
  List<Object> get props => [];
}

class KegiatanDitambahkan extends DaftarKegiatanEvent {
  final Kegiatan kegiatanBaru;

  const KegiatanDitambahkan(this.kegiatanBaru);
  List<Object> get props => [kegiatanBaru];
}

class KegiatanDihapus extends DaftarKegiatanEvent {
  final Kegiatan kegiatanDihapus;

  const KegiatanDihapus(this.kegiatanDihapus);
  List<Object> get props => [kegiatanDihapus];
}

class KegiatanDiperbarui extends DaftarKegiatanEvent {
  final Kegiatan kegiatanDiperbarui;
  const KegiatanDiperbarui(this.kegiatanDiperbarui);
  List<Object> get props => [kegiatanDiperbarui];
}

class UbahStatusKegiatan extends DaftarKegiatanEvent {
  final String idKegiatan;
  final KegiatanStatus statusBaru;

  const UbahStatusKegiatan(this.idKegiatan, this.statusBaru);
  List<Object> get props => [idKegiatan, statusBaru];
}
