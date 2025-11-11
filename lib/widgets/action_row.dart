import 'package:flutter/material.dart';

class ActionRow extends StatelessWidget {
  final VoidCallback onBoost1;
  final VoidCallback onBoost2;

  const ActionRow({
    super.key,
    required this.onBoost1,
    required this.onBoost2,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onBoost1,
            child: const Text("Activate 20% Boost"),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: ElevatedButton(
            onPressed: onBoost2,
            child: const Text("Activate 30% Boost"),
          ),
        ),
      ],
    );
  }
}
