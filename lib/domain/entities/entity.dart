import 'package:flutter/material.dart';

@immutable
abstract class Entity {
  const Entity();
}

abstract class ParamEntity extends Entity {
  const ParamEntity();
}

abstract class ResponseEntity extends Entity {
  const ResponseEntity();
}
