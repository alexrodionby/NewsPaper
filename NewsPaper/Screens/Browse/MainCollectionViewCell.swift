//
//  MainCollectionViewCell.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 9.05.23.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCell"
    
    private let mainCellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.backgroundColor = .systemMint
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        contentView.addSubview(mainCellView)
 
        
        mainCellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            
        }
        
    }

    func configureCell(title: String) {
    
    }
    
}
