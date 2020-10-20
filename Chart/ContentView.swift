//
//  ContentView.swift
//  Chart
//
//  Created by Macbook Pro on 10/20/20.
//  Copyright © 2020 tendi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var pickerSelectedItem = 0
    @State var chartValue: [CGFloat] = [50, 100, 190]
    var body: some View {
        ZStack{
            Color(#colorLiteral(red: 0.3750723898, green: 1, blue: 0.7466797233, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack{
                Text("Chart")
                .font(.system(size: 35))
                .fontWeight(.heavy)
                
                Picker(selection: $pickerSelectedItem, label: Text("")){
                    Text("Weekday").tag(0)
                    Text("Afternoon").tag(1)
                    Text("Evening").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 20)
                
                HStack(spacing: 20){
                    BarView(value: chartValue[pickerSelectedItem], title : "M").animation(.easeIn)
                    BarView(value: chartValue[pickerSelectedItem], title: "T").animation(.easeInOut)
                    BarView(value: chartValue[pickerSelectedItem], title: "W").animation(.linear)
                    BarView(value: chartValue[pickerSelectedItem], title: "T").animation(.easeIn(duration: 2))
                    BarView(value: chartValue[pickerSelectedItem], title: "F").animation(.easeOut(duration: 2))
                    BarView(value: chartValue[pickerSelectedItem], title: "S").animation(.linear(duration: 2))
                    BarView(value: chartValue[pickerSelectedItem], title: "S").animation(.some(.interactiveSpring()))
                }
            }
        }
    }
}

struct BarView: View {
    var value: CGFloat
    var title : String
    var body: some View{
        VStack{
            ZStack(alignment: .bottom){
                Capsule().frame(width: 25, height: 200)
                    .foregroundColor(Color(#colorLiteral(red: 0.3479170203, green: 0.9111325741, blue: 0.6900341511, alpha: 1)))
                Capsule().frame(width: 25, height: value)
                    .foregroundColor(.white)
            }
            Text(title).padding(.top, 10)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
