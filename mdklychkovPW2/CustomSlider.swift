//
//  CustomSlider.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 29.10.2024.
//

import UIKit

final class CustomSlider: UIView {
    // MARK: - Constants
    enum Constants {
        static let horizontalSpacing: CGFloat = 20
        static let verticalSpacing: CGFloat = 10
    }
    
    // MARK: - Varibales
    let slider = UISlider()
    let titleView = UILabel()
    
    // MARK: - Lifecycle
    init(title: String, min: Double, max: Double) {
        super.init(frame: .zero)
        titleView.text = title
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        configureUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private funcs
    private func configureUI() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
        
        for view in [slider, titleView] {
            addSubview(view)
        }
        
        titleView.pinCenterX(to: self.centerXAnchor)
        titleView.pinTop(to: self.topAnchor, Constants.verticalSpacing)
        titleView.pinLeft(to: self.leadingAnchor, Constants.horizontalSpacing)
        
        slider.pinTop(to: titleView.bottomAnchor)
        slider.pinCenterX(to: self.centerXAnchor)
        slider.pinBottom(to: self.bottomAnchor, Constants.verticalSpacing)
        slider.pinLeft(to: self.leadingAnchor, Constants.horizontalSpacing)
    }
}
