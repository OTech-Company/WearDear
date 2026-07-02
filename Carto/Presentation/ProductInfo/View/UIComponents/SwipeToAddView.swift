//
//  SwipeToAddView.swift
//  Carto
//
//  Created by Manona on 27/06/2026.
//

import SwiftUI

struct SwipeToAddView: View {
    let price: Double
    let compareAtPrice: Double?
    let discountPercentage: Int?

    @Binding var quantity: Int
    @State private var dragOffset: CGFloat = 0
    @State private var showAddedEffect = false
    @State private var addedEffectOffset: CGFloat = 0
    @State private var addedEffectOpacity: Double = 0

    private let threshold: CGFloat = 45

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    HStack(spacing: 8) {
                        Text(String(format: "$%.2f", price))
                            .font(.title2)
                            .bold()

                        if let compareAtPrice = compareAtPrice, compareAtPrice > price {
                            Text(String(format: "$%.2f", compareAtPrice))
                                .font(.subheadline)
                                .foregroundColor(.secondary)
                                .strikethrough()
                        }
                    }

                    if let discountPercentage = discountPercentage {
                        Text("-\(discountPercentage)% OFF")
                            .foregroundColor(.red)
                            .font(.subheadline)
                            .bold()
                    }
                }

                Spacer()

                HStack(spacing: 16) {
                    Button {
                        if quantity > 0 {
                            quantity -= 1
                        }
                    } label: {
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

                    Button {
                        quantity += 1
                    } label: {
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

            Text("Swipe down to add")
                .font(.subheadline)
                .bold()
                .foregroundColor(.secondary)
                .padding(.bottom, 2)

            VStack(spacing: 1) {
                Image(systemName: "chevron.up")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.2))

                Image(systemName: "chevron.up")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))

                Image(systemName: "chevron.up")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.6))
            }

            Spacer(minLength: 6)

            Circle()
                .fill(Color.black)
                .frame(width: 50, height: 50)
                .overlay {
                    Image(systemName: "bag")
                        .foregroundColor(.white)
                        .font(.title3)
                }
                .offset(y: dragOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            dragOffset = max(-threshold - 10, min(value.translation.height, threshold + 10))
                        }
                        .onEnded { value in
                            let impact = UIImpactFeedbackGenerator(style: .medium)

                            if value.translation.height >= threshold {
                                quantity += 1
                                impact.impactOccurred()
                                triggerAddedEffect()
                            } else if value.translation.height <= -threshold {
                                if quantity > 0 {
                                    quantity -= 1
                                }
                                impact.impactOccurred()
                            }

                            withAnimation(.spring()) {
                                dragOffset = 0
                            }
                        }
                )
                .animation(.interactiveSpring(), value: dragOffset)

            Spacer(minLength: 6)

            VStack(spacing: 1) {
                Image(systemName: "chevron.down")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.6))

                Image(systemName: "chevron.down")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.4))

                Image(systemName: "chevron.down")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.2))
            }
            .padding(.bottom, 0)

            ZStack(alignment: .top) {
                Image("bag")
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: .infinity, maxHeight: 200)
                    .padding(.top, -30)
                    .clipped()

                if showAddedEffect {
                    Text("+1")
                        .font(.title3)
                        .bold()
                        .foregroundColor(.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 4)
                        .background(Color.black)
                        .clipShape(Capsule())
                        .offset(y: addedEffectOffset)
                        .opacity(addedEffectOpacity)
                }
            }
        }
    }

    private func triggerAddedEffect() {
        showAddedEffect = true
        addedEffectOffset = 20
        addedEffectOpacity = 1

        withAnimation(.easeOut(duration: 0.6)) {
            addedEffectOffset = -30
            addedEffectOpacity = 0
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            showAddedEffect = false
        }
    }
}
