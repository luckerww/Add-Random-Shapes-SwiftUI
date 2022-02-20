//
//  BezierShape.swift
//  DrawingApp
//
//  Created by wei wu on 2/20/22.
//

import SwiftUI

struct BezierShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint (x: rect.midX, y:rect.maxY))
        path.addQuadCurve(to: CGPoint(x:rect.midX, y:rect.minY), control: CGPoint(x: rect.minX, y: rect.minY))
        path.addQuadCurve(to: CGPoint(x:rect.midX, y:rect.maxY), control: CGPoint(x: rect.maxX, y: rect.minY))
        
        
        return path
        
    }

      
        
}
    


struct BezierShape_Previews: PreviewProvider {
    static var previews: some View {
        BezierShape()
            .frame(width: 300, height: 150)
            .foregroundColor(.purple)
    }
}
