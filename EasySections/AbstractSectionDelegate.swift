import UIKit

@objc public protocol AbstractSectionDelegateProtocol: UITableViewDelegate, UITableViewDataSource {
    var sectionCount: Int {get}
}

open class AbstractSectionDelegate: NSObject, AbstractSectionDelegateProtocol {
    
    public internal(set) var sectionCount: Int
    
    public init(_ sectionCount: Int = 1) {
        self.sectionCount = sectionCount
        super.init()
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("should be implemented in subclasses")
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("should be implemented in subclasses")
    }
}
