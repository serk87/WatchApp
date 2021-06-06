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
                        print(message)
                    }
                }
            }, label: {
                Text("Войти")
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
