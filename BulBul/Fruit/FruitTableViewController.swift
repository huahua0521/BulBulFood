//
//  FruitTableViewController.swift
//  BulBul
//
//  Created by BRAVO iDEAS on 2021/4/23.
//

import UIKit
import Network

class FruitTableViewController: UITableViewController {

    struct PropertyKey {
        static let fruitCell = "fruitCell"
    }
    var fruits = [FruitField]()
 
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchFruitTable()
    }
    
    func fetchFruitTable()  {
        
        let urlStr = "https://api.airtable.com/v0/appEyb6PJIhBrKOQz/Fruit?api_key=keygHTQcnAknXc3jJ&sort[][field]=rating&sort[][direction]=desc"
        if let url = URL(string: urlStr) {
            URLSession.shared.dataTask(with: url) { data, response , error in  let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data {
                    do {
                        let searchResponse = try decoder.decode(FruitBody.self,  from: data)
                        print(searchResponse.records)
                        self.fruits = searchResponse.records
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                            
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
        return fruits.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PropertyKey.fruitCell,for: indexPath) as? FruitTableViewCell else {
            return UITableViewCell()}
       
        cell.updateDatas(with: fruits[indexPath.section])
        
        return cell
    
    }

    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        8
    }



    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
