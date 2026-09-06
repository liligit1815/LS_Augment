.class LJ/Y$h;
.super LJ/Y$g;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "h"
.end annotation


# instance fields
.field private i:LB/b;

.field private j:LB/b;

.field private k:LB/b;


# direct methods
.method constructor <init>(LJ/Y;LJ/Y$h;)V
    .locals 0

    .line 5
    invoke-direct {p0, p1, p2}, LJ/Y$g;-><init>(LJ/Y;LJ/Y$g;)V

    const/4 p1, 0x0

    .line 6
    iput-object p1, p0, LJ/Y$h;->i:LB/b;

    .line 7
    iput-object p1, p0, LJ/Y$h;->j:LB/b;

    .line 8
    iput-object p1, p0, LJ/Y$h;->k:LB/b;

    return-void
.end method

.method constructor <init>(LJ/Y;Landroid/view/WindowInsets;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LJ/Y$g;-><init>(LJ/Y;Landroid/view/WindowInsets;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, LJ/Y$h;->i:LB/b;

    .line 3
    iput-object p1, p0, LJ/Y$h;->j:LB/b;

    .line 4
    iput-object p1, p0, LJ/Y$h;->k:LB/b;

    return-void
.end method


# virtual methods
.method h()LB/b;
    .locals 1

    .line 1
    iget-object v0, p0, LJ/Y$h;->j:LB/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getMandatorySystemGestureInsets()Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, LB/b;->c(Landroid/graphics/Insets;)LB/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LJ/Y$h;->j:LB/b;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, LJ/Y$h;->j:LB/b;

    .line 18
    .line 19
    return-object p0
.end method

.method j()LB/b;
    .locals 1

    .line 1
    iget-object v0, p0, LJ/Y$h;->i:LB/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getSystemGestureInsets()Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, LB/b;->c(Landroid/graphics/Insets;)LB/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LJ/Y$h;->i:LB/b;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, LJ/Y$h;->i:LB/b;

    .line 18
    .line 19
    return-object p0
.end method

.method l()LB/b;
    .locals 1

    .line 1
    iget-object v0, p0, LJ/Y$h;->k:LB/b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/WindowInsets;->getTappableElementInsets()Landroid/graphics/Insets;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, LB/b;->c(Landroid/graphics/Insets;)LB/b;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, LJ/Y$h;->k:LB/b;

    .line 16
    .line 17
    :cond_0
    iget-object p0, p0, LJ/Y$h;->k:LB/b;

    .line 18
    .line 19
    return-object p0
.end method

.method m(IIII)LJ/Y;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$e;->c:Landroid/view/WindowInsets;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/WindowInsets;->inset(IIII)Landroid/view/WindowInsets;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, LJ/Y;->v(Landroid/view/WindowInsets;)LJ/Y;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
