//
//  PETCategoryTableViewCell.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import UIKit

struct PETCategoryTableCellModel {
    let title: String?
    let icon: UIImage?
}

class PETCategoryTableCell: UITableViewCell {
    @IBOutlet private var iconView: UIImageView?
    @IBOutlet private var titleLabel: UILabel?

    func setup(model: PETCategoryTableCellModel) {
        self.titleLabel?.text = model.title
        self.iconView?.image = model.icon
    }
}

