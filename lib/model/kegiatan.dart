import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

enum KegiatanStatus { belum, selesai }

class Kegiatan extends Equatable {
  final String id;
  final String judul;
  final String deskripsi;
  final KegiatanStatus status;

  const Kegiatan(
      {this.judul = '',
      this.deskripsi = '',
      this.status = KegiatanStatus.belum,
      this.id = ''});

  Kegiatan copyWith({
    String? id,
    String? judul,
    String? deskripsi,
    KegiatanStatus? status,
  }) {
    return Kegiatan(
        id: id ?? this.id,
        judul: judul ?? this.judul,
        deskripsi: deskripsi ?? this.deskripsi,
        status: status ?? this.status);
  }

  List<Object> get props => [id, judul, deskripsi, status];
}
