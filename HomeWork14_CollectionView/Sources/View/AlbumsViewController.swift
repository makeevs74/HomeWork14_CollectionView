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
//        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: createLayout())

        collectionView.register(MyAlbumsCell.self, forCellWithReuseIdentifier: MyAlbumsCell.identifier)
        collectionView.register(SharedAlbumsCell.self, forCellWithReuseIdentifier: SharedAlbumsCell.identifier)

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

    // MARK: - CollectionViewLayout

    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { sectionIndex, _ in

            switch sectionIndex {

            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 5,
                                                                   trailing: 5)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                    heightDimension: .fractionalWidth(1)
                )
                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 2)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 2.5,
                                                                    bottom: 0,
                                                                    trailing: 2.5)

                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)

                //                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                //                    widthDimension: .fractionalWidth(0.93),
                //                    heightDimension: .estimated(80)
                //                )
                //                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                //                    layoutSize: layoutSectionHeaderSize,
                //                    elementKind: UICollectionView.elementKindSectionHeader,
                //                    alignment: .top
                //                )

                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 10,
                                                                      bottom: 0,
                                                                      trailing: 10)
                sectionLayout.orthogonalScrollingBehavior = .groupPaging
                return sectionLayout

            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalWidth(1)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 5,
                                                                   trailing: 5)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.5),
                    heightDimension: .fractionalHeight(0.33)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitem: layoutItem,
                    count: 1)
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 2.5,
                                                                    bottom: 0,
                                                                    trailing: 2.5)
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)

                //                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                //                    widthDimension: .fractionalWidth(0.93),
                //                    heightDimension: .estimated(80)
                //                )
                //                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                //                    layoutSize: layoutSectionHeaderSize,
                //                    elementKind: UICollectionView.elementKindSectionHeader,
                //                    alignment: .top
                //                )

                sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                      leading: 10,
                                                                      bottom: 0,
                                                                      trailing: 10)
                sectionLayout.orthogonalScrollingBehavior = .continuous
                return sectionLayout

            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .fractionalHeight(1.0)
                )
                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 5,
                                                                   leading: 5,
                                                                   bottom: 5,
                                                                   trailing: 5)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1.0),
                    heightDimension: .absolute(44)
                )
                let layoutGroup = NSCollectionLayoutGroup.horizontal(
                    layoutSize: groupSize,
                    subitems: [layoutItem]
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0,
                                                                    leading: 2.5,
                                                                    bottom: 0,
                                                                    trailing: 2.5)
                let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
                //sectionLayout.orthogonalScrollingBehavior = .groupPaging
                return sectionLayout
            }
        }
    }
}

extension AlbumsViewController: UICollectionViewDataSource, UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PhotoAlbum.albums[section].count
//        switch section {
//        case 0:
//            return 8
//        case 1:
//            return 20
//        default:
//            return 10
//        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyAlbumsCell.identifier,
                for: indexPath
            )
            cell.backgroundColor = .systemGreen
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyAlbumsCell.identifier,
                for: indexPath
            )
            cell.backgroundColor = .systemBlue
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: MyAlbumsCell.identifier,
                for: indexPath
            )
            cell.backgroundColor = .systemYellow
            return cell
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        3
    }
}

