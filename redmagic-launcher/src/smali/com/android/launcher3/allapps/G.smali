.class public Lcom/android/launcher3/allapps/G;
.super Ljava/lang/Object;
.source "AllAppsTransitionController.java"

# interfaces
.implements Lcom/android/launcher3/statemanager/d$f;
.implements Lcom/android/launcher3/X3$b;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/launcher3/statemanager/d$f<",
        "Lcom/android/launcher3/V3;",
        ">;",
        "Lcom/android/launcher3/X3$b;"
    }
.end annotation


# static fields
.field public static final u:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/allapps/G;",
            ">;"
        }
    .end annotation
.end field

.field public static final v:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/allapps/G;",
            ">;"
        }
    .end annotation
.end field

.field public static final w:Landroid/util/FloatProperty;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/FloatProperty<",
            "Lcom/android/launcher3/allapps/G;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private g:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "Lcom/android/launcher3/C2;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Lcom/android/launcher3/C2;

.field private final i:Lcom/android/launcher3/anim/d;

.field private final j:I

.field private k:Landroid/animation/Animator$AnimatorListener;

.field private l:Z

.field private m:Z

.field private n:F

.field private o:F

.field private p:Lcom/android/launcher3/views/ScrimView;

.field private q:Lcom/android/launcher3/util/B1;

.field private r:Lcom/android/launcher3/util/v1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/v1<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private s:Z

.field private final t:Lcom/android/launcher3/util/s1;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/G$a;

    .line 2
    .line 3
    const-string v1, "allAppsProgress"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/G$a;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lcom/android/launcher3/allapps/G;->u:Landroid/util/FloatProperty;

    .line 9
    .line 10
    new-instance v0, Lcom/android/launcher3/allapps/G$b;

    .line 11
    .line 12
    const-string v1, "allAppsPullBackTranslation"

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/G$b;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/android/launcher3/allapps/G;->v:Landroid/util/FloatProperty;

    .line 18
    .line 19
    new-instance v0, Lcom/android/launcher3/allapps/G$c;

    .line 20
    .line 21
    const-string v1, "allAppsPullBackAlpha"

    .line 22
    .line 23
    invoke-direct {v0, v1}, Lcom/android/launcher3/allapps/G$c;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Lcom/android/launcher3/allapps/G;->w:Landroid/util/FloatProperty;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/anim/d;

    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/allapps/E;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/android/launcher3/allapps/E;-><init>(Lcom/android/launcher3/allapps/G;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/android/launcher3/anim/d;-><init>(Ljava/lang/Runnable;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/allapps/G;->i:Lcom/android/launcher3/anim/d;

    .line 15
    .line 16
    iput-object p1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const/high16 v2, 0x3f800000    # 1.0f

    .line 23
    .line 24
    iput v2, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 25
    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    iput-boolean v3, p0, Lcom/android/launcher3/allapps/G;->l:Z

    .line 31
    .line 32
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->e1()Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    iput-boolean v3, p0, Lcom/android/launcher3/allapps/G;->m:Z

    .line 37
    .line 38
    const v3, 0x7f040386

    .line 39
    .line 40
    .line 41
    invoke-static {p1, v3}, Lcom/android/launcher3/util/F2;->c(Landroid/content/Context;I)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_0

    .line 46
    .line 47
    const/4 v3, 0x2

    .line 48
    goto :goto_0

    .line 49
    :cond_0
    const/4 v3, 0x1

    .line 50
    :goto_0
    iput v3, p0, Lcom/android/launcher3/allapps/G;->j:I

    .line 51
    .line 52
    iget v1, v1, Lcom/android/launcher3/h0;->D2:I

    .line 53
    .line 54
    int-to-float v1, v1

    .line 55
    invoke-virtual {p0, v1}, Lcom/android/launcher3/allapps/G;->w(F)V

    .line 56
    .line 57
    .line 58
    iput v2, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 59
    .line 60
    invoke-interface {p1, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 61
    .line 62
    .line 63
    sget-object v0, Lcom/android/launcher3/util/s1;->b:Lcom/android/launcher3/util/I;

    .line 64
    .line 65
    invoke-virtual {p1}, Landroid/app/Activity;->getApplicationContext()Landroid/content/Context;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    check-cast p1, Lcom/android/launcher3/util/s1;

    .line 74
    .line 75
    iput-object p1, p0, Lcom/android/launcher3/allapps/G;->t:Lcom/android/launcher3/util/s1;

    .line 76
    .line 77
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/allapps/G;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/G;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/allapps/G;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/G;->o(Ljava/lang/Boolean;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/allapps/G;)Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->g:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/allapps/G;)F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/allapps/G;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/allapps/G;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/allapps/G;)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/G;->k()Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/allapps/G;)Lcom/android/launcher3/util/v1$c;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/G;->l()Lcom/android/launcher3/util/v1$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private j()Lcom/android/launcher3/util/v1$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->r:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private k()Lcom/android/launcher3/util/v1$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->q:Lcom/android/launcher3/util/B1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private l()Lcom/android/launcher3/util/v1$c;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->r:Lcom/android/launcher3/util/v1;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/util/v1;->get(I)Lcom/android/launcher3/util/v1$c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method private synthetic o(Ljava/lang/Boolean;)V
    .locals 2

    .line 1
    sget-object p1, Lcom/android/launcher3/allapps/G;->v:Landroid/util/FloatProperty;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {p1, p0, v0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Lcom/android/launcher3/allapps/G;->w:Landroid/util/FloatProperty;

    .line 12
    .line 13
    const/high16 v0, 0x3f800000    # 1.0f

    .line 14
    .line 15
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {p1, p0, v1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/allapps/G;->i:Lcom/android/launcher3/anim/d;

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 28
    .line 29
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x4

    .line 34
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method private q()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->i:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    iget v0, v0, Lcom/android/launcher3/anim/d;->d:F

    .line 4
    .line 5
    sget-object v1, Lcom/android/launcher3/G2;->b:Landroid/util/FloatProperty;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-static {v0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    invoke-virtual {v1, v2, v3}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->e1()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_1

    .line 43
    .line 44
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getScrimView()Lcom/android/launcher3/views/ScrimView;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    invoke-virtual {v1, v0}, Lcom/android/launcher3/views/ScrimView;->setScrimHeaderScale(F)V

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 54
    .line 55
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const/high16 v2, 0x3f800000    # 1.0f

    .line 64
    .line 65
    cmpg-float v0, v0, v2

    .line 66
    .line 67
    if-gez v0, :cond_2

    .line 68
    .line 69
    const/4 v0, 0x1

    .line 70
    goto :goto_0

    .line 71
    :cond_2
    const/4 v0, 0x0

    .line 72
    :goto_0
    iget-boolean v2, p0, Lcom/android/launcher3/allapps/G;->s:Z

    .line 73
    .line 74
    if-eq v0, v2, :cond_4

    .line 75
    .line 76
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/G;->s:Z

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    sget-object v0, Lcom/android/launcher3/O5;->b:Lcom/android/launcher3/O5$c;

    .line 87
    .line 88
    filled-new-array {v0}, [Lcom/android/launcher3/O5$c;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v1, p0, v0}, Lcom/android/launcher3/O5;->a(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 97
    .line 98
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    sget-object v0, Lcom/android/launcher3/O5;->b:Lcom/android/launcher3/O5$c;

    .line 103
    .line 104
    filled-new-array {v0}, [Lcom/android/launcher3/O5$c;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v1, p0, v0}, Lcom/android/launcher3/O5;->b(Landroid/view/View;Landroid/view/ViewParent;[Lcom/android/launcher3/O5$c;)V

    .line 109
    .line 110
    .line 111
    :cond_4
    return-void
.end method

.method private r(Lcom/android/launcher3/V3;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/android/launcher3/H5;->k0()Z

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-eqz v2, :cond_0

    .line 29
    .line 30
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->G0()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v2, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move v2, v1

    .line 43
    :goto_0
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setTranslationY(F)V

    .line 44
    .line 45
    .line 46
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->N0()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 63
    .line 64
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 75
    .line 76
    .line 77
    move-result v2

    .line 78
    if-eqz v2, :cond_3

    .line 79
    .line 80
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 81
    .line 82
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->G0()I

    .line 87
    .line 88
    .line 89
    move-result v2

    .line 90
    int-to-float v2, v2

    .line 91
    goto :goto_1

    .line 92
    :cond_3
    move v2, v1

    .line 93
    :goto_1
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 94
    .line 95
    .line 96
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 97
    .line 98
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    if-nez v0, :cond_5

    .line 103
    .line 104
    return-void

    .line 105
    :cond_5
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-virtual {v2}, Lcom/android/launcher3/h0;->T0()Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    iget-object v3, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 116
    .line 117
    invoke-virtual {v3}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 118
    .line 119
    .line 120
    move-result-object v3

    .line 121
    const/4 v4, 0x0

    .line 122
    invoke-virtual {v3, v4}, Lcom/android/launcher3/X3;->k(I)I

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 127
    .line 128
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-eqz v2, :cond_7

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    if-eqz p1, :cond_6

    .line 143
    .line 144
    int-to-float v1, p0

    .line 145
    :cond_6
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationX(F)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_7
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-eqz p0, :cond_8

    .line 154
    .line 155
    int-to-float v1, v3

    .line 156
    :cond_8
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method private u(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 5

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {v1, v2}, Lcom/android/launcher3/X3;->k(I)I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    new-instance v3, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v4, "setOtherState: "

    .line 48
    .line 49
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    const-string v4, "AllAppsTrC"

    .line 67
    .line 68
    invoke-static {v4, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 72
    .line 73
    .line 74
    move-result v3

    .line 75
    const/4 v4, 0x0

    .line 76
    if-eqz v3, :cond_3

    .line 77
    .line 78
    if-eqz v0, :cond_1

    .line 79
    .line 80
    sget-object v3, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_1
    sget-object v3, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 84
    .line 85
    :goto_0
    if-eqz v0, :cond_2

    .line 86
    .line 87
    move v1, v2

    .line 88
    :cond_2
    int-to-float v0, v1

    .line 89
    sget-object v1, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 90
    .line 91
    invoke-virtual {p3, p2, v3, v0, v1}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 96
    .line 97
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    check-cast v1, Lcom/android/launcher3/V3;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/android/launcher3/V3;->z()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-eqz v1, :cond_4

    .line 112
    .line 113
    if-eqz v0, :cond_4

    .line 114
    .line 115
    sget-object v0, Lcom/android/launcher3/G2;->i:Landroid/util/FloatProperty;

    .line 116
    .line 117
    sget-object v1, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 118
    .line 119
    invoke-virtual {p3, p2, v0, v4, v1}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 120
    .line 121
    .line 122
    :cond_4
    :goto_1
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 123
    .line 124
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p2}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    if-nez p2, :cond_5

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_5
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->k0()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_7

    .line 144
    .line 145
    sget-object v0, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 146
    .line 147
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    if-eqz v1, :cond_6

    .line 152
    .line 153
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 154
    .line 155
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->G0()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    int-to-float v1, v1

    .line 164
    goto :goto_2

    .line 165
    :cond_6
    move v1, v4

    .line 166
    :goto_2
    sget-object v2, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 167
    .line 168
    invoke-virtual {p3, p2, v0, v1, v2}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 169
    .line 170
    .line 171
    :cond_7
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 172
    .line 173
    .line 174
    move-result-object p2

    .line 175
    invoke-virtual {p2}, Lcom/android/launcher3/H5;->N0()Z

    .line 176
    .line 177
    .line 178
    move-result p2

    .line 179
    if-nez p2, :cond_9

    .line 180
    .line 181
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 182
    .line 183
    invoke-virtual {p2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 184
    .line 185
    .line 186
    move-result-object p2

    .line 187
    iget-object p2, p2, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 188
    .line 189
    iget-boolean p2, p2, Lcom/android/launcher3/r4;->k:Z

    .line 190
    .line 191
    if-eqz p2, :cond_8

    .line 192
    .line 193
    goto :goto_4

    .line 194
    :cond_8
    :goto_3
    return-void

    .line 195
    :cond_9
    :goto_4
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 196
    .line 197
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 198
    .line 199
    .line 200
    move-result-object p2

    .line 201
    sget-object v0, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/android/launcher3/V3;->z()Z

    .line 204
    .line 205
    .line 206
    move-result p1

    .line 207
    if-eqz p1, :cond_a

    .line 208
    .line 209
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 210
    .line 211
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->G0()I

    .line 216
    .line 217
    .line 218
    move-result p0

    .line 219
    int-to-float v4, p0

    .line 220
    :cond_a
    sget-object p0, LJ0/h;->X:Landroid/view/animation/Interpolator;

    .line 221
    .line 222
    invoke-virtual {p3, p2, v0, v4, p0}, Lcom/android/launcher3/anim/f;->b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;

    .line 223
    .line 224
    .line 225
    return-void
.end method


# virtual methods
.method public h()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->i:Lcom/android/launcher3/anim/d;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/anim/d;->k()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->i:Lcom/android/launcher3/anim/d;

    .line 11
    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Lcom/android/launcher3/anim/d;->f(F)Landroid/animation/ObjectAnimator;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-wide/16 v1, 0xc8

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->k:Landroid/animation/Animator$AnimatorListener;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    invoke-virtual {v0}, Landroid/animation/Animator;->start()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public varargs i([F)Landroid/animation/Animator;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/allapps/G;->u:Landroid/util/FloatProperty;

    .line 2
    .line 3
    invoke-static {p0, v0, p1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public m()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 2
    .line 3
    return p0
.end method

.method public n()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/G;->n:F

    .line 2
    .line 3
    return p0
.end method

.method public bridge synthetic onBackProgressed(Ljava/lang/Object;F)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/allapps/G;->p(Lcom/android/launcher3/V3;F)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/G;->l:Z

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "AllAppContainerExp: onDeviceProfileChanged mIsVerticalLayout="

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-boolean v1, p0, Lcom/android/launcher3/allapps/G;->l:Z

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const-string v1, "AllAppsTrC"

    .line 27
    .line 28
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 29
    .line 30
    .line 31
    iget v0, p1, Lcom/android/launcher3/h0;->D2:I

    .line 32
    .line 33
    int-to-float v0, v0

    .line 34
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/G;->w(F)V

    .line 35
    .line 36
    .line 37
    iget-boolean v0, p0, Lcom/android/launcher3/allapps/G;->l:Z

    .line 38
    .line 39
    if-eqz v0, :cond_3

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x0

    .line 48
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->setTranslationY(F)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageIndicator()Landroid/view/View;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, v1}, Landroid/view/View;->setTranslationY(F)V

    .line 74
    .line 75
    .line 76
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const/high16 v2, 0x3f800000    # 1.0f

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Lcom/android/launcher3/Hotseat;->setAlpha(F)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->k0()Z

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_1

    .line 108
    .line 109
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 110
    .line 111
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setTranslationY(F)V

    .line 120
    .line 121
    .line 122
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicatorLayout()Lcom/android/launcher3/pageindicators/MfvPageIndicatorLayout;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout;->setAlpha(F)V

    .line 133
    .line 134
    .line 135
    :cond_1
    invoke-static {}, Lcom/android/launcher3/H5;->U()Lcom/android/launcher3/H5;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->N0()Z

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    if-nez v0, :cond_2

    .line 144
    .line 145
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 152
    .line 153
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->k:Z

    .line 154
    .line 155
    if-eqz v0, :cond_3

    .line 156
    .line 157
    :cond_2
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 158
    .line 159
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTranslationY(F)V

    .line 164
    .line 165
    .line 166
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 167
    .line 168
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->d2()Lcom/android/launcher3/LongClickTextView;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {v0, v2}, Lcom/android/launcher3/LongClickTextView;->setAlpha(F)V

    .line 173
    .line 174
    .line 175
    :cond_3
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->e1()Z

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/G;->m:Z

    .line 180
    .line 181
    return-void
.end method

.method public p(Lcom/android/launcher3/V3;F)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 4
    .line 5
    invoke-interface {v0, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    sget-object v0, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 12
    .line 13
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/high16 p1, 0x3f800000    # 1.0f

    .line 21
    .line 22
    sub-float/2addr p1, p2

    .line 23
    const p2, 0x3dccccd0    # 0.100000024f

    .line 24
    .line 25
    .line 26
    mul-float/2addr p1, p2

    .line 27
    const p2, 0x3f666666    # 0.9f

    .line 28
    .line 29
    .line 30
    add-float/2addr p1, p2

    .line 31
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->i:Lcom/android/launcher3/anim/d;

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/d;->n(F)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method public s(Landroid/animation/Animator$AnimatorListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/G;->k:Landroid/animation/Animator$AnimatorListener;

    .line 2
    .line 3
    return-void
.end method

.method public bridge synthetic setState(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/G;->x(Lcom/android/launcher3/V3;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic setStateWithAnimation(Ljava/lang/Object;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/V3;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/G;->y(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public t(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/Y;)V
    .locals 1

    .line 1
    iget-object p3, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Lcom/android/launcher3/V3;->t(Lcom/android/launcher3/C2;)I

    .line 4
    .line 5
    .line 6
    const/16 p3, 0xa

    .line 7
    .line 8
    sget-object v0, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 9
    .line 10
    invoke-virtual {p2, p3, v0}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 11
    .line 12
    .line 13
    const/16 p3, 0x8

    .line 14
    .line 15
    invoke-virtual {p2, p3}, LQ1/f;->c(I)Z

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    if-nez p2, :cond_1

    .line 20
    .line 21
    sget-object p2, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 22
    .line 23
    if-eq p2, p1, :cond_0

    .line 24
    .line 25
    iget-object p1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/statemanager/d;->C()Lcom/android/launcher3/statemanager/a;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    if-ne p1, p2, :cond_1

    .line 36
    .line 37
    :cond_0
    const/4 p1, 0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 p1, 0x0

    .line 40
    :goto_0
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->p:Lcom/android/launcher3/views/ScrimView;

    .line 41
    .line 42
    if-eqz p1, :cond_2

    .line 43
    .line 44
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->g:Lcom/android/launcher3/allapps/r;

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const/4 p0, 0x0

    .line 48
    :goto_1
    invoke-virtual {p2, p0}, Lcom/android/launcher3/views/ScrimView;->setDrawingController(Lcom/android/launcher3/views/ScrimView$a;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public v(F)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->p:Lcom/android/launcher3/views/ScrimView;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/views/ScrimView;->setProgress(F)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/statemanager/d;->x()Lcom/android/launcher3/statemanager/a;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget-object v1, Lcom/android/launcher3/V3;->y:Lcom/android/launcher3/V3;

    .line 19
    .line 20
    if-ne v0, v1, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iget v0, v0, Lcom/android/launcher3/h0;->U0:I

    .line 29
    .line 30
    int-to-float v0, v0

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    iget v0, p0, Lcom/android/launcher3/allapps/G;->n:F

    .line 33
    .line 34
    :goto_0
    invoke-direct {p0}, Lcom/android/launcher3/allapps/G;->j()Lcom/android/launcher3/util/v1$c;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    iget v2, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 39
    .line 40
    mul-float/2addr v2, v0

    .line 41
    invoke-virtual {v1, v2}, Lcom/android/launcher3/util/v1$c;->d(F)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 45
    .line 46
    const/high16 v1, 0x3f800000    # 1.0f

    .line 47
    .line 48
    sub-float/2addr v1, p1

    .line 49
    invoke-virtual {v0, v1}, Lcom/android/launcher3/C2;->I3(F)V

    .line 50
    .line 51
    .line 52
    const v0, 0x3dcccccd    # 0.1f

    .line 53
    .line 54
    .line 55
    cmpg-float p1, p1, v0

    .line 56
    .line 57
    if-gez p1, :cond_1

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getNavBarScrimHeight()I

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-lez p1, :cond_1

    .line 70
    .line 71
    const/4 p1, 0x1

    .line 72
    goto :goto_1

    .line 73
    :cond_1
    const/4 p1, 0x0

    .line 74
    :goto_1
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getSystemUiController()Lcom/android/launcher3/util/E2;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    iget v1, p0, Lcom/android/launcher3/allapps/G;->j:I

    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-static {p1, v1, p0}, Lx1/O;->S(ZILcom/android/launcher3/C2;)I

    .line 85
    .line 86
    .line 87
    move-result p0

    .line 88
    const/4 p1, 0x4

    .line 89
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/util/E2;->b(II)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public w(F)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/G;->n:F

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "setShiftRange mShiftRange: "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/allapps/G;->n:F

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "AllAppsTrC"

    .line 23
    .line 24
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->p:Lcom/android/launcher3/views/ScrimView;

    .line 28
    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/android/launcher3/views/ScrimView;->reInitUi()V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public x(Lcom/android/launcher3/V3;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setState  state="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "AllAppsTrC"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    const/4 v2, 0x0

    .line 38
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const/4 v2, 0x4

    .line 49
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 50
    .line 51
    .line 52
    :goto_0
    instance-of v1, p1, Lcom/android/launcher3/uioverrides/touchcontrollers/A;

    .line 53
    .line 54
    if-eqz v1, :cond_1

    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 58
    .line 59
    invoke-virtual {v1, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-nez v1, :cond_2

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    if-eqz v1, :cond_3

    .line 70
    .line 71
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getStateManager()Lcom/android/launcher3/statemanager/d;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-virtual {v1}, Lcom/android/launcher3/statemanager/d;->z()Lcom/android/launcher3/statemanager/a;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    if-ne v1, v0, :cond_3

    .line 82
    .line 83
    sget-object v0, Lcom/android/launcher3/allapps/G;->v:Landroid/util/FloatProperty;

    .line 84
    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, p0, v1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 91
    .line 92
    .line 93
    sget-object v0, Lcom/android/launcher3/allapps/G;->w:Landroid/util/FloatProperty;

    .line 94
    .line 95
    const/high16 v1, 0x3f800000    # 1.0f

    .line 96
    .line 97
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    invoke-virtual {v0, p0, v1}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 102
    .line 103
    .line 104
    :cond_3
    iget-object v0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/G;->v(F)V

    .line 111
    .line 112
    .line 113
    new-instance v0, LQ1/f;

    .line 114
    .line 115
    invoke-direct {v0}, LQ1/f;-><init>()V

    .line 116
    .line 117
    .line 118
    sget-object v1, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 119
    .line 120
    invoke-virtual {p0, p1, v0, v1}, Lcom/android/launcher3/allapps/G;->t(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/Y;)V

    .line 121
    .line 122
    .line 123
    invoke-direct {p0, p1}, Lcom/android/launcher3/allapps/G;->r(Lcom/android/launcher3/V3;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public y(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setStateWithAnimation  toState="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "AllAppsTrC"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/V3;->s:Lcom/android/launcher3/V3;

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    const/4 v3, 0x0

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 33
    .line 34
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2, v3}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 39
    .line 40
    .line 41
    :cond_0
    instance-of v2, p1, Lcom/android/launcher3/uioverrides/touchcontrollers/A;

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    return-void

    .line 46
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 47
    .line 48
    invoke-interface {v2, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_2

    .line 53
    .line 54
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_2

    .line 59
    .line 60
    new-instance v2, Lcom/android/launcher3/allapps/F;

    .line 61
    .line 62
    invoke-direct {v2, p0}, Lcom/android/launcher3/allapps/F;-><init>(Lcom/android/launcher3/allapps/G;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p3, v2}, Lcom/android/launcher3/anim/f;->f(Ljava/util/function/Consumer;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object v2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 69
    .line 70
    invoke-virtual {p1, v2}, Lcom/android/launcher3/V3;->s(Lcom/android/launcher3/C2;)F

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    new-instance v4, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v5, "AllAppContainerExp: setStateWithAnimation: progress: "

    .line 80
    .line 81
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget v5, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 85
    .line 86
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const-string v5, ", target progress: "

    .line 90
    .line 91
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    const-string v5, ", toState: "

    .line 98
    .line 99
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    .line 111
    .line 112
    iget v1, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 113
    .line 114
    invoke-static {v1, v2}, Ljava/lang/Float;->compare(FF)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-nez v1, :cond_3

    .line 119
    .line 120
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/G;->t(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/Y;)V

    .line 121
    .line 122
    .line 123
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/G;->u(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/V;)V

    .line 124
    .line 125
    .line 126
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 127
    .line 128
    sget-object p3, Lcom/android/launcher3/V3;->C:Lcom/android/launcher3/V3;

    .line 129
    .line 130
    invoke-interface {p2, p3}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    if-eqz p2, :cond_8

    .line 135
    .line 136
    sget-object p2, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 137
    .line 138
    if-ne p1, p2, :cond_8

    .line 139
    .line 140
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/G;->v(F)V

    .line 141
    .line 142
    .line 143
    return-void

    .line 144
    :cond_3
    invoke-virtual {p2}, LQ1/f;->d()Z

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    if-eqz v1, :cond_4

    .line 149
    .line 150
    sget-object v1, LJ0/h;->q:Landroid/view/animation/Interpolator;

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_4
    sget-object v1, LJ0/h;->K:Landroid/view/animation/Interpolator;

    .line 154
    .line 155
    :goto_0
    invoke-virtual {p2, v3, v1}, LQ1/f;->b(ILandroid/view/animation/Interpolator;)Landroid/view/animation/Interpolator;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget v4, p0, Lcom/android/launcher3/allapps/G;->o:F

    .line 160
    .line 161
    const/4 v5, 0x2

    .line 162
    new-array v5, v5, [F

    .line 163
    .line 164
    aput v4, v5, v3

    .line 165
    .line 166
    const/4 v4, 0x1

    .line 167
    aput v2, v5, v4

    .line 168
    .line 169
    invoke-virtual {p0, v5}, Lcom/android/launcher3/allapps/G;->i([F)Landroid/animation/Animator;

    .line 170
    .line 171
    .line 172
    move-result-object v4

    .line 173
    new-instance v5, Lcom/android/launcher3/allapps/G$d;

    .line 174
    .line 175
    invoke-direct {v5, p0, v2}, Lcom/android/launcher3/allapps/G$d;-><init>(Lcom/android/launcher3/allapps/G;F)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v4, v5}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v4, v1}, Landroid/animation/Animator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 182
    .line 183
    .line 184
    invoke-virtual {p3, v4}, Lcom/android/launcher3/anim/V;->a(Landroid/animation/Animator;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {p0, p1, p2, p3}, Lcom/android/launcher3/allapps/G;->t(Lcom/android/launcher3/V3;LQ1/f;Lcom/android/launcher3/anim/Y;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result p3

    .line 194
    if-eqz p3, :cond_6

    .line 195
    .line 196
    iget-object p3, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 197
    .line 198
    sget-object v1, Lcom/android/launcher3/V3;->p:Lcom/android/launcher3/V3;

    .line 199
    .line 200
    invoke-interface {p3, v1}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 201
    .line 202
    .line 203
    move-result p3

    .line 204
    if-eqz p3, :cond_6

    .line 205
    .line 206
    invoke-static {}, Lcom/android/launcher3/y0;->n0()Z

    .line 207
    .line 208
    .line 209
    move-result p3

    .line 210
    if-eqz p3, :cond_6

    .line 211
    .line 212
    invoke-virtual {p2}, LQ1/f;->d()Z

    .line 213
    .line 214
    .line 215
    move-result p2

    .line 216
    if-eqz p2, :cond_5

    .line 217
    .line 218
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->t:Lcom/android/launcher3/util/s1;

    .line 219
    .line 220
    sget-object p3, Lw3/e;->v:Lw3/e;

    .line 221
    .line 222
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/s1;->c(Lw3/e;)V

    .line 223
    .line 224
    .line 225
    goto :goto_1

    .line 226
    :cond_5
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->t:Lcom/android/launcher3/util/s1;

    .line 227
    .line 228
    sget-object p3, Lw3/e;->w:Lw3/e;

    .line 229
    .line 230
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/s1;->c(Lw3/e;)V

    .line 231
    .line 232
    .line 233
    :cond_6
    :goto_1
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 234
    .line 235
    invoke-interface {p2, v0}, Lcom/android/launcher3/statemanager/i;->isInState(Lcom/android/launcher3/statemanager/a;)Z

    .line 236
    .line 237
    .line 238
    move-result p2

    .line 239
    if-nez p2, :cond_7

    .line 240
    .line 241
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p1

    .line 245
    if-eqz p1, :cond_8

    .line 246
    .line 247
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 248
    .line 249
    const/16 p2, 0x100

    .line 250
    .line 251
    invoke-static {p1, p2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    if-eqz p1, :cond_8

    .line 256
    .line 257
    iget-object p0, p0, Lcom/android/launcher3/allapps/G;->h:Lcom/android/launcher3/C2;

    .line 258
    .line 259
    invoke-static {p0, p2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-virtual {p0, v3}, Lcom/android/launcher3/a;->close(Z)V

    .line 264
    .line 265
    .line 266
    :cond_8
    return-void
.end method

.method public z(Lcom/android/launcher3/views/ScrimView;Lcom/android/launcher3/allapps/r;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/views/ScrimView;",
            "Lcom/android/launcher3/allapps/r<",
            "Lcom/android/launcher3/C2;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/G;->p:Lcom/android/launcher3/views/ScrimView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/allapps/G;->g:Lcom/android/launcher3/allapps/r;

    .line 4
    .line 5
    invoke-virtual {p2, p1}, Lcom/android/launcher3/allapps/r;->setScrimView(Lcom/android/launcher3/views/ScrimView;)V

    .line 6
    .line 7
    .line 8
    new-instance p1, Lcom/android/launcher3/util/B1;

    .line 9
    .line 10
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->g:Lcom/android/launcher3/allapps/r;

    .line 11
    .line 12
    const/16 v0, 0x8

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    invoke-direct {p1, p2, v1, v0}, Lcom/android/launcher3/util/B1;-><init>(Landroid/view/View;II)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/android/launcher3/allapps/G;->q:Lcom/android/launcher3/util/B1;

    .line 19
    .line 20
    const/4 p2, 0x1

    .line 21
    invoke-virtual {p1, p2}, Lcom/android/launcher3/util/B1;->setUpdateVisibility(Z)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Lcom/android/launcher3/util/v1;

    .line 25
    .line 26
    iget-object p2, p0, Lcom/android/launcher3/allapps/G;->g:Lcom/android/launcher3/allapps/r;

    .line 27
    .line 28
    sget-object v0, Lcom/android/launcher3/G2;->j:Landroid/util/FloatProperty;

    .line 29
    .line 30
    new-instance v2, Lcom/android/launcher3/B0;

    .line 31
    .line 32
    invoke-direct {v2}, Lcom/android/launcher3/B0;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-direct {p1, p2, v0, v1, v2}, Lcom/android/launcher3/util/v1;-><init>(Ljava/lang/Object;Landroid/util/FloatProperty;ILcom/android/launcher3/util/v1$b;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/android/launcher3/allapps/G;->r:Lcom/android/launcher3/util/v1;

    .line 39
    .line 40
    return-void
.end method
