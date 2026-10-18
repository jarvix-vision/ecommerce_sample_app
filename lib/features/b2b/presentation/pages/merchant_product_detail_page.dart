// Merchant (B2B) Product Detail Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantProductDetailPage extends ConsumerWidget {
  final String productId;

  const MerchantProductDetailPage({super.key, required this.productId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: Text('Product $productId')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(customSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 220,
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerHighest,
                      borderRadius: BorderRadius.circular(customRadius.lg),
                    ),
                    child: Center(
                      child: Icon(Icons.inventory_2_outlined, size: 64, color: colorScheme.primary),
                    ),
                  ),
                  SizedBox(height: customSpacing.lg),
                  Text('Industrial Widget ${productId}', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(height: customSpacing.xs),
                  Text('SKU: B2B-$productId • Lead time: 5-7 days', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                  SizedBox(height: customSpacing.lg),
                  Text('Bulk Pricing Tiers', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                  SizedBox(height: customSpacing.md),
                  ...[1, 50, 100, 500].map((qty) => Container(
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
                            Text('$qty+ units', style: theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600)),
                            Text('\$${(100 - qty ~/ 10).clamp(1, 100)}.00 / unit', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.secondary, fontWeight: FontWeight.w600)),
                          ],
                        ),
                      )),
                  SizedBox(height: customSpacing.lg),
                  Text('MOQ: 5 units', style: theme.textTheme.bodyMedium),
                  SizedBox(height: customSpacing.xl),
                  FilledButton(
                    onPressed: () => context.push('/b2b/cart'),
                    child: const Text('Add to Bulk Cart'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
