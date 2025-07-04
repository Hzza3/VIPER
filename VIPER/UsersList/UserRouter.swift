//
//  UserRouter.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import UIKit


typealias EntryPoint = UserViewProtocol & UIViewController

protocol UserRouterProtocol {
    
    var entry: EntryPoint? {get}
    
    static func start() -> UserRouterProtocol
}


class UserRouter: UserRouterProtocol {
    
    var entry: EntryPoint?
    
    static func start() -> any UserRouterProtocol {
        
        let router = UserRouter()
        let sb = UIStoryboard(name: "Main", bundle: nil)
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
    
    
}
