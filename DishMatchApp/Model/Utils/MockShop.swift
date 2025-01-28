//
//  MockShop.swift
//  DishMatchApp
//
//  Created by 大江悠都 on 2025/01/28.
//

import Foundation

struct MockShop {
    static let mockShop = Shop(
        id : "12345",
        name: "Sushi Restaurant",
        genre: Genre(name: "Japanese", genreCatch: "Authentic Sushi Experience"),
        photo: Photo(pc: Pc(l: "https://example.com/image1.jpg")),
        address: "123 Tokyo Street",
        close: "None",
        open: "11:00 AM - 9:00 PM",
        shopCatch: "Best sushi in town!",
        urls: Urls(pc: "https://example.com/sushi"),
        stationName: "Shinjuku Station"
    )
}
