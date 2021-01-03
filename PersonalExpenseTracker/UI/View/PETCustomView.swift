//
//  SWCustomView.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import UIKit

@IBDesignable class PETCustomView: UIView {
    @IBOutlet weak var view: UIView!

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.nibSetup()
        self.initUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        self.nibSetup()
        self.initUI()
    }

    private func nibSetup() {
        self.backgroundColor = .clear

        self.view = loadViewFromNib()
        self.view.frame = bounds
        self.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.translatesAutoresizingMaskIntoConstraints = true

        self.addSubview(view)
    }

    private func loadViewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as! UIView

        return nibView
    }

    func initUI() {

    }
}

