//
//  ContentView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 28.02.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var login = "admin"
    @State private var password = "123"
    
    @State private var isTabViewShow = false
    @State private var isIncorectCredentialsShowError = false
    
    private let keyboardIsOnPublisher = Publishers.Merge (
        NotificationCenter.default.publisher(for: UIResponder.keyboardDidChangeFrameNotification).map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false }
    )
        .removeDuplicates()
    
    var body: some View {
        ZStack {
            Color.blue
                .edgesIgnoringSafeArea(.all)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
    
            VStack {
                Image("vklogo")
                    .resizable()
                    .frame(maxWidth: 110, maxHeight: 80)
                
                TextField("Введите логин", text: self.$login)
                    .padding(.all, 10)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
                
                SecureField("Введите пароль", text: self.$password)
                    .padding(.all, 10)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
                
                Button {
                    if self.login == "admin" && self.password == "123" {
                        self.isTabViewShow = true
                    } else {
                        self.isIncorectCredentialsShowError = true
                    }
                    
                } label: {
                    Text("Войти")
                        .padding(.all, 10)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 30)
                }
                .disabled(self.login.isEmpty || self.password.isEmpty)
                .fullScreenCover(isPresented: self.$isTabViewShow) {
                    NewsListView()
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        .alert("Ошибка", isPresented: self.$isIncorectCredentialsShowError) {
            EmptyView()
        } message: {
            Text("Введены неверные данные")
        }

    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
