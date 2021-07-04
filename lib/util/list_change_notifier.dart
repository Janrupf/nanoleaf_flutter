import 'package:flutter/cupertino.dart';

/// A [ChangeNotifier] for [List]s.
class ListChangeNotifier<E> extends ChangeNotifier implements Iterable<E> {
  final List<E> _underlying;

  ListChangeNotifier() : _underlying = [];

  void add(E element) {
    _underlying.add(element);
    notifyListeners();
  }

  void remove(Object? value) {
    _underlying.remove(value);
    notifyListeners();
  }

  int indexOf(E element, [int start = 0]) =>
      _underlying.indexOf(element, start);

  E operator[](int index) => _underlying[index];

  @override
  bool contains(Object? element) => _underlying.contains(element);

  @override
  bool any(bool test(E element)) => _underlying.any(test);

  @override
  Iterable<R> cast<R>() => _underlying.cast<R>();

  @override
  elementAt(int index) => _underlying.elementAt(index);

  @override
  bool every(bool Function(E element) test) => _underlying.every(test);

  @override
  Iterable<T> expand<T>(Iterable<T> Function(E element) f) =>
      _underlying.expand(f);

  @override
  E get first => _underlying.first;

  @override
  E firstWhere(bool Function(E element) test, {E orElse()?}) =>
      _underlying.firstWhere(test, orElse: orElse);

  @override
  T fold<T>(T initialValue, T Function(T previousValue, E element) combine) =>
      _underlying.fold<T>(initialValue, combine);

  @override
  Iterable<E> followedBy(Iterable<E> other) => _underlying.followedBy(other);

  @override
  void forEach(void Function(E element) f) => _underlying.forEach(f);

  @override
  bool get isEmpty => _underlying.isEmpty;

  @override
  bool get isNotEmpty => _underlying.isNotEmpty;

  @override
  Iterator<E> get iterator => _underlying.iterator;

  @override
  String join([String separator = ""]) => _underlying.join(separator);

  @override
  E get last => _underlying.last;

  @override
  lastWhere(bool Function(E element) test, {E orElse()?}) =>
      _underlying.lastWhere(test, orElse: orElse);

  @override
  int get length => _underlying.length;

  @override
  Iterable<T> map<T>(T Function(E e) f) => _underlying.map(f);

  @override
  E reduce(E Function(E value, E element) combine) =>
      _underlying.reduce(combine);

  @override
  get single => _underlying.single;

  @override
  E singleWhere(bool Function(E element) test, {E orElse()?}) =>
      _underlying.singleWhere(test, orElse: orElse);

  @override
  Iterable<E> skip(int count) => _underlying.skip(count);

  @override
  Iterable<E> skipWhile(bool Function(E value) test) =>
      _underlying.skipWhile(test);

  @override
  Iterable<E> take(int count) => _underlying.take(count);

  @override
  Iterable<E> takeWhile(bool Function(E value) test) =>
      _underlying.takeWhile(test);

  @override
  List<E> toList({bool growable = true}) =>
      _underlying.toList(growable: growable);

  @override
  Set<E> toSet() => _underlying.toSet();

  @override
  Iterable<E> where(bool Function(E element) test) => _underlying.where(test);

  @override
  Iterable<T> whereType<T>() => _underlying.whereType<T>();
}
