//
//  WebView.swift
//  Web2App
//
//  Created by Javier Calatrava on 2/1/25.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var url: URL
    var onMessageReceived: (String) -> Void // Closure to handle messages from JS

    class Coordinator: NSObject, WKScriptMessageHandler {
        var parent: WebView

        init(parent: WebView) {
            self.parent = parent
        }

        // This method is called when JS sends a message to native code
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "callbackHandler" {
                if let messageBody = message.body as? String {
                    parent.onMessageReceived(messageBody)
                }
            }
        }
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> WKWebView {
        let configuration = WKWebViewConfiguration()
        configuration.userContentController.add(context.coordinator, name: "callbackHandler")

        let webView = WKWebView(frame: .zero, configuration: configuration)
        webView.load(URLRequest(url: url))
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        // No need to update the WebView in this case
    }
}

