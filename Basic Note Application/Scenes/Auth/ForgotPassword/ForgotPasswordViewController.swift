//
//  ForgotPasswordViewController.swift
//  Basic Note Application
//
//  Created by İbrahim Kültepe on 5.12.2022.
//

import UIKit

class ForgotPasswordViewController: BaseViewController<ForgotPasswordViewModel> {
    
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    private let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()
    
    private let forgotPasswordView = AuthView()
    
    private let emailAuthTextField = AuthTextField()
    
    private let resetPasswordButton = PrimaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureContent()
        setLocalize()
    }
}

// MARK: - UILayout
extension ForgotPasswordViewController {
    
    private func addSubviews() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview(usingSafeArea: true)
        
        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .init(top: 100, left: 10, bottom: 0, right: 10))
        
        contentStackView.addArrangedSubview(forgotPasswordView)
        contentStackView.setCustomSpacing(50, after: forgotPasswordView)
        contentStackView.addArrangedSubview(emailAuthTextField)
        contentStackView.addArrangedSubview(resetPasswordButton)
    }
}

//MARK: - Configure
extension ForgotPasswordViewController {
    
    private func configureContent() {
        view.backgroundColor = .white
        resetPasswordButton.addTarget(self, action: #selector(resetPasswordButtonAction), for: .touchUpInside)
    }
}

//MARK: - Localize
extension ForgotPasswordViewController {
    
    private func setLocalize() {
        forgotPasswordView.title = "Forgot Password?"
        forgotPasswordView.subtitle = "Confirm your email and we’ll send\nthe instructions."
        emailAuthTextField.placeholder = "Email Adresses"
        resetPasswordButton.setTitle("Reset Password", for: .normal)
    }
}

//MARK: - Actions
extension ForgotPasswordViewController {
    
    @objc
    private func resetPasswordButtonAction() {
        
    }
}
