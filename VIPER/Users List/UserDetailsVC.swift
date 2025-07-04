//
//  UserDetailsVC.swift
//  VIPER
//
//  Created by A.Hazzaa on 04/07/2025.
//

import Foundation
import UIKit

class UserDetailsVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = user?.name {
            nameLabel.text = name
        }
    }
}
