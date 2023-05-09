//
//  CategoryCollectionViewCell.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 8.05.23.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    private let categoryCellView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let categoryTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        //label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override var isSelected: Bool {
        didSet {
            updateSelectionAppearance()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    
    private func setupUI() {
        contentView.addSubview(categoryCellView)
        categoryCellView.addSubview(categoryTitleLabel)
        
        categoryCellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        categoryTitleLabel.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(10)
        }
        
        updateSelectionAppearance()
    }


    
    
    //    private func setupUI() {
    //        contentView.addSubview(categoryCellView)
    //        categoryCellView.addSubview(categoryTitleLabel)
    //
    //        categoryCellView.snp.makeConstraints {
    ////            $0.top.equalTo(contentView.snp.top)
    ////            $0.leading.equalTo(contentView.snp.leading)
    ////            $0.trailing.equalTo(contentView.snp.trailing)
    ////            $0.bottom.equalTo(contentView.snp.bottom)
    //            $0.edges.equalToSuperview()
    //        }
    //
    //        categoryTitleLabel.snp.makeConstraints {
    //            $0.center.equalTo(categoryCellView.snp.center)
    //        }
    //
    ////        NSLayoutConstraint.activate([
    ////            categoryCellView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
    ////            categoryCellView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
    ////            categoryCellView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
    ////            categoryCellView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
    ////
    ////            categoryTitleLabel.centerXAnchor.constraint(equalTo: categoryCellView.centerXAnchor),
    ////            categoryTitleLabel.centerYAnchor.constraint(equalTo: categoryCellView.centerYAnchor)
    ////        ])
    //
    //        updateSelectionAppearance()
    //    }
    
    private func updateSelectionAppearance() {
        categoryCellView.backgroundColor = isSelected ? .blue : .gray
        categoryTitleLabel.textColor = isSelected ? .white : .black
    }
    
    func configureCell(title: String) {
        categoryTitleLabel.text = title
    }
    
}
