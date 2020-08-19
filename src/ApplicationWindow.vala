public class ApplicationWindow : Gtk.ApplicationWindow {
    public ApplicationWindow(Gtk.Application app) {
        Object(application: app);

        set_default_size(500, 300);
        set_position(Gtk.WindowPosition.CENTER);

        addTitleBar();
    }

    void addTitleBar() {
        var headerBar = new Gtk.HeaderBar();
        headerBar.set_show_close_button(true);
        set_titlebar(headerBar);

        var switcher = new Gtk.StackSwitcher();
        var stack = new Gtk.Stack();
        add(stack);
        switcher.stack = stack;

        headerBar.custom_title = switcher;
        stack.add_titled(new SearchBox(), "search", "search");
        stack.add_titled(new InstalledBox(), "installed", "installed");
    }
}
