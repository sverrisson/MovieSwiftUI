//
//  GenresList.swift
//  MovieSwift
//
//  Created by Thomas Ricouard on 23/07/2019.
//  Copyright © 2019 Thomas Ricouard. All rights reserved.
//

import SwiftUI
import SwiftUIFlux

struct GenresList: View {
    @EnvironmentObject private var store: Store<AppState>
    var headerView: AnyView?
    
    var body: some View {
        List {
            if headerView != nil {
                headerView!
            }
            ForEach(store.state.moviesState.genres) { genre in
                NavigationLink(destination: MoviesGenreList(genre: genre)) {
                    Text(genre.name)
                }
            }
        }
        .navigationBarTitle("Genres")
        .onAppear {
            self.store.dispatch(action: MoviesActions.FetchGenres())
        }
    }
}

#if DEBUG
struct GenresList_Previews: PreviewProvider {
    static var previews: some View {
        GenresList()
    }
}
#endif
