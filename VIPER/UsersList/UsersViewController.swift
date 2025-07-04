//
//  ViewController.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import UIKit


protocol UserViewProtocol {
    var presenter: UserPresenterProtocol? {get set}
    func update<T: Decodable>(with data: [T])
    func update(with error: String)
}


class UsersViewController: UIViewController, UserViewProtocol {
    
    @IBOutlet weak var usersTableView: UITableView!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        presenter?.viewRequestedData()
    }
    var presenter: UserPresenterProtocol?
    
    func update<T>(with data: [T]) where T : Decodable {
        DispatchQueue.main.async { [weak self] in
            if let users = data as? [User] {
                self?.users = users
                self?.usersTableView.reloadData()
            }
        }
    }
    
    func update(with error: String) {
        
    }
    
}

extension UsersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = usersTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    
    
}

