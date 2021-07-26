//
//  ViewController.swift
//  BodyFit
//
//  Created by Ahmad Shahir Abdul Satar on 7/23/21.
//

import UIKit
import Combine

class LoginViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    private lazy var loginView = LoginView()
    private let viewModel: LoginViewModel
    private var bindings = Set<AnyCancellable>()
    
    init(viewModel: LoginViewModel = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        self.view = loginView
        setupTargets()
        setupBindings()
    }
    
    private func setupTargets() {
        loginView.loginButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        loginView.signupButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)
    }
    
    private func setupBindings() {
        func bindViewToViewModel() {
            loginView.loginTextField.textPublisher
                .receive(on: DispatchQueue.main)
                .assign(to: \.login, on: viewModel)
                .store(in: &bindings)
            
            loginView.passwordTextField.textPublisher
                .receive(on: RunLoop.main)
                .assign(to: \.password, on: viewModel)
                .store(in: &bindings)
        }
        func bindViewModelToView() {
                    viewModel.isInputValid
                        .receive(on: RunLoop.main)
                        .assign(to: \.isValid, on: loginView.loginButton)
                        .store(in: &bindings)
                    
                    viewModel.$isLoading
                        .assign(to: \.isLoading, on: loginView)
                        .store(in: &bindings)
                    
                    viewModel.validationResult
                        .sink { completion in
                            switch completion {
                            case .failure:
                                // Error can be handled here (e.g. alert)
                                return
                            case .finished:
                                return
                            }
                        } receiveValue: { [weak self] _ in
                            print("logged in successfully!!")
                            self?.coordinator?.eventOccurred(with: .loggedIn)

                        }
                        .store(in: &bindings)
                    
                }
        
        bindViewToViewModel()
        bindViewModelToView()
    }
    
    @objc func didTapButton() {
        viewModel.validateCredentials()
    }
    
    @objc func signUp() {
        coordinator?.eventOccurred(with: .signUp)
    }


}

