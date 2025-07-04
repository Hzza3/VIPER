//
//  MainTabBarViewProtocol.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import Foundation
import UIKit

protocol MainTabBarViewProtocol {
    var presenter: MainTabBarPresenterProtocol? {get set}
    
}


class MainTabBarView: UITabBarController, MainTabBarViewProtocol {
    var presenter: MainTabBarPresenterProtocol?
}
