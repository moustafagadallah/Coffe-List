//
//  CoffeTableViewCell.swift
//  IOS  Task
//
//  Created by Moustafa Gadallah on 29/08/1445 AH.
//

import UIKit
import AlamofireImage

class CoffeTableViewCell: UITableViewCell {

    //MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var itemImageView: CustomImageView!
    
    //MARK: - View Life Cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    //MARK: - UpdateCell With Data
    
    func showCoffe(_ item: CoffeItem?) {
      
        itemImageView.makeCircular()
        if let imageUrlString = item?.image,
            let _ = URL(string: imageUrlString) {
            itemImageView.ImageViewLoading(mediaUrl: imageUrlString)

        }
        
        titleLabel.text = item?.title
        
        
    }
  

}
