//
//  UserViewController.swift
//  ScrollingFrame
//
//  Created by Daria Salamakha on 15.02.2022.
//

import UIKit

class UserViewController: UIViewController {
    
    // MARK: - Outlet
    @IBOutlet weak var informationLabel: UILabel!
   
    // MARK: - Properties
    var user: User?
    
    // MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        informationLabel.text = user?.description
        
    }

}
