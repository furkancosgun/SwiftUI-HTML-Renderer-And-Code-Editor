//
//  StringToHtmlView.swift
//  CodingLab
//
//  Created by Furkan on 25.01.2023.
//

import SwiftUI
import WebKit
struct StringToHtmlView: UIViewRepresentable {
        let htmlContent: String

        func makeUIView(context: Context) -> WKWebView {
            return WKWebView()
        }

        func updateUIView(_ uiView: WKWebView, context: Context) {
            uiView.loadHTMLString(htmlContent, baseURL: nil)
        }
}
/*
 struct StringToHtmlView_Previews: PreviewProvider {
 static var previews: some View {
 StringToHtmlView()
 }
 }
 */
