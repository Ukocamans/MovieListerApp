//
//  ListItemCell.swift
//  MovieListerApp
//
//  Created by Umurcan Kocaman on 14.06.2020.
//  Copyright © 2020 ukocaman. All rights reserved.
//

import UIKit

class ListItemCell: UITableViewCell {

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelYear: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(viewModel: ListItemCellViewModel) {
        labelTitle.text = viewModel.title
        labelType.text = viewModel.type
        labelYear.text = viewModel.year
    }
    
}
