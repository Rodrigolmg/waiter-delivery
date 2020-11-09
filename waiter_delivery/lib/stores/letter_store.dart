import 'package:mobx/mobx.dart';
import 'package:waiter_delivery/util/values.dart';

part 'letter_store.g.dart';

class LetterStore = _LetterStore with _$LetterStore;

abstract class _LetterStore with Store {

  _LetterStore(){
    _loadLetters();
  }

  // OBSERVABLES
  ObservableList letters = ObservableList();

  // ACTIONS
  @action
  void setLetters(List<String> lettersValue) {
    letters.clear();
    letters.addAll(lettersValue);
  }

  // COMPUTED

  // FUNCTIONS
  _loadLetters(){
    final letterAdded = lettersValues;
    setLetters(letterAdded);
  }
}

