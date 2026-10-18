// Merchant (B2B) Checkout Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantCheckoutPage extends ConsumerWidget {
  const MerchantCheckoutPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Merchant Checkout')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(customSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Purchase Order', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.md),
            TextField(decoration: const InputDecoration(labelText: 'PO Number')),
            SizedBox(height: customSpacing.md),
            DropdownButtonFormField<String>(
              items: const [
                DropdownMenuItem(value: 'net30', child: Text('Net 30')),
                DropdownMenuItem(value: 'net60', child: Text('Net 60')),
                DropdownMenuItem(value: 'cod', child: Text('Cash on Delivery')),
              ],
              onChanged: (_) {},
              decoration: const InputDecoration(labelText: 'Payment Terms'),
            ),
            SizedBox(height: customSpacing.lg),
            Text('Shipping Address', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.md),
            Container(
              padding: EdgeInsets.all(customSpacing.md),
              decoration: BoxDecoration(
                color: colorScheme.surface,
                borderRadius: BorderRadius.circular(customRadius.lg),
                border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
              ),
              child: Text('Acme Corp Warehouse\n123 Industrial Rd, Suite 4\nSpringfield, IL 62701', style: theme.textTheme.bodyMedium),
            ),
            SizedBox(height: customSpacing.lg),
            Text('Order Summary', style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.md),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Subtotal'), Text('\$1,240.00')]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Tax'), Text('\$99.20')]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Shipping'), Text('\$45.00')]),
            Divider(height: customSpacing.lg),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Total', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
              Text('\$1,384.20', style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w700)),
            ]),
            SizedBox(height: customSpacing.xl),
            FilledButton(
              onPressed: () => context.go('/b2b/orders'),
              child: const Text('Place Order'),
            ),
          ],
        ),
      ),
    );
  }
}
