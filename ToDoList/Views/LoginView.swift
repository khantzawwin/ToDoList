//
//  LoginView.swift
//  ToDoList
//
//  Created by KZW on 15/10/23.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, backgroundColor: .pink)
                
                
                
                //Login Form
                Form{
                    
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .autocorrectionDisabled()
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    TLButton(title: "Log In", backgroundColor: .blue){
                        viewModel.login()
                    }
                }
                .offset(y:-50)
                
                //create account
                VStack{
                    Text("New User?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom,50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
