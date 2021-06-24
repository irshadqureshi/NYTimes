//
//  ArticlesListView.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit


class ArticlesListView: BaseViewController, ArticlesListPresenterToView {
    var presenter: ArticlesListViewToPresenter?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    init() {
        super.init(nibName: String(describing: ArticlesListView.self), bundle: Bundle(for: ArticlesListView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidload()
        setUpViews()
    }
    
    private func setUpViews() {
        self.title = presenter?.getTitle()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.Identifiers.listTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Identifiers.listTableViewCell)
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 80
        tableView.backgroundColor = hexStringToUIColor(hex: "#f7f7f7")
    }
    
    func reloadView() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
    
    func showLoader(isShowing: Bool) {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.isHidden = !isShowing
            isShowing ? self?.activityIndicator.startAnimating() : self?.activityIndicator.stopAnimating()
        }
    }
    
    func showAlert(titleStr: String?, messageStr: String?) {
        showAlertMessage(vc: self, titleStr: titleStr ?? "", messageStr: messageStr ?? "")
    }
}

extension ArticlesListView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.listTableViewCell) as? ListTableViewCell, let viewModel = presenter?.model(for: indexPath) else { return UITableViewCell() }
        
        tableCell.bind(viewModel: viewModel)
        
        return tableCell
    }
}
