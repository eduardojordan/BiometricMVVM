//
//  ViewModelBiometric.swift
//  BiometricMVVM-SwiftUI
//
//  Created by Eduardo Jordan on 23/4/24.
//

import SwiftUI
import LocalAuthentication

struct ViewModelBiometric {
    @State var biometricState: Bool = false
    let context = LAContext()
    
    func authenticate() {
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Please authenticate for contiue") { success, error in
                if success {
                    biometricState.toggle()
                }else{
                    print("Error in authentication biometric \(String(describing: error))")
                }
            }
        } else {
            print("This device don´t support Biometric")
        }
    }
}

