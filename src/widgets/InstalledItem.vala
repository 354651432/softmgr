public class InstalledItem : Gtk.Box {
    public Soft soft { set; get; }
    public Gtk.Button installButton { set; get; }
    public InstalledItem(Soft soft) {
        Object(
            orientation: Gtk.Orientation.HORIZONTAL,
            soft: soft,
            installButton: new Gtk.Button.from_icon_name("list-remove"),
            margin: 3
        );

        modify_bg(Gtk.StateType.NORMAL, parseColor("#ffffff"));
        pack_start(new Gtk.Label(soft.intro), false);
        pack_end(installButton, false);

        Gtk.Button detailBUtton = new Gtk.Button.from_icon_name("dialog-information");
        detailBUtton.clicked.connect(() => {
            DetailDialog.showSoftDialog(soft);
        });
        pack_end(detailBUtton, false);
    }

    Gdk.Color parseColor(string spec) {
        Gdk.Color ret;
        Gdk.Color.parse(spec, out ret);

        return ret;
    }
}