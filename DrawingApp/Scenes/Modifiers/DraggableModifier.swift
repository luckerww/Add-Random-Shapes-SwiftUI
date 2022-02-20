//
//  DraggableModifier.swift
//  DrawingApp
//
//  Created by wei wu on 2/19/22.
//

import SwiftUI

extension View {
    func draggable() -> some View {
         self
            .modifier(DraggableModifier())
    }
}
struct DraggableModifier: ViewModifier {
    @State private var offset: CGPoint = .zero
    @State private var previousTranslation: CGSize?
    
    func body(content: Content) -> some View {
        content
            .offset(x: offset.x, y: offset.y)
            .gesture(DragGesture().onChanged { value in
                if let translation = previousTranslation {
                    // drag changed
                    let delta = CGSize(width: value.translation.width - translation.width,
                                       height: value.translation.height - translation.height)
                    offset.x += delta.width
                    offset.y += delta.height
                    previousTranslation = value.translation
                } else {
                    // drage started
                    previousTranslation = value.translation
                }
            }
            .onEnded{ _ in
                // drag ended
                previousTranslation = nil
                })
    }
}
