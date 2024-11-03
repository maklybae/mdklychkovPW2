//
//  WrittenWishCell.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit

final class WrittenWishCell: UITableViewCell {
    static let reuseId: String = "WrittenWishCell"
    
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        static let wishLabelOffset: CGFloat = 8
    }
    
    private let wishLabel: UILabel = UILabel()
    private let dateLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with wish: WishStoring.DisplayedWish) {
        wishLabel.text = wish.text
        dateLabel.text = wish.date.formatted(.dateTime)
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
        
        dateLabel.textAlignment = .right
        dateLabel.textColor = .lightGray
        wrap.addSubview(dateLabel)
        dateLabel.pinHorizontal(to: wrap, Constants.wishLabelOffset)
        dateLabel.pinTop(to: wishLabel.bottomAnchor, Constants.wishLabelOffset)
        dateLabel.pinBottom(to: wrap, Constants.wishLabelOffset)
        
        wrap.pinVertical(to: self.contentView, Constants.wrapOffsetV)
        wrap.pinHorizontal(to: self.contentView, Constants.wrapOffsetH)
    }
}
