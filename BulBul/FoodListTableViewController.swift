//
//  FoodListTableViewController.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/27.
//

import UIKit

class FoodListTableViewController: UITableViewController {

    @IBOutlet weak var conerImageView: UIImageView!
    var networkUrl : String?
    var coverImageName : String!
    var spinner: UIActivityIndicatorView!
    
    var food = [FoodField]()
        
    struct PropertyKey {
        static let foodCell = "foodCell"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        print(" \(self.networkUrl ?? "no url ")")
        if let myUrl = self.networkUrl {
            setupSpinner()
            fetchFoodData(with: myUrl)
        }
      
        conerImageView.image = UIImage(named: coverImageName)
        
      
    }
    func setupSpinner(){
        spinner = UIActivityIndicatorView(frame: CGRect(x: 0, y: 0, width: 40, height:40))
        spinner.color = UIColor.black
        self.spinner.center = CGPoint(x:UIScreen.main.bounds.size.width / 2, y:UIScreen.main.bounds.size.height / 2)
        self.view.addSubview(spinner)
        spinner.hidesWhenStopped = true
    }
    func fetchFoodData(with url : String)  {
       
        spinner.startAnimating()
        if let url = URL(string: url) {
            URLSession.shared.dataTask(with: url) { data, response , error in  let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let searchResponse = try decoder.decode(FoodBody.self,  from: data)
//                        print(searchResponse.records)
                        self.food = searchResponse.records
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            self.spinner.stopAnimating()
                        }
                    } catch {
                        print(error)
                    }
                } else {
                    // show error
                }
            }.resume()
            
        }

        
      
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return food.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKey.foodCell,for: indexPath) as? FoodTableViewCell else {
            return UITableViewCell()}
       
        cell.updateDatas(with: food[indexPath.section])
        
        return cell
    
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        8
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
