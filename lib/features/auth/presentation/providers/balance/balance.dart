import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'balance.g.dart';

@riverpod
class Balance extends _$Balance {
  @override
  Future<int> build() async {
    await Future.delayed(const Duration(seconds: 1));
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('balance') ?? 0;
  }

  Future<void> addBalance(int newBalance) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('balance', state.value! + newBalance);
  }

  Future<void> reduceBalance(int newBalance) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();

    state.value! < newBalance
        ? throw GoException('Balance tidak mencukupi')
        : null;

    await preferences.setInt('balance', state.value! - newBalance);
  }
}
