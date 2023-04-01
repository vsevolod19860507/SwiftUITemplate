//
//  Font.swift
//  SwiftUITemplate
//
//  Created by Vsevolod on 26.03.2023.
//

import SwiftUI
import CustomFont

extension CustomTextStyle {
    static let hugeTitleFixed = CustomTextStyle(Barlow.semiBold, fixedSize: 36)
    static let hugeTitle = CustomTextStyle(Barlow.semiBold, size: 36, relativeTo: .largeTitle)
    static let largeTitle = CustomTextStyle(Copperplate.light, size: 34, relativeTo: .largeTitle)
    static let largeTitle2 = CustomTextStyle(Barlow.semiBold, size: 32, relativeTo: .largeTitle)
    static let title = CustomTextStyle(NewYorkExtraLarge.semiBold, size: 28, relativeTo: .title)
    static let title2 = CustomTextStyle(Barlow.thin, size: 22, relativeTo: .title2)
    static let title3 = CustomTextStyle(Barlow.thin, size: 20, relativeTo: .title3)
    static let headline = CustomTextStyle(Barlow.semiBold, size: 17, relativeTo: .headline)
    static let body = CustomTextStyle(Barlow.regular, size: 17)
    static let body2 = CustomTextStyle(Barlow.thin, size: 17)
    static let callout = CustomTextStyle(NewYorkExtraLarge.semiBold, size: 16, relativeTo: .callout)
    static let subheadline = CustomTextStyle(DancingScript.regular, size: 15, relativeTo: .subheadline)
    static let footnote = CustomTextStyle(DancingScript.medium, size: 13, relativeTo: .footnote)
    static let caption = CustomTextStyle(DancingScript.regular, size: 12, relativeTo: .caption)
    static let caption2 = CustomTextStyle(DancingScript.medium, size: 11, relativeTo: .caption2)
#if os(macOS)
    static let caption3 =  CustomTextStyle(NewYorkExtraLarge.semiBold, size: 10, relativeTo: .caption2)
#else
    static let caption3 =  CustomTextStyle(NewYorkExtraLarge.semiBold, size: 10, relativeTo: .caption2)
#endif
}

// Add bolder fonts for legibilityWeight in addition to those used.
// Don't add cases for italic fonts, use the .italic() view modifier instead.
fileprivate enum Barlow: String, CaseIterable, FontFamily {
    static let baseName = "Barlow-"
    
    case thin, extraLight, regular, medium, semiBold, bold
}

fileprivate enum DancingScript: String, CaseIterable, FontFamily {
    static let baseName = "DancingScript-"
    
    case regular, medium, semiBold
}

fileprivate enum NewYorkExtraLarge: String, CaseIterable, FontFamily {
    static let baseName = "NewYorkExtraLarge-"
    
    case semiBold, bold
}

fileprivate enum Copperplate: String, CaseIterable, FontFamily {
    static let baseName = "Copperplate"
    
    case light = "-Light", regular = ""
}

struct FontView: View {
    @Environment(\.legibilityWeight) private var legibilityWeight
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Hello World!")
                        .font(.custom(.hugeTitle))
                    Text("Hello World!")
                        .font(.custom(.largeTitle))
                    Text("Hello World!")
                        .font(.custom(.largeTitle2))
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
                    Text("Hello World!")
                        .font(.custom(.body2))
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
                    Text("Hell.custom(o World!")
                        .font(.custom(.caption2))
                    Text("Hello World!")
                        .font(.custom(.caption3))
                }
                VStack(alignment: .leading) {
                    Text("Hello World!")
                        .font(.custom(.hugeTitle))
                    Text("Hello World!")
                        .font(.custom(.hugeTitleFixed))
                    Text("Hello World!")
                        .font(.custom(.title3))
                        .bold()
                        .italic()
                    Text("Hello World!")
                        .font(.custom(.hugeTitle))
                        .italic()
                    Text("Hello ")
                        .font(.custom(.hugeTitle), consider: legibilityWeight)
                        .italic() +
                    Text("World!")
                        .font(.custom(.caption), consider: legibilityWeight)
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
