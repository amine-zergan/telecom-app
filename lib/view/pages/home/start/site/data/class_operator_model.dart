// ignore_for_file: public_member_api_docs, sort_constructors_first
class OperatorEntity {
  final String name;
  final String image;
  OperatorEntity({
    required this.name,
    required this.image,
  });
}

List<OperatorEntity> dataOperator = [
  OperatorEntity(name: "Ooredoo", image: "assets/project/ooredoo.png"),
  OperatorEntity(name: "Orange", image: "assets/project/orange.png"),
  OperatorEntity(name: "Telecom", image: "assets/project/telecom.png"),
];
