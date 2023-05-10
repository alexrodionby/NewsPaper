//
//  MainTableViewCell.swift
//  NewsPaper
//
//  Created by Alexandr Rodionov on 9.05.23.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableCell"
    
    private let mainView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
           super.init(style: style, reuseIdentifier: reuseIdentifier)
           
           // Настраиваем внешний вид ячейки
           contentView.backgroundColor = .clear
           backgroundColor = .clear
           selectionStyle = .none
           
           // Добавляем квадратное представление в ячейку
           contentView.addSubview(mainView)
           
           // Настраиваем constraints
        mainView.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).offset(10)
            $0.leading.equalTo(contentView.snp.leading).offset(10)
            $0.bottom.equalTo(contentView.snp.bottom).offset(-10)
            $0.trailing.equalTo(contentView.snp.trailing).offset(-10)
            $0.height.equalTo(100)
        }

       }
       
       required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
       
       func configureCell(color: UIColor) {
           mainView.backgroundColor = color
       }

}
