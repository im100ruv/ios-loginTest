//
//  ViewController.swift
//  LoginTest
//
//  Created by Im100ruv on 22/02/18.
//  Copyright © 2018 Im100ruv. All rights reserved.
//

import UIKit

class RegisterVC: UIViewController {
    
    // Outlets
    @IBOutlet weak var usernameTxt: UITextField!
    @IBOutlet weak var firstnameTxt: UITextField!
    @IBOutlet weak var lastnameTxt: UITextField!
    @IBOutlet weak var ageTxt: UITextField!
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!
    @IBOutlet weak var cnfpasswordTxt: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func submitPressed(_ sender: Any) {
        if passwordTxt.text == cnfpasswordTxt.text && !(usernameTxt.text=="" || firstnameTxt.text=="" || lastnameTxt.text=="" || ageTxt.text=="" || emailTxt.text=="" || passwordTxt.text==""){
                ConnectionServices.instance.insertRecord(uname: usernameTxt.text!, fname: firstnameTxt.text!, lname: lastnameTxt.text!, age: Int(ageTxt.text!)!, email: emailTxt.text!, passwd: passwordTxt.text!)
                performSegue(withIdentifier: "registerToListSegue", sender: nil)
        } else {
            print("passwords not matched!")
        }
        
    }
    


}

