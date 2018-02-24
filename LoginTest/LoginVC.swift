//
//  LoginVC.swift
//  LoginTest
//
//  Created by Im100ruv on 23/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SubmitPressed(_ sender: Any) {
        if ConnectionServices.instance.loginCheck(email: emailTxt.text!, pswd: passwordTxt.text!) == true {
            performSegue(withIdentifier: "loginToListSegue", sender: nil)
        } else {
            print("invalid user!")
        }
    }
    
}

