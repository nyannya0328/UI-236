//
//  Home.swift
//  UI-236
//
//  Created by にゃんにゃん丸 on 2021/06/14.
//

import SwiftUI

extension View{
    
    
    func getRect()->CGRect{
        
        return UIScreen.main.bounds
    }
    func getSafeArea()->UIEdgeInsets{
        
        
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
}

struct Home: View {
   
    @State var maxCicleHeight : CGFloat = 0
    @State var show = false
    var body: some View {
        VStack{
            
            GeometryReader{proxy -> AnyView in
                
                
                let frame = proxy.frame(in: .global)
                
                
                DispatchQueue.main.async {
                    if maxCicleHeight == 0{
                        
                        
                        maxCicleHeight = frame.height
                        
                    }
                }
            
                
                
                
                return AnyView(
                
                    ZStack{
                        
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: getRect().width / 2, y: -frame.height / 1.3)
                        
                        Circle()
                            .fill(Color("dark"))
                            .offset(x: -getRect().width / 2, y: -frame.height / 1.6)
                        
                        Circle()
                            .fill(Color("lb"))
                            .offset(y: -frame.height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                        
                        
                        
                        
                    }
                  
                
                
                )
                
                
            }
            .frame(height: getRect().width)
            
            
            ZStack{
                if show{
                    
                    SignUp()
                        .transition(.move(edge: .trailing))
                    
                }
                else{
                    
                   Login()
                    .transition(.move(edge: .trailing))
                    
                }
                
            }
            
           
            .padding(.top,-maxCicleHeight / (getRect().height < 750 ? 1.5 : 1.6))
            .frame(maxHeight: .infinity, alignment: .top)
            
           
            
        }
        .overlay(
        
        
            HStack{
                
                Text(show ? "NewMember" : "Already Menmeber")
                    .font(.caption.bold())
                    .foregroundColor(.gray)
                
                
                Button(action: {
                    
                    withAnimation{
                        
                        show.toggle()
                    }
                    
                }, label: {
                    Text(show ? "Sign in" : "Sign up")
                        .font(.headline.italic())
                        .foregroundColor(.black)
                        .underline(true, color: Color.black)
                })
                
            }
            .padding(.bottom,getSafeArea().bottom == 0 ? 15 : 0)
            ,alignment: .bottom
        )
        .background(
            
        
            HStack{
                
                
                
                Circle()
                    .fill(Color("dark"))
                    .frame(width: 50, height: 50)
                    .offset(x: -10, y: getRect().height < 750 ? 10 : 0)
                
                
                Spacer()
                
                
                Circle()
                    .fill(Color("lb"))
                    .frame(width: 150, height: 150)
                    .offset(x: 30, y: 20)
                
            }
            .offset(y: getSafeArea().bottom + 30)
            
            
            ,alignment: .bottom
            
            
        )
        .ignoresSafeArea(.keyboard, edges: .bottom)
        
        
      
    
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
