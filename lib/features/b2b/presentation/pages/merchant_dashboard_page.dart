// Merchant (B2B) Dashboard Page
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/theme/app_theme.dart';

class MerchantDashboardPage extends ConsumerWidget {
  const MerchantDashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Merchant Portal'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () => context.push('/profile/notifications'),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(customSpacing.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back, Acme Corp',
                    style: theme.textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: customSpacing.xs),
                  Text(
                    'B2B merchant dashboard',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: customSpacing.lg),
                  _KpiRow(),
                  SizedBox(height: customSpacing.lg),
                  Text(
                    'Quick Actions',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: customSpacing.md),
                  _QuickActions(),
                  SizedBox(height: customSpacing.lg),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Recent Orders',
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextButton(
                        onPressed: () => context.push('/b2b/orders'),
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                  SizedBox(height: customSpacing.md),
                  ...List.generate(4, (i) => _OrderTile(index: i)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _KpiRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customSpacing = context.customSpacing;
    final items = [
      ('Revenue', '\$12.4k', Icons.trending_up),
      ('Orders', '48', Icons.receipt_long),
      ('Quotes', '7', Icons.request_quote),
      ('Low Stock', '3', Icons.warning_amber),
    ];
    return LayoutBuilder(
      builder: (context, constraints) {
        final isWide = constraints.maxWidth >= 600;
        final crossAxisCount = isWide ? 4 : 2;
        return GridView.count(
          crossAxisCount: crossAxisCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: customSpacing.md,
          crossAxisSpacing: customSpacing.md,
          childAspectRatio: 1.6,
          children: items
              .map((e) => _KpiCard(label: e.$1, value: e.$2, icon: e.$3))
              .toList(),
        );
      },
    );
  }
}

class _KpiCard extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const _KpiCard({required this.label, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(icon, color: colorScheme.primary, size: 22),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                value,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final customSpacing = context.customSpacing;
    final actions = [
      ('Products', Icons.inventory_2_outlined, '/b2b/products'),
      ('Quotes', Icons.request_quote_outlined, '/b2b/quotes'),
      ('Invoices', Icons.receipt_outlined, '/b2b/invoices'),
      ('Customers', Icons.people_outline, '/b2b/customers'),
      ('Company', Icons.business_outlined, '/b2b/company'),
      ('Approvals', Icons.approval_outlined, '/b2b/approvals'),
      ('Shipments', Icons.local_shipping_outlined, '/b2b/shipments'),
      ('Reports', Icons.bar_chart_outlined, '/b2b/reports'),
    ];
    return Wrap(
      spacing: customSpacing.md,
      runSpacing: customSpacing.md,
      children: actions
          .map(
            (a) => SizedBox(
              width: 150,
              child: _ActionCard(label: a.$1, icon: a.$2, route: a.$3),
            ),
          )
          .toList(),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final String route;

  const _ActionCard({required this.label, required this.icon, required this.route});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    return InkWell(
      onTap: () => context.push(route),
      borderRadius: BorderRadius.circular(customRadius.lg),
      child: Container(
        padding: EdgeInsets.all(customSpacing.md),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer.withValues(alpha: 0.4),
          borderRadius: BorderRadius.circular(customRadius.lg),
        ),
        child: Column(
          children: [
            Icon(icon, color: colorScheme.primary, size: 28),
            SizedBox(height: customSpacing.sm),
            Text(
              label,
              style: theme.textTheme.labelLarge?.copyWith(
                color: colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderTile extends StatelessWidget {
  final int index;

  const _OrderTile({required this.index});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final customSpacing = context.customSpacing;
    final customRadius = context.customRadius;

    final statuses = ['Processing', 'Shipped', 'Delivered', 'Pending'];
    final status = statuses[index % statuses.length];

    return Container(
      margin: EdgeInsets.only(bottom: customSpacing.md),
      padding: EdgeInsets.all(customSpacing.md),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(customRadius.lg),
        border: Border.all(color: colorScheme.outlineVariant.withValues(alpha: 0.5)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(customRadius.md),
            ),
            child: Icon(Icons.receipt_long_outlined, color: colorScheme.primary),
          ),
          SizedBox(width: customSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order #B2B-${1000 + index}',
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Acme Corp • \$${(index + 1) * 240}.00',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: customSpacing.sm,
              vertical: customSpacing.xs,
            ),
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: BorderRadius.circular(customRadius.full),
            ),
            child: Text(
              status,
              style: theme.textTheme.labelSmall?.copyWith(
                color: colorScheme.onPrimaryContainer,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
