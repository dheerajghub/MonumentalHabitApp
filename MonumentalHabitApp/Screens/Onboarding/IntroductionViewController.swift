//
//  IntroductionViewController.swift
//  MonumentalHabitApp
//
//  Created by Rahul Sharma on 27/05/23.
//

import UIKit

enum Introduction : CaseIterable{
    case Welcome
    case CreateHabit
    case TrackProgress
    case JoinCommunity
    var info : (title : String,image : String){
        switch self {
        case .Welcome:
            return ("WELCOME TO MONUMENTAL HABITS","Intro1")
        case .CreateHabit:
            return ("CREATE NEW HABIT EASILY","Intro2")
        case .TrackProgress:
            return ("KEEP TRACK OF YOUR PROGRESS","Intro3")
        case .JoinCommunity:
            return ("JOIN A SUPPORTIVE COMMUNITY","Intro4")
        }
    }
}

class IntroductionViewController: UIViewController {
    
    // MARK: PROPERTIES -
    
    let headerlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font(.installed(.klasikRegular), size: .custom(32)).instance
        label.textColor = Color.eclipse
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    let image: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    let descriptionlabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = Font(.installed(.manropeRagular), size: .custom(17)).instance
        label.textColor = Color.eclipse
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let skipButton : UIButton = {
        let button = UIButton()
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(17)).instance
        return button
    }()
    
    let nextButton : UIButton = {
        let button = UIButton()
        button.setTitle("Next", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(17)).instance
        return button
    }()
    
    let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = Color.eclipse
        pageControl.pageIndicatorTintColor = Color.morning
        pageControl.layer.shadowColor = Color.shadow.cgColor
        pageControl.layer.shadowOpacity = 0.15
        pageControl.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
        pageControl.layer.shadowRadius = 1.0
        return pageControl
        
    }()
    
    let stackView : UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 20.0
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let getStartedButton : UIButton = {
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(Color.eclipse, for: .normal)
        button.titleLabel?.font = Font(.installed(.manropeBold), size: .custom(17)).instance
        button.backgroundColor = Color.morningDark
        button.layer.cornerRadius = 8
        button.hapticFeedback()
        return button
    }()
    
    var introScreen : Introduction = .Welcome
    
    // MARK: MAIN -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        setUpConstraints(introScreen: self.introScreen)
        attributtedString()
        nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        skipButton.addTarget(self, action: #selector(skipButtonTapped), for: .touchUpInside)
        getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        configureType(introScreen: self.introScreen)
    }
    
    // MARK: FUNCTIONS -
    
    func setUpViews(){
        view.backgroundColor = .white
        view.addSubview(headerlabel)
        view.addSubview(image)
        view.addSubview(descriptionlabel)
        view.addSubview(stackView)
        pageControl.numberOfPages = 4
        pageControl.currentPage = 0
        stackView.addArrangedSubview(skipButton)
        stackView.addArrangedSubview(pageControl)
        stackView.addArrangedSubview(nextButton)
        stackView.addArrangedSubview(getStartedButton)
    }
    
    func configureType(introScreen : Introduction){
        image.image = UIImage(named: introScreen.info.image)
        headerlabel.text = introScreen.info.title
        if introScreen == .JoinCommunity{
            skipButton.isHidden = true
            pageControl.isHidden = true
            nextButton.isHidden = true
            getStartedButton.isHidden = false
        }else{
            skipButton.isHidden = false
            pageControl.isHidden = false
            nextButton.isHidden = false
            getStartedButton.isHidden = true
        }
    }
    
    func attributtedString(){
        let str = "WE CAN HELP YOU TO BE A BETTER VERSION OF YOURSELF."
        let font = Font(.installed(.manropeBold), size: .custom(17)).instance
        let string = NSMutableAttributedString.init(string: str)
        let firstRange = NSString(string: str).range(of: "WE CAN", options: String.CompareOptions.caseInsensitive)
        let secondRange = NSString(string: str).range(of: "HELP YOU", options: String.CompareOptions.caseInsensitive)
        let thirdRange = NSString(string: str).range(of: "TO BE A BETTER VERSION OF", options: String.CompareOptions.caseInsensitive)
        let fourthRange = NSString(string: str).range(of: "YOURSELF.", options: String.CompareOptions.caseInsensitive)
        string.addAttributes([NSAttributedString.Key.foregroundColor : Color.eclipse as Any, NSAttributedString.Key.font: font as Any], range: firstRange)
        string.addAttributes([NSAttributedString.Key.foregroundColor : Color.sunset as Any, NSAttributedString.Key.font: font as Any], range: secondRange)
        string.addAttributes([NSAttributedString.Key.foregroundColor : Color.eclipse as Any, NSAttributedString.Key.font: font as Any], range: thirdRange)
        string.addAttributes([NSAttributedString.Key.foregroundColor : Color.sunset as Any, NSAttributedString.Key.font: font as Any], range: fourthRange)
        descriptionlabel.attributedText = string
    }
    
    func setUpConstraints(introScreen : Introduction){
        
        NSLayoutConstraint.activate([
            headerlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 32),
            headerlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -32),
            headerlabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            headerlabel.heightAnchor.constraint(equalToConstant: 64),
            
            image.topAnchor.constraint(equalTo: headerlabel.bottomAnchor,constant: 0),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 50),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -50),
            image.bottomAnchor.constraint(equalTo: descriptionlabel.topAnchor),
            
            descriptionlabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            descriptionlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            descriptionlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            descriptionlabel.bottomAnchor.constraint(equalTo: stackView.topAnchor,constant: -73),
            descriptionlabel.heightAnchor.constraint(equalToConstant: 60),
            
            stackView.topAnchor.constraint(equalTo: descriptionlabel.bottomAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: 60),
        ])
    }
    
    @objc func nextButtonTapped() {
        if pageControl.currentPage == 0{
            pageControl.currentPage =  1
            introScreen = .CreateHabit
        }else if pageControl.currentPage == 1{
            pageControl.currentPage =  2
            introScreen = .TrackProgress
        }else if pageControl.currentPage == 2{
            pageControl.currentPage =  3
            introScreen = .JoinCommunity
        }
        configureType(introScreen: self.introScreen)
        setUpConstraints(introScreen: self.introScreen)
    }
    
    @objc func skipButtonTapped() {
        introScreen = .JoinCommunity
        configureType(introScreen: self.introScreen)
        setUpConstraints(introScreen: self.introScreen)
    }
    
    
    
    @objc func getStartedButtonTapped() {
        let VC = LoginViewController()
        let navVC = UINavigationController(rootViewController: VC)
        navVC.modalPresentationStyle = .fullScreen
        self.present(navVC, animated: true)
        
        // onboarding completed
        UserDefaults.standard.set(true, forKey: "isOnboardingCompleted")
        
    }
}
