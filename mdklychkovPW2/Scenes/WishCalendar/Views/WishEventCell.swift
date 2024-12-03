//
//  WishEventCell.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.12.2024.
//

import UIKit

final class WishEventCell: UICollectionViewCell {
    // MARK: - Static
    static let reuseIdentifier: String = "WishEventCell"
    
    // MARK: - Constants
    private enum Constants {
        static let backgroundColor: UIColor = .white
        static let cornerRadius: CGFloat = 16
        static let offset: CGFloat = 5
        
        static let minimumScaleFactor: CGFloat = 0.8
        
        static let titleTop: CGFloat = 16
        static let titleLeading: CGFloat = 16
        static let titleFont: UIFont = .systemFont(ofSize: 20, weight: .bold)
        
        static let descriptionTop: CGFloat = 4
        static let descriptionLeading: CGFloat = 16
        static let descriptionFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
        static let descriptionNumberOfLines: Int = 10
        
        static let startDateTop: CGFloat = 8
        static let startDateLeading: CGFloat = 16
        static let startDateFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
        
        static let endDateTop: CGFloat = 8
        static let endDateLeading: CGFloat = 16
        static let endDateFont: UIFont = .systemFont(ofSize: 16, weight: .regular)
    }
    
    // MARK: - Variables
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
    func configure(with event: WishCalendar.DisplayedWishEvent) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium // Use a standard date style
        dateFormatter.timeStyle = .none  // Exclude the time
        
        titleLabel.text = event.title
        descriptionLabel.text = event.note
        startDateLabel.text = "Start: \(dateFormatter.string(from: event.startDate))"
        endDateLabel.text = "End: \(dateFormatter.string(from: event.endDate))"
    }
    
    // MARK: - UI Configuration
    private func configureWrap() {
        addSubview(wrapView)
        wrapView.pin(to: self, Constants.offset)
        wrapView.layer.cornerRadius = Constants.cornerRadius
        wrapView.backgroundColor = Constants.backgroundColor
    }
    
    private func configureTitleLabel() {
        wrapView.addSubview(titleLabel)
        titleLabel.textColor = .black
        titleLabel.numberOfLines = 1
        titleLabel.lineBreakMode = .byTruncatingTail
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = Constants.minimumScaleFactor
        titleLabel.pinTop(to: wrapView, Constants.titleTop)
        titleLabel.font = Constants.titleFont
        titleLabel.pinHorizontal(to: wrapView, Constants.titleLeading)
    }
        
    private func configureDescriptionLabel() {
        wrapView.addSubview(descriptionLabel)
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = Constants.descriptionNumberOfLines
        descriptionLabel.lineBreakMode = .byTruncatingTail
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = Constants.minimumScaleFactor
        descriptionLabel.pinTop(to: titleLabel.bottomAnchor, Constants.descriptionTop)
        descriptionLabel.pinHorizontal(to: wrapView, Constants.descriptionLeading)
    }
    
    private func configureStartDateLabel() {
        wrapView.addSubview(startDateLabel)
        startDateLabel.textColor = .black
        startDateLabel.numberOfLines = 1
        startDateLabel.lineBreakMode = .byTruncatingTail
        startDateLabel.adjustsFontSizeToFitWidth = true
        startDateLabel.minimumScaleFactor = Constants.minimumScaleFactor
        startDateLabel.pinTop(to: descriptionLabel.bottomAnchor, Constants.startDateTop)
        startDateLabel.pinHorizontal(to: wrapView, Constants.startDateLeading)
    }
    
    private func configureEndDateLabel() {
        wrapView.addSubview(endDateLabel)
        endDateLabel.textColor = .black
        endDateLabel.numberOfLines = 1
        endDateLabel.lineBreakMode = .byTruncatingTail
        endDateLabel.adjustsFontSizeToFitWidth = true
        endDateLabel.minimumScaleFactor = 0.8
        endDateLabel.pinTop(to: startDateLabel.bottomAnchor, Constants.endDateTop)
        endDateLabel.pinLeft(to: wrapView, Constants.endDateLeading)
    }
    
    // MARK: Actions
    
    // MARK: - Public funcs
    
    // MARK: - Private funcs
    
}
