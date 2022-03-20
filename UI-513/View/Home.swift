//
//  Home.swift
//  UI-513
//
//  Created by nyannyan0328 on 2022/03/20.
//

import SwiftUI

struct Home: View {
    @State var progress : CGFloat = 0.5
    @State var currentTab : String = "Jan"
    @Namespace var animation
    var body: some View {
        VStack{
            
            HStack{
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "chevron.left")
                        .frame(width: 50, height: 50)
                        .background(
                        
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .stroke(.white,lineWidth: 1)
                            
                        
                        )
                        
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    
                    Image(systemName: "ellipsis")
                        .rotationEffect(.init(degrees: -90))
                }


            }
            .foregroundColor(.white)
            .padding(.horizontal)
            
            VStack{
                
                
                Text("Saved This Month")
                    .fontWeight(.semibold)
                    .foregroundColor(.white.opacity(0.7))
                
                AnimateNumberText(value: progress * 1330, font: .system(size: 35, weight: .black),isCurrency: true)
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color("Green"))
                    .padding(.top,5)
                    .lineLimit(1)
                
                SppedMeter(progress: $progress)
            }
            .padding(.top,50)
            .frame(maxWidth:.infinity)
            .frame(height: 350)
            .background{
                
                
                LinearGradient(colors: [
                
                
                    Color("LightGreen").opacity(0.5),
                    Color("LightGreen").opacity(0.3),
                    Color("LightGreen").opacity(0.1),
                
                ] + Array(repeating: .clear, count: 6), startPoint: .topTrailing, endPoint: .bottomLeading)
            }
            .padding(.horizontal,15)
            .padding(.top,20)
            
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    
                    HStack(spacing:10){
                        
                        
                        ForEach(months,id:\.self){month in
                            
                            
                            
                            Text(month)
                                .font(.callout)
                                .padding(.vertical,8)
                                .padding(.horizontal,20)
                                .background{
                                    
                                    if currentTab == month{
                                        
                                        Capsule()
                                            .fill(.black)
                                            .matchedGeometryEffect(id: "MONTH", in: animation)
                                        
                                        
                                    }
                                }
                                .onTapGesture {
                                    
                                    withAnimation(.interactiveSpring(response: 0.8, dampingFraction: 0.8, blendDuration: 0)){
                                        
                                        currentTab = month
                                        progress = progressArray[getIndex(month: month)]
                                    }
                                }
                            
                        }
                    }
                    
                }
                
                
                
                BottomContent()
                
            }
            
            
           
            
            
            
        }
        .padding(.top,15)
        .frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .top)
        .background{
            
            Color("BG").ignoresSafeArea()
        }
        
    }
    
    func getIndex(month : String) -> Int{
        
        
        
        return months.firstIndex { value in
            month == value
        } ?? 0
    }
    
    @ViewBuilder
    func BottomContent()->some View{
        
        VStack{
            
            
            ForEach(expenses){exp in
                
                
                HStack(spacing:13){
                    
                    Image(exp.icon)
                        .resizable()
                        .renderingMode(.template)
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 30, height: 30)
                        .cornerRadius(10)
                    
                    
                    VStack(alignment: .leading, spacing: 13) {
                        
                    
                        
                        Text(exp.title)
                            .font(.title.weight(.bold))
                        
                        
                        Text(exp.subTitle)
                            .foregroundColor(.gray)
                        
                        
                    }
                    .frame(maxWidth:.infinity,alignment:.leading)
                    
                    
                    Text(exp.amount)
                        .fontWeight(.semibold)
                }
            }
        }
        .padding()
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


