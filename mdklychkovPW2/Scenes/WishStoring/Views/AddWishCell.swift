//
//  AddWishCell.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit

final class AddWishCell: UITableViewCell {
    // MARK: - Static
    static let reuseId: String = "AddWishCell"
    
    // MARK: - Constants
    private enum Constants {
        static let wrapColor: UIColor = .white
        static let wrapRadius: CGFloat = 16
        static let wrapOffsetV: CGFloat = 5
        static let wrapOffsetH: CGFloat = 10
        
        static let textViewHeight: CGFloat = 100
        static let textViewOffsetV: CGFloat = 10
        static let textViewOffsetH: CGFloat = 10
        
        static let addWishButtonOffsetV: CGFloat = 8
        static let addWishButtonOffsetH: CGFloat = 10
    }
    
    // MARK: - Variables
    private let textView = UITextView()
    private let addWishButton = UIButton(type: .system)
    var addWish: ((String) -> Void)?
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Actions
    @objc
    private func addWishButtonPressed() {
        addWish?(textView.text)
        textView.text = ""
    }
    
    // MARK: - Public funcs
    func setText(_ text: String) {
        textView.text = text
    }
    
    // MARK: - Private funcs
    private func configureTextView() {
        textView.isEditable = true
        textView.isUserInteractionEnabled = true
        textView.textColor = .label
        textView.backgroundColor = .clear
        textView.font = .preferredFont(forTextStyle: .body)
        
        textView.heightAnchor.constraint(greaterThanOrEqualToConstant: Constants.textViewHeight).isActive = true
    }
    
    private func configureAddWWishButton() {
        addWishButton.setTitle("Add wish", for: .normal)
        
        addWishButton.addTarget(self, action: #selector(addWishButtonPressed), for: .touchUpInside)
    }
    
    private func configureUI() {
        configureTextView()
        configureAddWWishButton()
        
        selectionStyle = .none
        backgroundColor = .clear
        
        let wrap: UIView = UIView()
        contentView.addSubview(wrap)
        wrap.pinVertical(to: self.contentView, Constants.wrapOffsetV)
        wrap.pinHorizontal(to: self.contentView, Constants.wrapOffsetH)
        
        wrap.addSubview(addWishButton)
        addWishButton.pinBottom(to: wrap, Constants.addWishButtonOffsetV)
        addWishButton.pinRight(to: wrap, Constants.addWishButtonOffsetH)
        
        wrap.addSubview(textView)
        textView.pinVertical(to: wrap, Constants.textViewOffsetV)
        textView.pinLeft(to: wrap, Constants.textViewOffsetH)
        textView.pinRight(to: addWishButton.leadingAnchor, Constants.textViewOffsetH)
    }
}
