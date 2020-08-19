public class Soft : Object {
    public string softId { set; get; }
    public string intro { set; get; }
    public Gee.HashMap<string, string> detail {
        owned get {
            return controller.detail(softId);
        }
    }

    public Soft(string softId, string intro) {
        Object(softId: softId, intro: intro);
    }

    public static IController controller { set; get; }

    public void install() {
        controller.install(softId);
    }

    public void uninstall() {
        controller.uninstall(softId);
    }

    public static void bindController(IController controller) {
        Soft.controller = controller;
    }

    public static List<Soft> installed() {
        return Soft.controller.installed();
    }

    public static List<Soft> search(string keyword) {
        return controller.search(keyword);
    }
}