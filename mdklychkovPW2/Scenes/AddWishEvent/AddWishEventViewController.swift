//
//  AddWishEventViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation
import UIKit

final class AddWishEventViewController: UIViewController {
    
    // MARK: - Constants
    private enum Constants {
        static let stackViewSpacing: CGFloat = 16
        static let padding: CGFloat = 16
        static let noteTextViewHeight: CGFloat = 100
        static let saveButtonHeight: CGFloat = 44
        static let saveButtonCornerRadius: CGFloat = 8
        static let titleTextFieldPlaceholder = "Enter title"
        static let saveButtonTitle = "Save"
        static let datePickerMode: UIDatePicker.Mode = .dateAndTime
        
        static let noteTextViewBorderWidth: CGFloat = 1
        static let noteTextViewCornerRadius: CGFloat = 5
        static let noteTextViewFontSize: CGFloat = 16
        static let noteTextViewBorderColor = UIColor.gray.cgColor
        
    }
    
    // MARK: - Variables
    private let interactor: AddWishEventBuisnessLogic
    
    private let stackView = UIStackView()
    private let titleTextField = UITextField()
    private let startDatePicker = UIDatePicker()
    private let endDatePicker = UIDatePicker()
    private let noteTextView = UITextView()
    private let saveButton = UIButton(type: .system)
    
    // MARK: - Lifecycle
    init(interactor: AddWishEventInteractor, color: UIColor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = color
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    private func configureUI() {
        stackView.axis = .vertical
        stackView.spacing = Constants.stackViewSpacing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(noteTextView)
        stackView.addArrangedSubview(startDatePicker)
        stackView.addArrangedSubview(endDatePicker)
        stackView.addArrangedSubview(saveButton)
        
        view.addSubview(stackView)
        stackView.pinHorizontal(to: view, Constants.padding)
        stackView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.padding)
        
        configureTitleTextField()
        configureNoteTextView()
        configureStartDatePicker()
        configureEndDatePicker()
        configureSaveButton()
    }
    
    private func configureTitleTextField() {
        titleTextField.placeholder = Constants.titleTextFieldPlaceholder
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureNoteTextView() {
        noteTextView.layer.borderWidth = Constants.noteTextViewBorderWidth
        noteTextView.layer.borderColor = Constants.noteTextViewBorderColor
        noteTextView.layer.cornerRadius = Constants.noteTextViewCornerRadius
        noteTextView.font = UIFont.systemFont(ofSize: Constants.noteTextViewFontSize)
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.heightAnchor.constraint(equalToConstant: Constants.noteTextViewHeight).isActive = true
    }
    
    private func configureStartDatePicker() {
        startDatePicker.datePickerMode = Constants.datePickerMode
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureEndDatePicker() {
        endDatePicker.datePickerMode = Constants.datePickerMode
        endDatePicker.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func configureSaveButton() {
        saveButton.setTitle(Constants.saveButtonTitle, for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = Constants.saveButtonCornerRadius
        saveButton.heightAnchor.constraint(equalToConstant: Constants.saveButtonHeight).isActive = true
        saveButton.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
    }
    
    // MARK: - Actions
    @objc
    private func saveButtonPressed() {
        let wishEventFromFields = AddWishEvent.WishEventFromFields(
            title: titleTextField.text ?? "",
            note: noteTextView.text ?? "",
            startDate: startDatePicker.date,
            endDate: endDatePicker.date
        )
        interactor.addWishEvent(AddWishEvent.AddWishEvent.Request(
            wishEventFromFields: wishEventFromFields,
            navigationController: navigationController
        ))
    }
}
