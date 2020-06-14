import UIKit

@objc protocol Refreshable {
    var refreshControl: UIRefreshControl? { get set }
    var refreshableView: UIScrollView! { get }
    @objc func handleRefresh(_ sender: Any)
}

extension Refreshable where Self: UIViewController {

    func installRefreshControl() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        refreshControl.addTarget(self, action: #selector(handleRefresh(_:)), for: .valueChanged)

        self.refreshControl = refreshControl
        refreshableView.refreshControl = refreshControl
    }
}
