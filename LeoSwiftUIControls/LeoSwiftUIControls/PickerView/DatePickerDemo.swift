//
//  DatePickerDemo.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 05/05/2021.
//

import SwiftUI

struct DatePickerDemo: View {
    @State private var date = Date()
    let dateFormatter: DateFormatter = {
           let formatter = DateFormatter()
           formatter.dateStyle = .long
           return formatter
       }()

       @State private var birthDate = Date()

      var body: some View {
          
        ScrollView(.vertical, showsIndicators: true, content: {
            VStack {
                Text("Enter your birthday\(date)")
                      .font(.largeTitle)
                  DatePicker("Enter your birthday", selection: $date)
                      .datePickerStyle(GraphicalDatePickerStyle())
                      .frame(maxHeight: 400)
                Text("Select a date")
                VStack {
                            DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                                Text("Select a date")
                            }.datePickerStyle(GraphicalDatePickerStyle())

                            Text("Date is \(birthDate, formatter: dateFormatter)")
                        
              
              }
          }
        })
     
  }
}


struct DatePickerDemo_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerDemo()
    }
}
