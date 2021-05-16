//
//  ViewController.swift
//  CoreData_HomeWork
//
//  Created by Doğuş  Kaynak on 13.05.2021.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cookNames = [String]()
    var cookList: [NSManagedObject] = []
    var cookImages = [UIImage]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getCooks()
    }
    
    private func getCooks() {
        cookNames.removeAll()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Cook")
        
        do {
            let results = try context.fetch(fetchRequest)
            if results.count > 0 {
                cookList = results as! [NSManagedObject]
                for result in cookList {
                    guard let name = result.value(forKey: "name") as? String else { return }
                    cookNames.append(name)
                    if let imageData = result.value(forKey: "image") as? Data {
                        if let image = UIImage(data:imageData) {
                            self.cookImages.append(image)
                        }
                    }
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                //TODO:
            }
        } catch  {
            print("Error")
        }
    }
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cookNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cookCell", for: indexPath)
        cell.textLabel?.text = cookNames[indexPath.row]
        cell.imageView?.image = cookImages[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            presentDeletionFailsafe(indexPath: indexPath)

            context.delete(cookList[indexPath.row])
            do {
                try context.save()
                tableView.reloadData()
            } catch let error as NSError {
                print("Could not save. \(error), \(error.userInfo)")
            }
        }
    }
    
    func presentDeletionFailsafe(indexPath: IndexPath) {
        let alert = UIAlertController(title: "Uyarı", message: "Silmek istediğine emin misin?", preferredStyle: .alert)
        let yesAction = UIAlertAction(title: "Evet", style: .default) { _ in
            self.cookNames.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        
        alert.addAction(yesAction)
        alert.addAction(UIAlertAction(title: "Hayır", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
}
