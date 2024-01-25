//
//  WTTitleSwitchView.swift
//  UIComponents
//
//  Created by Виталик Молоков on 08.12.2023.
//

import UIKit
import SnapKit

open class WTTitleSwitchView: BaseView {
    
    private let firstLabel = UILabel()
    private let secondLabel = UILabel()
    private let button = UIButton()
    private let separatorView = UILabel()
    
    private let animationTimeInterval: TimeInterval = 0.3
    private var animationPoint: CGFloat = 0
    private var animationTimer = Timer()
    
    public var state = ActivityState.left {
        didSet {
            animateStateSetting()
        }
    }
    public var titles: (firstTitle: String, secondTitle: String)? = nil {
        didSet {
            
            firstLabel.text = titles?.firstTitle
            secondLabel.text = titles?.secondTitle
        }
    }
    
    override func setup() {
        super.setup()
        
        setupSeparatorView()
        setupFirstLabel()
        setupSecondLabel()
        setupButton()
    }
}

// MARK: - Setup UI
private extension WTTitleSwitchView {
    
    func setupButton() {
        addSubview(button)
        
        button.addTarget(self, action: #selector(buttonHandler), for: .touchUpInside)
        
        button.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func setupFirstLabel() {
        addSubview(firstLabel)
        
        firstLabel.font = .systemFont(ofSize: 30, weight: .medium)
        firstLabel.layoutMargins.bottom = 0
        
        firstLabel.snp.makeConstraints { make in
            make.bottom.leading.equalToSuperview()
            make.trailing.equalTo(separatorView.snp.leading).offset(-10)
        }
    }
    
    func setupSecondLabel() {
        addSubview(secondLabel)
        
        secondLabel.font = .systemFont(ofSize: 20, weight: .regular)
        secondLabel.layoutMargins.bottom = 0
        secondLabel.alpha = 0.3
        
        secondLabel.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.leading.equalTo(separatorView.snp.trailing).offset(10)
            make.bottom.equalToSuperview().inset(2.5)
        }
    }
    
    func setupSeparatorView() {
        addSubview(separatorView)
        
        separatorView.text = "/"
        separatorView.font = .systemFont(ofSize: 30, weight: .medium)
        
        separatorView.snp.makeConstraints { make in
            make.bottom.equalToSuperview()
        }
    }
}

private extension WTTitleSwitchView {
    
    func animateStateSetting() {
        let activeLabel = state == .left ? secondLabel : firstLabel
        let inActiveLabel = state == .left ? firstLabel : secondLabel
        
        //MARK: - Separator animation
        UIView.animate(withDuration: animationTimeInterval / 4) { 
            self.separatorView.alpha = 0.1
        } completion: { _ in
            UIView.animate(withDuration: self.animationTimeInterval / 4, 
                           delay: self.animationTimeInterval / 2) { 
                self.separatorView.alpha = 1
            }
        }
        
        //MARK: - Label transition animation
        UIView.animate(withDuration: animationTimeInterval) { // Reset Alpha
            inActiveLabel.alpha = 1
            activeLabel.alpha = 0.3
            
            inActiveLabel.snp.remakeConstraints { make in
                make.leading.bottom.equalToSuperview()
                make.trailing.equalTo(self.separatorView.snp.leading).offset(-10)
            }
            
            activeLabel.snp.remakeConstraints { make in
                make.trailing.equalToSuperview()
                make.leading.equalTo(self.separatorView.snp.trailing).offset(10)
                make.bottom.equalToSuperview().inset(2.5)
            }
            
            self.layoutIfNeeded()
        }
        
        //MARK: - Label transformation animation
        animationTimer.invalidate()
        animationTimer = Timer.scheduledTimer(withTimeInterval: animationTimeInterval / 25, 
                                              repeats: true, 
                                              block: { timer in
            if self.animationPoint < 10 {
                self.animationPoint += 4
                
                let inactiveSize = 20 + self.animationPoint
                inActiveLabel.font = inactiveSize > 25 
                    ? .systemFont(ofSize: inactiveSize, weight: .medium)
                    : .systemFont(ofSize: inactiveSize, weight: .regular)
                
                let activeSize = 30 - self.animationPoint
                activeLabel.font = activeSize < 25 
                    ? .systemFont(ofSize: activeSize, weight: .regular)
                    : .systemFont(ofSize: activeSize, weight: .medium)
                
            } else {
                timer.invalidate()
                self.animationPoint = 0
            }
        })
    }
}


public extension WTTitleSwitchView {
    enum ActivityState {
        case left
        case right
        
        mutating func toggle() {
            self = self == .left ? .right : .left
        }
    }
}

// MARK: - Actions
public extension WTTitleSwitchView {
    
    @IBAction func buttonHandler() {
        state.toggle()
    }
}


