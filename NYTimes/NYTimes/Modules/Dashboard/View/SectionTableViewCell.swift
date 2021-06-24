//
//  SectionTableViewCell.swift
//  NYTimes
//
//  Created by Irshad Qureshi on 22/06/2021.
//

import UIKit

class SectionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.contentView.backgroundColor = UIColor.clear
    }
    
    func bind(viewModel: HomeSectionCellViewModel) {
        titleLabel.text = viewModel.titleString
    }
}

protocol HomeSectionCellViewModel {
    var titleString: String {get set}
}
