//
//  UserListVC.swift
//  LoginTest
//
//  Created by Im100ruv on 23/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class UserListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    // Outlets
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        ConnectionServices.instance.getUsers()
        print(ConnectionServices.instance.users)

        // Do any additional setup after loading the view.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return ConnectionServices.instance.countOfRecords()
        return ConnectionServices.instance.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        cell.usernameLbl.text = ConnectionServices.instance.users[indexPath.row].uname
        cell.firstnameLbl.text = ConnectionServices.instance.users[indexPath.row].fname
        cell.lastnameLbl.text = ConnectionServices.instance.users[indexPath.row].lname
        cell.ageLbl.text = ".."
//        cell.ageLbl.text = ConnectionServices.instance.users[indexPath.row].age as? String
        cell.emailLbl.text = ConnectionServices.instance.users[indexPath.row].email
        print(cell.frame.height)
        
        return cell
    }
}
