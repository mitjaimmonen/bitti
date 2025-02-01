import 'package:bitti/data/data_sources/interfaces/journal_data_source.dart';
import 'package:bitti/data/models/param/journal_create_param_model.dart';
import 'package:bitti/data/models/param/journal_delete_param_model.dart';
import 'package:bitti/data/models/param/journal_update_param_model.dart';
import 'package:bitti/data/models/param/journals_read_param_model.dart';
import 'package:bitti/data/models/response/journal_response_model.dart';
import 'package:bitti/data/models/response/journals_response_model.dart';

class MockJournalDataSource extends JournalDataSource {
  @override
  Future<JournalResponseModel> create(JournalCreateParamModel params) {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<JournalResponseModel> delete(JournalDeleteParamModel params) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<JournalsResponseModel> readAll(JournalsReadParamModel params) {
    // TODO: implement readAll
    throw UnimplementedError();
  }

  @override
  Future<JournalResponseModel> update(JournalUpdateParamModel params) {
    // TODO: implement update
    throw UnimplementedError();
  }
}
