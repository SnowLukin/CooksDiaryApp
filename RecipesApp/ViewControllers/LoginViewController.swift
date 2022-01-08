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
    
    private let user = User.getUserLogin()
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        guard let tabbarController = segue.destination as? UITabBarController else { return }
//        guard let viewControllers = tabbarController.viewControllers else { return }
//
//        viewControllers.forEach {
//            if let navationVC = $0 as? UINavigationController {
//                let ingredientsRecipesVC = navationVC.topViewController as! IngredientsRecipesViewController
//                ingredientsRecipesVC.user = user
//                let personalPostsVC = navationVC.topViewController as! PersonalPostsViewController
//                personalPostsVC.user = user
//                let settingsVC = navationVC.topViewController as! SettingsPostsViewController
//                settingsVC.user = user
//            }
        
        }
    
    
    
    
    // MARK: IBActions
    @IBAction func forgotPasswordButtonPressed() {
        showAlert(title: "ПОДСКАЗКА!!!", message: """
                                                    Ваш логин - \(user.login)
                                                    Ваш пароль - \(user.password)
                                                    """)
    }
    
    @IBAction func loginButtonPressed() {
        if loginTF.text != user.login && passwordTF.text != user.password {
            showAlert(title: "ОШИБКА!!!",
                      message: "Введите правильный логин и пароль.",
                      textField: passwordTF)
        }
    }
    //MARK: - unwind seque
    @IBAction func unwindSeque (seque: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
    
    
}

// MARK: - Private Methods
extension LoginViewController {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ОК", style: .default) { _ in
            textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


    
    
    // MARK: Override Methods
//     Hide keyboard by touching on screen
extension LoginViewController: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else {
            loginButtonPressed()
            performSegue(withIdentifier: "showTabBarController", sender: nil)
        }
        return true
    @IBAction func unwindSegue(segue: UIStoryboardSegue){
        
    }
}
