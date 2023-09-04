import 'package:faro_clean_tdd/features/user_authentification/presentation/providers/state/user_state.dart';
import 'package:faro_clean_tdd/features/user_authentification/presentation/providers/user_provider.dart';
import 'package:faro_clean_tdd/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RememberCheckbox extends ConsumerStatefulWidget {
  const RememberCheckbox({super.key});

  @override
  ConsumerState<RememberCheckbox> createState() => _RememberCheckboxState();
}

class _RememberCheckboxState extends ConsumerState<RememberCheckbox> {
  @override
  Widget build(BuildContext context) {
    final state = ref.read(userAuthProvider);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Checkbox(
            value: state is Initial ? state.userInfo["pref"] : false,
            onChanged: (value) {
              setState(() {
                if (state is Initial) {
                  ref
                      .read(userAuthProvider.notifier)
                      .togglePref(state.userInfo, value!);
                }
              });
            }),
        const SizedBox(width: 10),
        Text(
          'Se souvenir de moi ?',
          style: TextStyle(color: theme.colorScheme.secondary, fontSize: 12),
        )
      ],
    );
  }
}
