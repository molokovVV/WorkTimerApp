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
    
    public var state = ActivityState.left {
        didSet {
            animateStateSetting()
        }
    }
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
            make.verticalEdges.equalToSuperview()
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
        rightButton.alpha = 0.3
        
        
        rightButton.snp.makeConstraints { make in
            make.leading.equalTo(buttonSeparatorView.snp.trailing).offset(5)
            make.trailing.verticalEdges.equalToSuperview()
        }
    }
}

private extension WTTitleSwitchView {
    
    func animateStateSetting() {
        let activeButton = state == .left ? rightButton : leftButton
        let inActiveButton = state == .left ? leftButton : rightButton
        
        UIView.animate(withDuration: animationTimeInterval / 2) { // Reset Alpha
            activeButton.alpha = 0.3
            self.buttonSeparatorView.alpha = 0.3
        } completion: { _ in
            UIView.animate(withDuration: self.animationTimeInterval) { // Set position
                
                inActiveButton.snp.remakeConstraints { make in
                    make.leading.verticalEdges.equalToSuperview()
                }
                
                self.buttonSeparatorView.snp.remakeConstraints { make in
                    make.centerY.equalTo(inActiveButton)
                    make.leading.equalTo(inActiveButton.snp.trailing).offset(5)
                }
                
                activeButton.snp.remakeConstraints { make in
                    make.leading.equalTo(self.buttonSeparatorView.snp.trailing).offset(5)
                    make.verticalEdges.trailing.equalToSuperview()
                }
                
                self.layoutIfNeeded()
            } completion: { _ in
                UIView.animate(withDuration: self.animationTimeInterval / 2) { // Set Alpha
                    self.buttonSeparatorView.alpha = 1
                    inActiveButton.alpha = 1
                }
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
            state = .left
            print("leftButtonHandler")
        }
    }
    
    @IBAction func rightButtonHandler() {
        if state == .left {
            state = .right
            print("rightButtonHandler")
        }
    }
}


