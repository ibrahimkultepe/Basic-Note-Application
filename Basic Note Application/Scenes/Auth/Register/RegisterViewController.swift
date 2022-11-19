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
        label.textColor = .black
        label.textAlignment = .right
        label.text = "Forgot Password?"
        label.font = .systemFont(ofSize: 15, weight: .heavy)
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
        authTextField.placeholder = "Full Name"
        authTextField2.placeholder = "Email Address"
        authTextField3.placeholder = "Password"
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.edgesToSuperview( excluding: .bottom ,usingSafeArea: true)

        scrollView.addSubview(contentView)
        contentView.edgesToSuperview()
        contentView.widthToSuperview()
        
        contentView.addSubview(contentStackView)
        contentStackView.edgesToSuperview(insets: .init(top: 100, left: 10, bottom: 0, right: 10))
        
        contentStackView.addArrangedSubview(authSignUpView)
        contentStackView.setCustomSpacing(50, after: authSignUpView)
        contentStackView.addArrangedSubview(authTextField)
        contentStackView.addArrangedSubview(authTextField2)
        contentStackView.addArrangedSubview(authTextField3)
        contentStackView.addArrangedSubview(forgotPasswordLabel)
        contentStackView.addArrangedSubview(primaryButton)
        
        view.addSubview(signInNowLabel)
        signInNowLabel.topToBottom(of: scrollView)
        signInNowLabel.leadingToSuperview()
        signInNowLabel.trailingToSuperview()
        signInNowLabel.bottomToSuperview(usingSafeArea: true)
    }
}

