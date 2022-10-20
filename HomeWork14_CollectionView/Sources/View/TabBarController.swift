//
//  TabBarViewController.swift
//  HomeWork14_CollectionView
//
//  Created by Sergey Makeev on 02.10.2022.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarViewControllers()
    }

    private func setupTabBarViewControllers() {
        let firstViewController = UINavigationController(rootViewController: MediaViewController())
        let firstItem = UITabBarItem(title: "Медиа", image: UIImage(systemName: "photo.fill"), selectedImage: UIImage(systemName: "photo.fill"))
        firstViewController.tabBarItem = firstItem

        let secondViewController = UINavigationController(rootViewController: ForYouViewController())
        let secondItem = UITabBarItem(title: "Для тебя", image: UIImage(systemName: "heart.text.square.fill"), selectedImage: UIImage(systemName: "heart.text.square.fill"))
        secondViewController.tabBarItem = secondItem

        let thirdViewController = UINavigationController(rootViewController: AlbumsViewController())
        let thirdItem = UITabBarItem(title: "Альбомы", image: UIImage(systemName: "rectangle.stack.fill"), selectedImage: UIImage(systemName: "rectangle.stack.fill"))
        thirdViewController.tabBarItem = thirdItem

        let forhtViewController = UINavigationController(rootViewController: SearchViewController())
        let forthItem = UITabBarItem(title: "Поиск", image: UIImage(systemName: "magnifyingglass"), selectedImage: UIImage(systemName: "magnifyingglass"))
        forhtViewController.tabBarItem = forthItem

        let controllers = [firstViewController, secondViewController, thirdViewController, forhtViewController]
        self.setViewControllers(controllers, animated: true)
        self.selectedIndex = 2
    }
}
