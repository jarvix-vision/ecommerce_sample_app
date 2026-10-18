// Merchant (B2B) Company Profile Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantCompanyProfilePage extends ConsumerWidget {
  const MerchantCompanyProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(title: const Text('Company Profile')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(customSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(radius: 40, backgroundColor: colorScheme.primaryContainer, child: Icon(Icons.business, color: colorScheme.onPrimaryContainer, size: 36)),
            SizedBox(height: customSpacing.lg),
            Text('Acme Corp', style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
            SizedBox(height: customSpacing.xs),
            Text('Tier: Gold Partner', style: theme.textTheme.bodyMedium?.copyWith(color: colorScheme.secondary, fontWeight: FontWeight.w600)),
            SizedBox(height: customSpacing.lg),
            _row('Tax ID', '12-3456789'),
            _row('Credit Limit', '\$50,000'),
            _row('Available Credit', '\$32,400'),
            _row('Payment Terms', 'Net 30'),
            _row('Shipping Address', '123 Industrial Rd, Springfield, IL'),
            SizedBox(height: customSpacing.xl),
            FilledButton(onPressed: () {}, child: const Text('Edit Company Info')),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text(value),
        ],
      ),
    );
  }
}
