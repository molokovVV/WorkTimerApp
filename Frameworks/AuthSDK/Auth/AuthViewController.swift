//
//  AuthViewController.swift
//  Pods
//
//  Created by Виталик Молоков on 08.12.2023.
//

import UIKit
import SnapKit
import UIComponents

public final class AuthViewController: BaseViewController {
    
    private let contentView = UIView()
    private let titleSwitchView = WTTitleSwitchView()
    private let userNameTextField = WTAuthTextField()
    private let passwordTextField = WTAuthTextField()
    private let loginButton = UIButton()
    
    override public func setup() {
        super.setup()
        
        view.backgroundColor = .white
        
        setupContentView()
        setupTitleSwitchView()
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
    
    func setupTitleSwitchView() {
        contentView.addSubview(titleSwitchView)
        
        titleSwitchView.titles = ("Login", "Sign Up")
        
        titleSwitchView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview().inset(45)
        }
    }
    
    func setupLoginTextField() {
        contentView.addSubview(userNameTextField)
        
        userNameTextField.placeholder = "Username"
        
        userNameTextField.snp.makeConstraints { make in
            make.top.equalTo(titleSwitchView.snp.bottom).offset(58)
            make.leading.equalToSuperview().inset(45)
            make.height.equalTo(28)
        }
    }
    
    func setupPasswordTextField() {
        contentView.addSubview(passwordTextField)
        
        passwordTextField.placeholder = "password"
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(userNameTextField.snp.bottom).offset(58)
            make.leading.equalToSuperview().inset(45)
            make.height.equalTo(28)
        }
    }
    
    func setupLoginButton() {
        contentView.addSubview(loginButton)
        
        loginButton.setTitle("Password", for: .normal)
        loginButton.backgroundColor = .blue
        
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(58)
            make.trailing.equalToSuperview().inset(45)
            make.bottom.equalToSuperview()
        }
    }
    
}
