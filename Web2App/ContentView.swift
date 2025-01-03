//
//  ContentView.swift
//  Web2App
//
//  Created by Javier Calatrava on 2/1/25.
//

import SwiftUI

struct ContentView: View {
    @State private var messageFromJS: String = ""
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            
            WebView(url: URL(string: "http://localhost:8080/")!) { message in
                messageFromJS = message
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .onChange(of: messageFromJS) {
            showAlert.toggle()
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Message from JavaScript:"),
                message: Text("\(messageFromJS)"),
                dismissButton: .default(Text("OK"))
            )
        }
    }
}

#Preview {
    ContentView()
}
