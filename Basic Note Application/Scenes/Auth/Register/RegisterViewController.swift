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
    private let nameAuthTextField = AuthTextField()
    private let emailAuthTextField = AuthTextField()
    private let passwordAuthTextField = AuthTextField()
    private let authSignUpView = AuthSignUpView()
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .right
        label.text = "Forgot Password?"
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    private let signInNowLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.textAlignment = .center
        label.text = "Already have an account? Sign in now"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        authSignUpView.title = "Sign Up"
        authSignUpView.subtitle = "Login or sign up to continue using our app."
        nameAuthTextField.placeholder = "Full Name"
        emailAuthTextField.placeholder = "Email Address"
        passwordAuthTextField.placeholder = "Password"
        passwordAuthTextField.isSecureTextEntry = true
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom ,usingSafeArea: true)

        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .init(top: 100, left: 10, bottom: 0, right: 10))
        
        contentStackView.addArrangedSubview(authSignUpView)
        contentStackView.setCustomSpacing(50, after: authSignUpView)
        contentStackView.addArrangedSubview(nameAuthTextField)
        contentStackView.addArrangedSubview(emailAuthTextField)
        contentStackView.addArrangedSubview(passwordAuthTextField)
        contentStackView.addArrangedSubview(forgotPasswordLabel)
        contentStackView.setCustomSpacing(20, after: forgotPasswordLabel)
        contentStackView.addArrangedSubview(primaryButton)
        
        view.addSubview(signInNowLabel)
        signInNowLabel.topToBottom(of: scrollView)
        signInNowLabel.leadingToSuperview()
        signInNowLabel.trailingToSuperview()
        signInNowLabel.bottomToSuperview(usingSafeArea: true)
    }
}

