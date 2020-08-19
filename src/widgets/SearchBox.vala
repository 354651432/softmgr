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
        add_with_viewport(vbox);

        vbox.pack_start(searchWidget);
        searchWidget.onSearch.connect((sender, keyword) => {
            foreach (Soft soft in Soft.search(keyword.strip())) {
                vbox.pack_start(new SearchItem(soft));
            }
            vbox.show_all();
        });
    }
}