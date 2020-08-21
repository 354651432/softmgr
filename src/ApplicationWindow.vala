public class ApplicationWindow : Gtk.ApplicationWindow {
    Gtk.Dialog loading { set; get; }
    public ApplicationWindow(Gtk.Application app) {
        Object(application: app);

        set_default_size(800, 600);
        set_position(Gtk.WindowPosition.CENTER);

        addTitleBar();
        loading = new Gtk.Dialog();
        loading.parent = this;
        loading.set_size_request(300, 100);
        loading.modal = true;
    }

    public void showLoaing(string message = "Loading") {
        loading.get_content_area().add(new Gtk.Label(message));
        loading.show_all();
    }

    public void closeLoaing() {
        loading.hide();
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

        var provider = new Gtk.CssProvider();
        provider.load_from_resource("/res/main.css");
        Gtk.StyleContext.add_provider_for_screen(Gdk.Screen.get_default(), provider, Gtk.STYLE_PROVIDER_PRIORITY_APPLICATION);
    }
}
