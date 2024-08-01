class WordsResponse {
  List<MeaningsList>? meaningsList;

  WordsResponse({this.meaningsList});

  WordsResponse.fromJson(Map<String, dynamic> json) {
    if (json['meaningsList'] != null) {
      meaningsList = [];
      json['meaningsList']
          .forEach((a) => meaningsList!.add(MeaningsList.fromJson(a)));
    }
  }
}

class MeaningsList {
  String? meaning;

  MeaningsList({this.meaning});

  MeaningsList.fromJson(Map<String, dynamic> json) {
    meaning = json['meaning'];
  }
}
