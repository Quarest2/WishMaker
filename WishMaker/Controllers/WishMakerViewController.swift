//
//  ViewController.swift
//  arakhmetianovPW2
//
//  Created by Аскар Ахметьянов on 25.10.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    // MARK: - Properties
    private let wishMakerView = WishMakerView()
    private var isStackHidden = false
    
    // MARK: - Lifecycle
    override func loadView() {
        self.view = wishMakerView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCallbacks()
        updateBackgroundAndTextColor()
    }
    
    // MARK: - Private Methods
    private func configureCallbacks() {
        wishMakerView.onColorChange = { [weak self] in
            self?.updateBackgroundAndTextColor()
        }
        
        wishMakerView.onToggleButtonPressed = { [weak self] in
            self?.toggleStackVisibility()
        }
        
        wishMakerView.onWishButtonPressed = { [weak self] in
            self?.addWish()
        }
        
        wishMakerView.onScheduleButtonPressed = { [weak self] in
            self?.calendar()
        }

    }
    
    private func updateBackgroundAndTextColor() {
        wishMakerView.updateBackgroundColor()
        wishMakerView.updateTextColor()
        wishMakerView.updateButtonTextColor()
    }
    
    private func toggleStackVisibility() {
        isStackHidden.toggle()
        wishMakerView.setStackVisibility(isHidden: isStackHidden)
        wishMakerView.updateButtonTitle(isHidden: isStackHidden)
    }
    
    private func addWish() {
        present(WishStoringViewController(), animated: true)
    }
    
    private func calendar() {
        present(WishCalendarViewController(), animated: true)
    }
}
