class Message {
  final String body;
  final String autherId;
  final int _date;
  Message(this.body, this.autherId, this._date);
  int get date {
    return -_date;
  }
}
