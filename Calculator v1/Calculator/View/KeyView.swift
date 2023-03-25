//
//  KeyView.swift
//  Calculator
//
//  Created by Zachary Swoveland on 3/25/23.
//

import SwiftUI

struct KeyView: View {
    //States to give default values on the screen to then use to make the calculations given by users
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operation = .none
    //for animation based on value by users
    @State private var changeColor = false
    //buttons array for view
    let buttons: [[Keys]] = [
        [.clear,.negative,.percent,.divide],
        [.seven,.eight,.nine,.multiply],
        [.four,.five,.six,.substract],
        [.one,.two,.three,.add],
        [.zero,.decimal,.equal],
    ]
    
    
    
    
    var body: some View {
        VStack{
            Spacer()
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(changeColor ?
                    Color("num").opacity(0.2) :
                    Color.purple.opacity(0.2))
                .scaleEffect(changeColor ? 2.5 : 1.0)
                .frame(width: 350, height: 280)
                .animation(Animation.easeInOut.speed(0.17).repeatForever(), value: changeColor)
                .onAppear(perform: {
                    self.changeColor.toggle()
                })
                .overlay(Text(value)).bold().font(.system(size:100)).foregroundColor(.black)
            ForEach(buttons, id: \.self){row in
                HStack(spacing: 10){
                    ForEach(row, id:\.self){elem in
                        Button {
                            self.didTap(button: elem)
                        } label: {
                            Text(elem.rawValue).font(.system(size:30)).frame(width: self.getWidth(elem: elem), height:self.getHeight(elem: elem)).background(elem.buttonColor).foregroundColor(.black).cornerRadius(self.getWidth(elem: elem)/2).shadow(color:.purple.opacity(0.8),radius:30)
                        }

                        
                    }
                }
            }.padding(.bottom,4)
        }.padding()
      
        
    }
    
    //get width to perfectly fit the screen
    func getWidth(elem: Keys) -> CGFloat{
        if elem == .zero{
            //X*Y (Gutter Space numbers)/Numbers of elements you want to fit in
            return (UIScreen.main.bounds.width - (5*10))/2

        }
        return (UIScreen.main.bounds.width - (5*10))/4
    }
    //get height to perfectly fit the screen
    func getHeight(elem: Keys) -> CGFloat{
        return (UIScreen.main.bounds.width - (5*10))/5
    }
    
    func didTap(button:Keys){
        let runningValue = self.runningNumber
        let currentValue = Int(self.value) ?? 0
        let number = button.rawValue
        switch button{
        case .add, .substract, .multiply, .divide, .equal:
            if button == .add{
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .substract{
                self.currentOperation = .substract
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .multiply{
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .divide{
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            }
            else if button == .equal{
              
                switch self.currentOperation{
                case .add: self.value = "\(runningValue + currentValue)"
                case .substract: self.value = "\(runningValue - currentValue)"
                case .multiply: self.value = "\(runningValue * currentValue)"
                case .divide: self.value = "\(runningValue / currentValue)"
                case .none: break
                    
                }
            }
            if button != .equal{
                self.value = "0"
            }
        case .clear: self.value = "0"
        case .percent,.negative,.decimal:
            break
      
        default:
           
            if self.value == "0"{
                value = number
            }
            else{
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

struct KeyView_Previews: PreviewProvider {
    static var previews: some View {
        KeyView()
    }
}
