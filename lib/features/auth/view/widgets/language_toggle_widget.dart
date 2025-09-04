import 'package:flutter/material.dart';

class LanguageToggleWidget extends StatelessWidget {
  final bool isArabic;
  final Function(bool) onLanguageChanged;

  const LanguageToggleWidget({
    super.key,
    required this.isArabic,
    required this.onLanguageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildLanguageFlag('🇺🇸', !isArabic, () => onLanguageChanged(false)),
          _buildLanguageFlag('🇪🇬', isArabic, () => onLanguageChanged(true)),
        ],
      ),
    );
  }

  Widget _buildLanguageFlag(String flag, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFFB800) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          flag,
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
