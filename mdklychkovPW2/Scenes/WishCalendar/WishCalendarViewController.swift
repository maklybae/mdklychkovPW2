//
//  WishCalendarViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 02.12.2024.
//

import UIKit

final class WishCalendarViewController: UIViewController {
    private enum Constants {
        static let contentInset: UIEdgeInsets = .init(top: 10, left: 10, bottom: 10, right: 10)
        static let collectionTop: CGFloat = 20
    }
    
    // MARK: - Variables
    private let interactor: WishCalendarBuisnessLogic
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    // MARK: - Lifecycle
    init(interactor: WishCalendarBuisnessLogic, color: UIColor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = color
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        configureCollection()
    }
    
    private func configureCollection() {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.itemSize = CGSize(width: 180, height: 180)
            layout.minimumInteritemSpacing = 10
            layout.minimumLineSpacing = 10
            layout.invalidateLayout()
        }
        
        collectionView.register(
            WishEventCell.self,
            forCellWithReuseIdentifier: WishEventCell.reuseIdentifier
        )
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = Constants.contentInset
        view.addSubview(collectionView)
        collectionView.pinHorizontal(to: view)
        collectionView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collectionView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.collectionTop)
    }
}

// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 10
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishEventCell.reuseIdentifier, for: indexPath)
        guard let wishEventCell = cell as? WishEventCell else {
            return cell
        }
        wishEventCell.configure(
            with: WishEventModel(
                title: """
Tesfasdfasdfadsfasdnfkljasbdfjkbasdhjfbajbdfjlhbdfjhbajbfhajsldfbasdft
dfsdf
""",
                description: """
Tesfasdfasdfadsfasdnfkljasbdfjkbasdhjfbajbdfjlhbdfjhbajbfhajsldfbasdft
dfsdfтлватфыловиафовиа
фвафодывиафодыва
фывадфорывиаодфывраифыва
фы
вафывафывафыва
фывафывафывафыва
фывафывафывафывафыва
фыва
фыва
""",
                startDate: Date(),
                endDate: Date()
            )
        )
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension WishCalendarViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
//        // Adjust cell size as needed
        return CGSize(width: collectionView.bounds.width / 2 - 20, height: 300)
    }
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        print("Cell tapped at index \(indexPath.item)")
    }
}
