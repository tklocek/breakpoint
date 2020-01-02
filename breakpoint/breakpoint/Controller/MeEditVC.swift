//
//  MeEditVC.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2020-01-01.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit
import Firebase


class MeEditVC: UIViewController {

    // Outlets
    @IBOutlet weak var descriptionTextView: InsetTextView!
    @IBOutlet weak var oldPassText: InsetTextField!
    @IBOutlet weak var newPassText: InsetTextField!
    @IBOutlet weak var retypePassText: InsetTextField!
    @IBOutlet weak var saveBtn: UIButton!
    @IBOutlet weak var loadImageBtn: UIButton!
    @IBOutlet weak var profileImage: UIImageView!
    
    
    private var imagePicker: ImagePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        descriptionTextView.delegate = self

        //view.bindToKeyboard()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if descriptionTextView.text == "add some description here ..." {
            
            descriptionTextView.text = ""
            descriptionTextView.textColor = #colorLiteral(red: 0.6212110519, green: 0.8334299922, blue: 0.3770503998, alpha: 1)
        }
        
        
    }
    
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if descriptionTextView.text == "" || descriptionTextView.text == "add some description here ..." {
            descriptionTextView.text = "add some description here ..."
            descriptionTextView.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
         }
    }
    
    
    
    @IBAction func backBtnWasPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func saveBtnWasPressed(_ sender: Any) {
        DataService.instance.uploadUserDetails(withImage: self.profileImage.image!, andDescription: self.descriptionTextView.text, atUID: Auth.auth().currentUser!.uid) { (success) in
            print("success")
        }
        
    }
    
    @IBAction func loadImageBtnWasPressed(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
        
    }
    
}

extension MeEditVC: UITextViewDelegate {
    
}

extension MeEditVC: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        if image != nil {
            self.profileImage.image = image
        }
    }
}
