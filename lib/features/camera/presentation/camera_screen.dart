import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_sizes.dart';
import '../../shared/widgets/glass_card.dart';
import '../../shared/widgets/educational_card.dart';
import 'providers/camera_provider.dart';

class CameraScreen extends ConsumerWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraAsync = ref.watch(cameraProvider);
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera'),
        backgroundColor: Colors.transparent,
      ),
      body: cameraAsync.when(
        data: (cameras) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSizes.p20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                GlassCard(
                  padding: const EdgeInsets.all(AppSizes.p32),
                  child: Column(
                    children: [
                      const Icon(Icons.camera, size: 80, color: AppColors.primaryLight).animate().scale(duration: 400.ms, curve: Curves.easeOutBack),
                      gapH16,
                      Text('${cameras.length}', style: theme.textTheme.displaySmall?.copyWith(fontWeight: FontWeight.bold)),
                      Text('Hardware Cameras Detected', style: theme.textTheme.titleMedium),
                    ],
                  ),
                ),
                gapH24,
                const EducationalCard(
                  title: 'Hardware Level',
                  icon: Icons.camera_alt,
                  content: 'Android categorizes cameras by Hardware Level:\n• LEGACY: Old Android API, limited features.\n• LIMITED: Basic features.\n• FULL: High-res capture and manual control.\n• LEVEL_3: Advanced RAW capture and YUV reprocessing.',
                  optimizationTips: [
                    'Apps like GCam port require FULL or LEVEL_3 hardware support.',
                  ],
                ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),
                gapH24,
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: cameras.length,
                  itemBuilder: (context, index) {
                    final cam = cameras[index];
                    return Padding(
                      padding: const EdgeInsets.only(bottom: AppSizes.p16),
                      child: GlassCard(
                        padding: const EdgeInsets.all(AppSizes.p20),
                        child: Row(
                          children: [
                            Icon(cam.facing == 'Front' ? Icons.camera_front : Icons.camera_rear, size: 40, color: theme.colorScheme.primary),
                            gapW16,
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('${cam.facing} Camera (ID: ${cam.id})', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                                  gapH4,
                                  Text(
                                    'Hardware Level: ${cam.hardwareLevel == 0 ? "LIMITED" : (cam.hardwareLevel == 1 ? "FULL" : (cam.hardwareLevel == 2 ? "LEGACY" : "LEVEL_3"))}',
                                    style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurface.withValues(alpha: 0.6)),
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
