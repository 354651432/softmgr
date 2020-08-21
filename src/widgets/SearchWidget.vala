public class SearchWidget : Gtk.Box {
    public Gtk.Entry entry { set; get; }
    public Gtk.Button button { set; get; }

    public signal void onSearch(string keyword);

    public SearchWidget() {
        Object(
            orientation: Gtk.Orientation.HORIZONTAL,
            spacing: 3,
            margin: 3,
            valign: Gtk.Align.START,
            entry: new Gtk.Entry(),
            button: new Gtk.Button.from_icon_name("system-search", Gtk.IconSize.BUTTON)
        );

        entry.expand = true;
        pack_start(entry);
        pack_end(button, false, false);

        button.clicked.connect(() => {
            onSearch(entry.get_text());
        });

        get_style_context().add_class("search-widget");
    }
}