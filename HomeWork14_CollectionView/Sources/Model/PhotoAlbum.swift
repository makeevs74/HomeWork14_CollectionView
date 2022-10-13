//
//  PhotoAlbum.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 13.10.2022.
//

import Foundation

struct PhotoAlbum {
    var name: String
    var photo: String
}

extension PhotoAlbum {
    static var albums = [
        // My albums
        [PhotoAlbum(name: "Недавние", photo: "Recent"),
         PhotoAlbum(name: "День рождения", photo: "Birhtday"),
         PhotoAlbum(name: "Дети", photo: "Kids"),
         PhotoAlbum(name: "Избранное", photo: "Favorites"),
         PhotoAlbum(name: "Ремонт", photo: "Renovation"),
         PhotoAlbum(name: "Путешетвия", photo: "Travel"),
         PhotoAlbum(name: "Машины", photo: "Cars"),
         PhotoAlbum(name: "WhatsApp", photo: "WhatsApp")],
        // Shared albums
        [PhotoAlbum(name: "Семья", photo: "Family"),
         PhotoAlbum(name: "Фото Sergey iPhone", photo: "Photo Sergey iPhone"),
         PhotoAlbum(name: "Фото Anastasia iPad", photo: "Photo Anastasia iPad")],
        // People and places
        [PhotoAlbum(name: "Места", photo: "Places")]
    ]
}
