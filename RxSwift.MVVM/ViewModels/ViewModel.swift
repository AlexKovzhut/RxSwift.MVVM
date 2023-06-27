//
//  ViewModel.swift
//  RxSwift.MVVM
//
//  Created by Alexander Kovzhut on 26.06.2023.
//

import UIKit
import RxSwift

class ViewModel {
    
    var dataSouce: BehaviorRelay<ListModels> = BehaviorRelay<ListModels>(value: ListModels())
    var disposable: DisposeBag = DisposeBag()
    
    func getList() {
        NetworkClient.getList().asObservable().subscribe(
            onNext: { result in
                self.mapResponse(result: result)
            print(result)
        }, onError: { error in
            print(error)
        }).disposed(by: disposable)
    }
    
    func mapResponse(result: APICitiesResponse) {
        
        var list: ListModels = []
        
        for items in result {
            list.append(ListModelElement(codable: items))
        }
        
        self.dataSouce.accept(list)
    }
}
