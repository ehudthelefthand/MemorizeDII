//
//  ToastExerciseView.swift
//  MemorizeDII
//
//  Created by Peerawat Poombua on 8/10/25.
//

import SwiftUI

struct ToastExerciseView: View {
    @State var showToast: Bool = false

    var body: some View {
        VStack {
            Spacer()
            if showToast {
//                ToastView() {
//                    showToast = false
//                }
                ToastView(showToast: $showToast) {

                }
            }

            Spacer()
            Button("Show Toast") {
                withAnimation(.spring(duration: 0.5, bounce: 0.4)) {
                    showToast = true
                }
            }
        }
        .padding()
        .font(.largeTitle)
    }
}

struct ToastView: View {
    @Binding var showToast: Bool

    var closeAction: () -> Void

    var body: some View {
        VStack {
            Text("Hello SwiftUI!")
            Button("Close") {
                withAnimation {
//                    closeAction()
                    showToast = false
                }
            }
            .buttonStyle(.bordered)
        }
        .padding(16)
        .background(.mint.opacity(0.5), in: RoundedRectangle(cornerRadius: 12))
        .transition(.move(edge: .bottom).combined(with: .opacity))
    }
}

#Preview {
    ToastExerciseView()
}
