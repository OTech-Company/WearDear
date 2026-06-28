//
//  SwipeToAddView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//


import SwiftUI

struct SwipeToAddView: View {
    @Binding var quantity: Int
    @State private var dragOffset: CGFloat = 0
    private let threshold: CGFloat = 80

    var body: some View {
        VStack(spacing: 0) {

            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text("$30.99")
                        .font(.title2)
                        .bold()
                    Text("10% OFF")
                        .foregroundColor(.red)
                        .font(.caption)
                        .bold()
                }

                Spacer()

                HStack(spacing: 16) {
                    Button {} label: {
                        Text("−")
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 32, height: 32)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                    }

                    Text("\(quantity)")
                        .font(.headline)
                        .frame(minWidth: 20)

                    Button {} label: {
                        Text("+")
                            .font(.title3)
                            .foregroundColor(.black)
                            .frame(width: 32, height: 32)
                            .background(Color(.systemGray6))
                            .clipShape(Circle())
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 16)

            Text("Swipe down to add")
                .font(.subheadline)
                .bold()
                .foregroundColor(.secondary)
                .padding(.bottom, 12)

            ZStack(alignment: .top) {

                VStack(spacing: 2) {
                    Spacer().frame(height: 20)
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.4))
                    Image(systemName: "chevron.down")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black.opacity(0.15))
                }
                Circle()
                    .fill(Color.black)
                    .frame(width: 56, height: 56)
                    .overlay {
                        Image(systemName: "bag")
                            .foregroundColor(.white)
                            .font(.title3)
                    }
                    .offset(y: dragOffset)
                    .opacity(1 - Double(dragOffset / threshold) * 0.8)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                if value.translation.height > 0 {
                                    dragOffset = min(value.translation.height, threshold + 10)
                                }
                            }
                            .onEnded { value in
                                if value.translation.height >= threshold {
                                    quantity += 1
                                    let impact = UIImpactFeedbackGenerator(style: .medium)
                                    impact.impactOccurred()
                                }
                                withAnimation(.spring()) {
                                    dragOffset = 0
                                }
                            }
                    )
                    .animation(.interactiveSpring(), value: dragOffset)
            }
            .padding(.bottom, 8)

            Image("bag")
                .resizable()
                .scaledToFit()
                .frame(width: 260)
                .ignoresSafeArea(edges: .bottom)
        }
    }
}
