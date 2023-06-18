//
//  SignUpViewController.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 31/05/23.
//

import UIKit

class SignUpViewController: UIViewController {

    // MARK: - PROPERTIES
    
    var viewModel =  SignUpViewModel()
    var bottomConstraint: NSLayoutConstraint?
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    let contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 15
        stackView.distribution = .fill
        stackView.axis = .vertical
        return stackView
    }()
    
    let headerView: SignUpHeaderView = {
        let view = SignUpHeaderView()
        return view
    }()
    
    // Input stack view
    
    let inputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    let userNameTextFieldView: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.configuration = CustomTextFieldConfiguration(
            withImage: true,
            withActionButton: false,
            backgroundColor: .white,
            dividerColor: Color.morningLight1,
            iconImage: UIImage(named: "ic_user") ,
            placeHolderData: CustomTextFieldPlaceHolder(
                color: Color.eclipseLight1,
                title: "Username",
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
    
    let emailTextFieldView: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.configuration = CustomTextFieldConfiguration(
            withImage: true,
            withActionButton: false,
            backgroundColor: .white,
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
    
    lazy var passwordTextFieldView: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        textField.configuration = CustomTextFieldConfiguration(
            withImage: true,
            withActionButton: true,
            backgroundColor: .white,
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
        
        textField.actionButton.addTarget(self, action: #selector(showHidePassword), for: .touchUpInside)
        
        textField.inputTextField.isSecureTextEntry = true
        
        return textField
    }()
    
    //:
    
    // check box views
    
    let checkBoxStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 7
        stackView.axis = .vertical
        return stackView
    }()
    
    lazy var keepMeSignedInCheckBox: CustomCheckBoxLabelView = {
        let view = CustomCheckBoxLabelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.checkBoxImage.image = UIImage(named: "ic_checkbox")
        
        view.label.text = "Keep me signed in"
        view.label.textColor = Color.eclipse.withAlphaComponent(0.5)
        view.label.font = Font(.installed(.manropeMedium), size: .custom(14)).instance
        
        view.actionButton.addTarget(self, action: #selector(keepMeSignedInTapped), for: .touchUpInside)
        
        return view
    }()
    
    lazy var emailMePricingCheckBox: CustomCheckBoxLabelView = {
        let view = CustomCheckBoxLabelView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.checkBoxImage.image = UIImage(named: "ic_checkbox")
        
        view.label.text = "Email me about special pricing and more"
        view.label.textColor = Color.eclipse.withAlphaComponent(0.5)
        view.label.font = Font(.installed(.manropeMedium), size: .custom(14)).instance
        
        view.actionButton.addTarget(self, action: #selector(emailMePricingTapped), for: .touchUpInside)
        
        return view
    }()
    
    //:
    
    let createAccountButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Create Account", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(16)).instance
        button.backgroundColor = Color.morningDark
        button.layer.cornerRadius = 8
        button.hapticFeedback()
        return button
    }()
    
    // dividerView
    
    let dividerCoverView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let dividerLine: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = Color.eclipse.withAlphaComponent(0.2)
        return view
    }()
    
    let dividerLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = Color.morningLight1
        label.text = "  Or Sign in with  "
        label.font = Font(.installed(.manropeMedium), size: .custom(15)).instance
        label.textColor = Color.eclipse.withAlphaComponent(0.5)
        return label
    }()
    
    //:
    
    // Social action View
    
    let socialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .horizontal
        return stackView
    }()
    
    let googleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("   Google", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(16)).instance
        button.setImage(UIImage(named: "ic_google"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.hapticFeedback()
        return button
    }()
    
    let facebookLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("   Facebook", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(16)).instance
        button.setImage(UIImage(named: "ic_facebook"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.hapticFeedback()
        return button
    }()
    
    //:
    
    lazy var signInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Already have an account? SignIn", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeRagular), size: .custom(14)).instance
        button.hapticFeedback()
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - MAIN
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
    }
    
    // MARK: - FUNCTIONS
    
    func setupViews(){
        hideKeyboardWhenTappedAround()
        view.backgroundColor = Color.morningLight1
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentStackView)
        
        contentStackView.addArrangedSubview(headerView)
        
        contentStackView.addArrangedSubview(inputStackView)
        inputStackView.addArrangedSubview(userNameTextFieldView)
        inputStackView.addArrangedSubview(emailTextFieldView)
        inputStackView.addArrangedSubview(passwordTextFieldView)
        
        contentStackView.addArrangedSubview(checkBoxStackView)
        checkBoxStackView.addArrangedSubview(keepMeSignedInCheckBox)
        checkBoxStackView.addArrangedSubview(emailMePricingCheckBox)
        
        contentStackView.addArrangedSubview(createAccountButton)
        
        contentStackView.addArrangedSubview(dividerCoverView)
        dividerCoverView.addSubview(dividerLine)
        dividerCoverView.addSubview(dividerLabel)
        
        contentStackView.addArrangedSubview(socialStackView)
        socialStackView.addArrangedSubview(googleLoginButton)
        socialStackView.addArrangedSubview(facebookLoginButton)
        
        contentStackView.addArrangedSubview(signInButton)
        
    }
    
    func setupConstraints(){
        scrollView.pin(to: view)
        NSLayoutConstraint.activate([
            contentStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            
            contentStackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            headerView.heightAnchor.constraint(equalToConstant: 300),
            
            // input stack
            
            inputStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            inputStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            inputStackView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 25),
            
            userNameTextFieldView.heightAnchor.constraint(equalToConstant: 55),
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 55),
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 55),
            
            //:
            
            // checkbox
            
            checkBoxStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            checkBoxStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            checkBoxStackView.topAnchor.constraint(equalTo: inputStackView.bottomAnchor, constant: 35),
            
            keepMeSignedInCheckBox.heightAnchor.constraint(equalToConstant: 30),
            emailMePricingCheckBox.heightAnchor.constraint(equalToConstant: 30),
            
            createAccountButton.topAnchor.constraint(equalTo: checkBoxStackView.bottomAnchor, constant: 35),
            createAccountButton.heightAnchor.constraint(equalToConstant: 60),
            createAccountButton.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 20),
            createAccountButton.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -20),
            
            //:
            
            // divider
            
            dividerCoverView.heightAnchor.constraint(equalToConstant: 30),
            dividerCoverView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 20),
            dividerCoverView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -20),
            
            dividerLine.centerYAnchor.constraint(equalTo: dividerCoverView.centerYAnchor),
            dividerLine.leadingAnchor.constraint(equalTo: dividerCoverView.leadingAnchor),
            dividerLine.trailingAnchor.constraint(equalTo: dividerCoverView.trailingAnchor),
            dividerLine.heightAnchor.constraint(equalToConstant: 1),
            
            dividerLabel.centerYAnchor.constraint(equalTo: dividerCoverView.centerYAnchor),
            dividerLabel.centerXAnchor.constraint(equalTo: dividerCoverView.centerXAnchor),
            
            //:
            
            // Social action view
            
            socialStackView.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor, constant: 20),
            socialStackView.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor, constant: -20),
            
            googleLoginButton.heightAnchor.constraint(equalToConstant: 50),
            facebookLoginButton.heightAnchor.constraint(equalToConstant: 50),
            
            //:
            
            signInButton.leadingAnchor.constraint(equalTo: contentStackView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: contentStackView.trailingAnchor)
            
        ])
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification) , name: UIResponder.keyboardWillShowNotification , object: nil)
                
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification) , name: UIResponder.keyboardWillHideNotification , object: nil)
        
        //bottomconstraints
        bottomConstraint = NSLayoutConstraint(item: scrollView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(bottomConstraint!)
    }
    
    // MARK: - ACTIONS
    
    @objc func showHidePassword(){
        
        // toggle the state
        viewModel.showPassword = !viewModel.showPassword
        
        // make change to UI afterwards
        let showPass = viewModel.showPassword
        passwordTextFieldView.actionButtonImage.image = UIImage(named: showPass ? "ic_eye" : "ic_eye_slash")
        passwordTextFieldView.inputTextField.isSecureTextEntry = showPass ? false : true
        
    }
    
    @objc func keepMeSignedInTapped(){
        
        // toggle the state
        viewModel.keepMeSignedIn = !viewModel.keepMeSignedIn
        
        // make change to UI afterwards
        let keepMeSignIn = viewModel.keepMeSignedIn
        keepMeSignedInCheckBox.checkBoxImage.image = UIImage(named: keepMeSignIn ? "ic_checkbox_checked" : "ic_checkbox")
        keepMeSignedInCheckBox.label.textColor = keepMeSignIn ? Color.eclipse : Color.eclipse.withAlphaComponent(0.5)
        
    }
    
    @objc func emailMePricingTapped(){
        
        // toggle the state
        viewModel.emailMePricing = !viewModel.emailMePricing
        
        // make change to UI afterwards
        let emailMePricing = viewModel.emailMePricing
        emailMePricingCheckBox.checkBoxImage.image = UIImage(named: emailMePricing ? "ic_checkbox_checked" : "ic_checkbox")
        emailMePricingCheckBox.label.textColor = emailMePricing ? Color.eclipse : Color.eclipse.withAlphaComponent(0.5)
        
    }
    
    @objc func signInButtonTapped() {
        self.dismiss(animated: true)
    }
    
    @objc func handleKeyboardNotification(notification: NSNotification){
            
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            
            let isKeyboardShowing = notification.name == UIResponder.keyboardWillShowNotification
            
            bottomConstraint?.constant = isKeyboardShowing ? -keyboardHeight : 0
            
            UIView.animate(withDuration:0.1, delay: 0 , options: .curveEaseOut , animations: {
                self.view.layoutIfNeeded()
            } , completion: {(completed) in
            })
        }
        
    }

}
