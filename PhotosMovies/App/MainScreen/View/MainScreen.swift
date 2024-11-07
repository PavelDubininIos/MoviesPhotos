import SwiftUI

struct MainScreen: View {
    @StateObject var viewModel = MainScreenViewModel()
    
    @State private var selectedTab = 0
    
    private var width: CGFloat = (UIScreen.main.bounds.width - 20) / CGFloat(3)
    private let gridItem: [GridItem] = .init(repeating: GridItem(.flexible(), spacing: 0), count: 3)
    
    var offsetLeading: CGFloat = 160
    let tabs = ["Now playing", "Upcoming", "Top rated", "Popular"]
    
    var body: some View {
        ZStack {
            Color.background
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                title
                SearchBarView(topPadding: 20, horizontalPadding: 20)
                topImage
                horizontalMovieSelector
                Spacer()
                
                ScrollView {
                    
                    LazyVGrid(columns: gridItem, spacing: 10) {
                        ForEach(viewModel.imageURLs, id: \.self) { imageURL in
                            AsyncImage(url: imageURL) { image in
                                image.image?
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: width)
                                    .clipped()
                                    .border(Color.red, width: 2)
                            }
                        }
                    }
                    .padding(.horizontal, 2)
                }
            }
        }
    }
}

extension MainScreen {
    var title: some View {
        HStack {
            Text("What do you want to watch")
                .font(Font.custom(.poppinsBold, size: 18))
                .foregroundStyle(.white)
                .padding(.leading, 20)
            
            Spacer()
        }
    }
}

extension MainScreen {
    
    var topImage: some View {
        ScrollView(.horizontal){
            HStack {
                
                Image("testImage")
                    .resizable()
                    .frame(width: 145, height: 210)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.leading, 24)
                    .overlay {
                        Image("Image1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 75)
                            .padding(.init(top: 185, leading: 50, bottom: 0, trailing: offsetLeading))
                    }
                
                Image("testImage")
                    .resizable()
                    .frame(width: 145, height: 210)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.leading, 30)
                
                    .overlay {
                        Image("Image2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 55, height: 75)
                            .padding(.init(top: 185, leading: 40, bottom: 0, trailing: offsetLeading))
                    }
                
                ZStack {
                    
                    Image("testImage")
                        .resizable()
                        .frame(width: 145, height: 210)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                    //                        .padding(.trailing, 24)
                    
                    Image("Image2")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 55, height: 75)
                        .padding(.init(top: 180, leading: 0, bottom: 0, trailing: offsetLeading))
                }
            }
            .padding(.top, 21)
        }
    }
}

extension MainScreen {
    
    var horizontalMovieSelector: some View {
        HStack {
            ForEach(0..<tabs.count, id: \.self)  { index in
                VStack {
                    Text(tabs[index])
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(selectedTab == index ? .white : .gray)
                        .onTapGesture {
                            withAnimation {
                                selectedTab = index
                            }
                        }
                    
                    if selectedTab == index {
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(.gray)
                    } else {
                        Rectangle()
                            .frame(height: 0)
                    }
                    
                }
            }
        }
        .padding(.top, 35)
        .padding(.all, 10)
        
    }
}

#Preview {
    MainScreen()
}
