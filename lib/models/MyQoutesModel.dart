/// subject : "Psyschological Life hacks "
/// subNo : "1"
/// quotes : [{"Text":"Talk with your self once a day.otherwise you may miss meeting an excellent person in the world","textNo":"1"},{"Text":"Talk with your self once a day.otherwise you may miss meeting an excellent person in the world","textNo":"1"},{"Text":"Talk with your self once a day.otherwise you may miss meeting an excellent person in the world","textNo":"3"}]

class MyQoutesModel {
  MyQoutesModel({
      String? subject, 
      String? subNo, 
      List<Quotes>? quotes,}){
    _subject = subject;
    _subNo = subNo;
    _quotes = quotes;
}

  MyQoutesModel.fromJson(dynamic json) {
    _subject = json['subject'];
    _subNo = json['subNo'];
    if (json['quotes'] != null) {
      _quotes = [];
      json['quotes'].forEach((v) {
        _quotes?.add(Quotes.fromJson(v));
      });
    }
  }
  String? _subject;
  String? _subNo;
  List<Quotes>? _quotes;
MyQoutesModel copyWith({  String? subject,
  String? subNo,
  List<Quotes>? quotes,
}) => MyQoutesModel(  subject: subject ?? _subject,
  subNo: subNo ?? _subNo,
  quotes: quotes ?? _quotes,
);
  String? get subject => _subject;
  String? get subNo => _subNo;
  List<Quotes>? get quotes => _quotes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subject'] = _subject;
    map['subNo'] = _subNo;
    if (_quotes != null) {
      map['quotes'] = _quotes?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Text : "Talk with your self once a day.otherwise you may miss meeting an excellent person in the world"
/// textNo : "1"

class Quotes {
  Quotes({
      String? text, 
      String? textNo,}){
    _text = text;
    _textNo = textNo;
}

  Quotes.fromJson(dynamic json) {
    _text = json['Text'];
    _textNo = json['textNo'];
  }
  String? _text;
  String? _textNo;
Quotes copyWith({  String? text,
  String? textNo,
}) => Quotes(  text: text ?? _text,
  textNo: textNo ?? _textNo,
);
  String? get text => _text;
  String? get textNo => _textNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Text'] = _text;
    map['textNo'] = _textNo;
    return map;
  }

}