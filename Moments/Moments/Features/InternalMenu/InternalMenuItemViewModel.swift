//
//  InternalMenuItemViewModel.swift
//  Moments
//
//  Created by GRZ on 2025/2/11.
//

import Foundation

enum InternalMenuItemType: String {
    case description
    case featureToggle
    case actionTrigger
}

protocol InternalMenuItemViewModel {
    var type: InternalMenuItemType { get }
    func select()
}
