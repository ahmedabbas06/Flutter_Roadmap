import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: theme.primaryColor.withValues(alpha: 0.12),
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(12),
              child: ClipOval(
                child: Image.asset(
                  'assets/icon/app_icon.png',
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Icon(
                      Icons.flutter_dash,
                      size: 54,
                      color: theme.primaryColor,
                    );
                  },
                ),
              ),
            ),
            SizedBox(height: 24),
            Text(
              'Flutter Roadmap',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: theme.colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Your Personal Flutter Learning Journey',
              style: TextStyle(
                fontSize: 14,
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            SizedBox(height: 48),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
