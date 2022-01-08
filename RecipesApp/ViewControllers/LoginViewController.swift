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
    
    private let users = User.getUserLogin()
        
    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        containerView.layer.cornerRadius = 20
        containerView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        loginButton.layer.cornerRadius = 12
        
        loginTF.delegate = self
        passwordTF.delegate = self
        setTextFields()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let user = findUser(userName: loginTF.text ?? "", password: passwordTF.text ?? "")
        guard let user = user else {
            let title = "Incorrect username or password\n"
            let message = "The username or password you entered is incorrect. Please try again.\n"
            invalidInputAlert(title: title, message: message)
            return
        }
        
        guard let tabbarController = segue.destination as? TabBarController else { return }
        tabbarController.user = user
    }
    
    // MARK: IBActions
    @IBAction func unwind(for unwindSegue: UIStoryboardSegue) {
        
        loginTF.text = nil
        passwordTF.text = nil
    }
    
    @IBAction func forgotPasswordAction(_ sender: UIButton) {
        forgotAlert(title: "Forgot password?\n", message: "Your password is test\n")
    }

    
    
    // MARK: - Public Methods
    func isUserExist() -> Bool {
        guard let userName = loginTF.text, let password = passwordTF.text,
              checkUser(userName: userName, password: password)
        else {
            let title = "Incorrect username or password\n"
            let message = "The username or password you entered is incorrect. Please try again.\n"
            invalidInputAlert(title: title, message: message)
            return false
        }
        return true
    }
    
    // MARK: - Private Methods
    
    private func setTextFields() {
        loginTF.returnKeyType = .next
        passwordTF.returnKeyType = .done
        
        passwordTF.enablesReturnKeyAutomatically = true
        
        loginTF.tintColor = .lightGray
        loginTF.setIcon(UIImage(named: "user")!)
        
        passwordTF.tintColor = .lightGray
        passwordTF.setIcon(UIImage(named: "password")!)
    }
    
    private func findUser(userName: String, password: String) -> User? {
        for user in users {
            if user.login == userName && user.password == password {
                return user
            }
        }
        return nil
    }
    
    private func checkUser(userName: String, password: String) -> Bool {
        users.contains(where: {
            $0.login == userName && $0.password == password
        })
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


extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == loginTF {
            passwordTF.becomeFirstResponder()
        } else if isUserExist() {
            performSegue(withIdentifier: "LogInSegue", sender: self)
        }
        
        return true
    }
}

// MARK: Alerts
extension LoginViewController {
    private func forgotAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        alert.setNeededFont()
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    private func invalidInputAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = nil
        }
        
        alert.setNeededFont()
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: Keyboard
extension LoginViewController {
    
    @objc func keyboardWillBeShown(_ notification: NSNotification) {
        // continue only if frame is not up already
        guard view.frame.origin.y == 0 else { return }
        
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                                  as? NSValue)?.cgRectValue else { return }
        
        let topOfKeyboard = keyboardSize.minY
        let bottomOfContainerView = passwordTF.convert(passwordTF.bounds, to: view).maxY;
        let spaceFromBottomToContainer = view.frame.maxY - bottomOfContainerView
        
        // if the bottom of ContainerView is below the top of keyboard, move up
        if bottomOfContainerView > topOfKeyboard {
            view.frame.origin.y = 0 - (keyboardSize.height - spaceFromBottomToContainer + 15)
        }
    }
    
    @objc func keyboardWillBeHidden(_ notification: NSNotification) {

        // move view back to normal
        view.frame.origin.y = 0
    }
    
    private func getKeyboardStatus() {
        
        // Listen for keyboard events
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeShown(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillBeHidden(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
}
