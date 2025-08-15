
import SwiftUI

struct TrackingScrollView<Content: View>: UIViewRepresentable {
    @Binding var offsetY: CGFloat
    let showsIndicators: Bool
    let content: Content

    init(offsetY: Binding<CGFloat>,
         showsIndicators: Bool = true,
         @ViewBuilder content: () -> Content) {
        self._offsetY = offsetY
        self.showsIndicators = showsIndicators
        self.content = content()
    }

    func makeCoordinator() -> UIScrollCoordinator { UIScrollCoordinator(self) }

    func makeUIView(context: Context) -> UIScrollView {
        let scrollView = UIScrollView()
        scrollView.delegate = context.coordinator
        scrollView.alwaysBounceVertical = true
        scrollView.showsVerticalScrollIndicator = showsIndicators

        let host = UIHostingController(rootView: content)
        host.view.backgroundColor = .clear
        host.view.translatesAutoresizingMaskIntoConstraints = false

        scrollView.addSubview(host.view)

        NSLayoutConstraint.activate([
            host.view.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            host.view.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            host.view.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            host.view.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),
            host.view.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor)
        ])

        context.coordinator.hostingController = host
        return scrollView
    }

    func updateUIView(_ scrollView: UIScrollView, context: Context) {
        context.coordinator.parent = self
        context.coordinator.hostingController?.rootView = content
    }

    final class UIScrollCoordinator: NSObject, UIScrollViewDelegate {
        var parent: TrackingScrollView
        weak var hostingController: UIHostingController<Content>?

        init(_ parent: TrackingScrollView) { self.parent = parent }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            // прямой доступ к contentOffset.y
            parent.offsetY = scrollView.contentOffset.y
        }
    }
}
