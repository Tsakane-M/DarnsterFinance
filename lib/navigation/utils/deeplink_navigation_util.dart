import 'package:auto_route/auto_route.dart';
import 'package:core/domain/models/filters/filter_query.dart';
import 'package:ecom_ui/components/webview/webview_config.dart';
import 'package:ecom_ui/util/web_view_utils.dart';
import 'package:fledge_common/exceptions/base_exception.dart';
import 'package:flutter/material.dart';

import '../../deeplinking/deep_link/deep_link.dart' as bash_deeplink;
import '../../deeplinking/deep_link/deep_link_account/deep_link_account.dart';
import '../../deeplinking/deep_link/deep_link_account/deep_link_account_addresses.dart';
import '../../deeplinking/deep_link/deep_link_account/deep_link_account_cards.dart';
import '../../deeplinking/deep_link/deep_link_account/deep_link_account_orders.dart';
import '../../deeplinking/deep_link/deep_link_account/deep_link_account_profile.dart';
import '../../deeplinking/deep_link/deep_link_account/deep_link_account_wishlist.dart';
import '../../deeplinking/deep_link/deep_link_brand.dart';
import '../../deeplinking/deep_link/deep_link_department.dart';
import '../../deeplinking/deep_link/deep_link_general_content_page.dart';
import '../../deeplinking/deep_link/deep_link_pdp.dart';
import '../../deeplinking/deep_link/deep_link_plp.dart';
import '../../deeplinking/deep_link/deep_link_plp_headless.dart';
import '../../deeplinking/deep_link/deep_link_plp_map.dart';
import '../../deeplinking/deep_link/deep_link_plp_search.dart';
import '../../deeplinking/deep_link/deep_link_storefront.dart';
import '../../deeplinking/deep_link/deep_link_web.dart';
import '../../pages/home/content_driven_page/content_driven_page_type.dart';
import '../../widgets/molecules/error_state_manager/error_state_manager_widget.dart';
import '../app_router.gr.dart';

class DeeplinkNavigationUtil {
  static Future<void> handleDeeplink(
    bash_deeplink.DeepLink deepLink,
    BuildContext context,
  ) async {
    final bash_deeplink.DeepLink castDeeplink = deepLink;
    if (castDeeplink is DeepLinkPDP) {
      final String? bySku = castDeeplink.sku;
      final String slug = castDeeplink.productSlug;
      if (bySku != null) {
        AutoRouter.of(context, watch: false)
            .push(ProductDetailPageRoute(sku: bySku));
        return;
      } else {
        // hard mode by slug
        // do dirty api call here.
        AutoRouter.of(context, watch: false)
            .push(ProductDetailPageRoute(slug: slug));
        return;
      }
    } else if (castDeeplink is DeepLinkDepartment) {
      context.navigateTo(
        DepartmentsRouter(
          children: <PageRouteInfo>[
            DepartmentsPageRoute(deepLinkSlug: castDeeplink.departmentSlug)
          ],
        ),
      );
    } else if (castDeeplink is DeepLinkPLP) {
      _navigateToPlpWithDeepLink(castDeeplink, context: context);
    } else if (castDeeplink is DeepLinkStorefront) {
      context.pushRoute(ContentDrivenPageRoute(
        slug: castDeeplink.storeSlug,
        type: ContentDrivenPageType.storefront.name,
      ));
    } else if (castDeeplink is DeepLinkPlpHeadless) {
      context.pushRoute(
        ProductListPageRoute(
          persistentFilters: castDeeplink.persistentFilters,
          filters: castDeeplink.filters,
          searchText: castDeeplink.searchTerm,
          storeSlug: castDeeplink.storeSlug,
          sortByType: castDeeplink.sortOption,
        ),
      );
    } else if (castDeeplink is DeepLinkGeneralContentPage) {
      context.pushRoute(ContentDrivenPageRoute(
        slug: castDeeplink.contentPath,
        type: ContentDrivenPageType.generalPage.name,
      ));
    } else if (castDeeplink is DeepLinkPLPSearch) {
      _navigateToPlpSearchWithDeepLink(castDeeplink, context: context);
    } else if (castDeeplink is DeepLinkWeb) {
      WebViewUtils.showWebViewBottomSheet(
        context,
        config: WebViewConfig(urlString: castDeeplink.deepLinkUrl),
      );
    } else if (castDeeplink is DeepLinkPlpMap) {
      _navigateToPlpWithFiltersDeepLink(castDeeplink, context: context);
    } else if (castDeeplink is DeepLinkBrand) {
      context.pushRoute(ContentDrivenPageRoute(
        slug: castDeeplink.brandSlug,
        type: ContentDrivenPageType.brand.name,
      ));
    } else if (castDeeplink is DeepLinkAccount) {
      _navigateToAccountRoute(castDeeplink, context: context);
    }
  }

  static void _navigateToAccountRoute(
    DeepLinkAccount deeplink, {
    required BuildContext context,
  }) {
    if (deeplink is DeepLinkAccountAddresses) {
      context.navigateTo(
        ProfileRouter(
          children: <PageRouteInfo>[
            const ProfilePageRoute(),
            AddressListWrapperPageRoute(
              errorBuilder: (
                BaseException exception,
                Future<void> Function() buttonPress,
              ) {
                return ErrorStateManagerWidget(
                  exception: exception,
                  onRefresh: buttonPress,
                );
              },
            ),
          ],
        ),
      );
    } else if (deeplink is DeepLinkAccountCards) {
      context.navigateTo(
        const ProfileRouter(),
      );
    } else if (deeplink is DeepLinkAccountOrders) {
      context.navigateTo(
        const ProfileRouter(
          children: <PageRouteInfo>[
            ProfilePageRoute(),
            OrderHistoryPageRoute(),
          ],
        ),
      );
    } else if (deeplink is DeepLinkAccountProfile) {
      context.navigateTo(
        const ProfileRouter(
          children: <PageRouteInfo>[
            ProfilePageRoute(),
            ProfileDetailsPageRoute(),
          ],
        ),
      );
    } else if (deeplink is DeepLinkAccountWishlist) {
      context.navigateTo(
        const WishlistRouter(),
      );
    }
  }

  static void _navigateToPlpWithDeepLink(
    DeepLinkPLP deeplink, {
    required BuildContext context,
  }) {
    final List<FilterQuery> persistentFilters = <FilterQuery>[
      FilterQuery(
        filterKey: 'category-1',
        filterValue: deeplink.category1,
      ),
    ];
    final String? category2 = deeplink.category2;
    if (category2 != null) {
      persistentFilters.add(
        FilterQuery(
          filterKey: 'category-2',
          filterValue: category2,
        ),
      );
    }
    final String? category3 = deeplink.category3;
    if (category3 != null) {
      persistentFilters.add(
        FilterQuery(
          filterKey: 'category-3',
          filterValue: category3,
        ),
      );
    }


    context.pushRoute(
      ProductListPageRoute(
        searchText: null,
        persistentFilters: persistentFilters,
        filters: deeplink.filters,
        sortByType: deeplink.sortOption,
      ),
    );
  }

  static void _navigateToPlpSearchWithDeepLink(
    DeepLinkPLPSearch deeplink, {
    required BuildContext context,
  }) {
    context.pushRoute(
      ProductListPageRoute(
        searchText: deeplink.searchTerm,
        persistentFilters: deeplink.persistentFilters,
        sortByType: deeplink.sortOption,
        filters: deeplink.filters,
      ),
    );
  }

  static void _navigateToPlpWithFiltersDeepLink(
    DeepLinkPlpMap deeplink, {
    required BuildContext context,
  }) {
    context.pushRoute(
      ProductListPageRoute(
        persistentFilters: deeplink.persistentFilters,
        filters: deeplink.filters,
        searchText: deeplink.searchTerm,
        storeSlug: deeplink.storeSlug,
        sortByType: deeplink.sortOption,
      ),
    );
  }
}
