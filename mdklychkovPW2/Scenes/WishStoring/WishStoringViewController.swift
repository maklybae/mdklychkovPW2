//
//  WishStoringViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.11.2024.
//

import UIKit

final class WishStoringViewController: UIViewController {
    enum Constants {
        static let tableCornerRadius: Double = 16
        static let tableOffset: Double = 16
        
        static let numberOfSections: Int = 2
    }
    
    private let table: UITableView = UITableView(frame: .zero)
    private var wishArray: [String] = ["I wish to add cells to the table1", "I wish to add cells to the table2", "I wish to add cells to the table3"]
    
    override func viewDidLoad() {
        view.backgroundColor = .magenta
        configureTable()
    }
    
    private func configureTable() {
        table.register(WrittenWishCell.self, forCellReuseIdentifier: WrittenWishCell.reuseId)
        table.register(AddWishCell.self, forCellReuseIdentifier: AddWishCell.reuseId)
        
        view.addSubview(table)
        table.backgroundColor = .white
        table.dataSource = self
        table.separatorStyle = .singleLine
        table.layer.cornerRadius = Constants.tableCornerRadius
        table.pin(to: view, Constants.tableOffset)
    }
}


// MARK: - UITableViewDataSource
extension WishStoringViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return Constants.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0: return 1
        default: return wishArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: AddWishCell.reuseId,
                for: indexPath
            )
            guard let addWishCell = cell as? AddWishCell else { return cell }
            return addWishCell
        default:
            let cell = tableView.dequeueReusableCell(
                withIdentifier: WrittenWishCell.reuseId,
                for: indexPath
            )
            guard let wishCell = cell as? WrittenWishCell else { return cell }
            wishCell.configure(with: wishArray[indexPath.row])
            return wishCell
        }
    }
}
