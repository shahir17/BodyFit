//
//  LoginView.swift
//  BodyFit
//
//  Created by Ahmad Shahir Abdul Satar on 7/25/21.
//

import UIKit

class LoginView: UIView {
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Login"
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var loginTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  Username"
        textfield.backgroundColor = .lightGray
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    lazy var passwordTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "  Password"
        textfield.isSecureTextEntry = true
        textfield.backgroundColor = .lightGray
        textfield.layer.cornerRadius = 5
        return textfield
    }()
    
    var isLoading: Bool = false {
           didSet { isLoading ? startLoading() : finishLoading() }
    }
    
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.setTitle("Login", for: .normal)
        return button
    }()
    lazy var signupButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.layer.cornerRadius = 5
        button.setTitle("Signup", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }
    
    func startLoading() {
           isUserInteractionEnabled = false
       }
       
       func finishLoading() {
           isUserInteractionEnabled = true
       }
   
    
    func createSubviews() {
        self.backgroundColor = UIColor.white
        [loginTextField, passwordTextField, loginButton, signupButton, loginLabel]
                   .forEach {
                       addSubview($0)
                       $0.translatesAutoresizingMaskIntoConstraints = false
                   }
        NSLayoutConstraint.activate([
                    loginLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -200.0),
                    loginLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40.0),
                    loginLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40.0),
                    loginLabel.heightAnchor.constraint(equalToConstant: 55),

                    loginTextField.centerXAnchor.constraint(equalTo: self.centerXAnchor),
                    loginTextField.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -30.0),
                    loginTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40.0),
                    loginTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40.0),
                    loginTextField.heightAnchor.constraint(equalToConstant: 55),
                    
                    passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10.0),
                    passwordTextField.centerXAnchor.constraint(equalTo: loginTextField.centerXAnchor),
                    passwordTextField.widthAnchor.constraint(equalTo: loginTextField.widthAnchor, multiplier: 1.0),
                    passwordTextField.heightAnchor.constraint(equalTo: loginTextField.heightAnchor),
                    
                    loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 20.0),
                    loginButton.centerXAnchor.constraint(equalTo: loginTextField.centerXAnchor),
                    loginButton.widthAnchor.constraint(equalToConstant: 120.0),
                    loginButton.heightAnchor.constraint(equalToConstant: 55),
                ])
        signupButton.anchor(top: nil, paddingTop: 0, bottom: self.bottomAnchor, paddingBottom: 30, left: self.leftAnchor, paddingLeft: 30, right: self.rightAnchor, paddingRight: 30, width: 0, height: 55)
        
    }

}
