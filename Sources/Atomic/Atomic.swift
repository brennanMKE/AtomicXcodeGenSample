import Foundation
import AtomicCore
import AtomicUI

public enum Atomic {

    public static func syncMain(execute work: () -> Void) {
        if Thread.isMainThread {
            work()
        } else {
            DispatchQueue.main.sync(execute: work)
        }
    }

    public static func syncMain<T>(execute work: () throws -> T) rethrows -> T {
        let result: T
        if Thread.isMainThread {
            result = try work()
        } else {
            result = try DispatchQueue.main.sync(execute: work)
        }
        return result
    }

}
