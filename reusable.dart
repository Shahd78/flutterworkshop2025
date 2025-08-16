import 'package:flutter/material.dart';
class GenderCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const GenderCard(
      {super.key,
      required this.icon,
      required this.label,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ReusableCard(
        color: isSelected ? Colors.pink : const Color(0xFF1D1E33),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 70, color: Colors.white),
            const SizedBox(height: 10),
            Text(label,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
}

class CounterCard extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onAdd;
  final VoidCallback onRemove;

  const CounterCard(
      {super.key,
      required this.label,
      required this.value,
      required this.onAdd,
      required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return ReusableCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(label, style: const TextStyle(fontSize: 18)),
          Text(value.toString(),
              style:
                  const TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.remove, color: Colors.white),
                onPressed: onRemove,
              ),
              IconButton(
                icon: const Icon(Icons.add, color: Colors.white),
                onPressed: onAdd,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ReusableCard extends StatelessWidget {
  final Widget child;
  final Color color;

  const ReusableCard(
      {super.key, required this.child, this.color = const Color(0xFF1D1E33)});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}
