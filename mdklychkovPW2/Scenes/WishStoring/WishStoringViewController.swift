//
//  WishStoringViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let tableCornerRadius: Double = 16
        static let tableOffset: Double = 16
        
        static let numberOfSections: Int = 2
        static let estimatedRowHeight: Double = 44
        
        static let addWishCellRow: Int = 0
        static let addWishCellSection: Int = 0
        static let numberOfAddWishCells: Int = 1
        
        static let addWishSectionTitle: String = "Add wish"
        static let wishesSectionTitle: String = "Wishes"
    }
    
    // MARK: - Variables
    private let interactor: WishStoringBuisnessLogic
    private let table: UITableView = UITableView(frame: .zero)
    private var displayedWishes: [WishStoring.DisplayedWish] = []
    
    // MARK: - Lifecycle
    init(interactor: WishStoringBuisnessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .magenta
        configureTable()
    }
    
    // MARK: Public funcs
    func displayFetchedWish(_ viewModel: WishStoring.FetchWishes.ViewModel) {
        displayedWishes = viewModel.displayedWishes
        table.reloadData()
    }
    
    func displayAddedWish(_ viewModel: WishStoring.AddWish.ViewModel) {
        displayedWishes = viewModel.displayedWishes
        table.reloadData()
    }
    
    func displayDeletedWish(_ viewModel: WishStoring.DeleteWish.ViewModel) {
        displayedWishes = viewModel.displayedWishes
        table.reloadData()
    }
    
    func displayEditedWish(_ viewModel: WishStoring.EditWish.ViewModel) {
        displayedWishes = viewModel.displayedWishes
        table.reloadData()
        if let addWishCell = table.cellForRow(at: IndexPath(row: Constants.addWishCellRow, section: Constants.addWishCellSection)) as? AddWishCell {
            addWishCell.setText(viewModel.editedWishText)
        }
    }
    
    // MARK: - Private funcs
    private func configureTable() {
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
        
        table.estimatedRowHeight = Constants.estimatedRowHeight
        table.rowHeight = UITableView.automaticDimension
        
        view.addSubview(table)
        table.backgroundColor = .white
        table.dataSource = self
        table.separatorStyle = .singleLine
        table.layer.cornerRadius = Constants.tableCornerRadius
        
        table.pinHorizontal(to: view, Constants.tableOffset)
        table.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.tableOffset)
        table.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor, Constants.tableOffset)
        
        fetchWishes()
    }
    
    private func addWish(withTextViewText text: String) {
        interactor.addWish(WishStoring.AddWish.Request(text: text))
    }
    
    private func fetchWishes() {
        interactor.fetchWishes(WishStoring.FetchWishes.Request())
    }
    
    private func deleteWish(at indexPath: IndexPath) {
        interactor.deleteWish(WishStoring.DeleteWish.Request(index: indexPath.row))
    }
    
    private func editWish(at indexPath: IndexPath) {
        interactor.editWish(WishStoring.EditWish.Request(index: indexPath.row))
    }
}

// MARK: - Extension UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case Constants.addWishCellSection: return Constants.numberOfAddWishCells
        default: return displayedWishes.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Constants.addWishCellSection:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: AddWishCell.reuseId,
                for: indexPath
            )
            guard let addWishCell = cell as? AddWishCell else { return cell }
            addWishCell.addWish = addWish
            return addWishCell
        default:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            wishCell.configure(with: displayedWishes[indexPath.row])
            wishCell.deleteWish = { [weak self] in
                self?.deleteWish(at: indexPath)
            }
            wishCell.editWish = { [weak self] in
                self?.editWish(at: indexPath)
            }
            
            return wishCell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case Constants.addWishCellSection:
            return Constants.addWishSectionTitle
        default:
            return Constants.wishesSectionTitle
        }
    }
}
