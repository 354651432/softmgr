public class InstalledItem : Gtk.Box {
    public Soft soft { set; get; }
    public Gtk.Button uninstallButton { set; get; }
    public InstalledItem(Soft soft) {
        Object(
            orientation: Gtk.Orientation.HORIZONTAL,
            soft: soft,
            uninstallButton: new Gtk.Button.from_icon_name("list-remove"),
            margin: 3
        );

        modify_bg(Gtk.StateType.NORMAL, parseColor("#ffffff"));

        var label = new Gtk.Label(soft.intro);
        label.set_line_wrap(true);
        label.set_line_wrap_mode(Pango.WrapMode.CHAR);
        pack_start(label, false);
        pack_end(uninstallButton, false);

        Gtk.Button detailBUtton = new Gtk.Button.from_icon_name("dialog-information");
        detailBUtton.clicked.connect(() => {
            var dialog = new DetailDialog(soft);
            dialog.showInstallDetail();
        });

        uninstallButton.clicked.connect(() => {
        });
        pack_end(detailBUtton, false);
    }

    Gdk.Color parseColor(string spec) {
        Gdk.Color ret;
        Gdk.Color.parse(spec, out ret);

        return ret;
    }
}