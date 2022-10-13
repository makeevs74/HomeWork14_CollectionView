//
//  SharedAlbumsCell.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 13.10.2022.
//

import UIKit

class SharedAlbumsCell: UICollectionViewCell {

    static let identifier = "SharedAlbums"

    // MARK: - Outlets

    private lazy var nameOfPhoto: UILabel = {
        let label = UILabel()
        label.textColor = .black
//        UICollectionViewListCell
        return label
    }()

    private lazy var photo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()

    private lazy var quantityOfPhoto: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        return label
    }()

    private lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 2
        return stack
    }()

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }

    // MARK: - Setup

    private func setupHierarchy() {
        stack.addArrangedSubview(nameOfPhoto)
        stack.addArrangedSubview(quantityOfPhoto)
        contentView.addSubview(photo)
        contentView.addSubview(stack)
    }

    private func setupLayout() {
        photo.snp.makeConstraints { make in
            make.top.right.left.equalTo(contentView)
            make.height.equalTo(contentView.snp.height).multipliedBy(1.05)
        }

        stack.snp.makeConstraints { make in
            make.top.equalTo(photo.snp.bottom).multipliedBy(1.05)
        }
    }

    // MARK: - Congigure

    func configure(album: PhotoAlbum) {
        self.nameOfPhoto.text = album.name
        self.photo.image = UIImage(named: album.photo)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameOfPhoto.text = nil
        photo.image = nil
    }
}
