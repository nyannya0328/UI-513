//
//  AnimateNumberText.swift
//  UI-513
//
//  Created by nyannyan0328 on 2022/03/20.
//

import SwiftUI

struct AnimateNumberText: Animatable ,View {
    
    var value : CGFloat
    var font : Font
    var folotationgPoint : Int = 2
    var isCurrency : Bool = false
    var additionalString : String = ""
    
    var animatableData: CGFloat{
        
        get{value}
        set{value = newValue}
    }
    
    
    var body: some View {
       Text("\(isCurrency ? "$" : "")\(String(format: "%.\(folotationgPoint)f", value))" + additionalString)
            .font(font)
    }
}


