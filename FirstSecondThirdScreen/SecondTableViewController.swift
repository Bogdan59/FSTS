//
//  secondTableViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 05.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import Foundation
import Parse

class SecondTableViewController: UITableViewController {


    @IBOutlet var categoryTable: UITableView!
    var selected12Category: PFObject?
    var category12Items = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        loadCategorySub(selectedCategory: selected12Category)
        //        loadCategorySongs(selectedCategory: selectedCategory)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        
        return category12Items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookCell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath)
        
        let bookItem = category12Items[indexPath.row]
        let categoryUserTitle = bookItem.object(forKey: "Text") as? String
        //
        //        let songItem = categoryItems[indexPath.row]
        //        _ = songItem.object(forKey: "SongsText") as? String
        
        bookCell.textLabel?.text = categoryUserTitle
        
        return bookCell
    }
    
    
    
    
    func loadCategorySub(selectedCategory: PFObject!) {
        
        let bookQuery = PFQuery(className: "TotalTest")
        bookQuery.whereKey("Subcategory", equalTo: selectedCategory)
        bookQuery.includeKey("Subcategory")
        
        bookQuery.findObjectsInBackground { (result: [PFObject]?, error) in
            if let searchResults = result {
                //                print("Found Category: \(searchResults.count)")
                
                self.category12Items = searchResults
                self.categoryTable.reloadData()
            }
        }
        //
        //
        
        
}
}


//    var SecondArray = [String]()
//    var ThirdArray = [ThirdTable]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        ThirdArray = [ThirdTable(ThirdTitle: ["Жить ради другого человека выматывает и оказывает огромное давление, причём на обе стороны.", "Когда человек может легко устоять перед великим искушением, он, несомненно, выделяется на общем фоне, а его разум силён.", "Если хочешь чего-то достичь, сперва за это нужно заплатить.Чтобы достичь своей нынешней силы, пришлось заплатить и Цинь Юю. Очень дорого заплатить."]),
//                      ThirdTable(ThirdTitle: ["Ты будешь прославлен, но будешь убит,А можешь быть жив, но будешь забыт! Здесьслава и страх, здесь боль и почет И жив будет тот, кто в муках умрёт.", "Я продал лодку за гроши: В ней больше нет нужды. Куда идешь? Ты не спеши И в очереди жди. Я в скромном домике живу. Моим ты гостем будь. Тебя за грань я провожу, Лишь плату не забудь.", "Холодная ярость, горячий озноб. Последний гвоздь заколочен в твой гроб. Хоть мне далеко не уйти — все равно: Все чувства и страхи мертвы уж давно."]),
//                      ThirdTable(ThirdTitle: ["Сейчас — мы враги, но когда-то были единым целым. Наши взгляды однажды разошлись, а пути — пересеклись. И я, ни за что не уступлю."]),
//                      ThirdTable(ThirdTitle: ["Мы не просили эту комнату или эту музыку. Нас в нее пригласили. Следовательно, так как тьма окружает нас, нам нужно повернуться к свету. Давайте терпеть лишение, чтобы радоваться малому. Боль дана нам, чтобы изумляться радости. Жизнь дана нам, чтобы отрицать смерть. Мы не просили эту комнату и музыку. Но раз уж мы здесь... Давайте танцевать!", "Извинения — как одуванчики, они красивые и быстро распускаются, но долго служить не могут."])]
//
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return SecondArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        var Cell = self.tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as UITableViewCell
//
//        Cell.textLabel?.text = SecondArray[indexPath.row]
//
//        return Cell
//    }
//
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        var DestViewControllerThird = segue.destination as! ThirdTableViewController
//        DestViewControllerThird.ThirdArray = ["hhhh"]
//
//        var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
//        var ThirdTableArray: ThirdTable
//        ThirdTableArray = ThirdArray[indexPath.row]
//        DestViewControllerThird.ThirdArray = ThirdTableArray.ThirdTitle
//    }
//
//}
//
