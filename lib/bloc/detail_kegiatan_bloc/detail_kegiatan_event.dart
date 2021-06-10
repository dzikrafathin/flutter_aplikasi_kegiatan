part of 'detail_kegiatan_bloc.dart';

abstract class DetailKegiatanEvent extends Equatable {
  const DetailKegiatanEvent();
  List<Object> get props => [];
}

class JudulBerubah extends DetailKegiatanEvent {
  final String judul;
  const JudulBerubah(this.judul);
  List<Object> get props => [judul];
}

class DeskripsiBerubah extends DetailKegiatanEvent {
  final String deskripsi;
  const DeskripsiBerubah(this.deskripsi);
  List<Object> get props => [deskripsi];
}

class UbahKegiatanEvent extends DetailKegiatanEvent {
  final Kegiatan kegiatan;
  const UbahKegiatanEvent(this.kegiatan);
  List<Object> get props => [kegiatan];
}

class BuatKegiatanEvent extends DetailKegiatanEvent {}

class SimpanKegiatan extends DetailKegiatanEvent {}
