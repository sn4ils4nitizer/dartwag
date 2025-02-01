import 'package:flutter/material.dart';
import 'dart:io';

class CardWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? imageAssetPath; // Path to the local image asset
  final File? imageFile; // Local image file (if using file picker)
  final VoidCallback? onTap;
  final List<Widget>? actions;

  const CardWidget({
    required this.title,
    this.subtitle,
    this.imageAssetPath,
    this.imageFile,
    this.onTap,
    this.actions,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Adds a shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12), // Match card's border radius
        onTap: onTap, // Handle tap events
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Local Image (optional)
            if (imageAssetPath != null || imageFile != null)
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: imageFile != null
                    ? Image.file(
                        imageFile!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imageAssetPath!,
                        height: 150,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
              ),

            // Title and Subtitle
            Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  if (subtitle != null)
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        subtitle!,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                ],
              ),
            ),

            // Actions (optional)
            if (actions != null)
              Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: actions!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
