.class Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;
.super LJ/a;
.source "AppBarLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->Y(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic j:Lcom/google/android/material/appbar/AppBarLayout;

.field final synthetic k:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

.field final synthetic l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;


# direct methods
.method constructor <init>(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;Lcom/google/android/material/appbar/AppBarLayout;Landroidx/coordinatorlayout/widget/CoordinatorLayout;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->k:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 6
    .line 7
    invoke-direct {p0}, LJ/a;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public g(Landroid/view/View;LK/d;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, LJ/a;->g(Landroid/view/View;LK/d;)V

    .line 2
    .line 3
    .line 4
    const-class p1, Landroid/widget/ScrollView;

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p2, p1}, LK/d;->i0(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 23
    .line 24
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->k:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 25
    .line 26
    invoke-static {p1, v0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->V(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;Landroidx/coordinatorlayout/widget/CoordinatorLayout;)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    if-nez p1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 34
    .line 35
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->W(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;Lcom/google/android/material/appbar/AppBarLayout;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_2

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->Q()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iget-object v1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/google/android/material/appbar/AppBarLayout;->getTotalScrollRange()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    neg-int v1, v1

    .line 57
    const/4 v2, 0x1

    .line 58
    if-eq v0, v1, :cond_3

    .line 59
    .line 60
    sget-object v0, LK/d$a;->q:LK/d$a;

    .line 61
    .line 62
    invoke-virtual {p2, v0}, LK/d;->b(LK/d$a;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2, v2}, LK/d;->F0(Z)V

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object v0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->Q()I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/4 v0, -0x1

    .line 77
    invoke-virtual {p1, v0}, Landroid/view/View;->canScrollVertically(I)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_4

    .line 82
    .line 83
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 84
    .line 85
    invoke-virtual {p0}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedPreScrollRange()I

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    neg-int p0, p0

    .line 90
    if-eqz p0, :cond_5

    .line 91
    .line 92
    sget-object p0, LK/d$a;->r:LK/d$a;

    .line 93
    .line 94
    invoke-virtual {p2, p0}, LK/d;->b(LK/d$a;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2, v2}, LK/d;->F0(Z)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_4
    sget-object p0, LK/d$a;->r:LK/d$a;

    .line 102
    .line 103
    invoke-virtual {p2, p0}, LK/d;->b(LK/d$a;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, v2}, LK/d;->F0(Z)V

    .line 107
    .line 108
    .line 109
    :cond_5
    :goto_0
    return-void
.end method

.method public j(Landroid/view/View;ILandroid/os/Bundle;)Z
    .locals 11

    .line 1
    const/16 v0, 0x1000

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    if-ne p2, v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 8
    .line 9
    invoke-virtual {p0, v2}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(Z)V

    .line 10
    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    const/16 v0, 0x2000

    .line 14
    .line 15
    if-ne p2, v0, :cond_3

    .line 16
    .line 17
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->Q()I

    .line 20
    .line 21
    .line 22
    move-result p1

    .line 23
    if-eqz p1, :cond_2

    .line 24
    .line 25
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 26
    .line 27
    iget-object p2, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->k:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 28
    .line 29
    invoke-static {p1, p2}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->V(Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;Landroidx/coordinatorlayout/widget/CoordinatorLayout;)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const/4 p1, -0x1

    .line 34
    invoke-virtual {v6, p1}, Landroid/view/View;->canScrollVertically(I)Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_1

    .line 39
    .line 40
    iget-object p1, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/google/android/material/appbar/AppBarLayout;->getDownNestedPreScrollRange()I

    .line 43
    .line 44
    .line 45
    move-result p1

    .line 46
    neg-int v8, p1

    .line 47
    if-eqz v8, :cond_2

    .line 48
    .line 49
    iget-object v3, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->l:Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;

    .line 50
    .line 51
    iget-object v4, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->k:Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    .line 52
    .line 53
    iget-object v5, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 54
    .line 55
    filled-new-array {v2, v2}, [I

    .line 56
    .line 57
    .line 58
    move-result-object v9

    .line 59
    const/4 v10, 0x1

    .line 60
    const/4 v7, 0x0

    .line 61
    invoke-virtual/range {v3 .. v10}, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior;->q0(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;II[II)V

    .line 62
    .line 63
    .line 64
    return v1

    .line 65
    :cond_1
    iget-object p0, p0, Lcom/google/android/material/appbar/AppBarLayout$BaseBehavior$b;->j:Lcom/google/android/material/appbar/AppBarLayout;

    .line 66
    .line 67
    invoke-virtual {p0, v1}, Lcom/google/android/material/appbar/AppBarLayout;->setExpanded(Z)V

    .line 68
    .line 69
    .line 70
    return v1

    .line 71
    :cond_2
    return v2

    .line 72
    :cond_3
    invoke-super {p0, p1, p2, p3}, LJ/a;->j(Landroid/view/View;ILandroid/os/Bundle;)Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    return p0
.end method
