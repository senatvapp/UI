import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn: Bool = false
    @State private var errorMessage: String? = nil
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Iniciar Sesión")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                // Campo de correo electrónico
                TextField("Correo Electrónico", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal)
                
                // Campo de contraseña
                SecureField("Contraseña", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                // Mostrar mensaje de error (si existe)
                if let errorMessage = errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .font(.footnote)
                }
                
                // Botón de inicio de sesión
                Button(action: {
                    handleLogin()
                }) {
                    Text("Iniciar Sesión")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                Spacer()
                
                // Navegación a registro
                NavigationLink(destination: RegisterView()) {
                    Text("¿No tienes cuenta? Regístrate aquí")
                        .font(.footnote)
                        .foregroundColor(.blue)
                }
            }
            .padding()
        }
    }
    
    // Simulación de autenticación
    func handleLogin() {
        if email.isEmpty || password.isEmpty {
            errorMessage = "Por favor, llena todos los campos."
            return
        }
        
        // Simulación de validación
        if email == "usuario@example.com" && password == "1234" {
            isLoggedIn = true
            errorMessage = nil
        } else {
            errorMessage = "Correo o contraseña incorrectos."
        }
    }
}

struct RegisterView: View {
    var body: some View {
        Text("Pantalla de Registro")
            .font(.title)
    }
}

// Vista principal
struct ContentView: View {
    var body: some View {
        LoginView()
    }
}

// App principal
@main
struct LoginApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
