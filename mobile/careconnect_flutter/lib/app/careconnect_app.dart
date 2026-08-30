import 'package:flutter/material.dart';

import 'theme/app_colors.dart';
import 'theme/app_spacing.dart';
import 'theme/care_theme_option.dart';
import 'theme/careconnect_theme.dart';

class CareConnectApp extends StatefulWidget {
  const CareConnectApp({super.key});

  @override
  State<CareConnectApp> createState() => _CareConnectAppState();
}

class _CareConnectAppState extends State<CareConnectApp> {
  CareThemeOption selectedTheme = CareThemeOption.neutral;

  void changeTheme(CareThemeOption theme) {
    setState(() {
      selectedTheme = theme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CareConnect',
      theme: CareConnectTheme.getTheme(selectedTheme),
      home: ThemePreviewScreen(
        selectedTheme: selectedTheme,
        onThemeChanged: changeTheme,
      ),
    );
  }
}

class ThemePreviewScreen extends StatelessWidget {
  final CareThemeOption selectedTheme;
  final ValueChanged<CareThemeOption> onThemeChanged;

  const ThemePreviewScreen({
    super.key,
    required this.selectedTheme,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.primary,
        foregroundColor: Colors.white,
        title: const Text('CareConnect'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.base),
          children: [
            Text(
              'Good morning, Linda',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'We’re here to support your health and well-being.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.xl),

            _buildAccessibilityCard(context),

            const SizedBox(height: AppSpacing.xl),

            Text(
              'Choose Your Theme',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: AppSpacing.sm),
            Text(
              'You can change how CareConnect looks without changing its accessibility features.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: AppSpacing.lg),

            _ThemeButton(
              label: 'Neutral',
              description: 'Calm and professional',
              selected: selectedTheme == CareThemeOption.neutral,
              colors: const [
                AppColors.neutralPrimary,
                AppColors.neutralSecondary,
                AppColors.neutralSoftSurface,
              ],
              onPressed: () {
                onThemeChanged(CareThemeOption.neutral);
              },
            ),

            const SizedBox(height: AppSpacing.md),

            _ThemeButton(
              label: 'Blue & Green',
              description: 'Cool healthcare colors',
              selected: selectedTheme == CareThemeOption.blueGreen,
              colors: const [
                AppColors.blueGreenPrimary,
                AppColors.blueGreenSecondary,
                AppColors.blueGreenAccent,
              ],
              onPressed: () {
                onThemeChanged(CareThemeOption.blueGreen);
              },
            ),

            const SizedBox(height: AppSpacing.md),

            _ThemeButton(
              label: 'Purple & Pink',
              description: 'Warm purple and pink accents',
              selected: selectedTheme == CareThemeOption.purplePink,
              colors: const [
                AppColors.purplePinkPrimary,
                AppColors.purplePinkSecondary,
                AppColors.purplePinkAccent,
              ],
              onPressed: () {
                onThemeChanged(CareThemeOption.purplePink);
              },
            ),

            const SizedBox(height: AppSpacing.md),

            _ThemeButton(
              label: 'Kids',
              description: 'Bright, friendly and playful',
              selected: selectedTheme == CareThemeOption.kids,
              colors: const [
                AppColors.kidsPrimary,
                AppColors.kidsSecondary,
                AppColors.kidsYellow,
                AppColors.kidsCoral,
              ],
              onPressed: () {
                onThemeChanged(CareThemeOption.kids);
              },
            ),

            const SizedBox(height: AppSpacing.xl),

            _buildReadingSettings(context),

            const SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }

  Widget _buildAccessibilityCard(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.base),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            Icons.accessibility_new,
            size: 40,
            color: colorScheme.primary,
            semanticLabel: 'Accessibility',
          ),
          const SizedBox(width: AppSpacing.base),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Accessibility Support',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  'Tools and settings to help you read, understand, and navigate with confidence.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReadingSettings(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.base),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reading Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: AppSpacing.base),

            const _SettingRow(
              icon: Icons.text_fields,
              title: 'Text Size',
              value: 'Large',
            ),

            const Divider(),

            const _SettingRow(
              icon: Icons.format_line_spacing,
              title: 'Line & Letter Spacing',
              value: 'Wide',
            ),

            const Divider(),

            const _SettingRow(
              icon: Icons.contrast,
              title: 'Contrast',
              value: 'High',
            ),

            const Divider(),

            const _SettingRow(
              icon: Icons.volume_up_outlined,
              title: 'Read Aloud',
              value: 'Available',
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemeButton extends StatelessWidget {
  final String label;
  final String description;
  final bool selected;
  final List<Color> colors;
  final VoidCallback onPressed;

  const _ThemeButton({
    required this.label,
    required this.description,
    required this.selected,
    required this.colors,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Semantics(
      button: true,
      selected: selected,
      label: '$label theme',
      child: OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          minimumSize: const Size.fromHeight(72),
          padding: const EdgeInsets.all(AppSpacing.base),
          side: BorderSide(
            color: selected ? primary : AppColors.border,
            width: selected ? 2 : 1,
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            Wrap(
              spacing: 4,
              children: colors
                  .map(
                    (color) => Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: AppColors.border,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),

            const SizedBox(width: AppSpacing.sm),

            if (selected)
              Icon(
                Icons.check_circle,
                color: primary,
                semanticLabel: 'Selected',
              ),
          ],
        ),
      ),
    );
  }
}

class _SettingRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _SettingRow({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        minHeight: 56,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            semanticLabel: title,
          ),
          const SizedBox(width: AppSpacing.base),
          Expanded(
            child: Text(
              title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
          const SizedBox(width: AppSpacing.sm),
          Text(
            value,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
