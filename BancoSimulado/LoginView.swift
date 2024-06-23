//
//  LoginView.swift
//  BancoSimulado
//
//  Created by MACBOOK on 23/06/24.
//

import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isAuthenticated: Bool = false
    
    var body: some View {
        if isAuthenticated {
            ContentView()
        } else {
            VStack {
                Text("Banco Simulado")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                TextField("Usuario", text: $username)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                SecureField("Contraseña", text: $password)
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button(action: {
                    authenticate()
                }) {
                    Text("Iniciar Sesión")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.top)
                }
            }
            .padding()
        }
    }
    
    func authenticate() {
        // Simulamos la autenticación del usuario
        if username == "usuario" && password == "contraseña" {
            isAuthenticated = true
        } else {
            // Mostrar error de autenticación (puedes mejorarlo con una alerta)
            print("Usuario o contraseña incorrectos")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
