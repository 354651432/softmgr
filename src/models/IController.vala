public interface IController : Object {
    public abstract string install(string softId);
    public abstract string uninstall(string softId);

    public abstract List<Soft> installed();
    public abstract List<Soft> search(string keyword);

    public abstract Gee.HashMap<string, string> detail(string softId);

    public abstract Gee.HashMap<string, string> installDetail(string softId);

    public abstract string ? getIcon(string softId);
}