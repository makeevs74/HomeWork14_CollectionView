//
//  myAlbumsCell.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 11.09.2022.
//

import UIKit
import SnapKit

class MyAlbumsCell: UICollectionViewCell {

    static let identifier = "MyAlbums"

    // MARK: - Outlets

    private lazy var nameOfPhoto: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()

    private lazy var photo: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        return image
    }()

    lazy var quantityOfPhoto: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.text = "Автор: я"
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
            make.height.equalTo(contentView.snp.height).multipliedBy(0.8)
        }

        stack.snp.makeConstraints { make in
            make.top.equalTo(photo.snp.bottom).offset(5)
        }
    }

    // MARK: - Congigure

    func configure(album: PhotoAlbum) {
        self.nameOfPhoto.text = album.name
        self.photo.image = UIImage(named: album.photo)
        if let photoCount = album.quantity {
            self.quantityOfPhoto.text = String(photoCount)
        }

    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameOfPhoto.text = nil
//        quantityOfPhoto.text = nil
        photo.image = nil
    }
}
