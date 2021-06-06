//
//  ContentView.swift
//  WatchApp WatchKit Extension
//
//  Created by luser on 06.06.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var email = ""
    @State var password = ""
    @State var showAlert = false
    @State var alertMessage = ""
    @StateObject var userObject = UserObject()
    var body: some View {
        VStack {
            TextField("vasya@mail.com", text: $email)
            SecureField("******", text: $password)
            Button(action: {
                userObject.login(email: email, password: password) { message in
                    if message == "Success" {
                        print(message)
                    } else {
                        alertMessage = message
                        showAlert = true
                    }
                }
            }, label: {
                Text("Войти")
            })
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
