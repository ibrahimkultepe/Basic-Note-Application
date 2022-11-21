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
    private let validation = Validation()
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
        label.textColor = UIColor(red: 0.137, green: 0.137, blue: 0.235, alpha: 1)
        label.textAlignment = .right
        label.text = "Forgot Password?"
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private let signInNowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let signInNowLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.545, green: 0.584, blue: 0.604, alpha: 1)
        label.text = "Already have an account?"
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let signInNowButton: UIButton = {
        let button = UIButton()
        button.setTitle(" Sign In Now", for: .normal)
        button.titleLabel?.font = .bold(size: 17)
        button.setTitleColor(UIColor(red: 0.545, green: 0.549, blue: 1, alpha: 1), for: .normal)
        button.backgroundColor = UIColor.white
        return button
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
        primaryButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        setupViews()
    }
    
    @objc func buttonAction() {
        if let unwrappedEmail = emailAuthTextField.text {
            validation.isValidEmail(unwrappedEmail)
        }
        
        guard let unwrappedPassword = passwordAuthTextField.text else { return }
        validation.isValidPassword(unwrappedPassword)
        
        guard let unrappedName = nameAuthTextField.text else { return }
        validation.isValidName(unrappedName)
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
        
        view.addSubview(signInNowStackView)
        signInNowStackView.topToBottom(of: scrollView)
        signInNowStackView.centerXToSuperview()
        signInNowStackView.leadingToSuperview(relation: .equalOrGreater)
        signInNowStackView.trailingToSuperview(relation: .equalOrLess)
        signInNowStackView.bottomToSuperview(usingSafeArea: true)
        signInNowStackView.addArrangedSubview(signInNowLabel)
        signInNowStackView.addArrangedSubview(signInNowButton)
    }
}

