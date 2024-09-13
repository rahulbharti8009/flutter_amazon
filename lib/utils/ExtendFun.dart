
import 'package:flutter/foundation.dart';

// var isDebug = true;
class Logger {
 final String name;
  bool mute = false;
  // _cache is library-private, thanks to
  // the _ in front of its name.
  static final Map<String, Logger> _cache = <String, Logger>{};

  factory Logger(String name) {
    return _cache.putIfAbsent(name, () => Logger._internal(name));
  }

  factory Logger.fromJson(Map<String, Object> json) {
    return Logger(json['name'].toString());
  }

  Logger._internal(this.name);

  void log(String msg) {
    if (!mute) {
      if (kDebugMode) {
        print("${_cache.keys} $msg");
      }
    }
  }
} 

String getTitleName(int value){
  switch (value) {
    case 0:
      return "Home";
    case 1: 
      return "Notification";
    case 2: 
      return "Message";
      default:
      return "Home";
  }
}
