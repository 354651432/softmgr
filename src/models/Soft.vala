public class Soft : Object {
    public string softId { set; get; }
    public string header { set; get; }
    public string intro { set; get; }
    public string ? icon {
        owned get {
            return controller.getIcon(softId) ?? "applications-system";
        }
    }
    public Gee.HashMap<string, string> detail {
        owned get {
            return controller.detail(softId);
        }
    }

    public Gee.HashMap<string, string> installDetail {
        owned get {
            return controller.installDetail(softId);
        }
    }

    public Soft(string softId, string intro, string header = "") {
        Object(softId: softId, intro: intro, header: header);
    }

    public static IController controller { set; get; }

    public string install() {
        return controller.install(softId);
    }

    public string uninstall() {
        return controller.uninstall(softId);
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