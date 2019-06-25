import Foundation
typealias DelegateWithRange = (AbstractSectionDelegateProtocol, CountableRange<Int>)

extension Array where Element == DelegateWithRange {

    func delegate(_ indexPath: IndexPath) -> AbstractSectionDelegateProtocol {
        return delegate(indexPath.section)
    }

    func delegate(_ section: Int) -> AbstractSectionDelegateProtocol {
        return self.first(where: {$0.1.contains(section)})!.0
    }
}

extension Array where Element == AbstractSectionDelegateProtocol {

    func totalCount() -> Int {
        return reduce(0) {$0 + $1.sectionCount}
    }

    func makeCorrespondingRanges() -> [CountableRange<Int>] {
        var ranges = [CountableRange<Int>]()
        var lowerBound = 0
        for delegate in self {
            let range = lowerBound..<(lowerBound + delegate.sectionCount)
            ranges.append(range)
            lowerBound = range.upperBound
        }
        return ranges
    }
}
