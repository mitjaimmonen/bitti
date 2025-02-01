import 'package:bitti/data/data_sources/data_source.dart';
import 'package:bitti/data/models/param/journal_create_param_model.dart';
import 'package:bitti/data/models/param/journal_delete_param_model.dart';
import 'package:bitti/data/models/param/journal_update_param_model.dart';
import 'package:bitti/data/models/param/journals_read_param_model.dart';
import 'package:bitti/data/models/response/journal_response_model.dart';
import 'package:bitti/data/models/response/journals_response_model.dart';

abstract class JournalDataSource extends DataSource {
  Future<JournalResponseModel> create(JournalCreateParamModel params);
  Future<JournalsResponseModel> readAll(JournalsReadParamModel params);
  Future<JournalResponseModel> update(JournalUpdateParamModel params);
  Future<JournalResponseModel> delete(JournalDeleteParamModel params);
}
