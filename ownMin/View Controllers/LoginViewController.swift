//
//  LoginViewController.swift
//  ownMin
//
//  Created by Bakulia Kurmant on 4/28/20.
//  Copyright © 2020 Bakulia Kurmant. All rights reserved.
//

import Foundation
import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var usernameTextField: UITextField!
    
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        // Hide the error label
        errorLabel.alpha = 0
        
        // Style the elements
        Utilities.styleTextField(usernameTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
        
    }
    
    
    @IBAction func logintapped(_ sender: Any) {
        
        // Validate the text fields
        
        // Create text field exnty
        let username = usernameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in user
        Auth.auth().signIn(withEmail: username, password: password) { (result, error) in
            
            if error != nil {
                //Cannot sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
                
            }
            else{
                let mainTabBarController = self.storyboard?.instantiateViewController(withIdentifier: "MainTabBarController") as! MainTabBarController
                
               
                
                
//
//
//                mainTabBarController.selectedViewController = mainTabBarController.viewControllers?[Tabs.Middle.rawValue]
                
                
                self.view.window?.rootViewController = mainTabBarController
                self.view.window?.makeKeyAndVisible()
                
            }
        }
        
    }
    
}
