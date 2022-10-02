//
//  myAlbumsCell.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 11.09.2022.
//

import UIKit

class MyAlbumsCell: UICollectionViewCell {

    static let identifier = "MyAlbums"

    private lazy var name: UILabel = {
        let label = UILabel()
//        UICollectionViewListCell
        return label
    }()

    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
}
