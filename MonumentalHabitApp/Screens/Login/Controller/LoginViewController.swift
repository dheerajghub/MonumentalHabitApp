//
//  LoginViewController.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 27/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: PROPERTIES -
    
    var backgroundViewBottomConstraint: NSLayoutConstraint?
    var bottomConstraint: NSLayoutConstraint?
    var showPassword: Bool = false
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return view
    }()
    
    let backgroundImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "SplashImage")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.text = "welcome to monumental habbits".uppercased()
        label.textColor = Color.eclipse
        label.font = Font(.installed(.klasikRegular), size: .custom(30)).instance
        label.textAlignment = .center
        label.numberOfLines = 0
        
        return label
    }()
    
    let socialStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 8
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    let googleLoginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("   Continue with Google", for: .normal)
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
        button.setTitle("   Continue with Facebook", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(16)).instance
        button.setImage(UIImage(named: "ic_facebook"), for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 8
        button.hapticFeedback()
        return button
    }()
    
    lazy var loginWithEmailCard: LoginWithEmailView = {
        let view = LoginWithEmailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [ .layerMinXMinYCorner , .layerMaxXMinYCorner ]
        
        view.passwordTextFieldView.actionButton.addTarget(self, action: #selector(togglePasswordButtonTapped(_:)), for: .touchUpInside)
        
        view.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        view.signUpButton.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        
        return view
    }()
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.gradientView.applyGradient(withColors: [UIColor.white.withAlphaComponent(0).cgColor, Color.morningLight1.cgColor, Color.morningLight1.cgColor])
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animateBackGroundImage()
        }
        
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        
        hideKeyboardWhenTappedAround()
        
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        backgroundView.addSubview(backgroundImage)
        view.addSubview(gradientView)
        
        view.addSubview(titleLabel)
        
        view.addSubview(socialStackView)
        socialStackView.addArrangedSubview(googleLoginButton)
        socialStackView.addArrangedSubview(facebookLoginButton)
        
        view.addSubview(loginWithEmailCard)

    }
    
    func setUpConstraints(){
        backgroundImage.pin(to: backgroundView)
        NSLayoutConstraint.activate([
            
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gradientView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gradientView.topAnchor.constraint(equalTo: view.topAnchor),
            gradientView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: socialStackView.topAnchor, constant: -30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            socialStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            socialStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            socialStackView.bottomAnchor.constraint(equalTo: loginWithEmailCard.topAnchor, constant: -25),
            
            facebookLoginButton.heightAnchor.constraint(equalToConstant: 50),
            googleLoginButton.heightAnchor.constraint(equalToConstant: 50),
            
            loginWithEmailCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginWithEmailCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginWithEmailCard.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginWithEmailCard.heightAnchor.constraint(equalToConstant: 360 + windowConstant.getBottomPadding)
            
        ])
        
        backgroundViewBottomConstraint = backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        backgroundViewBottomConstraint?.isActive = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification) , name: UIResponder.keyboardWillShowNotification , object: nil)
                
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardNotification) , name: UIResponder.keyboardWillHideNotification , object: nil)
        
        //bottomconstraints
        bottomConstraint = NSLayoutConstraint(item: loginWithEmailCard, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0)
        view.addConstraint(bottomConstraint!)
    }
    
    func animateBackGroundImage(){
        
        self.backgroundViewBottomConstraint?.constant = -(self.loginWithEmailCard.frame.height + 100)
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
        }
        
    }
    
    // MARK: - ACTIONS
    
    @objc func loginButtonTapped(){
        print("LoginTapped")
        view.endEditing(true)
    }
    
    @objc func signupButtonTapped(){
        let VC = SignUpViewController()
        VC.modalPresentationStyle = .fullScreen
        self.present(VC, animated: true)
    }
    
    @objc func togglePasswordButtonTapped(_ sender: UIButton){
    
        let passwordTextFieldView = self.loginWithEmailCard.passwordTextFieldView
        let actionButtonImage = passwordTextFieldView.actionButtonImage
        
        if showPassword {
            showPassword = false
            actionButtonImage.image = UIImage(named: "ic_eye_slash")?.withRenderingMode(.alwaysTemplate)
            passwordTextFieldView.inputTextField.isSecureTextEntry = true
            
        } else {
            showPassword = true
            actionButtonImage.image = UIImage(named: "ic_eye")?.withRenderingMode(.alwaysTemplate)
            passwordTextFieldView.inputTextField.isSecureTextEntry = false
        }
        
        actionButtonImage.tintColor = Color.eclipse
        
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

extension UIView {
    func applyGradient(withColors:[CGColor], withLocation: [NSNumber] = []) {
        let gradient = CAGradientLayer()
        gradient.colors = withColors   // your colors go here
//        gradient.locations = withLocation
        gradient.frame = self.bounds
        self.layer.insertSublayer(gradient, at: 0)
    }
}
