//
//  LoginViewController.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 27/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: PROPERTIES -
    
    let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.5)
        return view
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
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        view.backgroundColor = .white
        view.addSubview(backgroundView)
        view.addSubview(loginWithEmailCard)
    }
    
    func setUpConstraints(){
        backgroundView.pin(to: view)
        NSLayoutConstraint.activate([
            loginWithEmailCard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loginWithEmailCard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loginWithEmailCard.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loginWithEmailCard.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.45)
        ])
    }

}
