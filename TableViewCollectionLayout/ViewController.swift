//
//  ViewController.swift
//  TableViewCollectionLayout
//
//  Created by Karlo Pagtakhan on 02/10/2018.
//  Copyright © 2018 kidap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //MARK:- Actions
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var slider: UISlider!
    @IBOutlet var sliderValueLabel: UILabel!
    
    //MARK:- Private constants
    private let spaceBetweenCells: CGFloat = 5
    
    //MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        updateTextLabel()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateCollectionView(layout: layout(numberOfColumns: Int(slider.value)))
    }
    
    //MARK:- IBActions
    @IBAction func onSliderValueChanged(_ sender: Any) {
        updateCollectionView(layout: layout(numberOfColumns: Int(slider.value)))
        updateTextLabel()
    }
    
}

//MARK:- Private methods
private extension ViewController {
    func updateCollectionView(layout: UICollectionViewFlowLayout) {
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    func updateTextLabel() {
        sliderValueLabel.text = "\(Int(slider.value))"
    }
    
    func layout(numberOfColumns: Int) -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        let numberOfColumns: CGFloat = CGFloat(numberOfColumns)
        
        let usableWidth = view.frame.width - view.safeAreaInsets.left - view.safeAreaInsets.right
        let widthPerItem = (usableWidth - (spaceBetweenCells * (numberOfColumns - 1 + 2))) / numberOfColumns
        
        layout.minimumLineSpacing = spaceBetweenCells
        layout.minimumInteritemSpacing = spaceBetweenCells
        layout.itemSize = CGSize(width: widthPerItem, height: layout.itemSize.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: spaceBetweenCells, bottom: 0, right: spaceBetweenCells)
        
        return layout
    }
}

//MARK:- UICollectionViewDelegate, UICollectionViewDataSource
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionViewCell.reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
        
        cell.shortText = "\(indexPath.row)"
        cell.mediumText = "S: \(indexPath.section), R: \(indexPath.row)"
        cell.longText = "Section: \(indexPath.section), Row: \(indexPath.row)"
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 25
    }
}
