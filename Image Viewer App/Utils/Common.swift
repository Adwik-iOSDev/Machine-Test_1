//
//  Common.swift
//  Image Viewer App
//
//  Created by Adwaith V V on 14/02/23.
//

import Foundation
import TTGSnackbar

class Common{
    
    static func snackBar(message: String){
        let snackbar = TTGSnackbar(message: message, duration: .long)
        snackbar.backgroundColor = .white
        snackbar.actionTextColor = .red
        snackbar.messageTextColor = .red
        snackbar.messageTextAlign = .center
        snackbar.show()
    }
    
}
