//
//  SearchView.swift
//  IGEE
//
//  Created by 03 on 17/6/2566 BE.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    @State var inSearchMode = false
    @ObservedObject var viewModel = SearchViewModel()
    
    var body: some View {
        ScrollView {
            Text("Search")
            
            // search bar
            SearchBar(text: $searchText, isEditing: $inSearchMode)
                .padding()
            // grid view/user list view
            ZStack {
                if inSearchMode {
                    UserListView(viewModel: viewModel, searchText: $searchText)

                } else {
//                    PostGridView(viewModel: viewModel)
                    PostGridView(config: .explore)

                }
            }
            //PostGridView
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
