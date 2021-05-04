//
//  NavigationViewTut.swift
//  LeoSwiftUIControls
//
//  Created by vijayvir on 01/05/2021.
//

import SwiftUI
struct Item : Identifiable {
    var id : Int
    var title : String
    var detail : String
    
    static var items : [Item]{
    
        var items : [Item] = []
        for index in 1..<5 {
            items.append(Item(id: index, title: "Title\(index)", detail: "Detail\(index)"))
        }
        return items
    }
}

class NavigationViewModel : ObservableObject{
    var items : [Item] = Item.items
}

struct NavigationViewTut: View {
    var navigationViewModel : NavigationViewModel = NavigationViewModel()
    
    var body: some View {
        NavigationView {
            
            List(navigationViewModel.items, id: \.id) { item in
  NavigationLink(
    destination: Text("Destination\(item.detail)"),
    label: {
        Text("Navigate\(item.title)")
    })
                
                   }.navigationTitle("Items")
        }
        
    }
}

struct NavigationViewTut_Previews: PreviewProvider {
    static var previews: some View {
        NavigationViewTut()
    }
}


