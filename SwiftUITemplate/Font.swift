//
//  Font.swift
//  SwiftUITemplate
//
//  Created by Vsevolod on 26.03.2023.
//
import SwiftUI
import CustomFont

extension CustomTextStyle {
    /// Barlow, 100, 34
    static let largeTitle = CustomTextStyle(Barlow.thin, size: 34, relativeTo: .largeTitle)
    /// NewYorkExtraLarge, 600, 28
    static let title = CustomTextStyle(NewYorkExtraLarge.semiBold, size: 28, relativeTo: .title)
    /// NewYorkExtraLarge, 600, 22
    static let title2 = CustomTextStyle(NewYorkExtraLarge.semiBold, size: 22, relativeTo: .title)
    /// NewYorkExtraLarge, 600, 20
    static let title3 = CustomTextStyle(NewYorkExtraLarge.semiBold, size: 20, relativeTo: .title)
    /// NewYorkExtraLarge, 600, 17
    static let headline = CustomTextStyle(NewYorkExtraLarge.semiBold, size: 17, relativeTo: .headline)
    /// Barlow, 400, 17
    static let body = CustomTextStyle(Barlow.regular, size: 17)
    /// Barlow, 100, 16
    static let callout = CustomTextStyle(Barlow.thin, size: 16, relativeTo: .callout)
    /// Barlow, 100, 15
    static let subheadline = CustomTextStyle(Barlow.thin, size: 15, relativeTo: .subheadline)
    /// DancingScript, 700, 13
    static let footnote = CustomTextStyle(DancingScript.bold, size: 13, relativeTo: .footnote)
    /// DancingScript, 700, 12
    static let caption = CustomTextStyle(DancingScript.bold, size: 12, relativeTo: .caption)
    /// DancingScript, 700, 11
    static let caption2 = CustomTextStyle(DancingScript.bold, size: 11, relativeTo: .caption2)
}

fileprivate enum Barlow: String, CaseIterable, FontFamily {
    static let baseName = "Barlow-"
    
    case thin, extraLight, regular, medium
}

fileprivate enum DancingScript: String, CaseIterable, FontFamily {
    static let baseName = "DancingScript-"
    
    case bold
}

fileprivate enum NewYorkExtraLarge: String, CaseIterable, FontFamily {
    static let baseName = "NewYorkExtraLarge-"
    
    case semiBold, bold
}

struct FontView: View {
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Hello World!")
                        .font(.custom(.largeTitle))
                    Text("Hello World!")
                        .font(.custom(.title))
                    Text("Hello World!")
                        .font(.custom(.title2))
                    Text("Hello World!")
                        .font(.custom(.title3))
                    Text("Hello World!")
                        .font(.custom(.headline))
                    Text("Hello World!")
                        .font(.custom(.body))
                }
                VStack(alignment: .leading) {
                    Text("Hello World!")
                        .font(.custom(.callout))
                    Text("Hello World!")
                        .font(.custom(.subheadline))
                    Text("Hello World!")
                        .font(.custom(.footnote))
                    Text("Hello World!")
                        .font(.custom(.caption))
                    Text("Hello World!")
                        .font(.custom(.caption2))
                }
            }
        }
    }
}

struct FontView_Previews: PreviewProvider {
    static var previews: some View {
        FontView()
    }
}
