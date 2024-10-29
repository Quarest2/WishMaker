//
//  ViewController.swift
//  arakhmetianovPW2
//
//  Created by Аскар Ахметьянов on 25.10.2024.
//

import UIKit

// MARK: WishMakerViewController class
final class WishMakerViewController: UIViewController {
    // MARK: Constants
    enum Constants {
    static let sliderMin: Double = 0
    static let sliderMax: Double = 1
    static let titleText: String = "Wish Maker"
    static let red: String = "Red"
    static let green: String = "Green"
    static let blue: String = "Blue"
    static let alpha: CGFloat = 1
    static let stackRadius: CGFloat = 20
    static let stackBottom: CGFloat = -40
    static let stackLeading: CGFloat = 20
    static let titleOfSize: CGFloat = 40
    static let titleLeading: CGFloat = 20
    static let titleTop: CGFloat = 30
    }
    
    // MARK: Fields
    private var titleView = UILabel()
    
    // MARK: Override didLoad method
    override func viewDidLoad(){
        super.viewDidLoad()
        configureUI()
        view.backgroundColor = .systemPink
    }

    // MARK: Private configure method
    private func configureUI() {
        view.backgroundColor = .systemPink
        configureTitle()
        configureSliders()
    }

    // MARK: Private configure title method
    private func configureTitle() {
        titleView.translatesAutoresizingMaskIntoConstraints = false
        titleView.text = Constants.titleText
        titleView.font = UIFont.systemFont(ofSize: Constants.titleOfSize)

        view.addSubview(titleView)
        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.titleLeading),
            titleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.titleTop)
        ])
    }
    
    // MARK: Private configure sliders method
    private func configureSliders() {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        view.addSubview(stack)
        stack.layer.cornerRadius = Constants.stackRadius
        stack.clipsToBounds = true
        
        let sliderRed = CustomSlider(title: Constants.red, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderGreen = CustomSlider(title: Constants.green, min: Constants.sliderMin, max: Constants.sliderMax)
        let sliderBlue = CustomSlider(title: Constants.blue, min: Constants.sliderMin, max: Constants.sliderMax)
        
        for slider in [sliderRed, sliderGreen, sliderBlue]{
            stack.addArrangedSubview(slider)
        }
        
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Constants.stackLeading),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.stackBottom)
        ])
        
        sliderRed.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(
                displayP3Red: value,
                green: .random(in: 0...1),
                blue: .random(in: 0...1),
                alpha: Constants.alpha
                )
        }
        
        sliderGreen.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(
                displayP3Red: .random(in: 0...1),
                green: value,
                blue: .random(in: 0...1),
                alpha: Constants.alpha
                )
        }
        
        sliderBlue.valueChanged = { [weak self] value in
            self?.view.backgroundColor = UIColor(
                displayP3Red: .random(in: 0...1),
                green: .random(in: 0...1),
                blue: value,
                alpha: Constants.alpha
                )
        }
    }
}

// MARK: CustomSlider class
final class CustomSlider: UIView {
    // MARK: Constants
    enum Constants {
    static let error: String = "init(coder:) has not been implemented"
    static let sliderBottom: CGFloat = -10
    static let sliderLeading: CGFloat = 20
    static let titleLeading: CGFloat = 20
    static let titleTop: CGFloat = 10
    }
    
    // MARK: Fields
    var valueChanged: ((Double) -> Void)?
    var slider = UISlider()
    var titleView = UILabel()

    // MARK: Methods
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError(Constants.error)
    }

    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false

        for view in [slider, titleView] {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }

        NSLayoutConstraint.activate([
            titleView.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.titleTop),
            titleView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.titleLeading),

            slider.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            slider.centerXAnchor.constraint(equalTo: centerXAnchor),
            slider.bottomAnchor.constraint(equalTo: bottomAnchor, constant: Constants.sliderBottom),
            slider.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.sliderLeading)
        ])
    }

    @objc
    private func sliderValueChanged() {
        valueChanged?(Double(slider.value))
    }
}
