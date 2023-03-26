//
//  CustomFont.swift
//  SwiftUITemplate
//
//  Created by Vsevolod on 26.03.2023.
//

import SwiftUI

// Don't use system names like body, title, caption2, etc.
extension ProxyFont {
    static let customHugeTitleFixed = ProxyFont(Barlow.semiBold, fixedSize: 36)
    static let customHugeTitle = ProxyFont(Barlow.semiBold, size: 36, relativeTo: .largeTitle)
    static let customLargeTitle = ProxyFont(Barlow.semiBold, size: 34, relativeTo: .largeTitle)
    static let customLargeTitle2 = ProxyFont(Barlow.semiBold, size: 32, relativeTo: .largeTitle)
    static let customTitle = ProxyFont(Copperplate.light, size: 28, relativeTo: .title)
    static let customTitle2 = ProxyFont(Barlow.thin, size: 22, relativeTo: .title2)
    static let customTitle3 = ProxyFont(Barlow.thin, size: 20, relativeTo: .title3)
    static let customHeadline = ProxyFont(Barlow.semiBold, size: 17, relativeTo: .headline)
    static let customBody = ProxyFont(Barlow.regular, size: 17)
    static let customCallout = ProxyFont(NewYorkExtraLarge.semiBold, size: 16, relativeTo: .callout)
    static let customSubheadline = ProxyFont(TamilSangamMN.regular, size: 15, relativeTo: .subheadline)
    static let customFootnote = ProxyFont(TimesNewRomanPSMT.bold, size: 13, relativeTo: .footnote)
    static let customCaption = ProxyFont(DancingScript.regular, size: 12, relativeTo: .caption)
    static let customCaption2 = ProxyFont(DancingScript.medium, size: 11, relativeTo: .caption2)
#if os(watchOS)
    static let customCaption3 =  ProxyFont(NewYorkExtraLarge.semiBold, size: 10, relativeTo: .caption2)
#else
    static let customCaption3 =  ProxyFont(TimesNewRomanPSMT.bold, size: 10, relativeTo: .caption2)
#endif
}

// Add bolder fonts for legibilityWeight in addition to those used.
// Don't add cases for italic fonts, use the .italic() view modifier instead.
fileprivate enum Barlow: String, CaseIterable, CustomFont {
    static let baseName = "Barlow-"
    
    case thin, extraLight, regular, medium, semiBold, bold
}

fileprivate enum Copperplate: String, CaseIterable, CustomFont {
    static let baseName = "Copperplate"
    
    case light = "-Light", regular = ""
}

fileprivate enum DancingScript: String, CaseIterable, CustomFont {
    static let baseName = "DancingScript-"
    
    case regular, medium, semiBold
}

fileprivate enum NewYorkExtraLarge: String, CaseIterable, CustomFont {
    static let baseName = "NewYorkExtraLarge-"
    
    case semiBold = "Semibold", bold
}

fileprivate enum TamilSangamMN: String, CaseIterable, CustomFont {
    //    static let baseName = "TamilSangamMN"
    //
    //    case regular = "", bold = "-Bold"
    
    // Just as an option
    static let baseName = "TamilS"
    
    var name: String {
        Self.baseName + rawValue
    }
    
    case regular = "angamMN", bold = "angamMN-Bold"
}

fileprivate enum TimesNewRomanPSMT: String, CaseIterable, CustomFont {
    static let baseName = "TimesNewRomanPS"
    
    case bold = "-BoldMT"
}

struct CustomFontView: View {
    @Environment(\.legibilityWeight) private var legibilityWeight
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text("Hello World!")
                        .font(.customHugeTitle)
                    Text("Hello World!")
                        .font(.customLargeTitle)
                    Text("Hello World!")
                        .font(.customLargeTitle2)
                    Text("Hello World!")
                        .font(.customTitle)
                    Text("Hello World!")
                        .font(.customTitle2)
                    Text("Hello World!")
                        .font(.customTitle3)
                    Text("Hello World!")
                        .font(.customHeadline)
                    Text("Hello World!")
                        .font(.customBody)
                }
                VStack(alignment: .leading) {
                    Text("Hello World!")
                        .font(.customCallout)
                    Text("Hello World!")
                        .font(.customSubheadline)
                    Text("Hello World!")
                        .font(.customFootnote)
                    Text("Hello World!")
                        .font(.customCaption)
                    Text("Hello World!")
                        .font(.customCaption2)
                    Text("Hello World!")
                        .font(.customCaption3)
                }
                VStack(alignment: .leading) {
                    Text("Hello World!")
                        .font(.customHugeTitle)
                    Text("Hello World!")
                        .font(.customHugeTitleFixed)
                    Text("Hello World!")
                        .font(.customHugeTitle)
                        .italic()
                    Text("Hello ")
                        .font(.customHugeTitle, consider: legibilityWeight)
                        .italic() +
                    Text("World!")
                        .font(.customCaption, consider: legibilityWeight)
                }
            }
        }
    }
}

struct CustomFont_Previews: PreviewProvider {
    static var previews: some View {
        CustomFontView()
    }
}

//MARK: Implementation
struct ProxyFont {
    private let customFont: CustomFont
    private let size: CGFloat
    private let textStyle: Font.TextStyle?
    
    private init(_ customFont: CustomFont, size: CGFloat, relativeTo textStyle: Font.TextStyle = .body) {
        self.customFont = customFont
        self.size = size
        self.textStyle = textStyle
    }
    
    private init(_ customFont: CustomFont, fixedSize: CGFloat) {
        self.customFont = customFont
        self.size = fixedSize
        self.textStyle = nil
    }
    
    fileprivate func callAsFunction(_ legibilityWeight: LegibilityWeight?) -> Font {
        let customFont: CustomFont
        switch legibilityWeight {
        case .bold:
            customFont = self.customFont.bolder
        default:
            customFont = self.customFont
        }
        
        if let textStyle = textStyle {
            return .custom(customFont.name, size: size, relativeTo: textStyle)
        }
        return .custom(customFont.name, fixedSize: size)
    }
}

fileprivate protocol CustomFont {
    static var baseName: String { get }
    
    var name: String { get }
    var bolder: Self { get }
}

fileprivate extension CustomFont where Self: Equatable,
                                       Self: RawRepresentable<String>,
                                       Self: CaseIterable,
                                       AllCases == [Self] {
    var name: String {
        Self.baseName + rawValue.capitalized
    }
    
    var bolder: Self {
        let allCases = Self.allCases
        
        guard self != allCases.last,
              let firstIndex = allCases.firstIndex(of: self)
        else { return self }
        
        return allCases[firstIndex + 1]
    }
}

extension Text {
    func font(_ proxyFont: ProxyFont, consider legibilityWeight: LegibilityWeight?) -> Text {
        self.font(proxyFont(legibilityWeight))
    }
}

extension View {
    func font(_ proxyFont: ProxyFont) -> some View {
        modifier(FontViewModifier(proxyFont: proxyFont))
    }
}

struct FontViewModifier: ViewModifier {
    @Environment(\.legibilityWeight) private var legibilityWeight
    let proxyFont: ProxyFont
    
    func body(content: Content) -> some View {
        content.font(proxyFont(legibilityWeight))
    }
}
