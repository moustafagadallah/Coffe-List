//
//  ItemDetailsVC.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import UIKit


class ItemDetailsVC: UIViewController {

    // MARK: - Outlets

    @IBOutlet weak var itemImageView: CustomImageView!
    @IBOutlet weak var ingriendentsLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: - Variabels

    
    lazy var viewModel = ItemDetailsViewModel()
    
    
    // MARK: - View Life Cycle

    override func viewDidLoad() {
        
        super.viewDidLoad()
        bindData()
        
    }
    
    // MARK: - DataSet
    
    func setItemDetails(_ item: CoffeItem?) {
        viewModel.item = item
    }
    
    // MARK: - Helper Methods
    
    func bindData() {
        
        let concatenatedString = viewModel.item?.ingredients?.joined(separator: "\n")
        ingriendentsLabel.text = concatenatedString
        descLabel.text = viewModel.item?.description?.description
        titleLabel.text = viewModel.item?.title
        if let imageUrlString = viewModel.item?.image,
            let _ = URL(string: imageUrlString) {
            itemImageView.ImageViewLoading(mediaUrl: imageUrlString)

        }
       
        
    }
    
    
    // MARK: - Initialization
    
    class func initializeFromStoryboard() -> ItemDetailsVC {
        
        let storyboard = UIStoryboard(name: StoryBoards.ItemDetails, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: ItemDetailsVC.self)) as! ItemDetailsVC
    }

    
}
