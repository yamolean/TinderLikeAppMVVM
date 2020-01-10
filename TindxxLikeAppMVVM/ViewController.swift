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
    
    private func initDummy() {
        print("Setting up dummy cards")
        let cardView = CardView(frame: .zero)
        cardsDeckView.addSubview(cardView)
        cardView.fillSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initDummy()
        
        cardsDeckView.backgroundColor = .blue
        initLayout()
    }
    
    private func initLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        overallStackView.axis = .vertical
        
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
    }
}

