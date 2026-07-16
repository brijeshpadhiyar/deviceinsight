import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'glass_card.dart';
import '../../../core/constants/app_sizes.dart';

class EducationalCard extends StatefulWidget {
  final String title;
  final String content;
  final IconData icon;
  final List<String>? optimizationTips;

  const EducationalCard({
    super.key,
    required this.title,
    required this.content,
    required this.icon,
    this.optimizationTips,
  });

  @override
  State<EducationalCard> createState() => _EducationalCardState();
}

class _EducationalCardState extends State<EducationalCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return GlassCard(
      padding: EdgeInsets.zero,
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (expanded) {
            setState(() => _isExpanded = expanded);
          },
          tilePadding: const EdgeInsets.symmetric(horizontal: AppSizes.p20, vertical: AppSizes.p8),
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(widget.icon, color: theme.colorScheme.primary),
          ),
          title: Text(
            widget.title,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
          childrenPadding: const EdgeInsets.fromLTRB(AppSizes.p20, 0, AppSizes.p20, AppSizes.p20),
          children: [
            Text(
              widget.content,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.8),
                height: 1.5,
              ),
            ).animate(target: _isExpanded ? 1 : 0).fadeIn().slideY(begin: 0.2, end: 0),
            if (widget.optimizationTips != null && widget.optimizationTips!.isNotEmpty) ...[
              gapH16,
              Container(
                padding: const EdgeInsets.all(AppSizes.p16),
                decoration: BoxDecoration(
                  color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.3),
                  borderRadius: BorderRadius.circular(AppSizes.radiusSmall),
                  border: Border.all(color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.5)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb_outline, color: theme.colorScheme.secondary, size: 20),
                        gapW8,
                        Text(
                          'Optimization Tips',
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    gapH12,
                    ...widget.optimizationTips!.map((tip) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('• ', style: TextStyle(color: theme.colorScheme.secondary, fontWeight: FontWeight.bold)),
                          Expanded(
                            child: Text(
                              tip,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                color: theme.colorScheme.onSurface.withValues(alpha: 0.9),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ).animate(target: _isExpanded ? 1 : 0).fadeIn(delay: 100.ms).slideY(begin: 0.2, end: 0),
            ]
          ],
        ),
      ),
    );
  }
}
