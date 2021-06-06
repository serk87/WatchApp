//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by luser on 06.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = "1"
    @State var password = "1"
    @State var showAlert = false
    @State var toMainView = false
    @State var alertMessage = ""
    @StateObject var userObject = UserObject()
    var body: some View {
        
        VStack {
            TextField("vasya@mail.com", text: $email)
            SecureField("******", text: $password)
            Button(action: {
                userObject.login(email: email, password: password) { message in
                    if message == "Success" {
                        toMainView.toggle()
                    } else {
                        alertMessage = message
                        showAlert = true
                    }
                }
            }, label: {
                Text("Войти")
            })
            NavigationLink(
                destination: MainView(),
                isActive: $toMainView,
                label: {
                    Text("")
                }).hidden()
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        })
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
