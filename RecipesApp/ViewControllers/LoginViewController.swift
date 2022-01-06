//
//  LoginViewController.swift
//  RecipesApp
//
//  Created by Snow Lukin on 31.12.2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var loginButton: UIButton!
    
    
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        loginButton.layer.cornerRadius = 12
    }
    
    // MARK: Override Methods
    // Hide keyboard by touching on screen
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: IBActions
    @IBAction func forgotPasswordButtonPressed() {
        
    }
    
    @IBAction func loginButtonPressed() {
        performSegue(withIdentifier: "loginSegue", sender: nil)
    }
    
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }
}
