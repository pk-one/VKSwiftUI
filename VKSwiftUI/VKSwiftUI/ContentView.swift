//
//  ContentView.swift
//  VKSwiftUI
//
//  Created by Pavel Olegovich on 28.02.2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var login = ""
    @State private var password = ""
    
    private let keyboardIsOnPublisher = Publishers.Merge (
        NotificationCenter.default.publisher(for: UIResponder.keyboardDidChangeFrameNotification).map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification).map { _ in false }
    )
        .removeDuplicates()
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Color.blue
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: geometry.size.width, maxHeight: geometry.size.height)
            }
            VStack {
//                Text("VKontakte")
//                    .padding(.top, 32)
//                    .font(.largeTitle)
                Image("vklogo")
                    .resizable()
                    .frame(maxWidth: 110, maxHeight: 80)
                
                TextField("Введите логин", text: $login)
                    .padding(.all, 10)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
                
                SecureField("Введите пароль", text: $password)
                    .padding(.all, 10)
                    .background(.white)
                    .cornerRadius(12)
                    .padding(.horizontal, 30)
                
                Button {
                    print("Войти")
                } label: {
                    Text("Войти")
                        .padding(.all, 10)
                        .frame(maxWidth: .infinity)
                        .background(.white)
                        .cornerRadius(12)
                        .padding(.horizontal, 30)
                }
            }
        }
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
