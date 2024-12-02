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
        
        static let titleTop: CGFloat = 16
        static let titleLeading: CGFloat = 16
        static let titleFont: UIFont = .systemFont(ofSize: 16, weight: .medium)
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
        
    }
    
    private func configureStartDateLabel() {

    }
    
    private func configureEndDateLabel() {
        
    }
    
    // MARK: Actions
    
    
    // MARK: - Public funcs
    
    
    // MARK: - Private funcs
    
}
