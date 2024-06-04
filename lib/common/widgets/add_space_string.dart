String addSpaces(String input) {
  String result = '';
  for (int i = 0; i < input.length; i++) {
    if (i % 4 == 0 && i != 0) {
      result += ' ';
    }
    result += input[i];
  }
  return result;
}
