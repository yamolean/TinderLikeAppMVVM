//
//  Bindable.swift
//  TindxxLikeAppMVVM
//
//  Created by 矢守叡 on 2020/01/12.
//  Copyright © 2020 yamolean. All rights reserved.
//

import Foundation

class Bindable<T> {
    var value: T? {
        didSet {
            observer?(value)
        }
    }
    
    var observer: ((T?)->())?
    
    func bind(observer: @escaping (T?) ->()) {
        self.observer = observer
    }
    
}
