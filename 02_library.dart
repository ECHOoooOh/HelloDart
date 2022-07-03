import 'dart:async';
import 'dart:io';
import 'dart:core';
import 'dart:math';

void funCore() {
  //控制台打印
  var anObject = 'computer';
  var tea = 'black tea';
  print(anObject);
  print('I drink $tea.');

  //数字
  assert(int.parse('42') == 42);
  assert(int.parse('Ox42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(num.parse('42') is int);
  assert(num.parse('Ox42') is int);
  assert(num.parse('0.50') is double);

  assert(int.parse('42', radix: 16) == 66);

  assert(42.toString() == '42');
  assert(123.456.toString() == '123.456');
  //保留两位小数
  assert(123.456.toStringAsFixed(2) == '123.46');
  //科学记数法
  assert(123.456.toStringAsExponential(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);

  //字符和正则表达式
  //在字符串中搜索
  assert('Never odd or even'.contains('odd'));
  assert('Never odd or even'.startsWith('Never'));
  assert('Never odd or even'.endsWith('even'));
  assert('Never odd or even'.indexOf('odd') == 6);
  //从字符串中提取数据
  assert('Never odd or even'.substring(6, 9) == 'odd');
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');
  assert('Never odd or even'[0] == 'N');

  for (final char in 'hello'.split(' ')) {
    print(char);
  }

  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);
  //字母大小写转换
  assert('web apps'.toUpperCase() == 'WEB APPS');
  assert('WEB APPS'.toLowerCase() == 'web apps');
  //Trimming和空字符串,使用trim()移除首尾空格，使用isEmpty检查一个字符串是否为空
  assert(' hello '.trim() == 'hello');
  assert(''.isEmpty);
  assert(' '.isNotEmpty);
  //替换部分字符串
  var greetingTemplate = 'Hello, Name!';
  var greeting = greetingTemplate.replaceAll(RegExp('Name'), 'Bob');
  assert(greeting != greetingTemplate);
  //构建一个字符串
  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');
  var fullString = sb.toString();
  assert(fullString == 'Use a StringBuffer for efficient string creation.');
  //正则表达式
  var numbers = RegExp(r'\d+');
  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');
  //也可以直接用RegExp类
  assert(numbers.hasMatch(someDigits));
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0));
  }
}

void funList() {
  //Create an empty list of strings
  var grains = <String>[];
  assert(grains.isEmpty);

  //Create a list using a list literal
  var fruits = ['apples', 'oranges'];

  //增加
  fruits.add('kiwis');
  fruits.addAll(['grapes', 'bananas']);

  //长度
  assert(fruits.length == 5);
  //移除单个元素
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);
  //清空
  fruits.clear();
  assert(fruits.isEmpty);

  //List.filled(length, fill)
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  //使用indexOf方法查找对象在列表中的下标值
  var fruits2 = ['apples', 'oranges'];
  assert(fruits2[0] == 'apples');
  assert(fruits2.indexOf('apples') == 0);

  //使用sort方法排序
  var fruits3 = ['bananas', 'apples', 'oranges'];
  fruits3.sort((a, b) => a.compareTo(b));
  assert(fruits3[0] == 'apples');

  var fruits4 = <String>[];
  fruits4.add('apples');
  var fruit = fruits4[0];
  assert(fruit is String);
  /*
  fruits4.add(5);//error:'int' can't be assigned to 'String'
   */
  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);
  teas.forEach((tea) => print('I drink $tea'));

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  //使用map().toList()或map().toSet强制在每个项目上立即调用函数
  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();

  /*
  使用 Iterable 的 where() 方法可以获取所有匹配条件的元素。
  使用 Iterable 的 any() 和 every() 方法可以检查部分或者所有元素是否匹配某个条件。
   */
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';
}

void funSet() {
  //Set 是一个无序，元素唯一的集合
  //新建
  var ingredients = <String>{};
  //增加
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);
  ingredients.add('gold');
  assert(ingredients.length == 3);
  //移除
  ingredients.remove('gold');
  assert(ingredients.length == 2);
  //使用构造函数新建set
  var atomicNumbers = Set.from([79, 22, 54]);
  //使用contains()和containsAll()检查一个或多个元素是否在set中
  var ingredient = Set<String>();
  ingredient.addAll(['gold', 'titanium', 'xenon']);

  assert(ingredient.contains('titanium'));
  assert(ingredient.containsAll(['titanium', 'xenon']));

  var nobleGases = Set.from(['xenon', 'argon']);
  var intersection = ingredient.intersection(nobleGases);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));
}

void funMap() {
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };
  var searchTerms = Map();
  var nobleGases = Map<int, String>();

  //添加，获取，设置，移除键值对
  nobleGases = {54: 'xenon'};
  assert(nobleGases[54] == 'xenon');
  assert(nobleGases.containsKey(54));
  nobleGases.remove(54);
  assert(!nobleGases.containsKey(54));
  //检索key
  var keys = hawaiianBeaches.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  var values = hawaiianBeaches.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  assert(hawaiianBeaches.containsKey('Oahu'));
  assert(!hawaiianBeaches.containsKey('Florida'));

  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
  });

  var teas = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);
  loudTeas = teas.map((tea) => tea.toUpperCase()).toList();

  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  //where
  var decaffeinatedTeas = teas.where((tea) => isDecaffeinated(tea));

  assert(teas.any(isDecaffeinated));
  assert(!teas.every(isDecaffeinated));
}

//URI: 一个用于标识某一互联网资源名称的字符串
void funURI() {
  var uri = 'https://example.org/api?foo=some message';
  //使用 encodeFull() 和 decodeFull() 方法，对 URI 中除了特殊字符（例如 /， :， &， #）以外的字符进行编解码，
  //这些方法非常适合编解码完整合法的 URI，并保留 URI 中的特殊字符。
  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');

  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);
  //使用 encodeComponent() 和 decodeComponent() 方法，
  //对 URI 中具有特殊含义的所有字符串字符，特殊字符包括（但不限于）/， &，和 :。
  encoded = Uri.encodeComponent(uri);
  assert(encoded == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');

  decoded = Uri.decodeComponent(encoded);
  assert(uri == decoded);

  //构建
  var uri2 = Uri(
      scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');
  assert(uri2.toString() == 'https://example.org/foo/bar#frag');
}

//日期和时间
void funDateTime() {
  // 获取当前时间
  var now = DateTime.now();

  var y2k = DateTime(2000); // January 1, 2000

  y2k = DateTime(2000, 1, 2); // January 2, 2000

  y2k = DateTime.utc(2000); // 1/1/2000, UTC（世界统一时间）

  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

  y2k = DateTime.parse('2000-01-01T00:00:00Z');

  // 1/1/2000, UTC
  y2k = DateTime.utc(2000);
  assert(y2k.millisecondsSinceEpoch == 946684800000);

  // 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  y2k = DateTime.utc(2000);

  var y2001 = y2k.add(const Duration(days: 366));
  assert(y2001.year == 2001);

  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);

  var duration = y2001.difference(y2k);
  assert(duration.inDays == 366);
}

//工具类
//比较对象
class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

//Implementing map keys
class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

// //迭代
// class Process {
//   // Represents a process...
// }

// class ProcessIterator implements Iterator<Process> {
//   @override
//   Process get current => ...;
//   @override
//   bool moveNext() => ...;
// }

// // A mythical class that lets you iterate through all
// // processes. Extends a subclass of [Iterable].
// class Processes extends IterableBase<Process> {
//   @override
//   final Iterator<Process> iterator = ProcessIterator();
// }

void funUtility() {
  var short = const Line(1);
  var long = const Line(100);
  assert(short.compareTo(long) < 0);

  var p1 = Person('Bob', 'Smith');
  var p2 = Person('Bob', 'Smith');
  var p3 = 'not a person';
  assert(p1.hashCode == p2.hashCode);
  assert(p1 == p2);
  assert(p1 != p3);
}

// //异常
// class FooException implements Exception {
//   final String? msg;

//   const FooException([this.msg]);

//   @override
//   String toString() => msg ?? 'FooException';
// }

// 数学和随机数
void math_and_random() {
  print('\n');
  print('#' * 40);
  print('数学和随机数');
  print('#' * 40);

  assert(cos(pi) == -1.0);

  var degrees = 30;
  var radians = degrees * (pi / 180);

  var sinOf30degrees = sin(radians);

  assert((sinOf30degrees - 0.5).abs() < 0.01);

  assert(max(1, 1000) == 1000);
  assert(min(1, -1000) == -1000);

  print(e); // 2.718281828459045
  print(pi); // 3.141592653589793
  print(sqrt2); // 1.4142135623730951

  var random = Random();
  var value1 = random.nextDouble();
  print('nextDouble: $value1');
  var value2 = random.nextInt(10);
  print('nextInt: $value2');
  var value3 = random.nextBool();
  print('nextBool: $value3');
}

void main() {
  funCore();
  funList();
  funSet();
  funMap();
  funURI();
  funUtility();
  math_and_random();
}
