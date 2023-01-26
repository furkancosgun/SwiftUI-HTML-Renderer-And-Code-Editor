//
//  FileManagerView.swift
//  CodingLab
//
//  Created by Furkan on 25.01.2023.
//

import SwiftUI

struct FileManagerView: View {
@State private var open = false
    var body: some View {
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onTapGesture {
                open = true
              
            }
    }

}


struct FileManagerView_Previews: PreviewProvider {
    static var previews: some View {
        FileManagerView()
    }
}
