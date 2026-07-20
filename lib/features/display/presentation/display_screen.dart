import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/display_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class DisplayScreen extends ConsumerWidget {
  const DisplayScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final displayAsync = ref.watch(displayProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Display Info'),
      ),
      body: displayAsync.when(
        data: (display) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 100,
              left: AppSizes.p20,
              right: AppSizes.p20,
              bottom: 120, // accommodate floating nav bar
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildMainStatus(display, theme),
                gapH32,
                Text('Display Specifications', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 100.ms),
                gapH16,
                _buildDetailsGrid(display, theme),
                gapH32,
                const EducationalCard(
                  title: 'Refresh Rate & HDR',
                  icon: Icons.screenshot_outlined,
                  content: 'Your screen updates multiple times per second (Refresh Rate). A 120Hz display is smoother than 60Hz but uses more battery. HDR (High Dynamic Range) allows the screen to display a wider range of colors and brighter highlights, making videos look much more realistic.',
                  optimizationTips: [
                    'Lowering the refresh rate to 60Hz can significantly improve battery life.',
                    'Use Dark Mode if you have an OLED display to save power, as true black pixels are turned off completely.',
                  ],
                ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1),
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
      animateOnEntry: true,
      padding: const EdgeInsets.all(AppSizes.p48),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.15),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: theme.colorScheme.primary.withValues(alpha: 0.3),
                  blurRadius: 32,
                )
              ]
            ),
            child: Icon(
              Icons.smartphone_outlined,
              size: 80,
              color: theme.colorScheme.primary,
            ).animate(onPlay: (c) => c.repeat(reverse: true))
             .scale(begin: const Offset(1,1), end: const Offset(1.05, 1.05), duration: 1.seconds),
          ),
          gapH32,
          Text(
            '${display.widthPixels} x ${display.heightPixels}',
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
          gapH8,
          Text('Resolution', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w700)),
        ],
      ),
    );
  }

  Widget _buildDetailsGrid(dynamic display, ThemeData theme) {
    final details = [
      {'title': 'Refresh Rate', 'value': '${display.refreshRate.toInt()} Hz', 'icon': Icons.speed_outlined, 'color': Colors.cyanAccent},
      {'title': 'Density', 'value': '${display.densityDpi} DPI', 'icon': Icons.grain_outlined, 'color': Colors.orangeAccent},
      {'title': 'HDR Support', 'value': display.isHdr ? 'Supported' : 'Not Supported', 'icon': Icons.hdr_on_outlined, 'color': display.isHdr ? AppColors.healthExcellent : Colors.grey},
      {'title': 'Aspect Ratio', 'value': (display.heightPixels / display.widthPixels).toStringAsFixed(2), 'icon': Icons.aspect_ratio_outlined, 'color': Colors.purpleAccent},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: details.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: AppSizes.p16,
        mainAxisSpacing: AppSizes.p16,
        childAspectRatio: 1.3,
      ),
      itemBuilder: (context, index) {
        final item = details[index];
        final color = item['color'] as Color;
        return GlassCard(
          animateOnEntry: true,
          padding: const EdgeInsets.all(AppSizes.p20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.15),
                  shape: BoxShape.circle,
                ),
                child: Icon(item['icon'] as IconData, color: color, size: 24),
              ),
              const Spacer(),
              Text(
                item['title'] as String,
                style: theme.textTheme.labelMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                  fontWeight: FontWeight.w600,
                ),
              ),
              gapH4,
              Text(
                item['value'] as String,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w900,
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ).animate().fadeIn(delay: (200 + index * 100).ms).slideY(begin: 0.1);
      },
    );
  }
}
