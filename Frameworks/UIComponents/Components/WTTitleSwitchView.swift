//
//  WTTitleSwitchView.swift
//  UIComponents
//
//  Created by Виталик Молоков on 08.12.2023.
//

import UIKit
import SnapKit

open class WTTitleSwitchView: BaseView {
    
    private let leftButton = UIButton()
    private let rightButton = UIButton()
    private let buttonSeparatorView = UILabel()
    
    private let animationTimeInterval: TimeInterval = 0.3
    
    public var state = ActivityState.left
    public var titles: (leftTitle: String, rightTitle: String)? = nil {
        didSet {
            leftButton.setTitle(titles?.leftTitle, for: .normal)
            rightButton.setTitle(titles?.rightTitle, for: .normal)
        }
    }
    
    override func setup() {
        super.setup()
        
        setupLeftButton()
        setupButtonSeparatorView()
        setupRightButton()
    }
}

// MARK: - Setup UI
private extension WTTitleSwitchView {
    
    func setupLeftButton() {
        addSubview(leftButton)
        
        leftButton.setTitleColor(.black, for: .normal)
        leftButton.addTarget(self, action: #selector(leftButtonHandler), for: .touchUpInside)
        
        leftButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview()
        }
    }
    
    func setupButtonSeparatorView() {
        addSubview(buttonSeparatorView)
        
        buttonSeparatorView.text = "/"
        
        buttonSeparatorView.snp.makeConstraints { make in
            make.centerY.equalTo(leftButton)
            make.leading.equalTo(leftButton.snp.trailing).offset(5)
        }
    }
    
    func setupRightButton() {
        addSubview(rightButton)
        
        rightButton.setTitleColor(.black, for: .normal)
        rightButton.addTarget(self, action: #selector(rightButtonHandler), for: .touchUpInside)
        
        
        rightButton.snp.makeConstraints { make in
            make.leading.equalTo(buttonSeparatorView.snp.trailing).offset(5)
            make.trailing.bottom.equalToSuperview()
        }
    }
}

private extension WTTitleSwitchView {
    func animateButtonSeparatorViewByTap() {
        UIView.animate(withDuration: animationTimeInterval) { 
            self.buttonSeparatorView.alpha = 0
        } completion: { _ in
            UIView.animate(withDuration: self.animationTimeInterval) {
                self.buttonSeparatorView.alpha = 1
            }
        }
    }
}

public extension WTTitleSwitchView {
    enum ActivityState {
        case left
        case right
    }
}

// MARK: - Actions
public extension WTTitleSwitchView {
    
    @IBAction func leftButtonHandler() {
        if state == .right {
            animateButtonSeparatorViewByTap()
            print("leftButtonHandler")
        }
    }
    
    @IBAction func rightButtonHandler() {
        if state == .left {
            animateButtonSeparatorViewByTap()
            print("rightButtonHandler")
        }
    }
}


