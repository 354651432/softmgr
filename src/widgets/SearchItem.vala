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

        installButton.valign = Gtk.Align.START;
        detailButton.valign = Gtk.Align.START;
        pack_end(installButton, false);
        pack_end(detailButton, false);

        installButton.clicked.connect(() => {
            soft.install();
        });
        detailButton.clicked.connect(() => {
            var diloag = new DetailDialog(soft);
            diloag.showInstallDetail();
        });

        logo();
        label();
    }

    void label() {
        var hbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        pack_start(hbox);
        var label = new Gtk.Label(soft.intro);
        label.set_line_wrap(true);
        label.set_line_wrap_mode(Pango.WrapMode.CHAR);
        label.halign = Gtk.Align.START;

        var header = new Gtk.Label(soft.header);
        header.halign = Gtk.Align.START;
        hbox.pack_start(header);
        hbox.pack_start(label, false);
    }

    void logo() {
        var img = new Gtk.Image.from_icon_name("application-default-icon", Gtk.IconSize.DND);
        img.margin = 10;
        pack_start(img, false);
    }

    Gdk.Color parseColor(string spec) {
        Gdk.Color ret;
        Gdk.Color.parse(spec, out ret);

        return ret;
    }
}