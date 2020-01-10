//
//  ViewController.swift
//  TindxxLikeAppMVVM
//
//  Created by 矢守叡 on 2020/01/11.
//  Copyright © 2020 yamolean. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    
    private let topStackView = TopNavigationStackView()
    private let cardsDeckView = UIView()
    private let buttonsStackView = HomeBottomControlsStackView()
    
    let users = [
        User(name: "yamolean", age: 24, profession: "hoshos", imageName: "yamolaen"),
        User(name: "yamolean1", age: 18, profession: "hoshoshos", imageName: "yamolaen")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDummy()
        
        cardsDeckView.backgroundColor = .blue
        initLayout()
    }
    
    private func initDummy() {
        users.forEach { (user) in
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: user.imageName)
            cardView.informationLabel.text = "\(user.name) \(user.age)\n\(user.profession)"
            
            let attributedText = NSMutableAttributedString(string: user.name, attributes: [.font: UIFont.systemFont(ofSize: 32, weight: .heavy)])
            attributedText.append(NSAttributedString(string: "  \(user.age)", attributes: [.font: UIFont.systemFont(ofSize: 24, weight: .regular)]))
            
            attributedText.append(NSAttributedString(string: "\n\(user.profession)", attributes: [.font: UIFont.systemFont(ofSize: 20, weight: .regular)]))
            
            cardView.informationLabel.attributedText = attributedText
            
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
    
    private func initLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        overallStackView.axis = .vertical
        
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}

