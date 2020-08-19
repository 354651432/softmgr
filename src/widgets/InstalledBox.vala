public class InstalledBox : Gtk.ScrolledWindow {
    public InstalledBox() {
        var vbox = new Gtk.Box(Gtk.Orientation.VERTICAL, 0);
        foreach (Soft it in Soft.installed()) {
            vbox.pack_start(new InstalledItem(it));
        }
        add_with_viewport(vbox);
    }
}