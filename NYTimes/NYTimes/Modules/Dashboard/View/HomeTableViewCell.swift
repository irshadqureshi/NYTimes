//
//  HomeTableViewCell.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.white
        self.backgroundColor = UIColor .clear
        self.selectionStyle = .none
    }
    
    func bind(viewModel: HomeCellViewModel) {
        titleLabel.text = viewModel.titleString
    }
}

protocol HomeCellViewModel {
    var titleString: String {get set}
}
