//
//  Functions.swift
//  Moments
//
//  Created by GRZ on 2025/2/11.
//
import UIKit

@discardableResult
public func configure<T: AnyObject>(_ object: T, clouse: (T) -> Void) -> T
{
    clouse(object)
    return object
}

var rootViewController: UIViewController? {
    let keyWindow = UIApplication.shared.connectedScenes
        .filter({ $0.activationState == .foregroundActive})
        .map({ $0 as? UIWindowScene })
        .compactMap({ $0 })
        .first?.windows
        .filter({ $0.isKeyWindow }).first
    return keyWindow?.rootViewController
}
