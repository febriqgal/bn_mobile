import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';

final CurrencyTextInputFormatter formatterRupiah =
    CurrencyTextInputFormatter.currency(
  locale: 'id',
  symbol: '',
  decimalDigits: 0,
  maxValue: 9999999999,
);
