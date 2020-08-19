int main(string[] args) {
    var app = new Gtk.Application("com.gyay", GLib.ApplicationFlags.FLAGS_NONE);
    app.activate.connect(() => {
        var win = app.active_window;
        if (win == null) {
            win = new ApplicationWindow(app);
        }
        win.present();
    });

    return app.run(args);
}