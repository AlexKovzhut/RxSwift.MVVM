//
//  ViewController.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 27.06.2023.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    
    var expandedIndexPath: NSIndexPath?
    
    var coordinator: PrincipalCoordinator?
    var presentationView = ListView()
    var viewModel = ViewModel()
    var disposable = DisposeBag()
    
    override func loadView() {
        view = presentationView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.viewModel.getList()
        self.bindView()
    }

    func bindView() {
        viewModel.dataSouce
            .bind(
                to: presentationView
                    .tableList
                    .rx
                    .items(
                        cellIdentifier: ListViewCell.identifier,
                        cellType: ListViewCell.self
                    )
            ) { _, data, cell in
                cell.selectionStyle = .none
                
                cell.configCell(data)
            }.disposed(by: disposable)
        
        self.presentationView.tableList.rx.itemSelected
          .subscribe(onNext: { [weak self] indexPath in
              let cell = self?.presentationView.tableList.cellForRow(at: indexPath) as? ListViewCell
              self?.presentationView.tableList.beginUpdates()
              cell?.userClickEffect()
              self?.presentationView.tableList.endUpdates()
          }).disposed(by: disposable)
    }
}
