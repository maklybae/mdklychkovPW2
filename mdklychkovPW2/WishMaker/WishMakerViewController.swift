//
//  WishMakerViewController.swift
//  mdklychkovPW2
//
//  Created by Maksim Klychkov on 29.10.2024.
//

import UIKit

final class WishMakerViewController: UIViewController {
    // MARK: - Constants
    enum Constants {
        static let viewTitle: String = "WishMaker"
        static let viewTitleFontSize: CGFloat = 32
        static let viewTitleVerticalSpacing: CGFloat = 20
        static let viewDescription: String = "This app will bring you joy and and will fulfill your wishes!\n\nThe slider will change the color of the background."
        static let viewDescriptionVerticalSpacing: CGFloat = 20
        
        static let sliderMin: Double = 0
        static let sliderMax: Double = 1
        static let redLabel: String = "Red"
        static let greenLabel: String = "Green"
        static let blueLabel: String = "Blue"
        static let stackRadius: CGFloat = 20
        static let stackBottom: CGFloat = -40
        static let stackLeading: CGFloat = 20
        
        static let buttonRandomizeTitle: String = "Randomize"
        static let buttonRandomizeHeight: CGFloat = 40
        
        static let toggleSlidersAnimationDuration: Double = 0.3
        static let buttonToggleSlidersTitle: String = "Toggle Sliders"
    }
    
    // MARK: - Varibales
    private let interactor: BuisnessLogic
    
    private let titleView = UILabel()
    private let descriptionView = UILabel()
    private let stackView = UIStackView()
    private let sliderRed = CustomSlider(title: Constants.redLabel, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderGreen = CustomSlider(title: Constants.greenLabel, min: Constants.sliderMin, max: Constants.sliderMax)
    private let sliderBlue = CustomSlider(title: Constants.blueLabel, min: Constants.sliderMin, max: Constants.sliderMax)
    private let buttonRandomize = UIButton(type: .system)
    private let buttonToggleSliders = UIButton(type: .system)
    
    // MARK: - Lifecycle
    init(interactor: BuisnessLogic) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Actions
    @objc
    func sliderValueChanged() {
        interactor.changeBackgroundColor(.init(red: Double(sliderRed.slider.value), green: Double(sliderGreen.slider.value), blue: Double(sliderBlue.slider.value)))
    }
    
    @objc
    func buttonRandomizeTapped() {
        interactor.randomizeBackgroundColor(.init())
    }
    
    @objc
    private func buttonToggleSlidersTapped() {
        UIView.animate(withDuration: Constants.toggleSlidersAnimationDuration) {
            for slider in [self.sliderRed, self.sliderGreen, self.sliderBlue] {
                slider.isHidden.toggle()
                slider.alpha = slider.isHidden ? 0 : 1
            }
        }
    }
    
    // MARK: - Public funcs
    func displayChangedBackground(_ viewModel: WishMaker.ChangeBackgroundColor.ViewModel) {
        view.backgroundColor = viewModel.uiColor
    }
    
    func displayRandomizedBackground(_ viewModel: WishMaker.RandomizeBackgroundColor.ViewModel) {
        view.backgroundColor = viewModel.uiColor
        let ciColor = CIColor(color: viewModel.uiColor)
        sliderRed.slider.setValue(Float(ciColor.red), animated: true)
        sliderBlue.slider.setValue(Float(ciColor.blue), animated: true)
        sliderGreen.slider.setValue(Float(ciColor.green), animated: true)
    }
    
    // MARK: - Private funcs
    private func configureUI() {
        configureTitle()
        configurateDescription()
        configurateButtonRandomize()
        configurateButtonToggleSliders()
        configurateStack()
    }
    
    private func configureTitle() {
        titleView.text = Constants.viewTitle
        titleView.textAlignment = .center
        titleView.font = UIFont.systemFont(ofSize: Constants.viewTitleFontSize, weight: .bold)
        titleView.textColor = .white
        
        view.addSubview(titleView)
        titleView.pinCenterX(to: view)
        titleView.pinTop(to: view.safeAreaLayoutGuide.topAnchor, Constants.viewTitleVerticalSpacing)
    }
    
    private func configurateDescription() {
        descriptionView.text = Constants.viewDescription
        descriptionView.lineBreakMode = NSLineBreakMode.byWordWrapping
        descriptionView.numberOfLines = 0 // word wrapping
        descriptionView.textColor = .white
        
        view.addSubview(descriptionView)
        descriptionView.pinCenterX(to: view)
        descriptionView.pinHorizontal(to: view, Constants.viewDescriptionVerticalSpacing)
        descriptionView.pinTop(to: titleView.bottomAnchor, Constants.viewDescriptionVerticalSpacing)
    }
    
    private func configurateButtonRandomize() {
        buttonRandomize.configuration = UIButton.Configuration.plain()
        buttonRandomize.setTitle(Constants.buttonRandomizeTitle, for: .normal)
        buttonRandomize.backgroundColor = .white
        buttonRandomize.setHeight(Constants.buttonRandomizeHeight)
        
        buttonRandomize.addTarget(self, action: #selector(buttonRandomizeTapped), for: .touchUpInside)
    }
    
    private func configurateButtonToggleSliders() {
        buttonToggleSliders.configuration = UIButton.Configuration.plain()
        buttonToggleSliders.setTitle(Constants.buttonToggleSlidersTitle, for: .normal)
        buttonToggleSliders.backgroundColor = .white
        
        buttonToggleSliders.addTarget(self, action: #selector(buttonToggleSlidersTapped), for: .touchUpInside)
    }
    
    private func configurateStack() {
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        stackView.layer.cornerRadius = Constants.stackRadius
        stackView.clipsToBounds = true
        
        for slider in [sliderRed, sliderGreen, sliderBlue] {
            stackView.addArrangedSubview(slider)
            slider.slider.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
        }
        
        stackView.addArrangedSubview(buttonToggleSliders)
        stackView.addArrangedSubview(buttonRandomize)
        
        
        stackView.pinBottom(to: view, -1 * Constants.stackBottom)
        stackView.pinHorizontal(to: view, Constants.stackLeading)
    }
}
