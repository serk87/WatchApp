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
    var body: some View {
        VStack {
            TextField("vasya@mail.com", text: $email)
            SecureField("******", text: $password)
            Button(action: {
                
            }, label: {
                Text("Войти")
            })
        }.frame(width: 190)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
