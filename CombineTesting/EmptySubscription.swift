//
//  EmptySubscription.swift
//  
//
//  Created by Michael Welsh on 2024-01-06.
//

import Combine
import Foundation

/// A `Subscription` which doesn't do anything or perform any actions.
public class EmptySubscription: Subscription {
  public init() { }

  /// Does nothing.
  public func request(_ demand: Subscribers.Demand) {
    /// Intentionally empty.
  }

  /// Does nothing.
  public func cancel() {
    /// Intentionally empty.
  }
}
