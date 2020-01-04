//
//  MeVC.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-19.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase

class MeVC: UIViewController {

    //Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var descriptionLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
        
        if let imageData = UserDefaults.standard.object(forKey: "profileImage") as? Data,
        let image = UIImage(data: imageData) {
            profileImage.image = image
        }
        
        if let description = UserDefaults.standard.object(forKey: "profileDescription") as? String {
            descriptionLbl.text = description
        }

        
    }
    
    @IBAction func signOutBtnWasPressed(_ sender: Any) {
        //Sign out code
        let logoutPopup = UIAlertController(title: "Logout?", message: "Are you sure you want to logout?", preferredStyle: .actionSheet)
        let logoutAction = UIAlertAction(title: "Logout?", style: .destructive) { (buttonTapped) in
            do {
                try Auth.auth().signOut()
                let authVC = self.storyboard?.instantiateViewController(identifier: "AuthVC") as? AuthVC
                self.present(authVC!, animated: true, completion: nil)
            } catch {
                print(error)
            }
        }
        logoutPopup.addAction(logoutAction)
        present(logoutPopup, animated: true, completion: nil)
    }
    
    @IBAction func editBtnWasPressed(_ sender: Any) {
        guard let meEditVC = storyboard?.instantiateViewController(identifier: "MeEditVC") as? MeEditVC else { return }
        presentDetail(meEditVC)
        
    }
    
}
