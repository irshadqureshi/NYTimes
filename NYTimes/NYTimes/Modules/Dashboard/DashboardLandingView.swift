//
//  DashboardLandingView.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit


class DashboardLandingView: BaseViewController, DashboardLandingPresenterToView {
    var presenter: DashboardLandingViewToPresenter?
    @IBOutlet weak var tableView: UITableView!
    
    init() {
        super.init(nibName: String(describing: DashboardLandingView.self), bundle: Bundle(for: DashboardLandingView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    private func setUpViews() {
        self.title = "NYT"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: Constants.Identifiers.sectionTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Identifiers.sectionTableViewCell)
        tableView.register(UINib(nibName: Constants.Identifiers.homeTableViewCell, bundle: nil), forCellReuseIdentifier: Constants.Identifiers.homeTableViewCell)
        tableView.backgroundColor = hexStringToUIColor(hex: "#f7f7f7")
        tableView.reloadData()
    }
}

extension DashboardLandingView: UITableViewDelegate, UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        presenter?.numberOfSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter?.numberOfRows(in: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let tableSection = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.sectionTableViewCell) as? SectionTableViewCell, let viewModel = presenter?.viewForHeader(in: section) else { return UITableViewCell() }
        tableSection.bind(viewModel: viewModel)
        return tableSection.contentView
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let tableCell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.homeTableViewCell) as? HomeTableViewCell, let viewModel = presenter?.model(for: indexPath) else { return UITableViewCell() }
        tableCell.bind(viewModel: viewModel)
        return tableCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.selectedModel(for: indexPath)
    }
}
