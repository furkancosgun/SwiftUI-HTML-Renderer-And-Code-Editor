//
//  HeaderButton.swift
//  CodingLab
//
//  Created by Furkan on 26.01.2023.
//

import SwiftUI

struct HeaderButton: View {
    @Binding var state : Bool 
    var btnImg : String
    var btnText : String
    var color : Color
    var device = UIDevice.current.model.lowercased()
    var body: some View {
        Button{
            state.toggle()
        }label: {
            HStack{
                if (device != "iphone")
                {
                    Image(systemName: btnImg)
                    Text(btnText)
                }else{
                    Text(btnText).font(.subheadline).lineLimit(1)
                }
            }
            .padding()
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: CGSize(width: 10, height: 10).width))
            }
            .foregroundColor(.white)
            .bold()
    }
}

struct HeaderButtonWithAction: View {
    var btnImg : String
    var btnText : String
    var color : Color
    var action : () -> Void
    var device = UIDevice.current.model.lowercased()
    var body: some View {
        Button{
            action()
        }label: {
            HStack{
                if (device != "iphone")
                {
                    Image(systemName: btnImg)
                    Text(btnText)
                }else{
                    Text(btnText).font(.subheadline).lineLimit(1)
                }
            }
            .padding()
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: CGSize(width: 10, height: 10).width))
            }.foregroundColor(.white)
            .bold()
    }
}

/*
 struct HeaderButton_Previews: PreviewProvider {
 static var previews: some View {
 HeaderButton()
 }
 }
 */
