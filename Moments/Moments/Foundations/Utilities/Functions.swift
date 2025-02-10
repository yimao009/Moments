//
//  Functions.swift
//  Moments
//
//  Created by GRZ on 2025/2/11.
//

public func configure<T: AnyObject>(_ object: T, clouse: (T) -> Void) -> T
{
    clouse(object)
    return object
}
