//
//  AuthVC.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-17.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import UIKit

class AuthVC: UIViewController {

    // Outlets
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInWithEmailBtnWasPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
        
    }
    
    @IBAction func googleSignInBtnWasPressed(_ sender: Any) {
    }
    
    
    @IBAction func facebookSignInBtnWasPressed(_ sender: Any) {
    }
    
    
}
