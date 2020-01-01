//
//  CreatePostVC.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-20.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    // Outlets
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var sendBtn: UIButton!    
    @IBOutlet weak var textView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendBtn.bindToKeyboard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.emailLbl.text = Auth.auth().currentUser?.email
    }
    
    @IBAction func sendBtnWasPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            sendBtn.isEnabled = true
            DataService.instance.uploadPost(withMessage: textView.text, forUID: Auth.auth().currentUser!.uid, withGroupKey: nil) { (isComplete) in
                if isComplete {
                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
                    self.sendBtn.isEnabled = true
                    print("There was an error!")
                }
            }
        }
    
    }
    
    @IBAction func closeBtnWasPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}


extension CreatePostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
    
}
