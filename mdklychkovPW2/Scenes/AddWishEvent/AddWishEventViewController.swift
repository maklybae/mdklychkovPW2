//
//  AddWishEventViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 03.12.2024.
//

import Foundation
import UIKit

final class AddWishEventViewController: UIViewController {
    
    // MARK: - Variables
    private let interactor: AddWishEventBuisnessLogic
    
    private let stackView =  UIStackView()
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
        stackView.spacing = 16
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(titleTextField)
        stackView.addArrangedSubview(noteTextView)
        stackView.addArrangedSubview(startDatePicker)
        stackView.addArrangedSubview(endDatePicker)
        stackView.addArrangedSubview(saveButton)
        
        view.addSubview(stackView)
        
        // Устанавливаем ограничения
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16)
        ])
        
        // Конфигурируем дочерние элементы
        configuretitleTextField()
        configureNoteTextView()
        configureStartDatePicker()
        configureEndDatePicker()
        configureSaveButton()
    }

    private func configuretitleTextField() {
        titleTextField.placeholder = "Enter title"
        titleTextField.borderStyle = .roundedRect
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureNoteTextView() {
        noteTextView.layer.borderWidth = 1
        noteTextView.layer.borderColor = UIColor.gray.cgColor
        noteTextView.layer.cornerRadius = 5
        noteTextView.font = UIFont.systemFont(ofSize: 16)
        noteTextView.translatesAutoresizingMaskIntoConstraints = false
        noteTextView.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }

    private func configureStartDatePicker() {
        startDatePicker.datePickerMode = .dateAndTime
        startDatePicker.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureEndDatePicker() {
        endDatePicker.datePickerMode = .dateAndTime
        endDatePicker.translatesAutoresizingMaskIntoConstraints = false
    }

    private func configureSaveButton() {
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.white, for: .normal)
        saveButton.backgroundColor = .systemBlue
        saveButton.layer.cornerRadius = 8
        saveButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
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
