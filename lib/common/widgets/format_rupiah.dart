import 'package:intl/intl.dart';

String formatRupiah(dynamic number) => NumberFormat.currency(
      locale: 'id',
      symbol: "",
      decimalDigits: 0,
    ).format(number);

int stringCurrencyToInt(String value) => int.parse(value.replaceAll(".", ""));
