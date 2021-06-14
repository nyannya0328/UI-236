//
//  Login.swift
//  UI-236
//
//  Created by にゃんにゃん丸 on 2021/06/14.
//

import SwiftUI

struct Login: View {
    @State var txt = ""
    @State var pass = ""
    var body: some View {
        VStack{
            
            
            Text("SIGN IN")
                .font(.title.bold())
                .foregroundColor(Color("dark"))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("User Name")
                    .font(.footnote.italic())
            
                TextField("name", text: $txt)
                    .font(.system(size: 15, weight: .bold))
                    .foregroundColor(Color("dark"))
                Divider()
                    .background(Color("dark"))
                
                
                
            })
            .padding(.top,10)
            
            
            VStack(alignment: .leading, spacing: 15, content: {
                Text("PassWord")
                    .font(.footnote.italic())
            
                SecureField("******", text: $pass)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(Color("dark"))
                Divider()
                    .background(Color("dark"))
                
                
                
            })
           
            .padding(.top,10)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Text("For Got PassWord?")
                    .font(.callout.italic())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                   
                    .foregroundColor(.purple)
            })
            .padding(.top,5)
            
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
               Image(systemName: "arrow.right")
                .font(.system(size: 15, weight: .heavy))
                .foregroundColor(.white)
                .padding(.vertical,10)
                 .padding(.horizontal,10)
                .background(Color("dark"))
                .clipShape(Circle())
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top,5)
            
            
            
        }
        .padding()
    }
}

