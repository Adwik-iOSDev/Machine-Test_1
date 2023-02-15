//
//  DefaultsSecureBank.swift
//  Image Viewer App
//
//  Created by Adwaith V V on 14/02/23.
//

import Foundation


struct DefaultsConstants{
    
    static let uname = "uname"
    static let upass = "upass"
    
}

class DefaultsSecureBank{
    
    let defaults = UserDefaults.standard
    
    static let shared = DefaultsSecureBank()
    
    var userName: String{
        set{
            defaults.set(newValue, forKey: DefaultsConstants.uname)
        }
        get{
            defaults.string(forKey: DefaultsConstants.uname) ?? ""
        }
    }
    
    var userPass: String{
        set{
            defaults.set(newValue, forKey: DefaultsConstants.upass)
        }
        get{
            defaults.string(forKey: DefaultsConstants.upass) ?? ""
        }
    }
    
}
