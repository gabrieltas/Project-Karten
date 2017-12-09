//
//  Colors.swift
//  project-karten
//
//  Created by Barbara Kudiess on 12/1/17.
//  Copyright © 2017 SpaceWalk. All rights reserved.
//

import Foundation
import  UIKit

struct ColorStruct {
    var normal: UIColor
    var dark: UIColor
}


enum Color: Int {
    case orange = 0
    case green = 1
    case purple = 2
    case waterGreen = 3
    case blue = 4
    case red = 5
    case yellow = 6
    case pink = 7
    
    func get() -> ColorStruct {
        switch self {
        case .orange:
            return ColorStruct(normal: #colorLiteral(red: 0.937254902, green: 0.7176470588, blue: 0.2980392157, alpha: 1) , dark: #colorLiteral(red: 0.7058823529, green: 0.5294117647, blue: 0.1960784314, alpha: 1))
        case .green:
            return ColorStruct(normal: #colorLiteral(red: 0.5647058824, green: 0.8705882353, blue: 0.2588235294, alpha: 1) , dark: #colorLiteral(red: 0.4196078431, green: 0.6784313725, blue: 0.1607843137, alpha: 1))
        case .purple:
            return ColorStruct(normal: #colorLiteral(red: 0.7254901961, green: 0.2784313725, blue: 0.8901960784, alpha: 1) , dark: #colorLiteral(red: 0.4588235294, green: 0.1450980392, blue: 0.568627451, alpha: 1))
        case .waterGreen:
            return ColorStruct(normal: #colorLiteral(red: 0.2588235294, green: 0.8705882353, blue: 0.6823529412, alpha: 1) , dark: #colorLiteral(red: 0.1215686275, green: 0.537254902, blue: 0.4117647059, alpha: 1))
        case .blue:
            return ColorStruct(normal: #colorLiteral(red: 0.2588235294, green: 0.5882352941, blue: 0.8705882353, alpha: 1) , dark: #colorLiteral(red: 0.1294117647, green: 0.3803921569, blue: 0.5960784314, alpha: 1))
        case .red:
            return ColorStruct(normal: #colorLiteral(red: 0.937254902, green: 0.3960784314, blue: 0.2980392157, alpha: 1) , dark: #colorLiteral(red: 0.7058823529, green: 0.2509803922, blue: 0.168627451, alpha: 1))
        case .yellow:
            return ColorStruct(normal: #colorLiteral(red: 1, green: 0.9019607843, blue: 0.1294117647, alpha: 1) , dark: #colorLiteral(red: 0.8392156863, green: 0.7568627451, blue: 0.1058823529, alpha: 1))
        case .pink:
            return ColorStruct(normal: #colorLiteral(red: 0.9568627451, green: 0.4274509804, blue: 0.8941176471, alpha: 1) , dark: #colorLiteral(red: 0.7176470588, green: 0.2470588235, blue: 0.662745098, alpha: 1))
        }
    }
    
    func description() -> String {
        switch self {
        case .orange:
            return "Orange"
        case .green:
            return "Green"
        case .purple:
            return "Purple"
        case .waterGreen:
            return "Water Green"
        case .blue:
            return "Blue"
        case .red:
            return "Red"
        case .yellow:
            return "Yellow"
        case .pink:
            return "Pink"
        }
    }
}

let colors: [Color] =  [.orange, .green, .purple, .waterGreen, .blue, .red, .yellow, .pink]

