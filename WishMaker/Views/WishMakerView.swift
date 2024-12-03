//
//  WishMakerView.swift
//  WishMaker
//
//  Created by Аскар Ахметьянов on 02.12.2024.
//

import UIKit

final class WishMakerView: UIView {
    
    // MARK: - UI Elements
    private let titleView = UILabel()
    private let descr = UILabel()
    let stack = UIStackView()
    private let toggleButton: UIButton = UIButton(type: .system)
    private let addWishButton: UIButton = UIButton(type: .system)
    private let scheduleWishButton: UIButton = UIButton(type: .system)
    private let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
    
    private var toggleButtonBottomConstraint: NSLayoutConstraint?
    private var isToggleButtonPinnedToStack = true
    
    // MARK: - Callbacks
    var onColorChange: (() -> Void)?
    var onToggleButtonPressed: (() -> Void)?
    var onWishButtonPressed: (() -> Void)?
    var onScheduleButtonPressed: (() -> Void)?
    
    // MARK: - Properties
    var redSliderValue: Float { sliderRed.slider.value }
    var greenSliderValue: Float { sliderGreen.slider.value }
    var blueSliderValue: Float { sliderBlue.slider.value }
    var alphaSliperValue = Constants.alphaValue
    var interfaceColor = UIColor()
    
    // MARK: - Initializer
    init() {
        super.init(frame: .zero)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func updateTextColor() {
        titleView.textColor = interfaceColor.inverted()
        descr.textColor = interfaceColor.inverted()
    }
    
    func updateBackgroundColor() {
        backgroundColor = interfaceColor
    }
    
    func updateButtonTextColor() {
        toggleButton.titleLabel?.textColor = interfaceColor
        addWishButton.titleLabel?.textColor = interfaceColor
        scheduleWishButton.titleLabel?.textColor = interfaceColor
    }
    
    func setStackVisibility(isHidden: Bool) {
        stack.isHidden = isHidden
    }
    
    func updateButtonTitle(isHidden: Bool) {
        toggleButton.setTitle(isHidden ? Constants.buttonTitleShow : Constants.buttonTitleHide, for: .normal)
        toggleButton.setTitleColor(interfaceColor, for: .normal)
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        interfaceColor = UIColor(
            red: Constants.colorValue,
            green: Constants.colorValue,
            blue: Constants.colorValue,
            alpha: Constants.alphaValue
        )
        backgroundColor = interfaceColor
        configureTitle()
        configureDescription()
        configureSceduleWishesButton()
        configureAddWishButton()
        configureSliders()
        configureToggleButton()
    }
    
    private func configureTitle() {
        titleView.text = Constants.titleText
        titleView.font = UIFont.boldSystemFont(ofSize: Constants.titleSize)
        
        addSubview(titleView)
        titleView.pinTop(to: safeAreaLayoutGuide.topAnchor, Constants.titleTopPadding)
        titleView.pinCenterX(to: self)
    }
    
    private func configureDescription() {
        descr.text = Constants.descriptionText
        descr.font = UIFont.systemFont(ofSize: Constants.descriptionSize)
        descr.numberOfLines = .zero
        descr.lineBreakMode = .byWordWrapping
        
        addSubview(descr)
        descr.pinLeft(to: self, Constants.descriptionPadding)
        descr.pinRight(to: self, Constants.descriptionPadding)
        descr.pinTop(to: titleView.bottomAnchor, Constants.descriptionPadding)
    }
    
    private func configureSliders() {
        stack.axis = .vertical
        stack.layer.cornerRadius = Constants.stackRadius
        stack.layer.borderWidth = Constants.borderWidth
        stack.clipsToBounds = true
        
        addSubview(stack)
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            stack.addArrangedSubview(slider)
            slider.valueChanged = { [weak self] _ in self?.notifyColorChange() }
        }
        
        stack.pinCenterX(to: self)
        stack.pinLeft(to: self.leadingAnchor, Constants.stackLeading)
        stack.pinBottom(to: addWishButton.topAnchor, Constants.buttonBottom)
    }
    
    private func configureToggleButton() {
        toggleButton.setTitle(Constants.buttonTitleHide, for: .normal)
        toggleButton.setTitleColor(interfaceColor, for: .normal)
        toggleButton.backgroundColor = Constants.buttonBackgroundColor
        toggleButton.layer.cornerRadius = Constants.stackRadius
        toggleButton.layer.borderWidth = Constants.borderWidth
        toggleButton.addTarget(self, action: #selector(toggleButtonPressed), for: .touchUpInside)
        
        addSubview(toggleButton)
        toggleButton.setHeight(Constants.buttonHeight)
        toggleButton.pinCenterX(to: centerXAnchor)
        toggleButton.pinLeft(to: stack.leadingAnchor)
        toggleButtonBottomConstraint = toggleButton.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -Constants.buttonBottom)
        toggleButtonBottomConstraint?.isActive = true
    }
    
    private func configureAddWishButton() {
        addWishButton.backgroundColor = Constants.buttonBackgroundColor
        addWishButton.setTitleColor(interfaceColor, for: .normal)
        addWishButton.setTitle(Constants.wishButtonText, for: .normal)
        addWishButton.layer.cornerRadius = Constants.stackRadius
        addWishButton.layer.borderWidth = Constants.borderWidth
        addWishButton.addTarget(self, action: #selector(wishButtonPressed), for: .touchUpInside)
        
        addSubview(addWishButton)
        addWishButton.setHeight(Constants.buttonHeight)
        addWishButton.pinBottom(to: scheduleWishButton.topAnchor, Constants.buttonBottom)
        addWishButton.pinHorizontal(to: self, Constants.stackLeading)
    }
    
    private func configureSceduleWishesButton() {
        scheduleWishButton.backgroundColor = Constants.buttonBackgroundColor
        scheduleWishButton.setTitleColor(interfaceColor, for: .normal)
        scheduleWishButton.setTitle(Constants.scheduleButtonText, for: .normal)
        scheduleWishButton.layer.cornerRadius = Constants.stackRadius
        scheduleWishButton.layer.borderWidth = Constants.borderWidth
        scheduleWishButton.addTarget(self, action: #selector(scheduleWishButtonPressed), for: .touchUpInside)
        
        addSubview(scheduleWishButton)
        scheduleWishButton.setHeight(Constants.buttonHeight)
        scheduleWishButton.pinBottom(to: safeAreaLayoutGuide.bottomAnchor, Constants.buttonBottom)
        scheduleWishButton.pinHorizontal(to: self, Constants.stackLeading)
    }
    
    private func notifyColorChange() {
        interfaceColor = UIColor(
            red: CGFloat(redSliderValue),
            green: CGFloat(greenSliderValue),
            blue: CGFloat(blueSliderValue),
            alpha: Constants.alphaValue
        )
        onColorChange?()
    }
    
    @objc private func toggleButtonPressed() {
        onToggleButtonPressed?()
        
        toggleButtonBottomConstraint?.isActive = false
        
        if isToggleButtonPinnedToStack {
            toggleButtonBottomConstraint = toggleButton.bottomAnchor.constraint(equalTo: addWishButton.topAnchor, constant: -Constants.buttonBottom)
        } else {
            toggleButtonBottomConstraint = toggleButton.bottomAnchor.constraint(equalTo: stack.topAnchor, constant: -Constants.buttonBottom)
        }
        
        toggleButtonBottomConstraint?.isActive = true
        isToggleButtonPinnedToStack.toggle()
        
        UIView.animate(withDuration: Constants.animationDuration) {
            self.layoutIfNeeded()
        }
    }
    
    @objc private func wishButtonPressed() {
        onWishButtonPressed?()
    }
    
    @objc private func scheduleWishButtonPressed() {
        onScheduleButtonPressed?()
    }
}
