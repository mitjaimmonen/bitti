abstract class DataSource {
  Future<void> open() async {}
  Future<void> close() async {}
}
