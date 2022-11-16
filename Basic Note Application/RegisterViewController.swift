//
//  ViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 16.09.2022.
//

import UIKit
import TinyConstraints
import Alamofire

class RegisterViewController: UIViewController {
    
    let primaryButton = PrimaryButton()
    let authTextField = AuthTextField()
    let authTextField2 = AuthTextField()
    let authTextField3 = AuthTextField()
    let authSignUpView = AuthSignUpView()
    
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
    }
    
    private let viewModel: RegisterViewModel
    
    init(viewModel: RegisterViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

