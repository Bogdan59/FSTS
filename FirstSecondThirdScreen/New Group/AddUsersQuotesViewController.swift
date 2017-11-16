//
//  AddUsersQuotesViewController.swift
//  FirstSecondThirdScreen
//
//  Created by Bogdan Dubiahin on 13.11.2017.
//  Copyright © 2017 Bogdan Dubiahin. All rights reserved.
//

import UIKit
import Parse

class AddUsersQuotesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var categoryUserQuote: UITextField!
    @IBOutlet weak var textQuoteField: UITextField!
    @IBOutlet weak var authorQuoteField: UITextField!
    @IBOutlet weak var dropdownCategoryUserQuote: UIPickerView!
    
    @IBAction func AddQuote() {
        let object = PFObject(className: "AddsUserQuote")
        object["text"] = textQuoteField.text!
        object["authorName"] = authorQuoteField.text!
        object["categoryQuote"] = categoryUserQuote.text!
        object.saveEventually { (success, error) in
            if success {
                self.textQuoteField.text = nil
                self.authorQuoteField.text = nil
                self.categoryUserQuote.text = nil
            }
        }
    }
    var userQuoteCategoryPicker = ["Артхаус", "Афоризм", "Бедность", "Бессмертие", "Бизнес", "Боль", "Брак", "Буддизм", "Вдохновение", "Вера", "Весна", "Взгляд на мир", "Возраст", "Война", "Время", "Вселенная", "Выбор", "Гармония", "Глупость", "Гнев", "Государство", "Гроза", "Деньги", "Дети", "Достижение цели", "Другая", "Дружба", "Душа", "Еда", "Женщины", "Животные", "Жизнь", "Зависть", "Звезды", "Здоровье", "Земля, планета", "Зима", "Знания", "Игра", "Идея", "Из книги", "Из мультфильма", "Из песен", "Из сериала", "Из фильма", "Интеллект", "Интернет", "Искусство", "Истина", "История", "Книга, литература", "Комфорт", "Красота", "Культура", "Лето", "Ложь", "Луна", "Любовь", "Люди", "Месть", "Мечты", "Милосердие", "Мир", "Мода", "Мораль", "Море", "Мотивация", "Мудрость", "Мужчины", "Музыка", "Мысли", "Надежда", "Наука", "Небо", "Новый год", "Обида", "Образование", "Общение", "Одежда", "Одиночество", "Опыт", "Осень", "Отдых", "Открытия", "Планеты", "Победа", "Погода", "Подарки", "Политика", "Пороки", "Пословица", "Правда", "Праздники", "Природа", "Программирование", "Путешествия", "Работа, труд", "Разлука", "Разум", "Ревность", "Религия", "Решение проблем", "Родина", "Родители", "Рыбалка", "Сарказм", "Свадьба", "Свет", "Свобода", "Семья", "Сила", "Слова", "Смелость", "Смех", "СМИ", "Смысл", "Спорт", "Срах", "Стремление", "Судьба", "Счастье", "Телевидение", "Терпение", "Техника", "Труд", "Удача", "Улыбка", "Успех", "Философия", "Цветы", "Цитаты", "Человек", "Чувства", "Юмор"]
    
    
    //    @IBOutlet weak var textField: UITextField!
    //    @IBOutlet weak var usernameField: UITextField!
    //    @IBAction func saveRecord() {
    //        let object = PFObject(className: "UsersQuotes")
    //        object["textQuote"] = textField.text!
    //        object["username"] = self.usernameField.text!
    //        object.saveEventually {
    //            (success, error) in
    //            if success {
    //                self.textField.text = nil
    //                self.usernameField.text = nil
    //            }
    //
    //        }
    //
    //    }
    
    //    override func viewDidLoad() {
    //        super.viewDidLoad()
    //        // initialize constant with 0
    //
    //        sideMenuConstraint.constant = -140
    //    }
    
    
    //    let object = PFObject(className: "Quote")
    //    object["text"] = textField.text!
    //    object["authorName"] = "Dima"
    //    object.saveEventually { (success, error) in
    //    if success {
    //    self.textField.text = nil
    //    }
    //    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        var countrows: Int = userQuoteCategoryPicker.count
        return countrows
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == dropdownCategoryUserQuote {
            var titleRow = userQuoteCategoryPicker[row]
            return titleRow
        }
        return " "
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == dropdownCategoryUserQuote {
            self.categoryUserQuote.text! += self.userQuoteCategoryPicker[row]
            self.userQuoteCategoryPicker[row] = self.userQuoteCategoryPicker.joined(separator: ",")
            self.dropdownCategoryUserQuote.isHidden = false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == self.categoryUserQuote {
            self.dropdownCategoryUserQuote.isHidden = true
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
