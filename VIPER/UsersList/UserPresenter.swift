//
//  UserPresenter.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//



protocol UserPresenterProtocol {
    var router: UserRouterProtocol? {get set}
    var interactor: UserInteractorProtocol? {get set}
    var view: UserViewProtocol? {get set}
    
    func viewRequestedData()
    func interactorDidFetchData<T: Decodable>(with result: Result<[T], Error>)
}


class UserPresenter: UserPresenterProtocol {
    
    var router: UserRouterProtocol?
    var view: UserViewProtocol?
    var interactor: UserInteractorProtocol?
    
    func viewRequestedData() {
        interactor?.getData()
    }
    
    func interactorDidFetchData<T>(with result: Result<[T], any Error>) {
        switch result {
        case .success(let users as [User]):
            view?.update(with: users)
        case .failure:
            view?.update(with: "something went wrong")
        case .success(_):
            print("wrong user type")
        }
    }
}
