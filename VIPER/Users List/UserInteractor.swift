//
//  UserInteractor.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import Foundation

enum fetchDataError: Error {
    case failed
}

protocol UserInteractorProtocol {
    var presenter: UserPresenterProtocol? {get set}
    func getData()
}


class UserInteractor: UserInteractorProtocol {
    
    var presenter: UserPresenterProtocol?
    
    func getData() {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _ , error in
            guard let data = data, error == nil else {
                self?.presenter?.interactorDidFetchData(with: .failure(fetchDataError.failed))
                return
            }
            
            do {
                let entities = try JSONDecoder().decode([User].self, from: data)
                self?.presenter?.interactorDidFetchData(with: .success(entities))
            } catch {
                self?.presenter?.interactorDidFetchData(with: .failure(fetchDataError.failed))
            }
        }
        task.resume()
    }
    
    
}
