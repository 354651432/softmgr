public class DetailDialog : Gtk.Dialog {

    public Soft soft { set; get; }
    public DetailDialog(Soft soft) {
        Object(
            visible: true,
            soft: soft,
            width_request: 500,
            height_request: 180,
            title: @"$(soft.softId) detail"
        );

        add_button("close", 0);

        response.connect(() => {
            this.close();
        });
    }

    void showBase(Gee.HashMap<string, string> info) {
        var tree = new Gtk.TreeView();
        get_content_area().add(tree);
        var store = new Gtk.ListStore(2, typeof (string), typeof (string));
        tree.set_model(store);
        tree.insert_column_with_attributes(-1, "Field", new Gtk.CellRendererText(), "text", 0);
        var textRender = new Gtk.CellRendererText();
        textRender.ellipsize = Pango.EllipsizeMode.END;
        tree.insert_column_with_attributes(-1, "Value", textRender, "text", 1);

        Gtk.TreeIter it;
        foreach (var it1 in info) {
            if (it1.key.strip() == "") {
                continue;
            }
            store.append(out it);
            store.set(it, 0, it1.key, 1, it1.value);
        }
        show_all();
    }

    public void showDetail() {
        showBase(soft.detail);
    }

    public void showInstallDetail() {
        showBase(soft.installDetail);
    }
}