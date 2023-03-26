//
//  SwiftUITemplateApp.swift
//  SwiftUITemplate
//
//  Created by Vsevolod on 26.03.2023.
//

import SwiftUI

func getFontInfo() {
    print()
    
    for familyName in UIFont.familyNames {
        print(familyName)
        
        let fontNamesAndWeights = UIFont.fontNames(forFamilyName: familyName)
            .map { fontName in
                let font = UIFont(name: fontName, size: 17)!
                let traits = font.fontDescriptor.object(forKey: .traits) as! [UIFontDescriptor.TraitKey: Any]
                let weightValue = traits[.weight] as! Double
                
                return (name: fontName, weight: weightValue)
            }
            .sorted { $0.weight < $1.weight }
        
        for fontNameAndWeight in fontNamesAndWeights {
            print(" - \(fontNameAndWeight.name): \(fontNameAndWeight.weight)")
        }
        
        print()
    }
    
    print("SwiftUI standard weights:")
    let swiftUIFontWeights = [
        ("ultraLight", Font.Weight.ultraLight),
        ("thin", Font.Weight.thin),
        ("light", Font.Weight.light),
        ("regular", Font.Weight.regular),
        ("medium", Font.Weight.medium),
        ("semibold", Font.Weight.semibold),
        ("bold", Font.Weight.bold),
        ("heavy", Font.Weight.heavy),
        ("black", Font.Weight.black),
    ]
    
    for swiftUIFontWeight in swiftUIFontWeights {
        let weightValue = "\(swiftUIFontWeight.1)".dropFirst(14).dropLast()
        
        print(" - \(swiftUIFontWeight.0): \(weightValue)")
    }
    
    print()
}

@main
struct SwiftUITemplateApp: App {
    init() {
        getFontInfo()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
