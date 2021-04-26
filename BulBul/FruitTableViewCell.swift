//
//  FruitTableViewCell.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/23.
//

import UIKit

class FruitTableViewCell: UITableViewCell {

    @IBOutlet weak var fruitImageView: UIImageView!
    @IBOutlet weak var fruitName: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func updateDatas(with fruit:FruitField)  {
        fruitName.text = fruit.fields.fruitName
        rateLabel.text =  rankingTransfer(rank: fruit.fields.rating ?? 0)
        descriptionLabel.text = fruit.fields.desc
        self.fruitImageView.image = nil
        self.fruitImageView.layer.cornerRadius = 10
        if let imageUrl = fruit.fields.image?[0].url {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                
                if let data = data{
                    DispatchQueue.main.async {
                        self.fruitImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        
    }
    
    
    func rankingTransfer(rank:Int) -> String {
        switch rank {
        
        case 1:
            return "★"
        case 2:
            return "★★"
        case 3:
            return "★★★"
        case 4:
            return "★★★★"
        case 5:
            return "★★★★★"
        default:
            return "⭐︎"
        }
        
        
        
    }
}
