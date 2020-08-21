public ApplicationWindow mainWin;
int main(string[] args) {
    Gtk.Application app = new Gtk.Application("com.gyay", GLib.ApplicationFlags.FLAGS_NONE);
    app.activate.connect(() => {
        var win = app.active_window;
        if (win == null) {
            win = new ApplicationWindow(app);
            global::mainWin = win as ApplicationWindow;
        }
        win.show_all();
    });

    Soft.bindController(new YayController());
    return app.run(args);
}