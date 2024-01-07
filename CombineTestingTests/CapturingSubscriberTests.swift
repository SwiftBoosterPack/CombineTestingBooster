//
//  CapturingSubscriberTests.swift
//
//
//  Created by Michael Welsh on 2024-01-06.
//

import Combine
import CombineTesting
import Foundation
import XCTest

class CapturingSubscriberTests: XCTestCase {

  func test_capturesValuesFromSubscription() {
    // Arrange
    let subject = CapturingSubscriber<Int, Never>()
    let emptySubscription = EmptySubscription()

    // Act
    XCTAssertEqual(subject.receive(1), .unlimited)
    XCTAssertEqual(subject.receive(2), .unlimited)
    XCTAssertEqual(subject.getCapturedValues(), [1, 2])
    XCTAssertNil(subject.getCapturedCompletion())
    XCTAssertNil(subject.getSubscription())
    subject.receive(completion: .finished)
    subject.receive(subscription: emptySubscription)

    // Assert
    XCTAssertEqual(subject.getCapturedCompletion(), .finished)
    XCTAssertNotNil(subject.getSubscription())
  }
}
