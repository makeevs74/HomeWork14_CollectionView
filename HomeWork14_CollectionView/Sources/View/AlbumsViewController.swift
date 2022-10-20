//
//  AlbumsViewController.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 10.09.2022.
//

import UIKit
import SnapKit

class AlbumsViewController: UIViewController {

    // MARK: - Outlets -

    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collectionView.register(TypeOfMediaAndOthers.self, forCellWithReuseIdentifier: TypeOfMediaAndOthers.identifier)
        collectionView.register(HeadersOfAlbum.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeadersOfAlbum.identifier)

        collectionView.delegate = self
        collectionView.dataSource = self

        return collectionView
    }()

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        navigationController?.navigationBar.prefersLargeTitles = true
        view.backgroundColor = .white
        setupHierarchy()
        setupLayout()
        setupNavigationBar()
    }

    // MARK: - Setup -

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.snp.makeConstraints { make in
            make.right.bottom.left.equalTo(view)
            make.top.equalTo(view.safeAreaLayoutGuide)
        }
    }

    private func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add,
                                                           target: self,
                                                           action: #selector(addPhotoAlbum))
    }

    // MARK: - CollectionViewLayout

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, enviroment in

            switch sectionIndex {
            case 0:
                return self.createLayoutOfPhotos(groupHeight: 0.7, itemCount: 2)
            case 1:
                return self.createLayoutOfPhotos(groupHeight: 0.35, itemCount: 1)
            default:
                return self.createLayouteOfTable(enviroment: enviroment)
            }
        }
    }
    
    // MARK: - Actions

    @objc func addPhotoAlbum() {
        // Any actions
    }
}



extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        PhotoAlbum.albums[section].count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        PhotoAlbum.albums.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let data = PhotoAlbum.albums[indexPath.section][indexPath.item]

        switch indexPath.section {
        case 0, 1:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyAlbumsCell.identifier,
                for: indexPath
            ) as? MyAlbumsCell else { return UICollectionViewCell() }
            cell.configure(album: data)
            return cell

        case 2, 3:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TypeOfMediaAndOthers.identifier,
                for: indexPath
            ) as? TypeOfMediaAndOthers else { return UICollectionViewCell() }
            cell.configureCell(album: data)
            return cell

        default:
            guard let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: TypeOfMediaAndOthers.identifier,
                for: indexPath
            ) as? TypeOfMediaAndOthers else { return UICollectionViewCell() }
            cell.configureCell(album: data)
            return cell
        }
    }

    func createLayouteOfTable(enviroment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection {
        let section = NSCollectionLayoutSection.list(using: .init(appearance: .plain), layoutEnvironment: enviroment)
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 10, bottom: 25, trailing: 10)

        // - Header -
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        section.boundarySupplementaryItems = [layoutSectionHeader]
        return section
    }

    func createLayoutOfPhotos(groupHeight: Double, itemCount: Int) -> NSCollectionLayoutSection {
        // - Item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                           leading: 0,
                                                           bottom: 5,
                                                           trailing: 0)
        // - Group -
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.47),
            heightDimension: .fractionalHeight(groupHeight)
        )
        let layoutGroup = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitem: layoutItem,
            count: itemCount)
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                            leading: 5,
                                                            bottom: 10,
                                                            trailing: 5)
        // - Section -
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                              leading: 10,
                                                              bottom: 15,
                                                              trailing: 10)
        // - Header -
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(80))
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top)
        sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
        
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        return sectionLayout
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        print("Нажата ячейка - \(PhotoAlbum.albums[indexPath.section][indexPath.item].name)")
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: HeadersOfAlbum.identifier,
            for: indexPath) as? HeadersOfAlbum
        header?.configure(header: Header.headers[indexPath.section])
        return header ?? HeadersOfAlbum()
    }
}

