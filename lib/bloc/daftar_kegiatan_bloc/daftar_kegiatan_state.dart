part of 'daftar_kegiatan_bloc.dart';

class DaftarKegiatanState extends Equatable {
  final List<Kegiatan> daftarKegiatan;

  const DaftarKegiatanState._(
      {this.daftarKegiatan = const [
        Kegiatan(
            id: 'A',
            judul: 'Sudah Dilakukan',
            deskripsi: 'Dah dilakukan',
            status: KegiatanStatus.selesai),
        Kegiatan(
            id: 'B',
            judul: 'Otw Dikerjain',
            deskripsi: 'Tubes, Tugas, Haha',
            status: KegiatanStatus.belum)
      ]});

  const DaftarKegiatanState() : this._();

  const DaftarKegiatanState.berisi(List<Kegiatan> daftarKegiatan)
      : this._(daftarKegiatan: daftarKegiatan);

  List<Object> get props => [daftarKegiatan];
}
