.class LJ/Z$a;
.super LJ/Z$d;
.source "WindowInsetsControllerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "a"
.end annotation


# instance fields
.field final a:LJ/Z;

.field final b:Landroid/view/WindowInsetsController;

.field final c:LJ/C;

.field private final d:Lo/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lo/r<",
            "Ljava/lang/Object;",
            "Landroid/view/WindowInsetsController$OnControllableInsetsChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field protected e:Landroid/view/Window;


# direct methods
.method constructor <init>(Landroid/view/Window;LJ/Z;LJ/C;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/Window;->getInsetsController()Landroid/view/WindowInsetsController;

    move-result-object v0

    invoke-direct {p0, v0, p2, p3}, LJ/Z$a;-><init>(Landroid/view/WindowInsetsController;LJ/Z;LJ/C;)V

    .line 2
    iput-object p1, p0, LJ/Z$a;->e:Landroid/view/Window;

    return-void
.end method

.method constructor <init>(Landroid/view/WindowInsetsController;LJ/Z;LJ/C;)V
    .locals 1

    .line 3
    invoke-direct {p0}, LJ/Z$d;-><init>()V

    .line 4
    new-instance v0, Lo/r;

    invoke-direct {v0}, Lo/r;-><init>()V

    iput-object v0, p0, LJ/Z$a;->d:Lo/r;

    .line 5
    iput-object p1, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 6
    iput-object p2, p0, LJ/Z$a;->a:LJ/Z;

    .line 7
    iput-object p3, p0, LJ/Z$a;->c:LJ/C;

    return-void
.end method


# virtual methods
.method a(I)V
    .locals 1

    .line 1
    and-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LJ/Z$a;->c:LJ/C;

    .line 6
    .line 7
    invoke-virtual {v0}, LJ/C;->a()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 11
    .line 12
    and-int/lit8 p1, p1, -0x9

    .line 13
    .line 14
    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->hide(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public b()Z
    .locals 2

    .line 1
    iget-object v0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1, v1}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 8
    .line 9
    invoke-interface {p0}, Landroid/view/WindowInsetsController;->getSystemBarsAppearance()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    and-int/lit8 p0, p0, 0x8

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    return v1
.end method

.method public c(Z)V
    .locals 1

    .line 1
    const/16 v0, 0x10

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p1, p0, LJ/Z$a;->e:Landroid/view/Window;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, LJ/Z$a;->f(I)V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 13
    .line 14
    invoke-interface {p0, v0, v0}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 15
    .line 16
    .line 17
    return-void

    .line 18
    :cond_1
    iget-object p1, p0, LJ/Z$a;->e:Landroid/view/Window;

    .line 19
    .line 20
    if-eqz p1, :cond_2

    .line 21
    .line 22
    invoke-virtual {p0, v0}, LJ/Z$a;->g(I)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-interface {p0, p1, v0}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public d(Z)V
    .locals 2

    .line 1
    const/16 v0, 0x2000

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    iget-object p1, p0, LJ/Z$a;->e:Landroid/view/Window;

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0}, LJ/Z$a;->f(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 15
    .line 16
    invoke-interface {p0, v1, v1}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    iget-object p1, p0, LJ/Z$a;->e:Landroid/view/Window;

    .line 21
    .line 22
    if-eqz p1, :cond_2

    .line 23
    .line 24
    invoke-virtual {p0, v0}, LJ/Z$a;->g(I)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-interface {p0, p1, v1}, Landroid/view/WindowInsetsController;->setSystemBarsAppearance(II)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method e(I)V
    .locals 1

    .line 1
    and-int/lit8 v0, p1, 0x8

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LJ/Z$a;->c:LJ/C;

    .line 6
    .line 7
    invoke-virtual {v0}, LJ/C;->b()V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 11
    .line 12
    and-int/lit8 p1, p1, -0x9

    .line 13
    .line 14
    invoke-interface {p0, p1}, Landroid/view/WindowInsetsController;->show(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method protected f(I)V
    .locals 1

    .line 1
    iget-object p0, p0, LJ/Z$a;->e:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    or-int/2addr p1, v0

    .line 12
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected g(I)V
    .locals 1

    .line 1
    iget-object p0, p0, LJ/Z$a;->e:Landroid/view/Window;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    not-int p1, p1

    .line 12
    and-int/2addr p1, v0

    .line 13
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
