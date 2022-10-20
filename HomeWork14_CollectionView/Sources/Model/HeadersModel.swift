//
//  HeadersModel.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 20.10.2022.
//

import Foundation

struct Header {
    var name: String
    var buttonHeader: String?
}

extension Header {
    static var headers = [
    Header(name: "Мои альбомы", buttonHeader: "Все"),
    Header(name: "Общие альбомы", buttonHeader: "Все"),
    Header(name: "Типы медиафайлов"),
    Header(name: "Другое")]
}
