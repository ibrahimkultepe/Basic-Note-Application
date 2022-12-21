//
//  LoginViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 1.12.2022.
//

import UIKit
import TinyConstraints

class LoginViewController: BaseViewController<LoginViewModel> {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let loginView = AuthHeaderView()
    
    private let emailAuthTextField = AuthTextField()
    private let passwordAuthTextField = AuthTextField()
    
    private let passwordView = UIView()
    
    private let forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.appBlack, for: .normal)
        button.titleLabel?.font = .semiBold(size: 16)
        return button
    }()
    
    private let loginButton = PrimaryButton()
    
    private let signUpStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        return stackView
    }()
    
    private let signUpLabel: UILabel = {
        let label = UILabel()
        label.textColor = .appLightGray
        label.font = .systemFont(ofSize: 17, weight: .bold)
        return label
    }()
    
    private let signUputton: UIButton = {
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
extension LoginViewController {
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(excluding: .bottom ,usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .init(top: 100, left: 10, bottom: 0, right: 10))
        
        contentStackView.addArrangedSubview(loginView)
        contentStackView.setCustomSpacing(50, after: loginView)
        contentStackView.addArrangedSubview(emailAuthTextField)
        contentStackView.addArrangedSubview(passwordAuthTextField)
        contentStackView.addArrangedSubview(passwordView)
        
        passwordView.addSubview(forgotPasswordButton)
        forgotPasswordButton.trailing(to: passwordView)
        forgotPasswordButton.leadingToSuperview(relation: .equalOrGreater)
        forgotPasswordButton.topToSuperview()
        forgotPasswordButton.bottomToSuperview()
        
        contentStackView.addArrangedSubview(loginButton)
        
        view.addSubview(signUpStackView)
        signUpStackView.topToBottom(of: scrollView)
        signUpStackView.centerXToSuperview()
        signUpStackView.leadingToSuperview(relation: .equalOrGreater)
        signUpStackView.trailingToSuperview(relation: .equalOrLess)
        signUpStackView.bottomToSuperview(usingSafeArea: true)
        signUpStackView.addArrangedSubview(signUpLabel)
        signUpStackView.addArrangedSubview(signUputton)
    }
}

// MARK: - Configure
extension LoginViewController {
    
    private func configureContent() {
        view.backgroundColor = .white
        navigationItem.hidesBackButton = true
        loginButton.addTarget(self, action: #selector(loginButtonAction), for: .touchUpInside)
        forgotPasswordButton.addTarget(self, action: #selector(forgotPasswordButtonAction), for: .touchUpInside)
        passwordAuthTextField.isSecureTextEntry = true
        emailAuthTextField.autocapitalizationType = .none
        subscribe()
    }
}

// MARK: - SetLocalize
extension LoginViewController {
    
    private func setLocalize() {
        loginView.title = "Login"
        loginView.subtitle = "Login or sign up to continue using our app."
        emailAuthTextField.placeholder = "Email Adresses"
        passwordAuthTextField.placeholder = "Password"
        forgotPasswordButton.setTitle("Forgot Password?", for: .normal)
        loginButton.setTitle("Login", for: .normal)
        signUpLabel.text = "New user?"
        signUputton.setTitle("Sign up now", for: .normal)
    }
}

// MARK: - Actions
extension LoginViewController {
    
    @objc
    private func loginButtonAction() {
        guard
            let unwrappedEmail = emailAuthTextField.text,
            let unwrappedPassword = passwordAuthTextField.text
        else { return }
        
        guard validation.isValidEmail(unwrappedEmail) else { return }
        guard validation.isValidPassword(unwrappedPassword) else { return }
        
        viewModel.loginRequest(email: unwrappedEmail, password: unwrappedPassword)
    }
}

// MARK: - Subscribe
extension LoginViewController {
    
    private func subscribe() {
        viewModel.pushToNoteVC = { [weak self] in
            guard let self = self else { return }
            let noteVC = NoteListViewController(viewModel: NoteListViewModel())
            self.navigationController?.pushViewController(noteVC, animated: true)
        }
    }
    
    @objc
    private func forgotPasswordButtonAction() {
//        let forgotPasswordVC = ForgotPasswordViewController(viewModel: ForgotPasswordViewModel())
//        self.navigationController?.pushViewController(forgotPasswordVC, animated: true)
    }
}
