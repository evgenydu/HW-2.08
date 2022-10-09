//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 06.10.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    // 1. Избавиться от кнопки возврата назад на экране результатов
    // 2. Передать массив с ответами на экран с результатами
    // 3. Определить наиболее часто встречающийся тип животного
    // 4. Отобразить результаты в соответствии с этим животным

    @IBOutlet var finalTitleLable: UILabel!
    @IBOutlet var finalDescriptionLable: UILabel!
    
    var ansversChosen: [Answer] = []
    private var winner = ""
    private var pollResult = [
        "dog" : 0,
        "cat" : 0,
        "turtle" : 0,
        "rabbit" : 0
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        scoring()
        selectAnimal()
        resultOutput()
    }

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        navigationController?.dismiss(animated: true)
    }
    
    private func scoring() {
        for type in ansversChosen {
            if type.animal == .dog {
                pollResult["dog"]! += 1
            } else if type.animal == .cat {
                pollResult["cat"]! += 1
            } else if type.animal == .turtle {
                pollResult["turtle"]! += 1
            } else if type.animal == .rabbit {
                pollResult["rabbit"]! += 1
            }
        }
    }
    
    private func selectAnimal() {
    let sortedResponses = pollResult.sorted(by: {$0.value > $1.value} )
        winner = sortedResponses[0].0
        }
    
    private func resultOutput() {
        if winner == "dog" {
            finalTitleLable.text = "Вы собака"
            finalDescriptionLable.text = "Не знаю как вытащить данные из модели"
        } else {
            finalTitleLable.text = "Вы не собака"
            finalDescriptionLable.text = "Не знаю как вытащить данные из модели"
        }
    }
}
