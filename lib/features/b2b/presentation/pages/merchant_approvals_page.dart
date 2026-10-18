// Merchant (B2B) Approvals Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantApprovalsPage extends ConsumerWidget {
  const MerchantApprovalsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Approvals')),
      body: ListView.separated(
        padding: EdgeInsets.all(customSpacing.lg),
        itemCount: 6,
        separatorBuilder: (_, __) => SizedBox(height: customSpacing.md),
        itemBuilder: (context, index) {
          return Container(
            padding: EdgeInsets.all(customSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(customRadius.lg),
              border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Order #B2B-${5000 + index}', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                    Text('Pending', style: theme.textTheme.labelSmall?.copyWith(color: AppColors.warning)),
                  ],
                ),
                SizedBox(height: customSpacing.xs),
                Text('Requested by: Buyer ${index + 1}', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                Text('Amount: \$${(index + 1) * 400}.00', style: theme.textTheme.bodySmall),
                SizedBox(height: customSpacing.md),
                Row(
                  children: [
                    Expanded(child: OutlinedButton(onPressed: () {}, child: const Text('Reject'))),
                    SizedBox(width: customSpacing.md),
                    Expanded(child: FilledButton(onPressed: () {}, child: const Text('Approve'))),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
