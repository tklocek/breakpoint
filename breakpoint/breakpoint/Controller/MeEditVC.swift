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
    @IBOutlet weak var activityIndicator: NSLayoutConstraint!
    
    
    private var imagePicker: ImagePicker!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        descriptionTextView.delegate = self

        //view.bindToKeyboard()
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let imageData = UserDefaults.standard.object(forKey: "profileImage") as? Data,
        let image = UIImage(data: imageData) {
            profileImage.image = image
        }
        
        if let description = UserDefaults.standard.object(forKey: "profileDescription") as? String {
            descriptionTextView.text = description
            descriptionTextView.textColor = #colorLiteral(red: 0.6212110519, green: 0.8334299922, blue: 0.3770503998, alpha: 1)
        }
        
        
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
        
        activityIndicator.isActive = true
        saveBtn.isEnabled = false
        
        if profileImage.image != nil {
            guard var image = profileImage.image else {
                print("There is no image while saving")
                return
                }
            
            let oryginalSize = image.size
            let size = CGSize(width: 150, height: 150)
            
            
            if Int(oryginalSize.width) > 150 || Int(oryginalSize.height) > 150 {
                let smallImage = resizedImage(from: image, for: size)
                if smallImage != nil {
                    image = smallImage!
                }
            }
        
            
            DataService.instance.uploadUserDetails(withImage: image, andDescription: descriptionTextView.text, atUID: Auth.auth().currentUser!.uid) { (success) in
                self.saveBtn.isEnabled = true
                self.activityIndicator.isActive = false
                if success {
                    UserDefaults.standard.set(image.jpegData(compressionQuality: 0.9), forKey: "profileImage")
                    UserDefaults.standard.set(self.descriptionTextView.text!, forKey: "profileDescription")
              
                    self.dismissDetail()
                } else {
                    print("Error")
                }
            }
        }
    }
        
    func resizedImage(from oryginalImage: UIImage, for size: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { (context) in
            oryginalImage.draw(in: CGRect(origin: .zero, size: size))
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
