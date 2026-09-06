.class public final synthetic LW3/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements LJ/x;


# instance fields
.field public final synthetic a:LW3/b;

.field public final synthetic b:Z


# direct methods
.method public synthetic constructor <init>(LW3/b;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LW3/a;->a:LW3/b;

    .line 5
    .line 6
    iput-boolean p2, p0, LW3/a;->b:Z

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;LJ/Y;)LJ/Y;
    .locals 1

    .line 1
    iget-object v0, p0, LW3/a;->a:LW3/b;

    .line 2
    .line 3
    iget-boolean p0, p0, LW3/a;->b:Z

    .line 4
    .line 5
    invoke-static {v0, p0, p1, p2}, LW3/b;->D(LW3/b;ZLandroid/view/View;LJ/Y;)LJ/Y;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
