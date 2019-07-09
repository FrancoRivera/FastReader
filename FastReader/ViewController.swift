//
//  ViewController.swift
//  FastReader
//
//  Created by Franco Rivera on 8/27/18.
//  Copyright © 2018 Franco Rivera. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var sampleString = "En un lugar de la Mancha, de cuyo nombre no quiero acordarme, no ha mucho tiempo que vivía un hidalgo de los de lanza en astillero, adarga antigua, rocín flaco y galgo corredor. Una olla de algo más vaca que carnero, salpicón las más noches, duelos y quebrantos los sábados, lantejas los viernes, algún palomino de añadidura los domingos, consumían las tres partes de su hacienda. El resto della concluían sayo de velarte, calzas de velludo para las fiestas, con sus pantuflos de lo mesmo, y los días de entresemana se honraba con su vellorí de lo más fino. Tenía en su casa una ama que pasaba de los cuarenta y una sobrina que no llegaba a los veinte, y un mozo de campo y plaza que así ensillaba el rocín como tomaba la podadera. Frisaba la edad de nuestro hidalgo con los cincuenta años. Era de complexión recia, seco de carnes, enjuto de rostro, gran madrugador y amigo de la caza.Quieren decir que tenía el sobrenombre de «Quijada», o «Quesada», que en esto hay alguna diferencia en los autores que deste caso escriben, aunque por conjeturas verisímiles se deja entender que se llamaba «Quijana». Pero esto importa poco a nuestro cuento: basta que en la narración dél no se salga un punto de la verdad."
    
    var wordArray: [String] = []
    
    @IBOutlet weak var wordsRead: UILabel!
    var timer : Timer = Timer()
    var contador = 0;
    var interval: Double = 0
    
    @IBOutlet weak var WordLabel: UILabel!
    @IBOutlet weak var wpmLabel: UILabel!
    @IBOutlet weak var sliderWpm: UISlider!
    
    @IBOutlet weak var progressViewParrafo: UIProgressView!
    
    @IBAction func intervalChange(_ sender: UISlider) {
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: interval, target: self, selector: #selector(changeLabel), userInfo: nil, repeats: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        wordArray = sampleString.components(separatedBy: " ")
        
      
        
        timer =  Timer.scheduledTimer(timeInterval: Double(sliderWpm.value), target: self, selector: #selector(changeLabel), userInfo: nil, repeats: true)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @objc func changeLabel(){
        interval = 1 - Double(sliderWpm.value)
        wordsRead.text = contador.description
        progressViewParrafo.progress = Float(contador)/Float(wordArray.count)
        WordLabel.text = wordArray[contador]
        contador += 1
        
        wpmLabel.text = "\(Int(1/interval * 60)) wpm"
        
        if contador > wordArray.count-1 {
            contador = 0
        }
        
    }

}

