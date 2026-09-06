.class Landroidx/appcompat/app/g$h;
.super Ljava/lang/Object;
.source "AppCompatDelegateImpl.java"

# interfaces
.implements Landroidx/appcompat/view/b$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/appcompat/app/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "h"
.end annotation


# instance fields
.field private a:Landroidx/appcompat/view/b$a;

.field final synthetic b:Landroidx/appcompat/app/g;


# direct methods
.method public constructor <init>(Landroidx/appcompat/app/g;Landroidx/appcompat/view/b$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Landroidx/appcompat/app/g$h;->a:Landroidx/appcompat/view/b$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Landroidx/appcompat/view/b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/g$h;->a:Landroidx/appcompat/view/b$a;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Landroidx/appcompat/view/b$a;->a(Landroidx/appcompat/view/b;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 7
    .line 8
    iget-object v0, p1, Landroidx/appcompat/app/g;->C:Landroid/widget/PopupWindow;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Landroidx/appcompat/app/g;->r:Landroid/view/Window;

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iget-object v0, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 19
    .line 20
    iget-object v0, v0, Landroidx/appcompat/app/g;->D:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p1, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 26
    .line 27
    iget-object v0, p1, Landroidx/appcompat/app/g;->B:Landroidx/appcompat/widget/ActionBarContextView;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroidx/appcompat/app/g;->g0()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 35
    .line 36
    iget-object v0, p1, Landroidx/appcompat/app/g;->B:Landroidx/appcompat/widget/ActionBarContextView;

    .line 37
    .line 38
    invoke-static {v0}, LJ/I;->d(Landroid/view/View;)LJ/S;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const/4 v1, 0x0

    .line 43
    invoke-virtual {v0, v1}, LJ/S;->b(F)LJ/S;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iput-object v0, p1, Landroidx/appcompat/app/g;->E:LJ/S;

    .line 48
    .line 49
    iget-object p1, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 50
    .line 51
    iget-object p1, p1, Landroidx/appcompat/app/g;->E:LJ/S;

    .line 52
    .line 53
    new-instance v0, Landroidx/appcompat/app/g$h$a;

    .line 54
    .line 55
    invoke-direct {v0, p0}, Landroidx/appcompat/app/g$h$a;-><init>(Landroidx/appcompat/app/g$h;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1, v0}, LJ/S;->g(LJ/T;)LJ/S;

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object p1, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 62
    .line 63
    iget-object v0, p1, Landroidx/appcompat/app/g;->t:Landroidx/appcompat/app/d;

    .line 64
    .line 65
    if-eqz v0, :cond_2

    .line 66
    .line 67
    iget-object p1, p1, Landroidx/appcompat/app/g;->A:Landroidx/appcompat/view/b;

    .line 68
    .line 69
    invoke-interface {v0, p1}, Landroidx/appcompat/app/d;->c(Landroidx/appcompat/view/b;)V

    .line 70
    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 73
    .line 74
    const/4 v0, 0x0

    .line 75
    iput-object v0, p1, Landroidx/appcompat/app/g;->A:Landroidx/appcompat/view/b;

    .line 76
    .line 77
    iget-object p1, p1, Landroidx/appcompat/app/g;->H:Landroid/view/ViewGroup;

    .line 78
    .line 79
    invoke-static {p1}, LJ/I;->f0(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroidx/appcompat/app/g;->a1()V

    .line 85
    .line 86
    .line 87
    return-void
.end method

.method public b(Landroidx/appcompat/view/b;Landroid/view/Menu;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/app/g$h;->a:Landroidx/appcompat/view/b$a;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroidx/appcompat/view/b$a;->b(Landroidx/appcompat/view/b;Landroid/view/Menu;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Landroidx/appcompat/view/b;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/app/g$h;->a:Landroidx/appcompat/view/b$a;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Landroidx/appcompat/view/b$a;->c(Landroidx/appcompat/view/b;Landroid/view/MenuItem;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public d(Landroidx/appcompat/view/b;Landroid/view/Menu;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/g$h;->b:Landroidx/appcompat/app/g;

    .line 2
    .line 3
    iget-object v0, v0, Landroidx/appcompat/app/g;->H:Landroid/view/ViewGroup;

    .line 4
    .line 5
    invoke-static {v0}, LJ/I;->f0(Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Landroidx/appcompat/app/g$h;->a:Landroidx/appcompat/view/b$a;

    .line 9
    .line 10
    invoke-interface {p0, p1, p2}, Landroidx/appcompat/view/b$a;->d(Landroidx/appcompat/view/b;Landroid/view/Menu;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method
