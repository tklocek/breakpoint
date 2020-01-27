//
//  UserDetails.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2020-01-01.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class UserDetails {
    
    private var _imageURL: String?
    private var _description: String
    
    var imageURL: String? {
        return _imageURL
    }
    
    var description: String {
        return _description
    }
    
    init(imageURL: String, description: String) {
        self._imageURL = imageURL
        self._description = description
    }
    
}
