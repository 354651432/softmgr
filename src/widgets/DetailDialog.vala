public class DetailDialog : Gtk.Dialog {

    public Soft soft { set; get; }
    public DetailDialog(Soft soft) {
        Object(
            visible: true,
            soft: soft,
            width_request: 300,
            height_request: 180,
            title: @"$(soft.softId) detail"
        );

        add_button("close", 0);
        var tree = new Gtk.TreeView();
        get_content_area().add(tree);

        var store = new Gtk.ListStore(2, typeof (string), typeof (string));
        tree.set_model(store);
        tree.insert_column_with_attributes(-1, "Field", new Gtk.CellRendererText(), "text", 0);
        tree.insert_column_with_attributes(-1, "Value", new Gtk.CellRendererText(), "text", 1);

        Gtk.TreeIter it;
        foreach (var it1 in soft.detail) {
            store.append(out it);
            store.set(it, 0, it1.key, 1, it1.value);
        }

        response.connect(() => {
            this.close();
        });
    }

    public static void showSoftDialog(Soft soft) {
        var dialog = new DetailDialog(soft);
        dialog.show_all();
    }
}