//
//  MainTabBarInteractor.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import Foundation

protocol MainTabBarInteractorProtocol {
    var presenter: MainTabBarPresenterProtocol? {get set}
}

class MainTabBarInteractor: MainTabBarInteractorProtocol {
    var presenter: (any MainTabBarPresenterProtocol)?
    
    
}
