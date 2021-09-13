//
//  ViewController.swift
//  GoogleSignInTestApp
//
//  Created by James Lea on 9/10/21.
//

import UIKit
import Firebase
import GoogleSignIn

class ViewController: UIViewController {
    // MARK: - Outlets
    @IBOutlet weak var signInButton: GIDSignInButton!
    
    @IBOutlet weak var signOutButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    @IBAction func signOutTapped(_ sender: Any) {
        
    }
    
    @IBAction func signOutButtonTapped(_ sender: Any) {
        
    }
    
    func signIn(){
        
    }
    
    
    
    
    // MARK: - FNs
    func googleSignIn(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in
            
            if let error = error {
                // ...
                return
            }
            
            guard
                let authentication = user?.authentication,
                let idToken = authentication.idToken
            else {
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: authentication.accessToken)
            
            // ...
        }
    }
    
    
}//End of class
