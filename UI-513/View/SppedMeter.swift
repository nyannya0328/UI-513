//
//  SppedMeter.swift
//  UI-513
//
//  Created by nyannyan0328 on 2022/03/20.
//

import SwiftUI

struct SppedMeter: View {
    @Binding var progress : CGFloat
    var body: some View {
        GeometryReader{proxy in
            
            
            let size = proxy.size
            ZStack{
                
                
                
                ForEach(1...60,id:\.self){index in
                    
                    let deg = CGFloat(index) * 3
                    
                    
                    Capsule()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 40, height: 5)
                        .offset(x: -(size.width - 40) / 2)
                        .rotationEffect(.init(degrees: deg))
                    
                }
                
                
                
            }
            .frame(width: size.width, height: size.height,alignment: .bottom)
            
            
            
            ZStack{
                
                
                
                ForEach(1...60,id:\.self){index in
                    
                    let deg = CGFloat(index) * 3
                    
                    
                    Capsule()
                        .fill(deg < 60 ? Color("Ring1") : (deg >= 60 && deg < 120 ? Color("Ring2") : Color("Ring3")))
                        .frame(width: 40, height: 5)
                        .offset(x: -(size.width - 40) / 2)
                        .rotationEffect(.init(degrees: deg))
                    
                }
                
                
                
            }
            .frame(width: size.width, height: size.height,alignment: .bottom)
            .mask {
                
                Circle()
                    .trim(from: 0, to: (progress / 2) + 0.002)
                    .stroke(.white,lineWidth: 40)
                    .frame(width: size.width - 40, height: size.width - 40)
                    .offset(y: -(size.height) / 2)
                    .rotationEffect(.init(degrees: 180))
                    
                 
                
            }
            
            
            
            
        }
  
        
        .overlay(alignment: .bottom) {
            HStack{
                
                
                Text("0%")
                    .font(.system(size: 15, weight: .bold))
                
                Spacer()
                
                AnimateNumberText(value:CGFloat(Int(progress * 100)), font: .system(size: 15, weight: .semibold), folotationgPoint: 0, additionalString: "%").font(.system(size: 15, weight: .semibold))
                    .font(.system(size: 15, weight: .bold))
                
                
                    
            }
            
            
        }
        .overlay(alignment: .bottom) {
            
            IndicatorShape()
                .fill(Color("Indicator"))
                .overlay(alignment: .bottom, content: {
                    
                    
                    Circle()
                        .fill(Color("Indicator"))
                        .frame(width: 30, height: 30)
                        .overlay {
                            
                            Circle()
                                .fill(Color("BG"))
                                .padding(6)
                        }
                        .offset(y: 10)
                    
                })
                .frame(width: 25)
                .padding(.top,40)
                .rotationEffect(.init(degrees: -90), anchor: .bottom)
                .rotationEffect(.init(degrees: progress * 180), anchor: .bottom)
                .offset(y:-5)
            
            
            
        }
        .padding(.top)
        .padding(10)
    
        
      
    }
}

struct SppedMeter_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct IndicatorShape : Shape{
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in
            
            let with = rect.width
            let height = rect.height
            
            path.move(to: CGPoint(x: with / 2, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: height))
            path.addLine(to: CGPoint(x: 0, y: height))
            
            
        }
    }
}
    
    


