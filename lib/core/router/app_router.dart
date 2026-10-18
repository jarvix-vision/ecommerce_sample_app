// App Router Configuration
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/auth/presentation/pages/register_page.dart';
import '../../features/auth/presentation/pages/forgot_password_page.dart';
import '../../features/auth/presentation/pages/verify_email_page.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/products/presentation/pages/product_list_page.dart';
import '../../features/products/presentation/pages/product_detail_page.dart';
import '../../features/products/presentation/pages/category_page.dart';
import '../../features/cart/presentation/pages/cart_page.dart';
import '../../features/checkout/presentation/pages/checkout_page.dart';
import '../../features/orders/presentation/pages/orders_page.dart';
import '../../features/orders/presentation/pages/order_detail_page.dart';
import '../../features/profile/presentation/pages/profile_page.dart';
import '../../features/profile/presentation/pages/edit_profile_page.dart';
import '../../features/profile/presentation/pages/addresses_page.dart';
import '../../features/profile/presentation/pages/payment_methods_page.dart';
import '../../features/search/presentation/pages/search_page.dart';
import '../../features/wishlist/presentation/pages/wishlist_page.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/b2b/presentation/pages/merchant_dashboard_page.dart';
import '../../features/b2b/presentation/pages/merchant_orders_page.dart';
import '../../features/b2b/presentation/pages/merchant_products_page.dart';
import '../../features/b2b/presentation/pages/merchant_quotes_page.dart';
import '../../features/b2b/presentation/pages/merchant_invoices_page.dart';
import '../../features/b2b/presentation/pages/merchant_customers_page.dart';
import '../../features/b2b/presentation/pages/merchant_product_detail_page.dart';
import '../../features/b2b/presentation/pages/merchant_cart_page.dart';
import '../../features/b2b/presentation/pages/merchant_checkout_page.dart';
import '../../features/b2b/presentation/pages/merchant_order_detail_page.dart';
import '../../features/b2b/presentation/pages/merchant_company_profile_page.dart';
import '../../features/b2b/presentation/pages/merchant_approvals_page.dart';
import '../../features/b2b/presentation/pages/merchant_shipments_page.dart';
import '../../features/b2b/presentation/pages/merchant_reports_page.dart';
import '../../shared/widgets/main_scaffold.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      // Auth redirect logic would go here
      // final authState = ref.read(authProvider);
      // if (!authState.isAuthenticated && !_isPublicRoute(state.matchedLocation)) {
      //   return '/login';
      // }
      return null;
    },
    routes: [
      // Shell route with bottom navigation
      ShellRoute(
        builder: (context, state, child) => MainScaffold(child: child),
        routes: [
          // Home Tab
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomePage(),
            routes: [
              GoRoute(
                path: 'category/:id',
                name: 'category',
                builder: (context, state) => CategoryPage(
                  categoryId: state.pathParameters['id']!,
                ),
              ),
              GoRoute(
                path: 'products',
                name: 'products',
                builder: (context, state) => ProductListPage(
                  categoryId: state.uri.queryParameters['category_id'],
                  searchQuery: state.uri.queryParameters['search'],
                ),
              ),
              GoRoute(
                path: 'product/:id',
                name: 'product-detail',
                builder: (context, state) => ProductDetailPage(
                  productId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          // Search Tab
          GoRoute(
            path: '/search',
            name: 'search',
            builder: (context, state) => const SearchPage(),
          ),
          // Cart Tab
          GoRoute(
            path: '/cart',
            name: 'cart',
            builder: (context, state) => const CartPage(),
            routes: [
              GoRoute(
                path: 'checkout',
                name: 'checkout',
                builder: (context, state) => const CheckoutPage(),
              ),
            ],
          ),
          // Orders Tab
          GoRoute(
            path: '/orders',
            name: 'orders',
            builder: (context, state) => const OrdersPage(),
            routes: [
              GoRoute(
                path: ':id',
                name: 'order-detail',
                builder: (context, state) => OrderDetailPage(
                  orderId: state.pathParameters['id']!,
                ),
              ),
            ],
          ),
          // Profile Tab
          GoRoute(
            path: '/profile',
            name: 'profile',
            builder: (context, state) => const ProfilePage(),
            routes: [
              GoRoute(
                path: 'edit',
                name: 'edit-profile',
                builder: (context, state) => const EditProfilePage(),
              ),
              GoRoute(
                path: 'addresses',
                name: 'addresses',
                builder: (context, state) => const AddressesPage(),
              ),
              GoRoute(
                path: 'payment-methods',
                name: 'payment-methods',
                builder: (context, state) => const PaymentMethodsPage(),
              ),
              GoRoute(
                path: 'wishlist',
                name: 'wishlist',
                builder: (context, state) => const WishlistPage(),
              ),
              GoRoute(
                path: 'settings',
                name: 'settings',
                builder: (context, state) => const SettingsPage(),
              ),
              GoRoute(
                path: 'notifications',
                name: 'notifications',
                builder: (context, state) => const NotificationsPage(),
              ),
            ],
          ),
        ],
      ),

      // Auth Routes (outside shell)
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/register',
        name: 'register',
        builder: (context, state) => const RegisterPage(),
      ),
      GoRoute(
        path: '/forgot-password',
        name: 'forgot-password',
        builder: (context, state) => const ForgotPasswordPage(),
      ),
      GoRoute(
        path: '/verify-email',
        name: 'verify-email',
        builder: (context, state) => VerifyEmailPage(
          email: state.uri.queryParameters['email'] ?? '',
        ),
      ),
      // B2B / Merchant portal routes
      GoRoute(
        path: '/b2b',
        name: 'b2b-dashboard',
        builder: (context, state) => const MerchantDashboardPage(),
        routes: [
          GoRoute(
            path: 'orders',
            name: 'b2b-orders',
            builder: (context, state) => const MerchantOrdersPage(),
          ),
          GoRoute(
            path: 'products',
            name: 'b2b-products',
            builder: (context, state) => const MerchantProductsPage(),
          ),
          GoRoute(
            path: 'quotes',
            name: 'b2b-quotes',
            builder: (context, state) => const MerchantQuotesPage(),
          ),
          GoRoute(
            path: 'invoices',
            name: 'b2b-invoices',
            builder: (context, state) => const MerchantInvoicesPage(),
          ),
          GoRoute(
            path: 'customers',
            name: 'b2b-customers',
            builder: (context, state) => const MerchantCustomersPage(),
          ),
          GoRoute(
            path: 'product/:id',
            name: 'b2b-product-detail',
            builder: (context, state) => MerchantProductDetailPage(
              productId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: 'cart',
            name: 'b2b-cart',
            builder: (context, state) => const MerchantCartPage(),
          ),
          GoRoute(
            path: 'checkout',
            name: 'b2b-checkout',
            builder: (context, state) => const MerchantCheckoutPage(),
          ),
          GoRoute(
            path: 'order/:id',
            name: 'b2b-order-detail',
            builder: (context, state) => MerchantOrderDetailPage(
              orderId: state.pathParameters['id']!,
            ),
          ),
          GoRoute(
            path: 'company',
            name: 'b2b-company',
            builder: (context, state) => const MerchantCompanyProfilePage(),
          ),
          GoRoute(
            path: 'approvals',
            name: 'b2b-approvals',
            builder: (context, state) => const MerchantApprovalsPage(),
          ),
          GoRoute(
            path: 'shipments',
            name: 'b2b-shipments',
            builder: (context, state) => const MerchantShipmentsPage(),
          ),
          GoRoute(
            path: 'reports',
            name: 'b2b-reports',
            builder: (context, state) => const MerchantReportsPage(),
          ),
        ],
      ),
      GoRoute(
        path: '/merchant',
        name: 'merchant-dashboard',
        redirect: (context, state) => '/b2b',
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.red),
            const SizedBox(height: 16),
            Text('Page not found: ${state.error}'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go Home'),
            ),
          ],
        ),
      ),
    ),
  );
}

// Helper to check if route is public
bool _isPublicRoute(String location) {
  const publicRoutes = [
    '/login',
    '/register',
    '/forgot-password',
    '/verify-email',
  ];
  return publicRoutes.any((route) => location.startsWith(route));
}