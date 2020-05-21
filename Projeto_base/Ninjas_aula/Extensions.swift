//
//  Extensions.swift
//  Ninjas_aula
//
//  Created by ninjanazal on 21/05/2020.
//  Copyright © 2020 Journey Tendency. All rights reserved.
//
// inporta UIKit para utilizar CGPoint
import UIKit
//MARK: Operadores para Vetors
// overide ao operador - para subtrair vetores
func -(left: CGPoint, right: CGPoint)-> CGPoint {
    // retorna a subtraçao do vector
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}
// overide ao operador + para adicionar vetores
func +(left: CGPoint, right: CGPoint)-> CGPoint {
    // retorna a subtraçao do vector
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}
// overide ao operador / para dividir vector por um escalar
func /(left: CGPoint, scalar : CGFloat) -> CGPoint{
    return CGPoint(x: left.x / scalar, y: left.y / scalar)
}
// overide ao operador * para dividir vector por um escalar
func *(left: CGPoint, scalar : CGFloat) -> CGPoint{
    return CGPoint(x: left.x * scalar, y: left.y * scalar)
}

//MARK: Extensoes
// extençao para calcular o ponto norma
extension CGPoint{
    // extensao ao cgpoint para retornar a norma do vector
    func length() -> CGFloat{
        return sqrt(x*x + y*y)
    }
    // extensao ao cgpoint para retornar o vetor normalizado
    func normalized() -> CGPoint{
        return self / length()
    }
}

