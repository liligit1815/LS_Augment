package ls.augment.com.step;

/** A task number alone is not identity: numbers can be reused and users/displays can change. */
public final class TaskIdentity {
    public final int id, user, display;
    public final Object token;
    public TaskIdentity(int id, int user, int display, Object token) {
        if (id <= 0 || user < 0 || display != 0 || token == null) throw new IllegalArgumentException("invalid original task identity");
        this.id=id; this.user=user; this.display=display; this.token=token;
    }
    public boolean matches(int id, int user, int display, Object token) {
        return this.id==id && this.user==user && this.display==display && this.token.equals(token);
    }
}
