//
//  PETIconSelectorViewController.swift
//  PersonalExpenseTracker
//
//  Created by Senthuran on 12/20/20.
//

import UIKit
import FontAwesome_swift

protocol IconSelectorDelegate: AnyObject {
    func iconSelected(icon: FontAwesome?)
}

class PETIconSelectorController: UIViewController {
    @IBOutlet weak var iconCollectionView: UICollectionView!
    weak var delegate: IconSelectorDelegate?

    let fontStyle = PETIconConfig.style
    let fontColor = PETIconConfig.color
    lazy var fontList = FontAwesome.fontList(style: self.fontStyle)

    let selectedColor = UIColor.green.withAlphaComponent(0.1)
    let deselectedColor = UIColor.white

    var selectedFont: FontAwesome?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.iconCollectionView.delegate = self
        self.iconCollectionView.dataSource = self
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        self.delegate?.iconSelected(icon: selectedFont)
    }
}

extension PETIconSelectorController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFont = self.fontList[indexPath.row]
        dismiss(animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = selectedColor
        }
    }

    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) {
            cell.contentView.backgroundColor = deselectedColor
        }
    }

}

extension PETIconSelectorController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fontList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.iconCollectionView.dequeueReusableCell(withReuseIdentifier: "gallery", for: indexPath) as! PETIconCollectionCell

        let fontItem = self.fontList[indexPath.row]

        cell.iconView.image = UIImage.fontAwesomeIcon(
            name: fontItem,
            style: fontStyle,
            textColor: fontColor,
            size: CGSize(width: 35, height: 35)
        )

        let isSelected = fontItem == selectedFont
        cell.contentView.backgroundColor = isSelected ? selectedColor : deselectedColor

        return cell
    }

}

