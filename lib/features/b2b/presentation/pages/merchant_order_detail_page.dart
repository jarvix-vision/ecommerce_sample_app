// Merchant (B2B) Order Detail Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantOrderDetailPage extends ConsumerWidget {
  final String orderId;

  const MerchantOrderDetailPage({super.key, required this.orderId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: Text('Order $orderId')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(customSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Status: Processing', style: theme.textTheme.titleMedium?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.md),
            Text('PO: PO-12345', style: theme.textTheme.bodyMedium),
            Text('Customer: Acme Corp', style: theme.textTheme.bodyMedium),
            Text('Order Date: 10/12/2026', style: theme.textTheme.bodyMedium),
            SizedBox(height: customSpacing.lg),
            Text('Items', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.md),
            ...List.generate(3, (i) => Container(
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
                      Text('Product ${i + 1} x ${(i + 1) * 5}'),
                      Text('\$${(i + 1) * 120}.00', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                )),
            SizedBox(height: customSpacing.lg),
            Text('Total: \$540.00', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.xl),
            Row(
              children: [
                Expanded(child: OutlinedButton(onPressed: () => context.push('/b2b/invoices'), child: const Text('View Invoice'))),
                SizedBox(width: customSpacing.md),
                Expanded(child: FilledButton(onPressed: () => context.push('/b2b/shipments'), child: const Text('Track Shipment'))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
