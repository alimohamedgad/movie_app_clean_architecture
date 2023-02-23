import '../../Domain/Entities/recomndtion.dart';

class RecomindtionModel extends Recommendation {
  const RecomindtionModel({
    required super.id,
     super.backDropPath,
  });

  factory RecomindtionModel.fromJson(Map<String, dynamic> json) {
    return RecomindtionModel(
      id: json['id'],
      backDropPath: json['backdrop_path'] ?? '/8sMmAmN2x7mBiNKEX2o0aOTozEB.jpg',
    );
  }
}
