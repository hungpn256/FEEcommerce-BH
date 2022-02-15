//
//  LoginViewController.swift
//  FEEcommerce
//
//  Created by Pham Hung on 2/11/22.
//

import UIKit
import Firebase
class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rePasswordTextField: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    private var loading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Register"
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        rePasswordTextField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @IBAction func toggleShowPassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func usernameEditingDidEnd(_ sender: Any) {
        if(usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0 && rePasswordTextField.text?.count ?? 0 > 0){
            btnRegister.isEnabled = true
        }
        else{
            btnRegister.isEnabled = false
        }
    }
    
    @IBAction func passwordEditingDidEnd(_ sender: Any) {
        if(usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0 && rePasswordTextField.text?.count ?? 0 > 0){
            btnRegister.isEnabled = true
        }else{
            btnRegister.isEnabled = false
        }
    }
    
    @IBAction func RepasswordEditingDidEnd(_ sender: Any) {
        if(usernameTextField.text?.count ?? 0 > 0 && passwordTextField.text?.count ?? 0 > 0 && rePasswordTextField.text?.count ?? 0 > 0){
            btnRegister.isEnabled = true
        }else{
            btnRegister.isEnabled = false
        }
    }
    @IBAction func submitRegister(_ sender: Any) {
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
        
        guard let rePassword = rePasswordTextField.text else{
            alert.message = "Re Password is empty!!"
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
        
        guard password == rePassword else{
            alert.message = "Password is not match re-password"
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        isLoading()
        
        Auth.auth().createUser(withEmail: username, password: password) { data, error in
            var messeage = ""
            error.map { error in
                messeage += error.localizedDescription+" "
            }
            
            guard let data = data, error == nil else{
                alert.message = messeage
                self.present(alert, animated: true, completion: nil)
                self.hideLoading()
                return
            }
            
            Firestore.firestore().collection("users").document(data.user.uid)
                .setData(UserPOST(email: username, password: password, username: username, phone: "", DOB: "").toDict()){ err in
                    self.hideLoading()
                    if let error = err {
                        messeage = error.localizedDescription
                        self.present(alert, animated: true, completion: nil)
                    }else{
                        alert.message = "Create account successfully"
                        alert.title = "Success"
                        self.present(alert, animated: true, completion: {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                self.navigationController?.popToRootViewController(animated: true)
                            }
                        })
                        
                    }
                }
           
        }
    }
    
    func isLoading(){
        btnRegister.isEnabled = false
    }
    
    func hideLoading(){
        btnRegister.isEnabled = true
    }
}

extension RegisterViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if (textField == self.usernameTextField) {
            self.passwordTextField.becomeFirstResponder()
        }
        else if (textField == self.passwordTextField) {
            self.rePasswordTextField.becomeFirstResponder()
            
        }
        return true
    }
}
