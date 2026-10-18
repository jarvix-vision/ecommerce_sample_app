// Merchant (B2B) Bulk Cart Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantCartPage extends ConsumerWidget {
  const MerchantCartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Bulk Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(customSpacing.lg),
              itemCount: 4,
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
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: colorScheme.surfaceContainerHighest,
                          borderRadius: BorderRadius.circular(customRadius.md),
                        ),
                        child: Icon(Icons.inventory_2_outlined, color: colorScheme.primary),
                      ),
                      SizedBox(width: customSpacing.md),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Product ${index + 1}', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                            Text('MOQ: 5 • Tier price', style: theme.textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          IconButton(onPressed: () {}, icon: const Icon(Icons.remove_circle_outline)),
                          Text('${(index + 1) * 10}', style: theme.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(customSpacing.lg),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              border: Border(top: BorderSide(color: colorScheme.outlineVariant)),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Subtotal', style: theme.textTheme.bodyLarge),
                    Text('\$1,240.00', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
                  ],
                ),
                SizedBox(height: customSpacing.md),
                FilledButton(
                  onPressed: () => context.push('/b2b/checkout'),
                  child: const Text('Proceed to Checkout'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
