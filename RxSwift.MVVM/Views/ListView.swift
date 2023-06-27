//
//  ListView.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 27.06.2023.
//

import UIKit

class ListView: UIView {
    
    var titleLabel: UILabel = {
       var lbl = UILabel()
        lbl.textColor = .black
        lbl.text = "Title"
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    var tableList: UITableView = {
        var table = UITableView()
        table.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        table.backgroundColor = .white
        table.separatorColor = .gray
        table.tableFooterView = UIView()
        table.refreshControl = UIRefreshControl()
        table.register(ListViewCell.self, forCellReuseIdentifier: ListViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        createSubviews()
    }

    func createSubviews() {
        backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        addSubview(tableList)
        NSLayoutConstraint.activate([
            tableList.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            tableList.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableList.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableList.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
