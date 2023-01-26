//
//  ContentView.swift
//  CodingLab
//
//  Created by Furkan on 25.01.2023.
//

import SwiftUI
import CodeEditor
import WebKit

struct ContentView: View {
    @State private var openExport = false
    @State private var openImport = false
    @State private var live = false
    private var size = UIScreen.main.bounds
    @State private var source2 = ""
    @State private var source = """
<!DOCTYPE html>
<html>
<body>
</body>
</html>
"""
    
    var body: some View {
        VStack {
            HStack{
                Spacer()
                
                
                
                HeaderButtonWithAction(btnImg: "play.fill", btnText: "RUN",color:.blue)
                    {
                        source2 = source
                    }
          
                    
                HeaderButton(state: $openExport, btnImg: "arrow.down.doc.fill", btnText: "EXPORT",color:.green)
                    .fileExporter(isPresented: $openExport, document: HtmlFile(initialText: source), contentType: .html) { result in
                        print(result)
                    }
                
                HeaderButton(state: $openImport, btnImg: "arrow.up.doc.fill", btnText: "IMPORT",color:.orange)
                    .fileImporter(isPresented: $openImport, allowedContentTypes: [.html], onCompletion: { result in
                        do{
                            let selectedFile: URL =  try result.get()
                            
                        guard let input = String(data: try Data(contentsOf: selectedFile), encoding: .utf8) else { return }
                            source = input
                        }catch{
                            print(error.localizedDescription)
                        }
                    })
                           
                VStack(alignment: .trailing){
                    Toggle("", isOn: $live)
                    Text("Live Mode")
                }
                
            }.padding(.horizontal)
            HStack{
                CodeEditor(source: $source, language: .markdown, theme: .ocean)
                    .frame(width: size.width / 2)
                StringToHtmlView(htmlContent: live ? source : source2)
                    .frame(width: size.width / 2)
            }
          
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
