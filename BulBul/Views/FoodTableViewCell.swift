//
//  FoodTableViewCell.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/27.
//

import UIKit

class FoodTableViewCell: UITableViewCell {
   
    @IBOutlet weak var foodImageView: UIImageView!
    @IBOutlet weak var foodName: UILabel!
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
    func updateDatas(with food:FoodField)  {
        foodName.text = food.fields.name
        rateLabel.text =  rankingTransfer(rank: food.fields.rating ?? 0)
        descriptionLabel.text = food.fields.description
        self.foodImageView.image = nil
        self.foodImageView.layer.cornerRadius = 10
        self.foodImageView.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.foodImageView.layer.shadowOpacity = 0.7
        self.foodImageView.layer.shadowRadius = 5
        self.foodImageView.layer.shadowColor = UIColor(red: 44.0/255.0,
                                                        green: 62.0/255.0,
                                                        blue: 80.0/255.0,
                                                        alpha: 1.0).cgColor
        
        
        if let imageUrl = food.fields.image?[0].url {
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                
                if let data = data{
                    DispatchQueue.main.async {
                        self.foodImageView.image = UIImage(data: data)
                    }
                }
            }.resume()
        }
        /*寫法２
         fetchImage(url: (food.fields.image?[0].url)!) { (image) in
         if let image = image{
         DispatchQueue.main.async {
         self.foodImageView.image = image
         }
         }
         }
         */
        
        
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
    
    
    
    func fetchImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data,
                let image = UIImage(data: data) {
                completion(image)
            } else {
                completion(nil)
            }
        }
        task.resume()
    }
}
