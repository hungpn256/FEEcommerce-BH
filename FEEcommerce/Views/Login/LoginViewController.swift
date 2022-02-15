//
//  LoginViewController.swift
//  FEEcommerce
//
//  Created by Pham Hung on 2/11/22.
//

import UIKit
import Firebase
class LoginViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Log In"
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func toggleShowPassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func navigateRegister(_ sender: Any) {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func usernameEditingDidEnd(_ sender: Any) {
        if(usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0 ){
            btnLogin.isEnabled = true
        }
        else{
            btnLogin.isEnabled = false
        }
    }
    
    @IBAction func passwordEditingDidEnd(_ sender: Any) {
        if(usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0){
            btnLogin.isEnabled = true
        }else{
            btnLogin.isEnabled = false
        }
    }
    
    @IBAction func submitLogin(_ sender: Any) {
        let alert = UIAlertController(title: "Erorr", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        guard let username = usernameTextField.text else{
            alert.message = "Email is empty!!"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard let password = passwordTextField.text else{
            alert.message = "Password is empty!!"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        guard emailPred.evaluate(with: username) else{
            alert.message = "The email is valid!!"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        guard password.count >= 6 else{
            alert.message = "The password must be 6 characters long or more!!"
            self.present(alert, animated: true, completion: nil)
            return
        }
        self.isLoading()
        Auth.auth().signIn(withEmail: username, password: password) { result, error in
            guard let uid = result?.user.uid else{
                alert.message = "Something when wrong!!"
                self.present(alert, animated: true, completion: nil)
                return
            }
            API.shared.getSingleData(collection: "users", id: uid, modelData: UserGET.self) { result in
                self.hideLoading()
                switch result {
                case .success(let user):
                    AppDelegate.shared.data?.user = user
                    print("user",user)
                    UserDefaults.standard.set(user.id, forKey: "uid")
                case .failure(let err):
                    alert.message = err.localizedDescription
                    self.present(alert, animated: true, completion: nil)
                    print(err)
                }
                
            }
        }
        
    }
    
    func isLoading(){
        btnLogin.isEnabled = false
    }
    
    func hideLoading(){
        btnLogin.isEnabled = true
    }
    
}

extension LoginViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == self.usernameTextField) {
            self.passwordTextField.becomeFirstResponder()
        }
        else if (textField == self.passwordTextField) {
//            self.emailField.becomeFirstResponder()
            
        }
        return true
    }
}
