//
//  ListTableViewCell.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 23/06/2021.
//

import UIKit

class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(viewModel: ArticleListCellViewModel) {
        dateLabel.text = viewModel.dateString
        titleLabel.text = viewModel.titleString
    }
}

protocol ArticleListCellViewModel {
    var titleString: String {get set}
    var dateString: String {get set}
}

