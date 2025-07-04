//
//  UserRouter.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import UIKit

typealias UsersListEntry = UserViewProtocol & UIViewController

protocol UserRouterProtocol {
    var entry: UsersListEntry? {get}
    static func start() -> UserRouterProtocol
    func navigateToUserDetails(user: User)
}


class UserRouter: UserRouterProtocol {
    var entry: UsersListEntry?
    
    static func start() -> any UserRouterProtocol {
        
        let router = UserRouter()
        let sb = UIStoryboard(name: "UsersList", bundle: nil)
        let view = sb.instantiateViewController(withIdentifier: "UsersViewController") as? UsersViewController
        
        let presenter = UserPresenter()
        let interactor = UserInteractor()
        
        view?.presenter = presenter
        interactor.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        router.entry = view
        
        return router
    }
    
    func navigateToUserDetails(user: User) {
        let storyboard = UIStoryboard(name: "UsersList", bundle: nil)
        let userDetailsVC = storyboard.instantiateViewController(withIdentifier: "UserDetailsVC") as! UserDetailsVC
        userDetailsVC.user = user
        
        if let navigationController = entry?.navigationController {
            navigationController.pushViewController(userDetailsVC, animated: true)
        }
    }
    
}
