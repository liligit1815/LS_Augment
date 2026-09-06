.class LJ/Z$c;
.super LJ/Z$b;
.source "WindowInsetsControllerCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "c"
.end annotation


# direct methods
.method constructor <init>(Landroid/view/Window;LJ/Z;LJ/C;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LJ/Z$b;-><init>(Landroid/view/Window;LJ/Z;LJ/C;)V

    return-void
.end method

.method constructor <init>(Landroid/view/WindowInsetsController;LJ/Z;LJ/C;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, LJ/Z$b;-><init>(Landroid/view/WindowInsetsController;LJ/Z;LJ/C;)V

    return-void
.end method


# virtual methods
.method public b()Z
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Z$a;->b:Landroid/view/WindowInsetsController;

    .line 2
    .line 3
    invoke-interface {p0}, Landroid/view/WindowInsetsController;->getSystemBarsAppearance()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    and-int/lit8 p0, p0, 0x8

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
