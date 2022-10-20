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
    var quantity: Int?
}

extension PhotoAlbum {
    static var albums = [
        // My albums
        [PhotoAlbum(name: "Недавние", photo: "Recent", quantity: 2312),
         PhotoAlbum(name: "Избранное", photo: "Favorites", quantity: 57),
         PhotoAlbum(name: "День рождения", photo: "Birhtday", quantity: 124),
         PhotoAlbum(name: "Дети", photo: "Kids", quantity: 319),
         PhotoAlbum(name: "Ремонт", photo: "Renovation", quantity: 42),
         PhotoAlbum(name: "Путешетвия", photo: "Travel", quantity: 215),
         PhotoAlbum(name: "Машины", photo: "Cars", quantity: 34),
         PhotoAlbum(name: "WhatsApp", photo: "WhatsApp", quantity: 26)],
        // Shared albums
        [PhotoAlbum(name: "Семья", photo: "Family"),
         PhotoAlbum(name: "Фото Sergey iPhone", photo: "Photo Sergey iPhone"),
         PhotoAlbum(name: "Фото iPad", photo: "Photo iPad")],
        // Type Of Media
        [PhotoAlbum(name: "Видео", photo: "video", quantity: 143),
         PhotoAlbum(name: "Селфи", photo: "person.crop.square", quantity: 19),
         PhotoAlbum(name: "Фото Live Photos", photo: "livephoto", quantity: 345),
         PhotoAlbum(name: "Портреты", photo: "cube", quantity: 52),
         PhotoAlbum(name: "Панорамы", photo: "pano", quantity: 17),
         PhotoAlbum(name: "Таймлапс", photo: "timelapse", quantity: 11),
         PhotoAlbum(name: "Замедленно", photo: "slowmo", quantity: 23),
         PhotoAlbum(name: "Серии", photo: "square.3.layers.3d.down.forward", quantity: 55),
         PhotoAlbum(name: "Снимки экрана", photo: "camera.viewfinder", quantity: 5),
         PhotoAlbum(name: "Запись экрана", photo: "record.circle", quantity: 3),
         PhotoAlbum(name: "Анимированные", photo: "square.stack.3d.forward.dottedline", quantity: 20)],
        // Other
        [PhotoAlbum(name: "Импортированные", photo: "square.and.arrow.down", quantity: 34),
         PhotoAlbum(name: "Дубликаты", photo: "square.on.square", quantity: 12),
         PhotoAlbum(name: "Скрытые", photo: "eye.slash", quantity: 24),
         PhotoAlbum(name: "Недавно удаленные", photo: "trash", quantity: 598)]
    ]
}

