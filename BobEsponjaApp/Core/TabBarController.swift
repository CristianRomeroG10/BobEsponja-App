//
//  TabBarController.swift
//  BobEsponjaApp
//
//  Created by Cristian Guillermo Romero Garcia on 17/10/26.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    func setUpViews(){
        
        //MARK: First View
        //Instanciamos El viewController
        let firstViewController = FirstViewController()
        //Embebemos el viewController en un navigation Controller
        let firstNavigation = UINavigationController(rootViewController: firstViewController)
        firstNavigation.tabBarItem.title = "List"
        firstNavigation.tabBarItem.image = UIImage(systemName: "list.bullet.circle")
        firstNavigation.tabBarItem.selectedImage = UIImage(systemName: "list.bullet.circle.fill")
        
        //MARK: second View
        //Instanciamos El viewController
        let secondViewController = SecondViewController()
        //Embebemos el viewController en un navigation Controller
        let secondNavigation = UINavigationController(rootViewController: secondViewController)
        secondNavigation.tabBarItem.title = "Search"
        secondNavigation.tabBarItem.image = UIImage(systemName: "magnifyingglass.circle")
        secondNavigation.tabBarItem.selectedImage = UIImage(systemName: "magnifyingglass.circle.fill")
        secondNavigation.navigationBar.prefersLargeTitles = true
        
        //MARK: Third View
        //Instanciamos El viewController
        let thirdViewController = ThirdViewController()
        //Embebemos el viewController en un navigation Controller
        let thirdNavigation = UINavigationController(rootViewController: thirdViewController)
        thirdNavigation.tabBarItem.title = "Favorites"
        thirdNavigation.tabBarItem.image = UIImage(systemName: "heart.circle")
        thirdNavigation.tabBarItem.selectedImage = UIImage(systemName: "heart.circle.fill")
        
        //MARK: ViewControllers ARRAY
        let viewControllers: [UIViewController] = [firstNavigation, secondNavigation, thirdNavigation]
        self.viewControllers = viewControllers
        self.selectedIndex = 0
    }
    
    

}
