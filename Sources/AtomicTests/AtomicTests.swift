import XCTest
@testable import Atomic

class AtomicTests: XCTestCase {

    func testAtomicStartsInMainAndRunsOnMain() {
        let exp = expectation(description: #function)
        var isMainThread = false

        let queue = DispatchQueue.main
        queue.async {
            Atomic.syncMain {
                isMainThread = Thread.isMainThread
            }
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
        XCTAssertTrue(isMainThread)
    }

    func testAtomicStartsInMainAndRunsOnMainReturnsValue() {
        let exp = expectation(description: #function)
        var isMainThread = false
        var value = 0

        let queue = DispatchQueue.main
        queue.async {
            value = Atomic.syncMain(execute: { () -> Int in
                isMainThread = Thread.isMainThread
                return 99
            })
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)

        XCTAssertTrue(isMainThread)
        XCTAssertEqual(value, 99)
    }

    func testAtomicStartsInBackgroundAndRunsOnMain() {
        let exp = expectation(description: #function)
        var isMainThread = false

        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            Atomic.syncMain {
                isMainThread = Thread.isMainThread
            }
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)
        XCTAssertTrue(isMainThread)
    }

    func testAtomicStartsInBackgroundAndRunsOnMainReturnsValue() {
        let exp = expectation(description: #function)
        var isMainThread = false
        var value = 0

        let queue = DispatchQueue.global(qos: .utility)
        queue.async {
            value = Atomic.syncMain(execute: { () -> Int in
                isMainThread = Thread.isMainThread
                return 99
            })
            exp.fulfill()
        }

        wait(for: [exp], timeout: 1.0)

        XCTAssertTrue(isMainThread)
        XCTAssertEqual(value, 99)
    }

}
