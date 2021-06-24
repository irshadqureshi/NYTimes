//
//  SearchArticlesLandingView.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit


class SearchArticlesLandingView: BaseViewController, SearchArticlesLandingPresenterToView {
    var presenter: SearchArticlesLandingViewToPresenter?
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    init() {
        super.init(nibName: String(describing: SearchArticlesLandingView.self), bundle: Bundle(for: SearchArticlesLandingView.self))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    private func setUpView() {
        self.title = "Search"
        self.mainView.backgroundColor = hexStringToUIColor(hex: "#e3dede")
        
        self.searchButton.layer.cornerRadius = 15.0
        self.searchButton.clipsToBounds = true
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

    // MARK: - Button action
    @IBAction func clickOnSearch(_ sender: Any) {
        showLoader(isShowing: true)
        guard let searchText = self.searchTextField.text, !searchText.isEmpty else {
            showAlertMessage(vc: self, titleStr: "Alert", messageStr: "I think you forgot to enter the text, Would you mind please! ;)", actionTitles: ["OK"], actions:[{ okAction in
                self.dismiss(animated: true, completion: nil)
                self.showLoader(isShowing: false)
            }])
            return
        }
        presenter?.searchTapped(searchText: searchText)
    }

}
