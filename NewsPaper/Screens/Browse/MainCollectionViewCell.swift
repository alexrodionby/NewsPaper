//
//  MainCollectionViewCell.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 9.05.23.
//

import UIKit
import Kingfisher

class MainCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MainCell"
    
    private var mainCellView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.backgroundColor = .black
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    private let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "bookmark"), for: .normal)
        button.tintColor = .red
        button.addTarget(nil, action: #selector(likeTapped), for: .touchUpInside)
        return button
    }()
    
    @objc func likeTapped() {
        print("Нажали likeTapped")
        // тут логика добавления в избранное + смена внешнего вида кнопки (заливка)
    }
    
    private var mainCellTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Discover things of this world"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
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
        mainCellView.addSubview(likeButton)
        mainCellView.addSubview(mainCellTitleLabel)
        
        mainCellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.equalTo(mainCellView.snp.trailing).inset(20)
            $0.top.equalTo(mainCellView.snp.top).inset(20)
            $0.width.height.equalTo(30)
        }
        
        mainCellTitleLabel.snp.makeConstraints {
            $0.leading.equalTo(mainCellView.snp.leading).inset(10)
            $0.trailing.equalTo(mainCellView.snp.trailing).inset(10)
            $0.bottom.equalTo(mainCellView.snp.bottom)
            $0.height.equalTo(70)
        }
        
    }

    func configureCell(article: Article) {
        mainCellTitleLabel.text = article.title
        let url = URL(string: article.urlToImage ?? "")
        mainCellView.kf.setImage(with: url)
    }
    
}
