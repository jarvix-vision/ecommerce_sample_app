// Merchant (B2B) Shipments Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantShipmentsPage extends ConsumerWidget {
  const MerchantShipmentsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Shipments')),
      body: ListView.separated(
        padding: EdgeInsets.all(customSpacing.lg),
        itemCount: 7,
        separatorBuilder: (_, __) => SizedBox(height: customSpacing.md),
        itemBuilder: (context, index) {
          final statuses = ['In Transit', 'Delivered', 'Processing', 'Delayed'];
          final status = statuses[index % statuses.length];
          return Container(
            padding: EdgeInsets.all(customSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(customRadius.lg),
              border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                Icon(Icons.local_shipping_outlined, color: colorScheme.primary),
                SizedBox(width: customSpacing.md),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Shipment #SH-${700 + index}', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                      Text('Carrier: FedEx • Tracking: 1Z999${index}', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ),
                Text(status, style: theme.textTheme.labelSmall?.copyWith(color: colorScheme.onSurfaceVariant)),
              ],
            ),
          );
        },
      ),
    );
  }
}
