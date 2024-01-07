//
//  CapturingSubscriber.swift
//
//
//  Created by Michael Welsh on 2024-01-06.
//

import Combine
import Foundation

/// A subscriber which captures the latest subscription it receives and stores the values and completion it receives.
/// When receiving input, always returns unlimited demand.
public class CapturingSubscriber<Input, Failure: Error>: Subscriber {
  public typealias Input = Input
  public typealias Failure = Failure

  var capturedValues = [Input]()
  var capturedCompletion: Subscribers.Completion<Failure>?

  var subscription: Subscription?

  public init() { }

  /// Receives `Input` and stores it. Stores all values.
  /// - returns: `Subscribers.Demand.unlimited` regardless of input.
  public func receive(_ input: Input) -> Subscribers.Demand {
    capturedValues.append(input)
    return .unlimited
  }

  /// Receives a `Subscription` and stores it.
  /// Only stores the latest value.
  public func receive(subscription: Subscription) {
    self.subscription = subscription
  }

  /// Receives a `Subscribers.Completion<Failure>` and stores it.
  /// Only stores the latest value.
  public func receive(completion: Subscribers.Completion<Failure>) {
    capturedCompletion = completion
  }
}

public extension CapturingSubscriber {
  /// - returns: The currently captured values.
  func getCapturedValues() -> [Input] {
    capturedValues
  }

  /// - returns: The completion value or `nil` if no completion has occurred.
  func getCapturedCompletion() -> Subscribers.Completion<Failure>? {
    return capturedCompletion
  }

  /// - returns: The latest captured subscription, or `nil` if one has not been received yet.
  func getSubscription() -> Subscription? {
    return subscription
  }
}
