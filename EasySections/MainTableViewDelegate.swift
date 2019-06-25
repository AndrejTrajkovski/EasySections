import UIKit
class MainTableViewDelegate: AbstractSectionDelegate {

    private var delegates: [AbstractSectionDelegateProtocol]
    private var zipped: [DelegateWithRange]

    init(_ delegates: [AbstractSectionDelegateProtocol]) {
        self.delegates = delegates
        zipped = Array(zip(delegates, delegates.makeCorrespondingRanges()))
        super.init(delegates.totalCount())
    }

    func didUpdateData() {
        zipped = Array(zip(delegates, delegates.makeCorrespondingRanges()))
        super.sectionCount = delegates.totalCount()
    }

    // MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let delegate = zipped.delegate(section)
        return delegate.tableView(tableView, numberOfRowsInSection: section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let delegate = zipped.delegate(indexPath)
        return delegate.tableView(tableView, cellForRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let delegate = zipped.delegate(indexPath)
        return delegate.tableView?(tableView, heightForRowAt: indexPath) ?? 44.0
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let delegate = zipped.delegate(section)
        return delegate.tableView?(tableView, viewForHeaderInSection: section)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let delegate = zipped.delegate(section)
        return delegate.tableView?(tableView, viewForFooterInSection: section)
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let delegate = zipped.delegate(section)
        return delegate.tableView?(tableView, heightForHeaderInSection: section) ?? 0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        let delegate = zipped.delegate(section)
        return delegate.tableView?(tableView, heightForFooterInSection: section) ?? 0
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let delegate = zipped.delegate(indexPath)
        delegate.tableView?(tableView, willDisplay: cell, forRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let delegate = zipped.delegate(section)
        return delegate.tableView?(tableView, titleForHeaderInSection: section)
    }

    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let delegate = zipped.delegate(section)
        return delegate.tableView?(tableView, titleForFooterInSection: section)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let delegate = zipped.delegate(indexPath)
        delegate.tableView?(tableView, didSelectRowAt: indexPath)
    }

    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let delegate = zipped.delegate(indexPath)
        delegate.tableView?(tableView, didDeselectRowAt: indexPath)
    }
}
