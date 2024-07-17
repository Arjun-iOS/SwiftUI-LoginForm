//
//  ContentView.swift
//  SwiftUI-LoginForm
//
//  Created by Arjun on 14/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    @State private var people = ["Jack", "David"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Login")) {
                    TextField("User name", text: $username)
                    SecureField("Password", text: $password)
                    Button(action: {
                        self.people.append(self.username)
                        username = ""
                        password = ""
                    }, label: {
                        Text("Sign in")
                    }).disabled(!isEnableButton())
                }
                
                Section {
                    List(people, id: \.self) {
                        Text($0)
                    }
                }
                
            }.navigationBarTitle(Text("SwiftUI Form"), displayMode: .inline)
        }
    }
    
    //MARK: match conditions to enable button
    private func isEnableButton() -> Bool {
        return (username != "" && password != "" && password.count > 3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
