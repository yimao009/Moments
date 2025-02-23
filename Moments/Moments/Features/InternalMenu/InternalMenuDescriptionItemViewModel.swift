//
//  InternalMenuDescriptionItemViewModel.swift
//  Moments
//
//  Created by GRZ on 2025/2/11.
//

struct InternalMenuDescriptionItemViewModel: InternalMenuItemViewModel {
    let title: String
    
    var type: InternalMenuItemType {
        .description
    }
    
    func select() { }
}
