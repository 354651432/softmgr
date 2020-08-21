public class MessageDialog : Gtk.Dialog {
    string message;
    public MessageDialog(string title, string message) {
        Object(title: title);
        this.message = message;
        this.parent = mainWin;
        this.modal = true;
    }

    public void showDialog() {
        this.get_content_area().add(new Gtk.Label(this.message));
        this.show_all();
    }
}