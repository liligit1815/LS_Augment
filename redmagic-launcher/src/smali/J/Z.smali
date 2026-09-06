.class public final LJ/Z;
.super Ljava/lang/Object;
.source "WindowInsetsControllerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LJ/Z$c;,
        LJ/Z$d;,
        LJ/Z$a;,
        LJ/Z$b;
    }
.end annotation


# instance fields
.field private final a:LJ/Z$d;


# direct methods
.method public constructor <init>(Landroid/view/Window;Landroid/view/View;)V
    .locals 2

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    new-instance v0, LJ/C;

    invoke-direct {v0, p2}, LJ/C;-><init>(Landroid/view/View;)V

    .line 7
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt p2, v1, :cond_0

    .line 8
    new-instance p2, LJ/Z$c;

    invoke-direct {p2, p1, p0, v0}, LJ/Z$c;-><init>(Landroid/view/Window;LJ/Z;LJ/C;)V

    iput-object p2, p0, LJ/Z;->a:LJ/Z$d;

    return-void

    .line 9
    :cond_0
    new-instance p2, LJ/Z$a;

    invoke-direct {p2, p1, p0, v0}, LJ/Z$a;-><init>(Landroid/view/Window;LJ/Z;LJ/C;)V

    iput-object p2, p0, LJ/Z;->a:LJ/Z$d;

    return-void
.end method

.method private constructor <init>(Landroid/view/WindowInsetsController;)V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x23

    if-lt v0, v1, :cond_0

    .line 3
    new-instance v0, LJ/Z$c;

    new-instance v1, LJ/C;

    invoke-direct {v1, p1}, LJ/C;-><init>(Landroid/view/WindowInsetsController;)V

    invoke-direct {v0, p1, p0, v1}, LJ/Z$c;-><init>(Landroid/view/WindowInsetsController;LJ/Z;LJ/C;)V

    iput-object v0, p0, LJ/Z;->a:LJ/Z$d;

    return-void

    .line 4
    :cond_0
    new-instance v0, LJ/Z$a;

    new-instance v1, LJ/C;

    invoke-direct {v1, p1}, LJ/C;-><init>(Landroid/view/WindowInsetsController;)V

    invoke-direct {v0, p1, p0, v1}, LJ/Z$a;-><init>(Landroid/view/WindowInsetsController;LJ/Z;LJ/C;)V

    iput-object v0, p0, LJ/Z;->a:LJ/Z$d;

    return-void
.end method

.method public static f(Landroid/view/WindowInsetsController;)LJ/Z;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    new-instance v0, LJ/Z;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LJ/Z;-><init>(Landroid/view/WindowInsetsController;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Z;->a:LJ/Z$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Z$d;->a(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Z;->a:LJ/Z$d;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Z$d;->b()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Z;->a:LJ/Z$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Z$d;->c(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Z;->a:LJ/Z$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Z$d;->d(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e(I)V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Z;->a:LJ/Z$d;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LJ/Z$d;->e(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
