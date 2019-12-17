//
//  AuthService.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2019-12-17.
//  Copyright © 2019 Tomek Klocek. All rights reserved.
//

import Foundation
import Firebase

class AuthService {
    static let instance = AuthService()
    
    func registerUser(withEmail email: String, andPassword password: String, userCreationComplete: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
            guard let user = authDataResult else {
                userCreationComplete(false, error)
                return
            }
            
            let userData = ["provider": user.user.providerID, "email": user.user.email]
            DataService.instance.createDBUser(uid: user.user.uid, userData: userData as Dictionary<String, Any> )
            userCreationComplete(true, nil)
         
        }
        
    }
    
    func loginUser(withEmail email: String, andPassword password: String, userLoginComplete: @escaping (_ status: Bool, _ error: Error?) -> ()){
        
        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
            if error != nil {
                userLoginComplete(false, error)
                return
            }
            userLoginComplete(true, nil)
            
            
        }
        
    }
    
}
