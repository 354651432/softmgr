public class SearchBox : Gtk.Box {
    public Gtk.Entry entry { set; get; }

    public SearchWidget searchWidget { set; get; }

    public SearchBox() {
        Object(
            orientation: Gtk.Orientation.VERTICAL,
            entry: new Gtk.Entry(),
            homogeneous: false,
            valign: Gtk.Align.START,
            margin: 3,
            spacing: 3,

            searchWidget: new SearchWidget()
        );

        pack_start(searchWidget);
        addListView();
    }

    void addListView() {
        var scrollWin = new Gtk.ScrolledWindow(null, null);
        scrollWin.height_request = 300;
        pack_start(scrollWin, true, true);

        var listBox = new Gtk.Box(Gtk.Orientation.VERTICAL, 3);
        scrollWin.add_with_viewport(listBox);

        foreach (Soft soft in Soft.installed()) {
            listBox.add(new SearchItem(soft));
        }
    }
}