//
//  CardsViewModel.swift
//  DishMatchApp
//
//  Created by 大江悠都 on 2025/01/28.
//

import Foundation

@MainActor
final class CardsViewModel: ObservableObject {
    @Published var shops = [Shop]() // Shopデータを直接保持
    @Published var buttonSwipeAction: SwipeAction? // スワイプアクションを保持
    @Published var likedShops: [Shop] = []
    
    // 一時的に削除されたShopを保存する配列
    private var removedShops: [Shop] = []
    // removedShopsに保存する最大数
    private let maxRemovedShopsCount = 5
    
    private let restaurantViewModel = RestaurantViewModel()
    
    init() {
    }
    
    /// 指定されたShopをshopsから削除し、removedShopsに保存する
    private func removeShop(_ shop: Shop) {
        guard let index = shops.firstIndex(where: { $0.id == shop.id }) else { return }
        // Shopを削除し、removedShopsに追加
        let removedShop = shops.remove(at: index)
        removedShops.append(removedShop)
        // removedShopsがmaxRemovedShopsCountを超えた場合、最古のShopを削除
        if removedShops.count > maxRemovedShopsCount {
            removedShops.removeFirst()
        }
        print("DEBUG: Removed shop with name: \(removedShop.name)")
    }
    /// 指定されたShopをlikedShopsリストに追加する
    private func likeShop(_ shop: Shop) {
        // 既にlikedShopsに存在する場合は追加しない
        guard !likedShops.contains(where: { $0.id == shop.id }) else {
            return
        }
        likedShops.append(shop)
        
        print("DEBUG🍎: Current likedShops:")
        for shop in likedShops {
            print(" - Name: \(shop.name), Address: \(shop.address), URL: \(shop.urls.pc)")
        }
    }
    /// LikeShopsListView用に、お気に入りのショップリストを提供
    private func getLikedShops() -> [Shop] {
        return likedShops
    }
}
