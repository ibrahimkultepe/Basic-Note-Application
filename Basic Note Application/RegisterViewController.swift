//
//  ViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.09.2022.
//

import UIKit
import TinyConstraints
import Alamofire

class RegisterViewController: BaseViewController<RegisterViewModel> {
    
    private let primaryButton = PrimaryButton()
    private let authTextField = AuthTextField()
    private let authTextField2 = AuthTextField()
    private let authTextField3 = AuthTextField()
    private let authSignUpView = AuthSignUpView()
    
        private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.backgroundColor = .cyan
        return stackView
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .right
        label.text = "Forgot Password?"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let signInNowLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.text = "Already have an account? Sign in now"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        authSignUpView.title = "Sign Up"
        authSignUpView.subtitle = "Login or sign up to continue using our app."
        authTextField.placeholder = "Full Name"
        authTextField2.placeholder = "Email Address"
        authTextField3.placeholder = "Password"
        setupViews()
        viewModel.loading()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.edgesToSuperview( insets: .init(top: 100, left: 10, bottom: 30, right: 10) ,usingSafeArea: true)
        
        stackView.addArrangedSubview(authSignUpView)
        
        stackView.addArrangedSubview(authTextField)
        stackView.addArrangedSubview(authTextField2)
        stackView.addArrangedSubview(authTextField3)
        stackView.addArrangedSubview(forgotPasswordLabel)
        
        stackView.addArrangedSubview(primaryButton)
        
        stackView.addArrangedSubview(signInNowLabel)
    }
}

