# CombineTestingBooster
Provides classes for testing Combine content

## EmptySubscription
`EmptySubscription` is as simple as that. Doesn't do anything, but can be used as a concrete subscription type.

## CapturingSubscriber
`CapturingSubscriber<Input, Failure: Error>` captures the values it receives to allow testing what a subscriber receives from a publisher.
