.class public LO0/t;
.super LO0/r;
.source "ShortcutMenuAccessibilityDelegate.java"


# direct methods
.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LO0/r;-><init>(Lcom/android/launcher3/C2;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic R(LO0/t;Lcom/android/launcher3/model/data/I;I[I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LO0/t;->S(Lcom/android/launcher3/model/data/I;I[I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic S(Lcom/android/launcher3/model/data/I;I[I)V
    .locals 7

    .line 1
    iget-object v0, p0, LO0/c;->h:Landroid/content/Context;

    .line 2
    .line 3
    check-cast v0, Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    const/4 v0, 0x0

    .line 10
    aget v5, p3, v0

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    aget v6, p3, v0

    .line 14
    .line 15
    const/16 v3, -0x64

    .line 16
    .line 17
    move-object v2, p1

    .line 18
    move v4, p2

    .line 19
    invoke-virtual/range {v1 .. v6}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, LO0/c;->h:Landroid/content/Context;

    .line 23
    .line 24
    check-cast p1, Lcom/android/launcher3/C2;

    .line 25
    .line 26
    invoke-static {v2}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    invoke-virtual {p1, p2, v0}, Lcom/android/launcher3/C2;->L(Ljava/util/List;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, LO0/c;->h:Landroid/content/Context;

    .line 34
    .line 35
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/android/launcher3/a;->closeAllOpenViews(Lcom/android/launcher3/views/k;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method protected d(Landroid/view/View;Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "LO0/c<",
            "Lcom/android/launcher3/C2;",
            ">.c;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of p1, p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, LO0/c;->g:Landroid/util/SparseArray;

    .line 10
    .line 11
    const p1, 0x7f0b0039

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, LO0/c$c;

    .line 19
    .line 20
    invoke-interface {p3, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method protected i(Landroid/view/View;Lcom/android/launcher3/model/data/y;IZ)Z
    .locals 2

    .line 1
    const p4, 0x7f0b0039

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    if-ne p3, p4, :cond_2

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 8
    .line 9
    .line 10
    move-result-object p3

    .line 11
    instance-of p3, p3, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 12
    .line 13
    if-nez p3, :cond_0

    .line 14
    .line 15
    return v0

    .line 16
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/android/launcher3/shortcuts/DeepShortcutView;

    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/shortcuts/DeepShortcutView;->getFinalInfo()Lcom/android/launcher3/model/data/I;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 p3, 0x2

    .line 27
    new-array p3, p3, [I

    .line 28
    .line 29
    invoke-virtual {p0, p2, p3}, LO0/r;->z(Lcom/android/launcher3/model/data/y;[I)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    const/4 p4, -0x1

    .line 34
    if-ne p2, p4, :cond_1

    .line 35
    .line 36
    return v0

    .line 37
    :cond_1
    iget-object p4, p0, LO0/c;->h:Landroid/content/Context;

    .line 38
    .line 39
    check-cast p4, Lcom/android/launcher3/C2;

    .line 40
    .line 41
    invoke-virtual {p4}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 42
    .line 43
    .line 44
    move-result-object p4

    .line 45
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 46
    .line 47
    new-instance v1, LO0/s;

    .line 48
    .line 49
    invoke-direct {v1, p0, p1, p2, p3}, LO0/s;-><init>(LO0/t;Lcom/android/launcher3/model/data/I;I[I)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Lcom/android/launcher3/anim/h;->c(Ljava/lang/Runnable;)Landroid/animation/Animator$AnimatorListener;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-virtual {p4, v0, p1, p0}, Lcom/android/launcher3/statemanager/d;->N(Lcom/android/launcher3/statemanager/a;ZLandroid/animation/Animator$AnimatorListener;)V

    .line 58
    .line 59
    .line 60
    return p1

    .line 61
    :cond_2
    return v0
.end method
