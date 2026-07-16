import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/display_provider.dart';

class DisplayScreen extends ConsumerWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayAsync = ref.watch(displayProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Display Info'),
        backgroundColor: Colors.transparent,
      ),
      body: displayAsync.when(
        data: (display) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMainStatus(display, theme),
                gapH24,
                _buildDetailsGrid(display, theme),
                gapH24,
                const EducationalCard(
                  title: 'Refresh Rate & HDR',
                  icon: Icons.screenshot,
                  content: 'Your screen updates multiple times per second (Refresh Rate). A 120Hz display is smoother than 60Hz but uses more battery. HDR (High Dynamic Range) allows the screen to display a wider range of colors and brighter highlights, making videos look much more realistic.',
                  optimizationTips: [
                    'Lowering the refresh rate to 60Hz can significantly improve battery life.',
                    'Use Dark Mode if you have an OLED display to save power, as true black pixels are turned off completely.',
                  ],
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.2),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildMainStatus(dynamic display, ThemeData theme) {
    return GlassCard(
      padding: const EdgeInsets.all(AppSizes.p32),
      child: Column(
        children: [
          Icon(
            Icons.smartphone,
            size: 80,
            color: theme.colorScheme.primary,
          ).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
          gapH16,
          Text(
            '${display.widthPixels} x ${display.heightPixels}',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Resolution', style: theme.textTheme.titleMedium),
        ],
      ),
    );
  }

  Widget _buildDetailsGrid(dynamic display, ThemeData theme) {
    final details = [
      {'title': 'Refresh Rate', 'value': '${display.refreshRate.toInt()} Hz', 'icon': Icons.speed, 'color': AppColors.info},
      {'title': 'Density', 'value': '${display.densityDpi} DPI', 'icon': Icons.grain, 'color': Colors.orange},
      {'title': 'HDR Support', 'value': display.isHdr ? 'Supported' : 'Not Supported', 'icon': Icons.hdr_on, 'color': display.isHdr ? AppColors.healthExcellent : Colors.grey},
      {'title': 'Aspect Ratio', 'value': (display.heightPixels / display.widthPixels).toStringAsFixed(2), 'icon': Icons.aspect_ratio, 'color': Colors.purple},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        final item = details[index];
        return GlassCard(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(item['icon'] as IconData, color: item['color'] as Color),
              gapH8,
              Text(
                item['title'] as String,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
              gapH4,
              Text(
                item['value'] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (200 + index * 100).ms).slideY(begin: 0.1);
      },
    );
  }
}
