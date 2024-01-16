import 'package:intl/intl.dart';

extension FormatPriceExtension on dynamic {
  String formatAsPrice() {
    final formatter = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    if (this is String) {
      return formatter.format(double.parse(this));
    } else if (this is double || this is int) {
      return formatter.format(this);
    }
    throw ArgumentError(
        'Invalid type. Only String, double, or int is allowed.');
  }
}
