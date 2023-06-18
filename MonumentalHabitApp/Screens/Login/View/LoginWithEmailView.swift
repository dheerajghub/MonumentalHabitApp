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
            actionButtonImage: UIImage(named: "ic_eye_slash")?.withRenderingMode(.alwaysTemplate),
            actionButtonColor: Color.eclipse,
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
    
    let loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(16)).instance
        button.backgroundColor = Color.morningDark
        button.layer.cornerRadius = 8
        button.hapticFeedback()
        return button
    }()
    
    let bottomActionStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    let forgotButton: UIButton = {
        let button = UIButton()
        button.titleLabel?.font = Font(.installed(.manropeMedium), size: .custom(14)).instance
        button.setTitleColor(Color.eclipse, for: .normal)
        
        // for underline attribute label
        let underlineAttribute = [
            NSAttributedString.Key.underlineStyle: NSUnderlineStyle.thick.rawValue
        ]
        let underlineAttributedString = NSAttributedString(string: "Forgot Password?", attributes: underlineAttribute)
        button.setAttributedTitle(underlineAttributedString, for: .normal)
        button.hapticFeedback()
        return button
    }()
    
    lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Don't have an account? Sign up", for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeMedium), size: .custom(14)).instance
        button.setTitleColor(Color.eclipse, for: .normal)
        button.hapticFeedback()
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
        
        addSubview(bottomActionStackView)
        bottomActionStackView.addArrangedSubview(forgotButton)
        bottomActionStackView.addArrangedSubview(signUpButton)
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
            loginButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 20),
            
            bottomActionStackView.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 20),
            bottomActionStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomActionStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            signUpButton.heightAnchor.constraint(equalToConstant: 20),
            forgotButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

}
