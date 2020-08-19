public interface IController : Object {
    public abstract void install(string softId);
    public abstract void uninstall(string softId);

    public abstract List<Soft> installed();
    public abstract List<Soft> search(string keyword);

    public abstract Gee.HashMap<string, string> detail(string softId);
}