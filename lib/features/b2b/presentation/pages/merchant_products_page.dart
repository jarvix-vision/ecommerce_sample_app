// Merchant (B2B) Products / Bulk Catalog Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantProductsPage extends ConsumerWidget {
  const MerchantProductsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Bulk Catalog')),
      body: ListView.separated(
        padding: EdgeInsets.all(customSpacing.lg),
        itemCount: 10,
        separatorBuilder: (_, __) => SizedBox(height: customSpacing.md),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => context.push('/b2b/product/B2B-$index'),
            borderRadius: BorderRadius.circular(customRadius.lg),
            child: Container(
            padding: EdgeInsets.all(customSpacing.md),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(customRadius.lg),
              border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
            ),
            child: Row(
              children: [
                Container(
                  width: 64,
                  height: 64,
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
                      Text(
                        'Product ${index + 1}',
                        style: theme.textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'SKU: B2B-${100 + index} • MOQ: ${(index + 1) * 5}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      SizedBox(height: customSpacing.xs),
                      Text(
                        'Tier pricing from \$${(index + 1) * 12}.00',
                        style: theme.textTheme.labelMedium?.copyWith(
                          color: colorScheme.secondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                FilledButton(
                  onPressed: () {},
                  style: FilledButton.styleFrom(
                    minimumSize: const Size(80, 36),
                  ),
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
        );
        },
      ),
    );
  }
}
