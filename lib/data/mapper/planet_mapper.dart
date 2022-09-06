import '../../domain/models/planet.dart';

import '../models/response/planet_response.dart';

extension PlanetMapper on PlanetResponse {
  Planet toDomain() {
    return Planet(
      name: name,
      rotationPeriod: rotationPeriod,
    );
  }
}
