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
    
    let cardViewModels: [CardViewModel] = {
        let producers = [
            User(name: "yamolean", age: 23, profession: "Hos", imageNames: ["yamada","yamada","yamolean","yamolean"]),
            Advertiser(title: "Slide Out Menu", brandName: "njndjajndjn", posterPhotoName: "slide_out_menu_poster"),
            User(name: "yamolean", age: 18, profession: "HosHosHos", imageNames: ["yamolean","yamada","yamolean","yamolean"])
        ] as [ProducesCardViewModel]
        
        let viewModels = producers.map({return $0.toCardViewModel()})
        return viewModels
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initLayout()
        initDummy()
    }
    
    private func initDummy() {
        cardViewModels.forEach { (cardVM) in
            let cardView = CardView(frame: .zero)
            cardView.cardViewModel = cardVM
            cardsDeckView.addSubview(cardView)
            cardView.fillSuperview()
        }
    }
    
    private func initLayout() {
        let overallStackView = UIStackView(arrangedSubviews: [topStackView, cardsDeckView, buttonsStackView])
        overallStackView.axis = .vertical
        view.addSubview(overallStackView)
        overallStackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor)
        overallStackView.isLayoutMarginsRelativeArrangement = true
        overallStackView.layoutMargins = .init(top: 0, left: 12, bottom: 0, right: 12)
        
        overallStackView.bringSubviewToFront(cardsDeckView)
    }
}

