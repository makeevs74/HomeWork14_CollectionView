//
//  TypeOfMediaAndOthers.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 19.10.2022.
//

import UIKit

class TypeOfMediaAndOthers: UICollectionViewListCell {

    static let identifier = "TypeOfMediaAndOthers"

    // MARK: - Outlets -

    private lazy var photoIcon: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemBlue
        return image
    }()

    private lazy var photoChevron: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFit
        image.tintColor = .systemGray
        image.image = UIImage(systemName: "chevron.right")
        return image
    }()

    private lazy var nameOfSetting: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textColor = .systemBlue
        return label
    }()

    private lazy var quantity: UILabel = {
        let descriptionText = UILabel()
        descriptionText.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        descriptionText.textColor = .systemGray
        return descriptionText
    }()

    // MARK: - Initialisers -

//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup -

    private func setupHierarchy() {
        addSubview(nameOfSetting)
        addSubview(quantity)
        addSubview(photoIcon)
        addSubview(photoChevron)
    }

    private func setupLayout() {
        photoIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.height.width.equalTo(27)
            make.left.equalToSuperview().offset(5)
        }

        nameOfSetting.snp.makeConstraints { make in
            make.centerY.equalTo(photoIcon)
            make.left.equalTo(photoIcon.snp.right).offset(10)
        }

        photoChevron.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-15)
        }

        quantity.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalTo(photoChevron.snp.left).offset(-5)
        }
    }

    // MARK: - Reuse -

    func configureCell(album: PhotoAlbum) {
        self.photoIcon.image = UIImage(systemName: album.photo)
        self.nameOfSetting.text = album.name
        self.quantity.text = String(album.quantity ?? 0)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        photoIcon.image = nil
        nameOfSetting.text = nil
    }
}
