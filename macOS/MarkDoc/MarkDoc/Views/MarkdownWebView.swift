/*
    MarkPad - A Markdown Notepad
    Copyright (C) 2022  GhostyJade <ghostyjade2410@gmail.com>
 
    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
 
    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
 
    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
*/

import SwiftUI
import WebKit

struct MarkdownWebView : NSViewRepresentable {
    public typealias NSViewType = WKWebView
    @ObservedObject var viewModel: PageViewModel
    
    private let view: WKWebView = WKWebView()
    func makeNSView(context: Context) -> WKWebView {
        let formattedHtml = DataUtils.convertMarkdownToHtml(markdown: viewModel.markdown)
        view.loadHTMLString(formattedHtml, baseURL: nil)
        
        return view
    }
    
    func updateNSView(_ nsView: WKWebView, context: Context) {
        let formattedHtml = DataUtils.convertMarkdownToHtml(markdown: viewModel.markdown)
        nsView.loadHTMLString(formattedHtml, baseURL: nil)
    }
}
