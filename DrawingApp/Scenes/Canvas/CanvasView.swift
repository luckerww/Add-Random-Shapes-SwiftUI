//
//  CanvasView.swift
//  DrawingApp
//
//  Created by wei wu on 2/19/22.
//

import SwiftUI

struct CanvasView: View {
    
    @State private var shapes: [AnyView] = []
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.clear)
            ForEach(shapes.indices, id: \.self) {
                shapes[$0]
                    .draggable()
            }
        }
        .contentShape(Rectangle())
        .onTapGesture(count: 2){
            shapes.append(Shapes.getRandomShape())
        }
    }
}


struct CanvasView_Previews: PreviewProvider {
    static var previews: some View {
        CanvasView()
    }
}
