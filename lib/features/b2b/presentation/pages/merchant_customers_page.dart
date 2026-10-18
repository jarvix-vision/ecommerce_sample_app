// Merchant (B2B) Customers Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantCustomersPage extends ConsumerWidget {
  const MerchantCustomersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Customers')),
      body: ListView.separated(
        padding: EdgeInsets.all(customSpacing.lg),
        itemCount: 10,
        separatorBuilder: (_, __) => SizedBox(height: customSpacing.md),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(customSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(customRadius.lg),
              border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: colorScheme.primaryContainer,
                  child: Text(
                    'C${index + 1}',
                    style: TextStyle(color: colorScheme.onPrimaryContainer),
                  ),
                ),
                SizedBox(width: customSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Customer ${index + 1} Inc.',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'Tier: ${index % 3 == 0 ? 'Gold' : (index % 3 == 1 ? 'Silver' : 'Bronze')}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${(index + 1) * 12} orders',
                  style: theme.textTheme.labelMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
