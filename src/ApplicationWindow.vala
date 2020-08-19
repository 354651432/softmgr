public class ApplicationWindow : Gtk.ApplicationWindow {
    public ApplicationWindow(Gtk.Application app) {
        Object(application: app);

        set_default_size(500, 300);
        set_position(Gtk.WindowPosition.CENTER);
    }
}
