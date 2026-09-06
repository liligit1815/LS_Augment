.class public Lcom/android/launcher3/allapps/y0;
.super Lcom/android/launcher3/allapps/v0;
.source "WorkProfileManager.java"

# interfaces
.implements Lcom/android/launcher3/workprofile/PersonalWorkSlidingTabStrip$a;


# instance fields
.field private final k:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "*>;"
        }
    .end annotation
.end field

.field private l:Lcom/android/launcher3/allapps/WorkUtilityView;

.field private final m:Ljava/util/function/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Predicate<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/UserManager;Lcom/android/launcher3/allapps/r;Lcom/android/launcher3/logging/StatsLogManager;LD1/t;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p3, p4}, Lcom/android/launcher3/allapps/v0;-><init>(Landroid/os/UserManager;Lcom/android/launcher3/logging/StatsLogManager;LD1/t;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 5
    .line 6
    new-instance p1, Lcom/android/launcher3/allapps/x0;

    .line 7
    .line 8
    invoke-direct {p1, p4}, Lcom/android/launcher3/allapps/x0;-><init>(LD1/t;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/android/launcher3/allapps/y0;->m:Ljava/util/function/Predicate;

    .line 12
    .line 13
    return-void
.end method

.method private D(I)V
    .locals 1

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/v0;->n(I)V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Lcom/android/launcher3/allapps/y0;->v()Lcom/android/launcher3/allapps/r$e;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-direct {p0}, Lcom/android/launcher3/allapps/y0;->v()Lcom/android/launcher3/allapps/r$e;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iget-object p1, p1, Lcom/android/launcher3/allapps/r$e;->d:Lcom/android/launcher3/allapps/M;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/M;->s()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 20
    .line 21
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object p1, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getCurrentPage()I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/y0;->E(I)V

    .line 30
    .line 31
    .line 32
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    const/4 v0, 0x1

    .line 37
    if-ne p1, v0, :cond_2

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/y0;->t()Z

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    const/4 v0, 0x2

    .line 48
    if-ne p1, v0, :cond_3

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/y0;->u()V

    .line 51
    .line 52
    .line 53
    :cond_3
    return-void
.end method

.method private E(I)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    if-ne p1, v1, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    if-ne p1, v0, :cond_2

    .line 13
    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 15
    .line 16
    .line 17
    move-result p1

    .line 18
    if-ne p1, v0, :cond_2

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 21
    .line 22
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->t(Z)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 27
    invoke-virtual {v0, p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->t(Z)V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public static synthetic q(Lcom/android/launcher3/allapps/y0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/y0;->z(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic r(LD1/t;Landroid/os/UserHandle;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/util/N2;->e()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method private v()Lcom/android/launcher3/allapps/r$e;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/allapps/r;->j:Ljava/util/List;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, Lcom/android/launcher3/allapps/r$e;

    .line 11
    .line 12
    return-object p0
.end method

.method private x()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Lcom/android/launcher3/J3;->g:Lcom/android/launcher3/X;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private z(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 v0, 0x1

    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/WorkUtilityView;->isEnabled()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    const-string p1, "WorkProfileManager"

    .line 17
    .line 18
    const-string v0, "Work FAB clicked."

    .line 19
    .line 20
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    sget-object p1, Lcom/android/launcher3/logging/StatsLogManager$e;->i2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/v0;->m(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 26
    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/y0;->B(Z)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method


# virtual methods
.method public A()V
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->O()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    const/16 v0, 0x8

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 13
    .line 14
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2, v0}, Lcom/android/launcher3/allapps/D;->r(I)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_1

    .line 23
    .line 24
    const/4 v1, 0x1

    .line 25
    :cond_1
    invoke-direct {p0, v1}, Lcom/android/launcher3/allapps/y0;->D(I)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->getImeInsets()Landroid/graphics/Rect;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Landroid/graphics/Rect;->setEmpty()V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/WorkUtilityView;->H()V

    .line 42
    .line 43
    .line 44
    :cond_2
    return-void
.end method

.method public B(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x3

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/y0;->D(I)V

    .line 3
    .line 4
    .line 5
    xor-int/lit8 p1, p1, 0x1

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->i:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/allapps/v0;->o(ZLandroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public C()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x2

    .line 6
    if-eq p0, v0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public g()Ljava/util/function/Predicate;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/function/Predicate<",
            "Landroid/os/UserHandle;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/y0;->m:Ljava/util/function/Predicate;

    .line 2
    .line 3
    return-object p0
.end method

.method public i(I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/y0;->E(I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public s(Ljava/util/ArrayList;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/allapps/O$a;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    new-instance p0, Lcom/android/launcher3/allapps/O$a;

    .line 9
    .line 10
    const/16 v0, 0x20

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/v0;->d()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x1

    .line 24
    if-ne v0, v1, :cond_1

    .line 25
    .line 26
    invoke-direct {p0}, Lcom/android/launcher3/allapps/y0;->x()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    new-instance p0, Lcom/android/launcher3/allapps/O$a;

    .line 33
    .line 34
    const/16 v0, 0x10

    .line 35
    .line 36
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/O$a;-><init>(I)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_0
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    return p0
.end method

.method public t()Z
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x5

    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/D;->r(I)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    const-string p0, "WorkProfileManager"

    .line 16
    .line 17
    const-string v0, "unable to attach work mode switch; Missing required permissions"

    .line 18
    .line 19
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 24
    .line 25
    if-nez v0, :cond_1

    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const v2, 0x7f0e027d

    .line 34
    .line 35
    .line 36
    iget-object v3, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 37
    .line 38
    invoke-virtual {v0, v2, v3, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 45
    .line 46
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 47
    .line 48
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    if-nez v0, :cond_2

    .line 53
    .line 54
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 55
    .line 56
    iget-object v2, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getCurrentPage()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    const/4 v2, 0x1

    .line 68
    if-eq v0, v2, :cond_3

    .line 69
    .line 70
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/WorkUtilityView;->t(Z)V

    .line 73
    .line 74
    .line 75
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/allapps/y0;->v()Lcom/android/launcher3/allapps/r$e;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-eqz v0, :cond_4

    .line 80
    .line 81
    invoke-direct {p0}, Lcom/android/launcher3/allapps/y0;->v()Lcom/android/launcher3/allapps/r$e;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r$e;->c()V

    .line 86
    .line 87
    .line 88
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/WorkUtilityView;->getWorkFAB()Landroid/view/View;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    new-instance v1, Lcom/android/launcher3/allapps/w0;

    .line 95
    .line 96
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/w0;-><init>(Lcom/android/launcher3/allapps/y0;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 100
    .line 101
    .line 102
    return v2
.end method

.method public u()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/allapps/y0;->k:Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 14
    .line 15
    invoke-virtual {v1, v0}, Landroid/widget/RelativeLayout;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 20
    .line 21
    return-void
.end method

.method public w()Lcom/android/launcher3/allapps/WorkUtilityView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/y0;->l:Lcom/android/launcher3/allapps/WorkUtilityView;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/y0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/android/launcher3/allapps/y0$a;-><init>(Lcom/android/launcher3/allapps/y0;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method
