//
//  MainTabBarPresenter.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import Foundation

protocol MainTabBarPresenterProtocol {
    var view: MainTabBarViewProtocol? {get set}
    var interactor: MainTabBarInteractorProtocol? {get set}
    var router: MainTabBarRouterProtocol? {get set}
}

class MainTabBarPresenter: MainTabBarPresenterProtocol {
    
    var view: (any MainTabBarViewProtocol)?
    
    var interactor: (any MainTabBarInteractorProtocol)?
    
    var router: (any MainTabBarRouterProtocol)?
    
    
}
