public class SearchItem : Gtk.Box {
    public Soft soft { set; get; }
    public Gtk.Button installButton { set; get; }
    public Gtk.Button detailButton { set; get; }

    public SearchItem(Soft soft) {
        Object(
            orientation: Gtk.Orientation.HORIZONTAL,
            soft: soft,
            installButton: new Gtk.Button.from_icon_name("list-add"),
            detailButton: new Gtk.Button.from_icon_name("dialog-information"),
            margin: 3
        );

        modify_bg(Gtk.StateType.NORMAL, parseColor("#ffffff"));
        var label = new Gtk.Label(soft.intro);
        label.set_line_wrap(true);
        label.set_line_wrap_mode(Pango.WrapMode.CHAR);

        pack_start(label, false);
        pack_end(installButton, false);
        pack_end(detailButton, false);

        installButton.clicked.connect(() => {
            soft.install();
        });
        detailButton.clicked.connect(() => {
            DetailDialog.showSoftDialog(soft);
        });
    }

    Gdk.Color parseColor(string spec) {
        Gdk.Color ret;
        Gdk.Color.parse(spec, out ret);

        return ret;
    }
}