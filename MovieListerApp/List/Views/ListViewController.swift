//
//  ListViewController.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import UIKit

class ListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let viewModel = ListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        installRefreshControl()
        setupRx()
        setupTableView()
        viewModel.searchRequest()
    }
    
    func setupTableView() {
        tableView.registerNib(name: "ListItemCell")
    }
    
    func setupRx() {
        viewModel.reloadData.subscribe(onNext: { [weak self] _ in
            self?.tableView.reloadData()
        }).disposed(by: viewModel.disposeBag)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let imdbId = sender as? String, let controller = segue.destination as? DetailViewController {
            controller.viewModel.imdbId = imdbId
        }
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.datasource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListItemCell", for: indexPath) as! ListItemCell
        cell.configure(viewModel: viewModel.datasource[indexPath.row])
        return cell
    }
}

extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let imdbId = viewModel.datasource[indexPath.row].id
        performSegue(withIdentifier: "toDetail", sender: imdbId)
    }
}

extension ListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let scrollViewHeight = scrollView.frame.size.height
        let scrollContentSizeHeight = scrollView.contentSize.height
        let scrollOffset = scrollView.contentOffset.y
        if !viewModel.isBusy , scrollContentSizeHeight > 0 {
            if scrollOffset + scrollViewHeight >= scrollContentSizeHeight {
                viewModel.searchRequest()
            }
        }
    }
}

extension ListViewController: Refreshable {
    var refreshControl: UIRefreshControl? {
        get {
            tableView.refreshControl
        }
        set {
        }
    }
    
    var refreshableView: UIScrollView! {
        return tableView
    }
    
    func handleRefresh(_ sender: Any) {
        refreshControl?.beginRefreshing()
        viewModel.searchRequest(reset: true) { [weak self] () in
            self?.refreshControl?.endRefreshing()
        }
    }
}
