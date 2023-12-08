//
//  AuthViewController.swift
//  Pods
//
//  Created by Виталик Молоков on 08.12.2023.
//

import UIKit
import SnapKit
import UIComponents

fileprivate extension Constants {
    static let horizontalOffset: CGFloat = 45
    static let buttonDividerOffset: CGFloat = 5
    static let interItemOffset: CGFloat = 58
    static let fieldHeight: CGFloat = 28
}

public final class AuthViewController: BaseViewController {
    
    private let contentView = UIView()
    private let loginTabButton = UIButton()
    private let buttonDividerView = UILabel()
    private let signUpTabButton = UIButton()
    private let userNameTextField = WTAuthTextField()
    private let passwordTextField = WTAuthTextField()
    private let loginButton = UIButton()
    
    override public func setup() {
        super.setup()
        
        view.backgroundColor = .white
        
        setupContentView()
        setupLoginTabButton()
        setupButtonDividerView()
        setupLSignUpTabButton()
        setupLoginTextField()
        setupPasswordTextField()
        setupLoginButton()
    }
    
}

private extension AuthViewController {
    
    func setupContentView() {
        view.addSubview(contentView)
        
        contentView.snp.makeConstraints { make in
            make.centerY.horizontalEdges.equalToSuperview()
        }
    }
    
    func setupLoginTabButton() {
        contentView.addSubview(loginTabButton)
        
        loginTabButton.setTitle("Login", for: .normal)
        loginTabButton.setTitleColor(.black, for: .normal)
        
        loginTabButton.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(Constants.horizontalOffset)
        }
    }
    
    func setupButtonDividerView() {
        contentView.addSubview(buttonDividerView)
        
        buttonDividerView.text = "/"
        
        buttonDividerView.snp.makeConstraints { make in
            make.centerY.equalTo(loginTabButton)
            make.leading.equalTo(loginTabButton.snp.trailing).offset(Constants.buttonDividerOffset)
        }
    }
    
    func setupLSignUpTabButton() {
        contentView.addSubview(signUpTabButton)
        
        signUpTabButton.setTitle("Sign Up", for: .normal)
        signUpTabButton.setTitleColor(.black, for: .normal)
        
        signUpTabButton.snp.makeConstraints { make in
            make.bottom.equalTo(loginTabButton)
            make.leading.equalTo(buttonDividerView.snp.trailing).offset(Constants.buttonDividerOffset)
        }
    }
    
    func setupLoginTextField() {
        contentView.addSubview(userNameTextField)
        
        userNameTextField.placeholder = "Username"
        
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(loginTabButton.snp.bottom).offset(Constants.interItemOffset)
            make.leading.equalToSuperview().inset(Constants.horizontalOffset)
            make.height.equalTo(Constants.fieldHeight)
        }
    }
    
    func setupPasswordTextField() {
        contentView.addSubview(passwordTextField)
        
        passwordTextField.placeholder = "password"
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(Constants.interItemOffset)
            make.leading.equalToSuperview().inset(Constants.horizontalOffset)
            make.height.equalTo(Constants.fieldHeight)
        }
    }
    
    func setupLoginButton() {
        contentView.addSubview(loginButton)
        
        loginButton.setTitle("Password", for: .normal)
        loginButton.backgroundColor = .blue
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Constants.interItemOffset)
            make.trailing.equalToSuperview().inset(Constants.horizontalOffset)
            make.bottom.equalToSuperview()
        }
    }
    
}
