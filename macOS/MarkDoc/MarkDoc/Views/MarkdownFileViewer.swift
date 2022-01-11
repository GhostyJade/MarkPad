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

struct MarkdownFileViewer : View {
    @State private var model: PageViewModel = PageViewModel(markdown: "")    
    @State private var showPreview : Bool = false
    @State private var editMode : Bool = false

    var body: some View{
        GeometryReader{ metrics in
            HStack {
                if editMode{
                    TextEditor(text: $model.markdown)
                        .frame(width: metrics.size.width * (showPreview ? 0.5 : 1))
                }
                if (showPreview || !editMode) {
                    MarkdownWebView(viewModel: model)
                }
            }.toolbar{
                ToolbarItem{
                    Button(action: {}){
                        Label("Save", systemImage: "square.and.arrow.up")
                    }
                }
                ToolbarItem{
                    Button(action: toggleEdit){
                        Label("Edit", systemImage: "pencil")
                    }
                }
                ToolbarItem{
                    Button(action: togglePreviewPanel){
                        Label("Toggle Preview Panel", systemImage: "square.lefthalf.filled")
                    }
                }
            }
        }
    }
    
    private func togglePreviewPanel() {
        self.showPreview = !showPreview
    }
    
    private func toggleEdit() {
        self.editMode = !editMode
    }
}

struct MarkdownFileViewer_Previews: PreviewProvider {
    static var previews: some View {
        MarkdownFileViewer()
    }
}
