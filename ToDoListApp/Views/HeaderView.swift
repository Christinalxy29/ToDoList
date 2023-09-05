//
//  HeaderView.swift
//  ToDoListApp
//
//  Created by Christina Lin  on 7/6/23.
//

import SwiftUI

struct HeaderView: View {
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            
            VStack{
                Text(title)
                    .font(.system(size: 55))
                    .foregroundColor(Color.yellow)
                    .bold()
                
                
                Text(subtitle)
                    .font(.system(size: 25))
                    .foregroundColor(Color.yellow)
            }
            .padding(.top, 90)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
        
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(title: "Title", subtitle: "Subtitle", angle: 15, background: .blue)
    }
}
