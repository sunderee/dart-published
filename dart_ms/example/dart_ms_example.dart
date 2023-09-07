import 'package:dart_ms/dart_ms.dart';

void main() {
  ms('2 days').also((it) => print(it)); // 172800000
  ms('1d').also((it) => print(it)); // 86400000
  ms('10h').also((it) => print(it)); // 36000000
  ms('2.5 hrs').also((it) => print(it)); // 9000000
  ms('2h').also((it) => print(it)); // 7200000
  ms('1m').also((it) => print(it)); // 60000
  ms('5s').also((it) => print(it)); // 5000
  ms('1y').also((it) => print(it)); // 31557600000
  ms('-3 days').also((it) => print(it)); // -259200000
  ms('-1h').also((it) => print(it)); // -3600000
}

extension _ScopeFunctionExt<T> on T {
  T also(void Function(T it) block) {
    block.call(this);
    return this;
  }
}
