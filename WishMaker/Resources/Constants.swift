//
//  Constants.swift
//  WishMaker
//
//  Created by Аскар Ахметьянов on 02.12.2024.
//

import UIKit

enum Constants {
    // MARK: - Slider Constants
    static let sliderMin: Double = 0
    static let sliderMax: Double = 1
    
    // MARK: - Stack and Layout Constants
    static let stackRadius: CGFloat = 20
    static let stackBottom: CGFloat = 40
    static let stackLeading: CGFloat = 20
    
    // MARK: - Color and Appearance Constants
    static let colorValue = 0.3
    static let alphaValue: CGFloat = 1.0
    static let borderWidth = 1.0
    
    // MARK: - Color Constants
    static let wrapColor: UIColor = .white
    static let wrapRadius: CGFloat = 16
    static let wrapOffsetV: CGFloat = 5
    static let wrapOffsetH: CGFloat = 10
    static let wishLabelOffset: CGFloat = 8
    static let buttonTitleColor: UIColor = .black
    static let buttonBackgroundColor: UIColor = .white
    static let wishButtonTitleColor: UIColor = .systemPink
    static let scheduleButtonTitleColor: UIColor = .systemPink
    static let buttonBackgroundGreenColor: UIColor = .green
    static let deleteButtonBackgroundColor: UIColor = .green
    static let editButtonBackgroundColor: UIColor = .yellow
    
    // MARK: - Text Constants
    static let red = "Red"
    static let green = "Green"
    static let blue = "Blue"
    
    static let titleSize: CGFloat = 32
    static let titleTopPadding: CGFloat = 30
    static let descriptionSize: CGFloat = 16
    static let descriptionPadding: CGFloat = 20
    static let titleText: String = "WishMaker"
    static let descriptionText: String = "This app will bring you joy and will fulfill three of your wishes!"
    static let wishButtonText: String = "My wishes"
    static let scheduleButtonText: String = "Schedule wish granting"
    
    // MARK: - Button Constants
    static let buttonBottom: CGFloat = 10
    static let buttonHeight: CGFloat = 40
    static let buttonTitleShow = "Show sliders"
    static let buttonTitleHide = "Hide sliders"
    static let buttonCornerRadius: CGFloat = 20
    static let buttonFontSize: CGFloat = 26
    static let buttonWidth: CGFloat = 40
    
    // MARK: - TableView Constants
    static let tableBackgroundColor: UIColor = .red
    static let tableCornerRadius: CGFloat = 20
    static let tableOffset: CGFloat = 40
    static let numberOfSections = 2
    
    // MARK: - Wishes Key Constants
    static let wishesKey = "wishes"
    
    // MARK: - AddWishCell Constants
    static let placeholderText: String = "Enter your wish here"
    static let addWishButtonTitle: String = "+"
    static let addWishButtonFontSize: CGFloat = 26
    static let wishTextViewFontSize: CGFloat = 16
    static let addWishButtonWidth: CGFloat = 50
    
    // MARK: - WrittenWishCell Constants
    static let deleteButtonTitle: String = "-"
    static let deleteButtonTitleColor: UIColor = .black
    static let editButtonTitle: String = "✎"
    static let editButtonTitleColor: UIColor = .black
    static let labelFontSize: CGFloat = 16
    
    // MARK: - ViewController Constants
    static let blueBackgroundColor: UIColor = .blue
    static let alertSaveTitle: String = "Save"
    static let alertCancelTitle: String = "Cancel"
    static let alertEditTitle: String = "Edit Wish"
    
    // MARK: - Animation Constants
    static let animationDuration: TimeInterval = 0.5
    
    //MARK: - WishCalendarViewController Constants
    static let contentInset: UIEdgeInsets = UIEdgeInsets.init()
    static let collectionTop: CGFloat = 30
    
    //MARK: - WishEventCell Constants
    static let offset: CGFloat = 5
    static let cornerRadius: CGFloat = 20
    static let backgroundColor: UIColor = .white
    static let titleTop: CGFloat = 30
    static let titleFont: UIFont = UIFont()
    static let titleLeading: CGFloat = 20
}


