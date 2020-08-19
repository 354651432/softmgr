public class YayController : Object, IController {
    public void install(string softId) {
        stdout.printf("installing %s\n", softId);
    }

    public void uninstall(string softId) {
        stdout.printf("uninstalling %s\n", softId);
    }

    public List<Soft> installed() {
        // string output;
        // Process.spawn_command_line_sync("yay -Q", out output);
        // print(output);

        List<Soft> result = new List<Soft>();
        for (var i = 0; i < 100; i++) {
            result.append(new Soft("vim", "vim is vim"));
            result.append(new Soft("gim", "gim ....."));
        }


        return result;
    }

    public List<Soft> search(string keyword) {
        return installed();
    }

    public Gee.HashMap<string, string> detail(string softId) {
        Gee.HashMap<string, string> result = new Gee.HashMap<string, string>();
        result["copyright"] = "none";
        result["homepage"] = "baidu.com";
        return result;
    }
}