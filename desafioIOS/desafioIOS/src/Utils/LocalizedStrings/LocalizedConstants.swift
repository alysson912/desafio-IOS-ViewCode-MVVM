//
//  LocalizedConstants.swift
//  RastreioBF
//
//  Created by Jessica Bigal on 09/09/22.
//

import Foundation
import UIKit

typealias LC = LocalizedConstants

enum LocalizedConstants: String {
    
    //MARK: - Home Screen
    
    case subImageView
    case animationView
    case nextButton
    
    //MARK: - Home Screen
    
    case backButtonImage
    
    
    
    var text: String {
        return rawValue.localized(.presentation)
    }
}
