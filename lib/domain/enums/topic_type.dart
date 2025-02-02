enum TopicType {
  toggle(1),
  number(2),
  note(3);

  final int value;
  const TopicType(this.value);

  static TopicType fromValue(int value) {
    return TopicType.values.firstWhere((element) => element.value == value);
  }
}
