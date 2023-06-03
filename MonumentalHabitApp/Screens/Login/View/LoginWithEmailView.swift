//
//  LoginWithEmailView.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 28/05/23.
//

import UIKit

class LoginWithEmailView: UIView {

    // MARK: PROPERTIES -
    
    let headerView: CustomCardHeaderView = {
        let view = CustomCardHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.titleLabel.text = "Log in with email"
        view.leadingButton.isHidden = true
        view.trailingButton.isHidden = true
        
        return view
    }()
    
    let fieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    let emailTextFieldView: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.configuration = CustomTextFieldConfiguration(
            withImage: true,
            withActionButton: false,
            backgroundColor: Color.morningLight2,
            dividerColor: Color.morningLight1,
            iconImage: UIImage(named: "ic_email") ,
            placeHolderData: CustomTextFieldPlaceHolder(
                color: Color.eclipseLight1,
                title: "Email",
                font: Font(.installed(.manropeMedium), size: .custom(16)).instance
            ),
            titleData: CustomInputTextFieldTitleData(
                tintColor: Color.morningDark,
                textColor: Color.morningDark,
                font: Font(.installed(.manropeBold), size: .custom(16)).instance
            )
            
        )
        
        return textField
    }()
    
    let passwordTextFieldView: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.configuration = CustomTextFieldConfiguration(
            withImage: true,
            withActionButton: true,
            backgroundColor: Color.morningLight2,
            dividerColor: Color.morningLight1,
            iconImage: UIImage(named: "ic_pass"),
            placeHolderData: CustomTextFieldPlaceHolder(
                color: Color.eclipseLight1,
                title: "Password",
                font: Font(.installed(.manropeMedium), size: .custom(16)).instance
            ),
            titleData: CustomInputTextFieldTitleData(
                tintColor: Color.morningDark,
                textColor: Color.morningDark,
                font: Font(.installed(.manropeBold), size: .custom(16)).instance
            )
        )
        
        textField.inputTextField.isSecureTextEntry = true
        
        return textField
    }()
    
    let loginButton: CustomButtonView = {
        let button = CustomButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.configuration = CustomButtonViewConfiguration(
            withImage: false,
            buttonTitle: "Login",
            buttonFont: Font(.installed(.manropeBold), size: .custom(16)).instance,
            buttonTitleColor: Color.eclipse,
            buttonColor: Color.morningDark
        )
        
        button.tapFeedBack()
        
        return button
    }()
    
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
        addSubview(headerView)
        
        addSubview(fieldsStackView)
        fieldsStackView.addArrangedSubview(emailTextFieldView)
        fieldsStackView.addArrangedSubview(passwordTextFieldView)
        
        addSubview(loginButton)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 50),
            
            fieldsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            fieldsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            fieldsStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 15),
            fieldsStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 55),
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 55),
            
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            loginButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 20)
        ])
    }

}
