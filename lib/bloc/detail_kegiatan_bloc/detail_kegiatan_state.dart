part of 'detail_kegiatan_bloc.dart';

enum DetailKegiatanStatus { mengisi, berhasil }

abstract class DetailKegiatanState extends Equatable {
  final DetailKegiatanStatus status;

  const DetailKegiatanState({this.status = DetailKegiatanStatus.mengisi});

  List<Object> get props => [status];
}

class BuatKegiatanBaru extends DetailKegiatanState {
  final Kegiatan kegiatanBaru;

  const BuatKegiatanBaru(
      {this.kegiatanBaru = const Kegiatan(),
      DetailKegiatanStatus status = DetailKegiatanStatus.mengisi})
      : super(status: status);

  BuatKegiatanBaru copyWith(
      {DetailKegiatanStatus? status, Kegiatan? kegiatanBaru}) {
    return BuatKegiatanBaru(
        status: status ?? this.status,
        kegiatanBaru: kegiatanBaru ?? this.kegiatanBaru);
  }

  List<Object> get props => [kegiatanBaru, status];
}

class UbahKegiatan extends DetailKegiatanState {
  final Kegiatan kegiatan;
  const UbahKegiatan(
      {this.kegiatan = const Kegiatan(),
      DetailKegiatanStatus status = DetailKegiatanStatus.mengisi})
      : super(status: status);

  UbahKegiatan copyWith({DetailKegiatanStatus? status, Kegiatan? kegiatan}) {
    return UbahKegiatan(
        status: status ?? this.status, kegiatan: kegiatan ?? this.kegiatan);
  }

  List<Object> get props => [kegiatan, status];
}
