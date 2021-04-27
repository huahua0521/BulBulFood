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
        fruitName.text = fruit.fields.name
        rateLabel.text =  rankingTransfer(rank: fruit.fields.rating ?? 0)
        descriptionLabel.text = fruit.fields.description
        self.fruitImageView.image = nil
        self.fruitImageView.layer.cornerRadius = 10
        self.fruitImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.fruitImageView.layer.shadowOpacity = 0.7
        self.fruitImageView.layer.shadowRadius = 5
        self.fruitImageView.layer.shadowColor = UIColor(red: 44.0/255.0,
                                                        green: 62.0/255.0,
                                                        blue: 80.0/255.0,
                                                        alpha: 1.0).cgColor
        
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
