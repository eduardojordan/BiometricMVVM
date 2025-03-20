//
//  ContentView.swift
//  BiometricMVVM-SwiftUI
//
//  Created by Eduardo Jordan on 23/4/24.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State var biometricState: Bool = false
    var viewModel = ViewModelBiometric()
    let context = LAContext()
    var body: some View {
        VStack {
            Button(action: {
                viewModel.authenticate()
            }, label: {
                VStack{
                    Image(systemName: "faceid")
                        .font(.system(size: 120))
                    Text("Press to Show Secret")
                        .padding(.top, 20)
                }
            })
            if viewModel.biometricState {
                Text("Your Face is correct WELCOME!")
                    .font(.largeTitle)
                    .bold()
                    .padding()
            }
        }
        .offset(y: -100)
        .padding()
    }
    
    func authenticate() {
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate for contiue") { success, error in
                if success {
                    biometricState.toggle()
                }else{
                    print("Error in authentication biometric")
                }
            }
        } else {
            print("This device don´t support Biometric")
        }
  
    }
}

#Preview {
    ContentView()
}
