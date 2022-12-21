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
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    private let authSignUpView = AuthHeaderView()
    
    private let nameAuthTextField = AuthTextField()
    private let emailAuthTextField = AuthTextField()
    private let passwordAuthTextField = AuthTextField()
    
    private let passwordView = UIView()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.appBlack, for: .normal)
        button.titleLabel?.font = .semiBold(size: 16)
        return button
    }()
    private let signUpButton = PrimaryButton()
    
    private let signInNowStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        return stackView
    }()
    
    private let signInNowLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appLightGray
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let signInNowButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = .bold(size: 17)
        button.setTitleColor(.appLightBlue, for: .normal)
        button.backgroundColor = UIColor.white
        return button
    }()
    
    private let validation = Validation()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContent()
        setLocalize()
    }
}

// MARK: - UILayout
extension RegisterViewController {
    
    private func addSubviews() {
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
        contentStackView.addArrangedSubview(passwordView)
        
        passwordView.addSubview(forgotPasswordButton)
        forgotPasswordButton.trailing(to: passwordView)
        forgotPasswordButton.leadingToSuperview(relation: .equalOrGreater)
        forgotPasswordButton.topToSuperview()
        forgotPasswordButton.bottomToSuperview()
        
        contentStackView.addArrangedSubview(signUpButton)
        
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

// MARK: - Configure
extension RegisterViewController {
    
    func configureContent() {
        view.backgroundColor = .white
        signUpButton.addTarget(self, action: #selector(signUpButtonAction), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonAction), for: .touchUpInside)
        passwordAuthTextField.isSecureTextEntry = true
        emailAuthTextField.autocapitalizationType = .none
        subscribe()
    }
}

// MARK: - SetLocalize
extension RegisterViewController {
    
    func setLocalize() {
        authSignUpView.title = "Sign Up"
        authSignUpView.subtitle = "Login or sign up to continue using our app."
        nameAuthTextField.placeholder = "Full Name"
        emailAuthTextField.placeholder = "Email Address"
        passwordAuthTextField.placeholder = "Password"
        signInNowLabel.text = "Already have an account?"
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        signInNowButton.setTitle(" Sign In Now", for: .normal)
        signUpButton.setTitle("Sign Up", for: .normal)
        
    }
}

// MARK: - Actions
extension RegisterViewController {
    
    @objc
    private func signUpButtonAction() {
        guard
            let unrappedName = nameAuthTextField.text,
            let unwrappedEmail = emailAuthTextField.text,
            let unwrappedPassword = passwordAuthTextField.text
        else { return }
        
        guard validation.isValidName(unrappedName) else { return }
        guard validation.isValidEmail(unwrappedEmail) else { return }
        guard validation.isValidPassword(unwrappedPassword) else { return }
        
        viewModel.registerRequest(fullName: unrappedName, email: unwrappedEmail, password: unwrappedPassword)
    }
    
    @objc
    private func forgotPasswordButtonAction() {
        let forgotPasswordVC = ForgotPasswordViewController(viewModel: ForgotPasswordViewModel())
        self.navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
}

// MARK: - Subscribe
extension RegisterViewController {
    
    private func subscribe() {
        viewModel.pushToLoginVC = { [weak self] in
            guard let self = self else { return }
            let loginVC = LoginViewController(viewModel: LoginViewModel())
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
}
