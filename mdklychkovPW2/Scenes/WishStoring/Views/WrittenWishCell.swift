//
//  WrittenWishCell.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit

final class WrittenWishCell: UITableViewCell {
    // MARK: Static
    static let reuseId: String = "WrittenWishCell"
    
    // MARK: Constants
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
    }
    
    // MARK: Variables
    var deleteWish: (() -> Void)?
    var editWish: (() -> Void)?
    private let wishLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    private let deleteButton: UIButton = UIButton(type: .system)
    private let editButton: UIButton = UIButton(type: .system)
    private let stackView: UIStackView = UIStackView()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    @objc
    func deleteButtonPressed() {
        deleteWish?()
    }
    
    @objc
    func editButtonPressed() {
        editWish?()
    }
    
    // MARK: Public funcs
    func configure(with wish: WishStoring.DisplayedWish) {
        wishLabel.text = wish.text
        dateLabel.text = wish.date.formatted(.dateTime)
    }
    
    // MARK: Private funcs
    private func configureDateLabel() {
        dateLabel.textAlignment = .right
        dateLabel.textColor = .lightGray
    }
    
    private func configureDeleteButton() {
        let image = UIImage(systemName: "trash")
        deleteButton.setImage(image, for: .normal)
        deleteButton.tintColor = .systemRed
        
        deleteButton.addTarget(self, action: #selector(deleteButtonPressed), for: .touchUpInside)
    }
    
    private func configureEditButton() {
        let image = UIImage(systemName: "square.and.pencil")
        editButton.setImage(image, for: .normal)
        editButton.tintColor = .systemBlue
        
        editButton.addTarget(self, action: #selector(editButtonPressed), for: .touchUpInside)
    }
    
    private func configureStackView() {
        stackView.axis = .horizontal
        stackView.alignment = .leading
        stackView.distribution = .fillProportionally
        stackView.addArrangedSubview(deleteButton)
        stackView.addArrangedSubview(editButton)
        stackView.addArrangedSubview(dateLabel)
    }
    
    private func configureUI() {
        wishLabel.numberOfLines = 0
        
        selectionStyle = .none
        backgroundColor = .clear
        
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        wrap.backgroundColor = Constants.wrapColor
        wrap.layer.cornerRadius = Constants.wrapRadius
        
        wrap.addSubview(wishLabel)
        wishLabel.pinHorizontal(to: wrap, Constants.wishLabelOffset)
        wishLabel.pinTop(to: wrap, Constants.wishLabelOffset)
        
        configureDateLabel()
        configureDeleteButton()
        configureEditButton()
        configureStackView()
        wrap.addSubview(stackView)
        stackView.pinHorizontal(to: wrap, Constants.wishLabelOffset)
        stackView.pinTop(to: wishLabel.bottomAnchor, Constants.wishLabelOffset)
        stackView.pinBottom(to: wrap, Constants.wishLabelOffset)
        
        wrap.pinVertical(to: self.contentView, Constants.wrapOffsetV)
        wrap.pinHorizontal(to: self.contentView, Constants.wrapOffsetH)
    }
}
