//
//  MealTableViewController.swift
//  MyMealTracker
//
//  Created by Journey Tendency on 07/05/2020.
//  Copyright © 2020 Daniela da Cruz. All rights reserved.
//

import UIKit

class MealTableViewController: UITableViewController {
    // MARK: properties
    var meals = [Meal]()
    
    // MARK: private functions
    private func loadSampleMeals()
    {
        let photo1 = UIImage(named: "francesinha")
        let photo2 = UIImage(named: "hamburger")
        let meal1 = Meal(name: "Francesinha", photo: photo1, rating: 4)
        let meal2 = Meal(name: "Hamburguer", photo: photo2, rating: 5)
        
        /*guard let meal3 = Meal(name: "", photo: nil, rating: -1) else {
            fatalError("failed to create meal")
        }*/
        
        meals.append(meal1!)
        meals.append(meal2!)
        //meals.append(meal3)
    }
    // guarda refeiçoes no ficheiro definido
    private func saveMeals(){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: meals, requiringSecureCoding: false)
            try data.write(to: Meal.FileURL)
            print("Filed saved")
        }
        catch{
            print("Something wrong")
        }
    }
    
    private func loadMeals()-> [Meal]?{
        do{
            let contents = try Data(contentsOf: Meal.FileURL)
            if let meals = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(contents) as? [Meal]{
                return meals
            }
        }
        catch{
          print("Exception while reading file")
        }
        
        return nil
    }
    
    // MARK: methods
    @IBAction func unwindToMeal(sender: UIStoryboardSegue)
    {
        if let originViewController = sender.source as? ViewController,
            let meal = originViewController.meal
        {
            let newIndex = IndexPath(row: meals.count,section: 0)
            meals.append(meal)
            tableView.insertRows(at: [newIndex], with: .automatic)
            
            saveMeals()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedMeals = loadMeals(){
            meals += savedMeals
        }
        else{
            loadSampleMeals()
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MealTableViewCell", for: indexPath) as? MealTableViewCell
            else {
            fatalError("failed")
        }

        // Configure the cell...
        let meal = meals[indexPath.row]
        cell.nameLabel.text = meal.name
        cell.photoImageView.image = meal.photo
        cell.ratingControl.rating = meal.rating
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch (segue.identifier ?? ""){
        case "Additem":
            print("Adding a new meal")
        case "ShowDetail":
            print("Showing detail of meal")
            guard let mealController = segue.destination as? ViewController else{
                fatalError("Unexpected Destination")
            }
            
            guard let selectedMeal = sender as? MealTableViewCell else{
                fatalError("unexpected Sender")
            }
            guard let index = tableView.indexPath(for: selectedMeal) else{
                fatalError("Cell Not Existing")
            }
            
            let myMeal = meals[index.row]
            mealController.meal = myMeal
            
        default:
            fatalError("unexpected error!")
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

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
