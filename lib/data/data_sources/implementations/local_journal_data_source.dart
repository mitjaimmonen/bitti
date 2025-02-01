import 'dart:convert';

import 'package:bitti/data/data_sources/interfaces/journal_data_source.dart';
import 'package:bitti/data/models/general/journal_models/journal_entry_model.dart';
import 'package:bitti/data/models/param/journal_create_param_model.dart';
import 'package:bitti/data/models/param/journal_delete_param_model.dart';
import 'package:bitti/data/models/param/journal_update_param_model.dart';
import 'package:bitti/data/models/param/journals_read_param_model.dart';
import 'package:bitti/data/models/response/journal_response_model.dart';
import 'package:bitti/data/models/response/journals_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:localstorage/localstorage.dart';

class LocalJournalDataSource extends JournalDataSource {
  @override
  Future<void> open() async {
    await initLocalStorage();
  }

  @override
  Future<JournalResponseModel> create(JournalCreateParamModel params) async {
    try {
      final journalsString = localStorage.getItem('journals${params.topicId}');
      final List<JournalEntryModel> journalsData;

      if (journalsString != null) {
        final jsonList = jsonDecode(journalsString) as List;
        journalsData =
            jsonList.map((e) => JournalEntryModel.fromJson(e)).toList();
      } else {
        throw Exception('No journals found');
      }

      journalsData.add(params.journal);
      final json = journalsData.map((e) => e.toJson()).toList();
      localStorage.setItem('journals', jsonEncode(json));

      return JournalResponseModel(journal: params.journal);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to create journal');
    }
  }

  @override
  Future<JournalResponseModel> delete(JournalDeleteParamModel params) async {
    try {
      final journalsString = localStorage.getItem('journals${params.topicId}');
      final List<JournalEntryModel> journalsData;

      if (journalsString != null) {
        final jsonList = jsonDecode(journalsString) as List;
        journalsData =
            jsonList.map((e) => JournalEntryModel.fromJson(e)).toList();
      } else {
        throw Exception('No journals found');
      }

      final journalIndex =
          journalsData.indexWhere((journal) => journal.id == params.journalId);

      if (journalIndex == -1) {
        throw Exception('Journal not found');
      }

      final journal = journalsData.removeAt(journalIndex);
      final json = journalsData.map((e) => e.toJson()).toList();
      localStorage.setItem('journals', jsonEncode(json));

      return JournalResponseModel(journal: journal);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to delete journal');
    }
  }

  @override
  Future<JournalsResponseModel> readAll(JournalsReadParamModel params) async {
    try {
      final journalsString = localStorage.getItem('journals${params.topicId}');
      final List<JournalEntryModel> journalsData;

      if (journalsString != null) {
        final jsonList = jsonDecode(journalsString) as List;
        journalsData =
            jsonList.map((e) => JournalEntryModel.fromJson(e)).toList();
      } else {
        throw Exception('No journals found');
      }

      return JournalsResponseModel(journals: journalsData);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to read journals');
    }
  }

  @override
  Future<JournalResponseModel> update(JournalUpdateParamModel params) async {
    try {
      final journalsString = localStorage.getItem('journals${params.topicId}');
      final List<JournalEntryModel> journalsData;

      if (journalsString != null) {
        final jsonList = jsonDecode(journalsString) as List;
        journalsData =
            jsonList.map((e) => JournalEntryModel.fromJson(e)).toList();
      } else {
        throw Exception('No journals found');
      }

      final journalIndex = journalsData
          .indexWhere((journal) => journal.id == params.journalEntry.id);

      if (journalIndex == -1) {
        throw Exception('Journal not found');
      }

      journalsData[journalIndex] = params.journalEntry;
      final json = journalsData.map((e) => e.toJson()).toList();
      localStorage.setItem('journals', jsonEncode(json));

      return JournalResponseModel(journal: params.journalEntry);
    } catch (e) {
      if (kDebugMode) print(e);
      throw Exception('Failed to update journal');
    }
  }
}
