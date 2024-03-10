//
//  CoffeListViewModel.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import UIKit

class CoffeListViewModel {
    
    var navigateToViewController: ((_ vc: UIViewController) -> ())?
    var reloadTableView: (() -> Void)?
    var removeRefreshController: (() -> ())?

    
    var coffeItems = [CoffeItem?]() {
        didSet {
            self.reloadTableView?()
        }
    }
    
    lazy var service = CoffeListService()
    
    func getCoffeList() {
        
        service.getCoffeList {  [weak self] response in
            switch response {
            case .success(let model):
                self?.coffeItems = []
                self?.coffeItems += model ?? []
                self?.reloadTableView?()
                self?.removeRefreshController?()
            case .failure(let error):
                print(error)
                break
            }
        }
        
        
    }
    
    
    
    //MARK: - Helper Methods
    
    func numberOfItems() -> Int? {
        
        return coffeItems.count
    }
    
    func coffee(atIndex index: Int) -> CoffeItem? {
        
        return coffeItems[index]
        
    }
    
    func didSelectItem(atIndex index: Int) {
        
        let selectedItem = coffee(atIndex: index)
        let itemDetailsVC = ItemDetailsVC.initializeFromStoryboard()
        itemDetailsVC.setItemDetails(selectedItem)
        navigateToViewController?(itemDetailsVC)
    }
    
    
}


