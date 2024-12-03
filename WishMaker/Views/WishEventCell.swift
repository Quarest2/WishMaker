//
//  WishEventCell.swift
//  WishMaker
//
//  Created by Аскар Ахметьянов on 03.12.2024.
//

import UIKit

final class WishEventCell: UICollectionViewCell {
    // MARK: - Fields
    static let reuseIdentifier: String = "WishEventCell"
    private let wrapView: UIView = UIView()
    private let titleLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    private let startDateLabel: UILabel = UILabel()
    private let endDateLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureWrap()
        configureTitleLabel()
        configureDescriptionLabel()
        configureStartDateLabel()
        configureEndDateLabel()
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Cell Configuration
    func configure(with event: WishEventModel) {
        titleLabel.text = event.title
        descriptionLabel.text = event.description
        startDateLabel.text = "Start Date: \(event.startDate)"
        endDateLabel.text = "End Date: \(event.endDate)"
    }
    
    // MARK: - UI Configuration
    private func configureWrap() {
        addSubview(wrapView)
        wrapView.pin(to: self, Constants.offset)
        wrapView.layer.cornerRadius = Constants.cornerRadius
        wrapView.backgroundColor = Constants.backgroundColor
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.pinTop(to: wrapView, Constants.titleTop)
        titleLabel.font = Constants.titleFont
        titleLabel.pinLeft(to: wrapView, Constants.titleLeading)
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.textColor = .black
        descriptionLabel.pinTop(to: wrapView, Constants.titleTop)
        descriptionLabel.font = Constants.titleFont
        descriptionLabel.pinLeft(to: wrapView, Constants.titleLeading)
    }
    
    private func configureStartDateLabel() {
        startDateLabel.textColor = .black
        startDateLabel.pinTop(to: wrapView, Constants.titleTop)
        startDateLabel.font = Constants.titleFont
        startDateLabel.pinLeft(to: wrapView, Constants.titleLeading)
    }
    
    private func configureEndDateLabel() {
        endDateLabel.textColor = .black
        endDateLabel.pinTop(to: wrapView, Constants.titleTop)
        endDateLabel.font = Constants.titleFont
        endDateLabel.pinLeft(to: wrapView, Constants.titleLeading)
    }
}


final class WishEventModel {
    // MARK: - Fields
    public let title: String = ""
    public let description: String = ""
    public let startDate: String = ""
    public let endDate: String = ""
    
    // MARK: - Lifecycle
    init(title: String, description: String, startDate: String, endDate: String) {}
}
