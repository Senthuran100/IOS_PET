//
//  SWRecordHeaderView.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import UIKit

struct PETRecordHeaderViewModel {
    let title: String?
    let spending: String?
}

class SWRecordHeaderView: PETCustomView {
    @IBOutlet private var titleLabel: UILabel?
    @IBOutlet private var spendingLabel: UILabel?

    override func initUI() {
        self.titleLabel?.font = self.titleLabel?.font.withSize(17)
        self.spendingLabel?.font = self.spendingLabel?.font.withSize(15)
        self.spendingLabel?.textColor = .systemPink
    }

    func setup(with viewModel: PETRecordHeaderViewModel) {
        self.titleLabel?.text = viewModel.title
        self.spendingLabel?.text = viewModel.spending
    }
}

