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
    
    let googleLoginButton: CustomButtonView = {
        let button = CustomButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = CustomButtonViewConfiguration(
            withImage: true,
            buttonTitle: "Continue with Google",
            buttonFont: Font(.installed(.manropeBold), size: .custom(16)).instance,
            buttonTitleColor: Color.eclipse,
            buttonColor: .white
        )
        return button
    }()
    
    let facebookLoginButton: CustomButtonView = {
        let button = CustomButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = CustomButtonViewConfiguration(
            withImage: true,
            buttonTitle: "Continue with Facebook",
            buttonFont: Font(.installed(.manropeBold), size: .custom(16)).instance,
            buttonTitleColor: Color.eclipse,
            buttonColor: .white
        )
        return button
    }()
    
    let loginWithEmailCard: LoginWithEmailView = {
        let view = LoginWithEmailView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.layer.maskedCorners = [ .layerMinXMinYCorner , .layerMaxXMinYCorner ]
        
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
    }
    
    func animateBackGroundImage(){
        
        self.backgroundViewBottomConstraint?.constant = -(self.loginWithEmailCard.frame.height + 100)
        UIView.animate(withDuration: 1.0) {
            self.view.layoutIfNeeded()
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
