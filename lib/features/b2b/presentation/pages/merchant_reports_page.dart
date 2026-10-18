// Merchant (B2B) Reports Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantReportsPage extends ConsumerWidget {
  const MerchantReportsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Reports & Analytics')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(customSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sales Overview', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.md),
            Row(
              children: [
                Expanded(child: _statCard(context, 'Revenue', '\$48.2k')),
                SizedBox(width: customSpacing.md),
                Expanded(child: _statCard(context, 'Orders', '124')),
              ],
            ),
            SizedBox(height: customSpacing.md),
            Row(
              children: [
                Expanded(child: _statCard(context, 'Avg Order', '\$389')),
                SizedBox(width: customSpacing.md),
                Expanded(child: _statCard(context, 'Customers', '38')),
              ],
            ),
            SizedBox(height: customSpacing.lg),
            Text('Top Products', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.md),
            ...List.generate(5, (i) => Container(
                  margin: EdgeInsets.only(bottom: customSpacing.sm),
                  padding: EdgeInsets.all(customSpacing.md),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(customRadius.md),
                    border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product ${i + 1}'),
                      Text('\$${(i + 1) * 1200}', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  Widget _statCard(BuildContext context, String label, String value) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;
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
          Text(value, style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          Text(label, style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}
