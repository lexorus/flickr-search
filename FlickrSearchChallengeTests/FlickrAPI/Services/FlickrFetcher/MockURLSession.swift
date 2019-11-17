import Foundation
@testable import FlickrSearchChallenge

final class MockURLSession: URLSessionType {
    var performStub = MockCancellable()
    var performFuncCheck = FunckCheck<(URLRequest, (Data?, URLResponse?, Error?) -> Void)>()
    func perform(_ request: URLRequest, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> Cancellable {
        performFuncCheck.call((request, completionHandler))
        return performStub
    }
}
