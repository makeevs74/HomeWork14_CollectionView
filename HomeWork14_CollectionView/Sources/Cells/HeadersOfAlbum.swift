//
//  HeadersOfAlbum.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 19.10.2022.
//

import UIKit

class HeadersOfAlbum: UICollectionReusableView {

    static let identifier = "HeadersOfAlbum"

    // MARK: - Outlets -

    lazy var nameOfHeader: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return label
    }()

    lazy var button: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
        button.setTitleColor(UIColor.systemBlue, for: .normal)
        return button
    }()

    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        return view
    }()

    // MARK: - Initializers -

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }

    // MARK: - Setup -

    func setupHierarchy() {
        addSubview(nameOfHeader)
        addSubview(button)
        addSubview(separator)
    }

    func setupLayout() {
        nameOfHeader.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.left.equalTo(self)
            make.centerY.equalTo(self).offset(5)
        }

        separator.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.equalToSuperview()
            make.right.equalToSuperview().inset(-10)
            make.height.equalTo(1)
        }

        button.snp.makeConstraints { make in
            make.bottom.equalTo(self)
            make.right.equalTo(self)
            make.centerY.equalTo(self).offset(5)
        }
    }

    func configure(header: Header) {
        self.nameOfHeader.text = header.name
        self.button.setTitle(header.buttonHeader, for: .normal)
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        nameOfHeader.text = nil
        button.setTitle(nil, for: .normal)
       }
}
