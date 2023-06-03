//
//  CustomInputTextField.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 28/05/23.
//

import UIKit

public struct CustomTextFieldPlaceHolder {
    
    let color: UIColor
    let title: String
    let font: UIFont
    
    init(color: UIColor = .lightGray, title: String = "Type Something.." , font: UIFont = Font(.installed(.manropeMedium), size: .custom(16)).instance) {
        self.color = color
        self.title = title
        self.font = font
    }
    
}

public struct CustomInputTextFieldTitleData {
    
    let tintColor: UIColor
    let textColor: UIColor
    let font: UIFont
    
    init(tintColor: UIColor, textColor: UIColor, font: UIFont) {
        self.tintColor = tintColor
        self.textColor = textColor
        self.font = font
    }
    
}

public struct CustomTextFieldConfiguration {
    
    let withImage: Bool
    let withActionButton: Bool
    let backgroundColor: UIColor
    let dividerColor: UIColor
    let iconImage: UIImage?
    let actionButtonImage: UIImage?
    let placeHolderData: CustomTextFieldPlaceHolder?
    let titleData: CustomInputTextFieldTitleData?
    
    init(
        withImage: Bool,
        withActionButton: Bool,
        backgroundColor: UIColor = .lightGray.withAlphaComponent(0.3),
        dividerColor: UIColor = .gray.withAlphaComponent(0.5),
        iconImage: UIImage? = nil,
        actionButtonImage: UIImage? = nil,
        placeHolderData: CustomTextFieldPlaceHolder? = nil,
        titleData: CustomInputTextFieldTitleData? = nil
    ) {
        self.withImage = withImage
        self.withActionButton = withActionButton
        self.dividerColor = dividerColor
        self.backgroundColor = backgroundColor
        self.iconImage = iconImage
        self.actionButtonImage = actionButtonImage
        self.placeHolderData = placeHolderData
        self.titleData = titleData
    }
    
}

class CustomInputTextField: UIView {

    // MARK: PROPERTIES -
    
    var configuration: CustomTextFieldConfiguration? {
        didSet {
            configure()
        }
    }
    
    var inputTextFieldLeadingConstraint: NSLayoutConstraint?
    var inputTextFieldTrailingConstraint: NSLayoutConstraint?
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 10
        return view
    }()
    
    // Input Icon View
    
    let inputImageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let inputImageIcon: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    //:
    
    let dividerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let inputTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.tintColor = .gray.withAlphaComponent(0.5)
        textField.placeholder = "Type something.."
        return textField
    }()
    
    // Action Button View
    
    let actionButtonView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let actionButtonImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .black.withAlphaComponent(0.8)
        image.layer.cornerRadius = 5
        return image
    }()
    
    let actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //:
    
    // MARK: MAIN -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
        setUpConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        addSubview(backgroundView)
        
        backgroundView.addSubview(inputImageView)
        inputImageView.addSubview(inputImageIcon)
        
        backgroundView.addSubview(dividerView)
        backgroundView.addSubview(inputTextField)
        
        backgroundView.addSubview(actionButtonView)
        actionButtonView.addSubview(actionButtonImage)
        actionButtonView.addSubview(actionButton)
    }
    
    func setUpConstraints(){
        
        backgroundView.pin(to: self)
        actionButton.pin(to: actionButtonView)
        NSLayoutConstraint.activate([
            inputImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            inputImageView.widthAnchor.constraint(equalToConstant: 50),
            inputImageView.topAnchor.constraint(equalTo: topAnchor),
            inputImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            inputImageIcon.centerXAnchor.constraint(equalTo: inputImageView.centerXAnchor),
            inputImageIcon.centerYAnchor.constraint(equalTo: inputImageView.centerYAnchor),
            inputImageIcon.widthAnchor.constraint(equalToConstant: 30),
            inputImageIcon.heightAnchor.constraint(equalToConstant: 30),
            
            dividerView.leadingAnchor.constraint(equalTo: inputImageView.trailingAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 1),
            dividerView.topAnchor.constraint(equalTo: topAnchor),
            dividerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            inputTextField.centerYAnchor.constraint(equalTo: inputImageView.centerYAnchor),
            
            actionButtonView.trailingAnchor.constraint(equalTo: trailingAnchor),
            actionButtonView.widthAnchor.constraint(equalToConstant: 50),
            actionButtonView.topAnchor.constraint(equalTo: topAnchor),
            actionButtonView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            actionButtonImage.widthAnchor.constraint(equalToConstant: 30),
            actionButtonImage.heightAnchor.constraint(equalToConstant: 30),
            actionButtonImage.centerYAnchor.constraint(equalTo: actionButtonView.centerYAnchor),
            actionButtonImage.centerXAnchor.constraint(equalTo: actionButtonView.centerXAnchor)
            
        ])
        
        inputTextFieldLeadingConstraint = inputTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60)
        inputTextFieldLeadingConstraint?.isActive = true
        
        inputTextFieldTrailingConstraint = inputTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60)
        inputTextFieldTrailingConstraint?.isActive = true
        
        
    }
    
    func configure(){
        
        guard let configuration = configuration else { return }
        
        inputTextFieldLeadingConstraint?.constant = configuration.withImage ? 60 : 15
        inputTextFieldTrailingConstraint?.constant = configuration.withActionButton ? -50 : -15
        
        actionButtonView.isHidden = configuration.withActionButton ? false : true
        inputImageView.isHidden = configuration.withImage ? false : true
        
        dividerView.isHidden = configuration.withImage ? false : true
        
        if let placeHolderData = configuration.placeHolderData {
            inputTextField.attributedPlaceholder = NSAttributedString(
                string: "\(placeHolderData.title)",
                attributes: [
                    NSAttributedString.Key.foregroundColor: placeHolderData.color,
                    NSAttributedString.Key.font: placeHolderData.font
                ]
            )
        }
        
        if let iconImage = configuration.iconImage {
            inputImageIcon.image = iconImage
            inputImageIcon.backgroundColor = .clear
            inputImageIcon.layer.cornerRadius = 0
        } else {
            inputImageIcon.backgroundColor = .black.withAlphaComponent(0.8)
            inputImageIcon.layer.cornerRadius = 5
        }
        
        dividerView.backgroundColor = configuration.dividerColor
        backgroundView.backgroundColor = configuration.backgroundColor
        
        if let actionButtonImage = configuration.actionButtonImage {
            self.actionButtonImage.image = actionButtonImage
            self.actionButtonImage.backgroundColor = .clear
            self.actionButtonImage.layer.cornerRadius = 0
        } else {
            self.actionButtonImage.backgroundColor = .black.withAlphaComponent(0.8)
            self.actionButtonImage.layer.cornerRadius = 5
        }
        
        if let titleData = configuration.titleData {
            inputTextField.font = titleData.font
            inputTextField.tintColor = titleData.tintColor
            inputTextField.textColor = titleData.textColor
        }
        
    }

}
