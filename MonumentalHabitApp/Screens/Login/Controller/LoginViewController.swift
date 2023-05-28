//
//  LoginViewController.swift
//  MonumentalHabitApp
//
//  Created by Dheeraj Kumar Sharma on 27/05/23.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: PROPERTIES -
    
    let presentationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 20
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        return stackView
    }()
    
    let demoTextField1: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.configuration = CustomTextFieldConfiguration(withImage: true)
        return textField
    }()
    
    let demoTextField2: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.configuration = CustomTextFieldConfiguration(withImage: true, withActionButton: true)
        return textField
    }()
    
    let demoTextField3: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.configuration = CustomTextFieldConfiguration()
        return textField
    }()
    
    let demoTextField4: CustomInputTextField = {
        let textField = CustomInputTextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.configuration = CustomTextFieldConfiguration(withActionButton: true)
        return textField
    }()
    
    let demoButton1: CustomButtonView = {
        let button = CustomButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = CustomButtonViewConfiguration(withImage: true)
        return button
    }()
    
    let demoButton2: CustomButtonView = {
        let button = CustomButtonView()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = CustomButtonViewConfiguration()
        return button
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
        
        view.addSubview(presentationStackView)
        presentationStackView.addArrangedSubview(demoTextField1)
        presentationStackView.addArrangedSubview(demoTextField2)
        presentationStackView.addArrangedSubview(demoTextField3)
        presentationStackView.addArrangedSubview(demoTextField4)
        
        presentationStackView.addArrangedSubview(demoButton1)
        presentationStackView.addArrangedSubview(demoButton2)
    }
    
    func setUpConstraints(){
        NSLayoutConstraint.activate([
            
            presentationStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            presentationStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            presentationStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            presentationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            demoTextField1.heightAnchor.constraint(equalToConstant: 50),
            demoTextField2.heightAnchor.constraint(equalToConstant: 50),
            demoTextField3.heightAnchor.constraint(equalToConstant: 50),
            demoTextField4.heightAnchor.constraint(equalToConstant: 50),
            
            demoButton1.heightAnchor.constraint(equalToConstant: 50),
            demoButton2.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}
