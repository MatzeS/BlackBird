import 'package:blackbird/blackbird.dart';
import 'package:async/async.dart';
import 'dart:async';
import 'common.dart';

part 'input.g.dart';

abstract class DiscreteInput extends Device {
  static DiscreteInput getRemote(Context context, String uuid) =>
      _$DiscreteInputRmi.getRemote(context, uuid);

  /// The number of descrete states
  @Property()
  int get states;

  /// The current state the sensor is measuring
  /// This value is within 0 to states-1
  @Executive()
  Future<int> get state;
}

abstract class DiscreteInterruptInput extends DiscreteInput {
  static DiscreteInterruptInput getRemote(Context context, String uuid) =>
      _$DiscreteInterruptInputRmi.getRemote(context, uuid);

  int _state;
  get state async => _state;

  @override
  void postImplementation() {
    stateChange.listen((s) => _state = s);
  }

  /// Stream issuing an event every time the state changes
  /// This should be a broadcast stream
  @Executive()
  Stream<int> get stateChange;
}

mixin BinaryInput implements DiscreteInput {
  get states => 2;
  get isOn async => state == ON;
  get isOff async => state == OFF;
}

typedef bool EventMatcher<T>(T event, T sequenceElement);

class SequenceTrigger<T> {
  final Stream<T> source;
  final List<T> sequence;
  EventMatcher<T> _matcher;
  EventMatcher<T> get matcher => _matcher;

  List<T> _recordedSequence = [];
  int get sequenceIndex => _recordedSequence.length;

  StreamController<List<T>> _controller =
      new StreamController<List<T>>.broadcast();
  RestartableTimer _timer;

  SequenceTrigger(this.source, this.sequence,
      {Duration sequenceTimeout = const Duration(milliseconds: 500),
      EventMatcher<T> matcher}) {
    _matcher = matcher;
    if (_matcher == null) _matcher = (a, b) => a == b;

    _timer = new RestartableTimer(sequenceTimeout, () {});

    source.listen(parseEvent);
  }

  parseEvent(T event) {
    if (!_timer.isActive) {
      _resetSequence();
    }

    if (matcher(event, sequence[sequenceIndex])) {
      _recordedSequence.add(event);
    } else {
      _resetSequence();
    }

    if (sequenceIndex == sequence.length) {
      _controller.sink.add(_recordedSequence);
      _resetSequence();
    }

    _timer.reset();
  }

  _resetSequence() => _recordedSequence.clear();

  Stream<List<T>> get trigger => _controller.stream;
}
