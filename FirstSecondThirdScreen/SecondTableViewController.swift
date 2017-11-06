//
//  secondTableViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 05.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import Foundation
import UIKit

class SecondTableViewController: UITableViewController {
    
    var SecondArray = [String]()
    var ThirdArray = [ThirdTable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        ThirdArray = [ThirdTable(ThirdTitle: ["Жить ради другого человека выматывает и оказывает огромное давление, причём на обе стороны.", "Когда человек может легко устоять перед великим искушением, он, несомненно, выделяется на общем фоне, а его разум силён.", "Если хочешь чего-то достичь, сперва за это нужно заплатить.Чтобы достичь своей нынешней силы, пришлось заплатить и Цинь Юю. Очень дорого заплатить."]),
                      ThirdTable(ThirdTitle: ["Ты будешь прославлен, но будешь убит,А можешь быть жив, но будешь забыт! Здесьслава и страх, здесь боль и почет И жив будет тот, кто в муках умрёт.", "Я продал лодку за гроши: В ней больше нет нужды. Куда идешь? Ты не спеши И в очереди жди. Я в скромном домике живу. Моим ты гостем будь. Тебя за грань я провожу, Лишь плату не забудь.", "Холодная ярость, горячий озноб. Последний гвоздь заколочен в твой гроб. Хоть мне далеко не уйти — все равно: Все чувства и страхи мертвы уж давно."]),
                      ThirdTable(ThirdTitle: ["Сейчас — мы враги, но когда-то были единым целым. Наши взгляды однажды разошлись, а пути — пересеклись. И я, ни за что не уступлю."]),
                      ThirdTable(ThirdTitle: ["Мы не просили эту комнату или эту музыку. Нас в нее пригласили. Следовательно, так как тьма окружает нас, нам нужно повернуться к свету. Давайте терпеть лишение, чтобы радоваться малому. Боль дана нам, чтобы изумляться радости. Жизнь дана нам, чтобы отрицать смерть. Мы не просили эту комнату и музыку. Но раз уж мы здесь... Давайте танцевать!", "Извинения — как одуванчики, они красивые и быстро распускаются, но долго служить не могут."])]
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SecondArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var Cell = self.tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as UITableViewCell
        
        Cell.textLabel?.text = SecondArray[indexPath.row]
        
        return Cell
    }


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var DestViewControllerThird = segue.destination as! ThirdTableViewController
        DestViewControllerThird.ThirdArray = ["hhhh"]
        
        var indexPath: NSIndexPath = self.tableView.indexPathForSelectedRow! as NSIndexPath
        var ThirdTableArray: ThirdTable
        ThirdTableArray = ThirdArray[indexPath.row]
        DestViewControllerThird.ThirdArray = ThirdTableArray.ThirdTitle
    }
    
}

