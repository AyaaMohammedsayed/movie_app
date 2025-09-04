import 'package:flutter/material.dart';

class AvatarSelectionWidget extends StatefulWidget {
  final int selectedAvatar;
  final Function(int) onAvatarSelected;

  const AvatarSelectionWidget({
    super.key,
    required this.selectedAvatar,
    required this.onAvatarSelected,
  });

  @override
  State<AvatarSelectionWidget> createState() => _AvatarSelectionWidgetState();
}

class _AvatarSelectionWidgetState extends State<AvatarSelectionWidget> {
  late PageController _pageController;
  
  final List<String> _avatarPaths = [
    'assets/images/gamer (1).png',
    'assets/images/gamer (2).png',
    'assets/images/gamer (3).png',
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      initialPage: widget.selectedAvatar - 1,
      viewportFraction: 0.35,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 130,
          alignment: Alignment.center,
          child: PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              widget.onAvatarSelected(index + 1);
            },
            itemCount: _avatarPaths.length,
            itemBuilder: (context, index) {
              return Container(
                alignment: Alignment.center,
                child: _buildAvatarOption(index + 1, _avatarPaths[index]),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Avatar',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildAvatarOption(int index, String imagePath) {
    final isSelected = widget.selectedAvatar == index;
    final size = isSelected ? 110.0 : 65.0;
    
    return GestureDetector(
      onTap: () {
        widget.onAvatarSelected(index);
        _pageController.animateToPage(
          index - 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isSelected ? const Color(0xFFFFB800) : Colors.grey[600]!,
            width: isSelected ? 4 : 2,
          ),
          boxShadow: isSelected ? [
            BoxShadow(
              color: const Color(0xFFFFB800).withOpacity(0.4),
              blurRadius: 12,
              spreadRadius: 2,
            ),
          ] : null,
        ),
        child: ClipOval(
          child: Image.asset(
            imagePath,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[800],
                child: Icon(
                  _getAvatarIcon(index),
                  color: isSelected ? const Color(0xFFFFB800) : Colors.white,
                  size: isSelected ? 40 : 22,
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  IconData _getAvatarIcon(int index) {
    switch (index) {
      case 1:
        return Icons.person;
      case 2:
        return Icons.face;
      case 3:
        return Icons.account_circle;
      default:
        return Icons.person;
    }
  }
}
