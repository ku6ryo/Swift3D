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
                /*
                let vertexShaderURL = Bundle.main.url(forResource: "Vert", withExtension: "metal")
                let fragmentShaderURL = Bundle.main.url(forResource: "Frag", withExtension: "metal")

                let vertexShader = try? String(contentsOf: vertexShaderURL!)
                let fragmentShader = try? String(contentsOf: fragmentShaderURL!)

                // Create a custom material with the loaded shaders
                let customMaterial = SCNMaterial()
                customMaterial.shaderModifiers = [
                    .geometry: vertexShader!,
                    .fragment: fragmentShader!
                ]
                 */

                let modelNode = scene?.rootNode.childNode(withName: "Cube", recursively: true)
                modelNode?.geometry?.materials = [material]
            }
        
    }
}

#Preview {
    ContentView()
}

