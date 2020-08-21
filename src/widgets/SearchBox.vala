public class SearchBox : Gtk.ScrolledWindow {
    public Gtk.Entry entry { set; get; }
    public SearchWidget searchWidget { set; get; }
    Gtk.Box vbox;
    public SearchBox() {
        Object(
            entry: new Gtk.Entry(),
            searchWidget: new SearchWidget()
        );
        vbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 3);
        vbox.valign = Gtk.Align.START;
        add_with_viewport(vbox);
        resetVBox(vbox);

        searchWidget.onSearch.connect((sender, keyword) => {
            // mainWin.showLoaing();
            // Gtk.main_iteration_do(true);
            resetVBox(vbox);
            foreach (Soft soft in Soft.search(keyword.strip())) {
                vbox.pack_start(new SearchItem(soft));
                // Gtk.main_iteration_do(false);
            }
            vbox.show_all();
            // mainWin.closeLoaing();
        });
    }

    void resetVBox(Gtk.Box box) {
        foreach (Gtk.Widget child in vbox.get_children()) {
            vbox.remove(child);
        }
        vbox.pack_start(searchWidget);
    }
}