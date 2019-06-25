import UIKit

@objc protocol AbstractSectionDelegateProtocol: UITableViewDelegate, UITableViewDataSource {
    var sectionCount: Int {get}
}

class AbstractSectionDelegate: NSObject, AbstractSectionDelegateProtocol {

    var sectionCount: Int

    init(_ sectionCount: Int = 1) {
        self.sectionCount = sectionCount
        super.init()
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionCount
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        fatalError("should be implemented in subclasses")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("should be implemented in subclasses")
    }
}
