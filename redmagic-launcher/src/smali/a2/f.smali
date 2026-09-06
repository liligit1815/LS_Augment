.class public final synthetic La2/f;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:La2/e$b;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(La2/e$b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La2/f;->a:La2/e$b;

    .line 5
    .line 6
    iput-boolean p2, p0, La2/f;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, La2/f;->a:La2/e$b;

    .line 2
    .line 3
    iget-boolean p0, p0, La2/f;->b:Z

    .line 4
    .line 5
    check-cast p1, La2/a;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, La2/e$b;->N(La2/e$b;ZLa2/a;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
