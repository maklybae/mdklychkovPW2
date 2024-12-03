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
    private var addButton: UIBarButtonItem = UIBarButtonItem()
    private let collectionView: UICollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    private var displayedWishEvents: [WishCalendar.DisplayedWishEvent] = []
    
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
        super.viewDidLoad()
        configureNavBar()
        configureCollection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchWishEvents()
    }
    
    private func configureNavBar() {
        addButton = UIBarButtonItem(
            image: UIImage(systemName: "plus"),
            style: .plain,
            target: self,
            action: #selector(addButtonPressed)
        )
        navigationItem.rightBarButtonItem = addButton
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
        collectionView.alwaysBounceVertical = true
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInset = Constants.contentInset
        collectionView.backgroundColor = .clear
        
        view.addSubview(collectionView)
        collectionView.pinHorizontal(to: view)
        collectionView.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collectionView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.collectionTop)
    }
    
    private func fetchWishEvents() {
        interactor.fetchWishEvents(WishCalendar.FetchWishEvents.Request())
    }
    
    @objc
    private func addButtonPressed() {
        interactor.routeToAddWishEvent(WishCalendar.RouteToAddWishEvent.Request(
            navigationController: navigationController,
            backgroundColor: view.backgroundColor ?? .black))
    }
    
    public func displayFetchedWishEvents(_ viewModel: WishCalendar.FetchWishEvents.ViewModel) {
        displayedWishEvents = viewModel.displayedWishEvents
        collectionView.reloadData()
    }
    
    public func displayStatus(_ status: Bool) {
        let messageLabel = UILabel()
        
        if status {
            messageLabel.text = "Success"
        } else {
            messageLabel.text = "Error"
        }
        
        messageLabel.textColor = .white
        messageLabel.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        messageLabel.textAlignment = .center
        messageLabel.layer.cornerRadius = 10
        messageLabel.clipsToBounds = true
        view.addSubview(messageLabel)
        messageLabel.pinCenter(to: view)
        
        UIView.animate(withDuration: 0.3, animations: {
            messageLabel.alpha = 1
        }, completion: { _ in
            UIView.animate(withDuration: 0.3, delay: 1, options: [], animations: {
                messageLabel.alpha = 0
            }, completion: { _ in
                messageLabel.removeFromSuperview()
            })
        })
    }
}

// MARK: - UICollectionViewDataSource
extension WishCalendarViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return displayedWishEvents.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WishEventCell.reuseIdentifier, for: indexPath)
        guard let wishEventCell = cell as? WishEventCell else {
            return cell
        }
        wishEventCell.configure(with: displayedWishEvents[indexPath.item])
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
        return CGSize(width: collectionView.bounds.width / 2 - 20, height: 300)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        let alertController = UIAlertController(
            title: "Add to Calendar",
            message: "Are you sure you want to add this wish event to your calendar?",
            preferredStyle: .alert
        )
        
        // Кнопка подтверждения
        let confirmAction = UIAlertAction(title: "Подтвердить", style: .default) { _ in
            // Вызов метода для добавления в календарь
            self.interactor.addWishEventToCalendar(WishCalendar.AddWishEventToCalendar.Request(wishEventIndex: indexPath.item))
        }
        
        // Кнопка отмены
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        // Добавление кнопок в UIAlertController
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        
        // Отображение диалогового окна
        present(alertController, animated: true, completion: nil)
    }
}
