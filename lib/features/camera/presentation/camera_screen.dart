import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/camera_provider.dart';
import '../../shared/widgets/glass_app_bar.dart';
import '../../shared/widgets/glass_scaffold.dart';

class CameraScreen extends ConsumerWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraAsync = ref.watch(cameraProvider);
    final theme = Theme.of(context);

    return GlassScaffold(
      appBar: const GlassAppBar(
        title: Text('Camera'),
      ),
      body: cameraAsync.when(
        data: (cameras) {
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
                GlassCard(
                  animateOnEntry: true,
                  padding: const EdgeInsets.all(AppSizes.p48),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: AppColors.primaryLight.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primaryLight.withValues(alpha: 0.3),
                              blurRadius: 32,
                            )
                          ]
                        ),
                        child: const Icon(Icons.camera_outlined, size: 80, color: AppColors.primaryLight)
                          .animate(onPlay: (c) => c.repeat(reverse: true))
                          .scale(begin: const Offset(1,1), end: const Offset(1.05, 1.05), duration: 1.seconds),
                      ),
                      gapH32,
                      Text('${cameras.length}', style: theme.textTheme.displayMedium?.copyWith(fontWeight: FontWeight.w900, color: theme.colorScheme.onSurface)),
                      gapH8,
                      Text('Hardware Cameras Detected', style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6), fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
                gapH32,
                const EducationalCard(
                  title: 'Hardware Level',
                  icon: Icons.camera_alt_outlined,
                  content: 'Android categorizes cameras by Hardware Level:\n• LEGACY: Old Android API, limited features.\n• LIMITED: Basic features.\n• FULL: High-res capture and manual control.\n• LEVEL_3: Advanced RAW capture and YUV reprocessing.',
                  optimizationTips: [
                    'Apps like GCam port require FULL or LEVEL_3 hardware support.',
                  ],
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                gapH32,
                Text('Camera Modules', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900)).animate().fadeIn(delay: 300.ms),
                gapH16,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cameras.length,
                  itemBuilder: (context, index) {
                    final cam = cameras[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p16),
                      child: GlassCard(
                        animateOnEntry: true,
                        padding: const EdgeInsets.all(AppSizes.p24),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: theme.colorScheme.primary.withValues(alpha: 0.15),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(cam.facing == 'Front' ? Icons.camera_front_outlined : Icons.camera_rear_outlined, size: 36, color: theme.colorScheme.primary),
                            ),
                            gapW24,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${cam.facing} Camera', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w800)),
                                  gapH4,
                                  Text('ID: ${cam.id}', style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.5), fontWeight: FontWeight.w600)),
                                  gapH12,
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.5),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Text(
                                      'Hardware Level: ${cam.hardwareLevel == 0 ? "LIMITED" : (cam.hardwareLevel == 1 ? "FULL" : (cam.hardwareLevel == 2 ? "LEGACY" : "LEVEL_3"))}',
                                      style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.8), fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ).animate().fadeIn(delay: (400 + index * 100).ms).slideX(begin: 0.1),
                    );
                  },
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
