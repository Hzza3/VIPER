//
//  MainTabBarRouter.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import Foundation
import UIKit

typealias MainTabBarEntry = MainTabBarViewProtocol & UITabBarController


protocol MainTabBarRouterProtocol {
    var entry: MainTabBarEntry? {get}
    
    static func start() -> MainTabBarRouterProtocol
}

class MainTabBarRouter: MainTabBarRouterProtocol {

    var entry: MainTabBarEntry?
    
    static func start() -> any MainTabBarRouterProtocol {
        let mainTabBarRouter = MainTabBarRouter()
        
        let sb = UIStoryboard(name: "MainTabBar", bundle: nil)
        let view = sb.instantiateViewController(withIdentifier: "MainTabBar") as? MainTabBarView
        
        let usersListRouter = UserRouter.start()
        let usersListVC = usersListRouter.entry
        
        if let usersList = usersListVC {
            view?.viewControllers = [usersList]
        }
       
    
        let presenter = MainTabBarPresenter()
        let interactor = MainTabBarInteractor()
        
        view?.presenter = presenter
        interactor.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = mainTabBarRouter
        
        mainTabBarRouter.entry = view
        return mainTabBarRouter
    }
    
}
