//
//  SplashViewController.swift
//  MonumentalHabitApp
//
//  Created by Rahul Sharma on 27/05/23.
//

import UIKit

class SplashViewController: UIViewController {

    // MARK: PROPERTIES -
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "WELCOME TO \nMONUMENTAL \nHABITS"
        label.font = Font(.installed(.klasikRegular), size: .custom(40)).instance
        label.textColor = Color.eclipse
        label.numberOfLines = 3
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    let image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "SplashImage")
        img.alpha = 0
        return img
    }()
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.animateImage()
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let VC = IntroductionViewController()
            VC.modalPresentationStyle = .fullScreen
            self.present(VC, animated: false)
        }

    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        view.backgroundColor = .white
        view.addSubview(image)
        view.addSubview(label)
    }
    
    func setUpConstraints(){
        image.pin(to: view)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            image.heightAnchor.constraint(equalToConstant: view.frame.height),
            image.widthAnchor.constraint(equalToConstant: view.frame.width)
        ])
    }
    
    func animateImage(){
        
        UIView.animate(withDuration: 2) {
            self.image.alpha = 1
            self.image.transform = .init(scaleX: 1.3, y: 1.3)
        }
        
        UIView.animate(withDuration: 2) {
            self.label.alpha = 1
        }
    
    }
    
}
