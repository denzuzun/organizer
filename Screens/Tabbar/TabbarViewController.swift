//
//  TabbarViewController.swift
//  OrganizerApp
//
//  Created by Adem Tarhan on 10.06.2023.
//

import UIKit

class TabbarViewController: UITabBarController {
    var factory: ViewControllerFactory!
    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.backgroundColor = UIColor(named: "yellow")
        tabBar.tintColor = .black
    }

    override func viewWillAppear(_ animated: Bool) {
        setUp()
    }

    private func setUp() {
        if let _ = factory {
            // UIColor(named: "background")

            setViewControllers([
                createNavController(for: factory.homeViewController as! UIViewController, title: "1", image: UIImage(systemName: "house")!, selectImage: UIImage(systemName: "house.fill")!),
                createNavController(for: factory.finishViewController as! UIViewController, title: "1", image: UIImage(systemName: "pencil.and.outline")!, selectImage: UIImage(systemName: "pencil.and.outline")!),
                createNavController(for: factory.profileViewController as! UIViewController, title: "1", image: UIImage(systemName: "person")!, selectImage: UIImage(systemName: "person.fill")!),
                
            ], animated: false)
        }
    }

    fileprivate func createNavController(for rootViewController: UIViewController, title: String, image: UIImage, selectImage: UIImage) -> UIViewController {
        rootViewController.tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selectImage)
        rootViewController.tabBarItem.badgeColor = UIColor.black
        let navigationController = UINavigationController(rootViewController: rootViewController)
        return navigationController
    }
}
