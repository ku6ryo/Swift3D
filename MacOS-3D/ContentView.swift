//
//  ContentView.swift
//  threed-test
//
//  Created by Ryo Kuroyanagi on 2023/10/21.
//

import SwiftUI
import SceneKit

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "cube")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, 3D in Swift!")
        }
        .padding()
        let scene = SCNScene(named: "cube.dae")
        SceneView(scene: scene, options: [.allowsCameraControl])
            .frame(width: 400, height: 400)
            .onAppear {
                let material = SCNMaterial()
                material.diffuse.contents = NSColor.blue
                
                /// creates a custom material with a custom shader and applies it to the model
                let mat = SCNMaterial()
                mat.metalness.contents = 0.5
                // use a metal shader
                mat.shaderModifiers = [
                    SCNShaderModifierEntryPoint.fragment: """
                    float3 color = float3(1.0, 1.0, 0.0);
                    _output.color.rgb = color;
                    """
                ]
                
                let modelNode = scene?.rootNode.childNode(withName: "Cube", recursively: true)
                modelNode?.geometry?.materials = [mat]
            }
        
    }
}

#Preview {
    ContentView()
}

