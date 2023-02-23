import '../modelErorr/movice_model_erorr.dart';

class ServiceExpaetion implements Exception {
  final ErrorMessgeMode errorMessgeModel;

  ServiceExpaetion({
    required this.errorMessgeModel,
  });
}


class LocalDataExpataion implements Exception {
}