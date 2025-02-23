//
//  InternalMenuDescriptionCell.swift
//  Moments
//
//  Created by GRZ on 2025/2/11.
//

import UIKit

class InternalMenuDescriptionCell: InternalMenuCell<InternalMenuDescriptionItemViewModel> {
    override func update(_ item: InternalMenuDescriptionItemViewModel) {
        textLabel?.text = item.title
    }
}
