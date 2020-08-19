public class YayController : Object, IController {
    public void install(string softId) {
        stdout.printf("installing %s\n", softId);
    }

    public void uninstall(string softId) {
        stdout.printf("uninstalling %s\n", softId);
    }

    public List<Soft> installed() {
        string output = exec("yay -Q");
        var lines = output.split("\n");

        List<Soft> result = new List<Soft>();
        foreach (var line in lines) {
            line = line.strip();
            var arr = line.split(" ");
            result.append(new Soft(arr[0], line));
        }

        return result;
    }

    public List<Soft> search(string keyword) {
        List<Soft> result = new List<Soft>();
        if (keyword == "") {
            print("keyword is empty\n");
            return result;
        }

        string output = exec(@"yay -Ss $(keyword)");
        if (output == "") {
            print("output is empty\n");
            return result;
        }

        var arr = output.split("\n");
        for (int i = 0; i < arr.length; i += 2) {
            var arr1 = arr[i].split(" ", 2);
            if (arr1.length <= 2) {
                continue;
            }
            var name = arr1[0];
            result.append(new Soft(name, arr[i + 1].strip()));
        }

        print("search result length:%u\n", result.length());
        return result;
    }

    public Gee.HashMap<string, string> detail(string softId) {
        var output = exec(@"yay -Qi $(softId)");
        Gee.HashMap<string, string> result = new Gee.HashMap<string, string>();
        var key = "";
        foreach (var line in output.split("\n")) {
            line = line.strip();
            var arr = line.split(":", 2);

            if (arr.length == 1 && key != "") {
                result[key] += line;
                continue;
            }
            key = arr[0];
            key = key.strip();
            if (key == "") {
                continue;
            }

            var value = arr[1];
            result[key] = value;
        }

        return result;
    }

    string exec(string cmd) {
        string output;
        Process.spawn_command_line_sync(cmd, out output);

        return output.strip();
    }
}