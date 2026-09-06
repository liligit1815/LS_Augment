.class Lj0/b$b;
.super LJ/a;
.source "SlidingPaneLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lj0/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "b"
.end annotation


# instance fields
.field private final j:Landroid/graphics/Rect;

.field final synthetic k:Lj0/b;


# direct methods
.method constructor <init>(Lj0/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lj0/b$b;->k:Lj0/b;

    .line 2
    .line 3
    invoke-direct {p0}, LJ/a;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/graphics/Rect;

    .line 7
    .line 8
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lj0/b$b;->j:Landroid/graphics/Rect;

    .line 12
    .line 13
    return-void
.end method

.method private n(LK/d;LK/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lj0/b$b;->j:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {p2, p0}, LK/d;->l(Landroid/graphics/Rect;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1, p0}, LK/d;->f0(Landroid/graphics/Rect;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p2}, LK/d;->V()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-virtual {p1, p0}, LK/d;->N0(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, LK/d;->x()Ljava/lang/CharSequence;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p1, p0}, LK/d;->z0(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2}, LK/d;->o()Ljava/lang/CharSequence;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p1, p0}, LK/d;->i0(Ljava/lang/CharSequence;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p2}, LK/d;->s()Ljava/lang/CharSequence;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, LK/d;->m0(Ljava/lang/CharSequence;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p2}, LK/d;->K()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    invoke-virtual {p1, p0}, LK/d;->o0(Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2}, LK/d;->I()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    invoke-virtual {p1, p0}, LK/d;->j0(Z)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p2}, LK/d;->L()Z

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    invoke-virtual {p1, p0}, LK/d;->q0(Z)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p2}, LK/d;->M()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    invoke-virtual {p1, p0}, LK/d;->r0(Z)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p2}, LK/d;->F()Z

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-virtual {p1, p0}, LK/d;->c0(Z)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p2}, LK/d;->S()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {p1, p0}, LK/d;->G0(Z)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p2}, LK/d;->P()Z

    .line 80
    .line 81
    .line 82
    move-result p0

    .line 83
    invoke-virtual {p1, p0}, LK/d;->w0(Z)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p2}, LK/d;->i()I

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-virtual {p1, p0}, LK/d;->a(I)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p2}, LK/d;->w()I

    .line 94
    .line 95
    .line 96
    move-result p0

    .line 97
    invoke-virtual {p1, p0}, LK/d;->y0(I)V

    .line 98
    .line 99
    .line 100
    return-void
.end method


# virtual methods
.method public f(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, LJ/a;->f(Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)V

    .line 2
    .line 3
    .line 4
    const-string p0, "androidx.slidingpanelayout.widget.SlidingPaneLayout"

    .line 5
    .line 6
    invoke-virtual {p2, p0}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public g(Landroid/view/View;LK/d;)V
    .locals 3

    .line 1
    invoke-static {p2}, LK/d;->X(LK/d;)LK/d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-super {p0, p1, v0}, LJ/a;->g(Landroid/view/View;LK/d;)V

    .line 6
    .line 7
    .line 8
    invoke-direct {p0, p2, v0}, Lj0/b$b;->n(LK/d;LK/d;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, LK/d;->a0()V

    .line 12
    .line 13
    .line 14
    const-string v0, "androidx.slidingpanelayout.widget.SlidingPaneLayout"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, LK/d;->i0(Ljava/lang/CharSequence;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p1}, LK/d;->I0(Landroid/view/View;)V

    .line 20
    .line 21
    .line 22
    invoke-static {p1}, LJ/I;->B(Landroid/view/View;)Landroid/view/ViewParent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    instance-of v0, p1, Landroid/view/View;

    .line 27
    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    check-cast p1, Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {p2, p1}, LK/d;->B0(Landroid/view/View;)V

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object p1, p0, Lj0/b$b;->k:Lj0/b;

    .line 36
    .line 37
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    const/4 v0, 0x0

    .line 42
    :goto_0
    if-ge v0, p1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lj0/b$b;->k:Lj0/b;

    .line 45
    .line 46
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {p0, v1}, Lj0/b$b;->o(Landroid/view/View;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    if-nez v2, :cond_1

    .line 61
    .line 62
    const/4 v2, 0x1

    .line 63
    invoke-static {v1, v2}, LJ/I;->t0(Landroid/view/View;I)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p2, v1}, LK/d;->c(Landroid/view/View;)V

    .line 67
    .line 68
    .line 69
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_2
    return-void
.end method

.method public i(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p0, p2}, Lj0/b$b;->o(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-super {p0, p1, p2, p3}, LJ/a;->i(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/accessibility/AccessibilityEvent;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return p0
.end method

.method public o(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lj0/b$b;->k:Lj0/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lj0/b;->k(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
