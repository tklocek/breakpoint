//
//  UserDetails.swift
//  breakpoint
//
//  Created by Tomek Klocek on 2020-01-01.
//  Copyright © 2020 Tomek Klocek. All rights reserved.
//

import UIKit

class UserDetails {
    
    private var _uid: String
    private var _image: UIImage
    private var _description: String
    
    var uid: String {
        return _uid
    }
    
    var image: UIImage {
        return _image
    }
    
    var description: String {
        return _description
    }
    
    init(uid: String, image: UIImage, description: String) {
        self._uid = uid
        self._image = image
        self._description = description
    }
    
}
