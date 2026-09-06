.class public Lcom/android/launcher3/blur/f;
.super Ljava/lang/Object;
.source "LauncherViewBlurUtils.java"


# static fields
.field private static final a:Z

.field private static b:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "gen_nubia_cn_zte_nebulaos2_pq84a01"

    .line 2
    .line 3
    invoke-static {}, Lx1/O;->k0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sput-boolean v0, Lcom/android/launcher3/blur/f;->a:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    sput-boolean v0, Lcom/android/launcher3/blur/f;->b:Z

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/C2;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p0, p2}, Lcom/android/launcher3/blur/f;->p(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/blur/f;->l(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public static c(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->d(Landroid/view/View;)Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static d(Landroid/view/View;)Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    if-eqz p0, :cond_2

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    :try_start_0
    invoke-virtual {p0}, Landroid/view/View;->getViewRootImpl()Landroid/view/ViewRootImpl;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Landroid/view/ViewRootImpl;->createBackgroundBlurDrawable()Lcom/android/internal/graphics/drawable/BackgroundBlurDrawable;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/16 v0, 0x64

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Lcom/android/internal/graphics/drawable/BackgroundBlurDrawable;->setBlurRadius(I)V

    .line 29
    .line 30
    .line 31
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->e(Landroid/view/View;)F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {v1, p0}, Lcom/android/internal/graphics/drawable/BackgroundBlurDrawable;->setCornerRadius(F)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    return-object v1

    .line 39
    :catchall_0
    move-exception p0

    .line 40
    const-string v0, "LauncherViewBlurUtils"

    .line 41
    .line 42
    const-string v2, "createViewBgBlurDrawableWhenOnAttachedToWindow error"

    .line 43
    .line 44
    invoke-static {v0, v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 45
    .line 46
    .line 47
    :cond_2
    :goto_0
    return-object v1
.end method

.method private static e(Landroid/view/View;)F
    .locals 5

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/widget/group/GroupWidgetBackgroundLayout;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    const/4 v2, 0x1

    .line 13
    if-nez v0, :cond_1

    .line 14
    .line 15
    instance-of v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetAIOutputLayout;

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    instance-of v0, p0, Lcom/android/launcher3/widget/custom/future/AIFutureOtherWidgetHostView;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    move v0, v2

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    move v0, v1

    .line 26
    :goto_0
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    instance-of v4, v3, Lcom/android/launcher3/model/data/y;

    .line 31
    .line 32
    if-eqz v4, :cond_5

    .line 33
    .line 34
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 35
    .line 36
    instance-of v4, p0, Lcom/android/launcher3/widget/T;

    .line 37
    .line 38
    if-eqz v4, :cond_5

    .line 39
    .line 40
    move-object v0, p0

    .line 41
    check-cast v0, Lcom/android/launcher3/widget/T;

    .line 42
    .line 43
    instance-of v4, v0, Lcom/android/launcher3/widget/suggest/m;

    .line 44
    .line 45
    if-nez v4, :cond_6

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->getLauncherAppWidgetProviderInfo()Lcom/android/launcher3/widget/U;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    if-eqz v4, :cond_2

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->getLauncherAppWidgetProviderInfo()Lcom/android/launcher3/widget/U;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    iget-object v4, v4, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 58
    .line 59
    if-eqz v4, :cond_2

    .line 60
    .line 61
    invoke-virtual {v0}, Lcom/android/launcher3/widget/T;->getLauncherAppWidgetProviderInfo()Lcom/android/launcher3/widget/U;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    iget-object v0, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 66
    .line 67
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    const-string v4, "cn.nubia.neostore.widget.rec.RecAppsWidget"

    .line 72
    .line 73
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    goto :goto_1

    .line 80
    :cond_2
    iget v0, v3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 81
    .line 82
    if-eq v0, v2, :cond_3

    .line 83
    .line 84
    iget v0, v3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 85
    .line 86
    if-ne v0, v2, :cond_4

    .line 87
    .line 88
    :cond_3
    move v1, v2

    .line 89
    :cond_4
    move v2, v1

    .line 90
    goto :goto_1

    .line 91
    :cond_5
    move v2, v0

    .line 92
    :cond_6
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    if-eqz v2, :cond_7

    .line 97
    .line 98
    const v0, 0x7f070504

    .line 99
    .line 100
    .line 101
    goto :goto_2

    .line 102
    :cond_7
    const v0, 0x7f070503

    .line 103
    .line 104
    .line 105
    :goto_2
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    return p0
.end method

.method public static f()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-boolean v0, Lcom/android/launcher3/blur/f;->b:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    return v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return v0
.end method

.method public static g()Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->o3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Lx1/O;->i3()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    const/4 v0, 0x0

    .line 27
    return v0
.end method

.method public static h()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-boolean v0, Lcom/android/launcher3/blur/f;->a:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    return v0

    .line 13
    :cond_0
    const/4 v0, 0x0

    .line 14
    return v0
.end method

.method public static i(Lcom/android/launcher3/K5;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-ge v0, v1, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-static {v1}, Lcom/android/launcher3/blur/f;->l(Landroid/view/View;)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_1
    :goto_1
    return-void
.end method

.method public static j(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    new-instance v0, Lcom/android/launcher3/blur/d;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/blur/d;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public static k(Lcom/android/launcher3/C2;Z)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "onCrossWindowBlursEnabledChanged blursEnabled="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " old="

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    sget-boolean v1, Lcom/android/launcher3/blur/f;->b:Z

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "LauncherViewBlurUtils"

    .line 36
    .line 37
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 38
    .line 39
    .line 40
    sput-boolean p1, Lcom/android/launcher3/blur/f;->b:Z

    .line 41
    .line 42
    if-nez p0, :cond_1

    .line 43
    .line 44
    :goto_0
    return-void

    .line 45
    :cond_1
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->j(Lcom/android/launcher3/C2;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public static l(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v0, v0, Lcom/android/launcher3/C2;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-static {v0}, Lcom/android/launcher3/v;->fromContext(Landroid/content/Context;)Lcom/android/launcher3/v;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Lcom/android/launcher3/C2;

    .line 30
    .line 31
    invoke-static {v0, p0}, Lcom/android/launcher3/blur/f;->p(Lcom/android/launcher3/C2;Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method public static m(Landroid/view/View;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static n(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Lcom/android/launcher3/blur/e;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Lcom/android/launcher3/blur/e;-><init>(Lcom/android/launcher3/C2;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    :cond_1
    :goto_0
    return-void
.end method

.method public static o(Lcom/android/launcher3/C2;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Lx1/Z;->g(Lcom/android/launcher3/V4;)Lcom/android/launcher3/M5;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    instance-of v0, v0, Lcom/android/launcher3/M5$b;

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-static {p0}, Lcom/android/launcher3/blur/f;->j(Lcom/android/launcher3/C2;)V

    .line 30
    .line 31
    .line 32
    :cond_2
    :goto_0
    return-void
.end method

.method private static p(Lcom/android/launcher3/C2;Landroid/view/View;)V
    .locals 9

    .line 1
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_c

    .line 6
    .line 7
    instance-of v0, p1, Lcom/android/launcher3/blur/c;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_6

    .line 12
    .line 13
    :cond_0
    move-object v0, p1

    .line 14
    check-cast v0, Lcom/android/launcher3/blur/c;

    .line 15
    .line 16
    invoke-interface {v0}, Lcom/android/launcher3/blur/c;->getBgBlurImageView()Lcom/android/launcher3/blur/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    goto/16 :goto_6

    .line 23
    .line 24
    :cond_1
    if-eqz p0, :cond_c

    .line 25
    .line 26
    if-nez p1, :cond_2

    .line 27
    .line 28
    goto/16 :goto_6

    .line 29
    .line 30
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/blur/a;->getBgBlurDrawable()Landroid/graphics/drawable/Drawable;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    instance-of v2, v1, Lcom/android/internal/graphics/drawable/BackgroundBlurDrawable;

    .line 35
    .line 36
    if-nez v2, :cond_3

    .line 37
    .line 38
    goto/16 :goto_6

    .line 39
    .line 40
    :cond_3
    const/high16 v2, 0x3f800000    # 1.0f

    .line 41
    .line 42
    move-object v3, p1

    .line 43
    move v4, v2

    .line 44
    :goto_0
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    instance-of v5, v5, Landroid/view/ViewGroup;

    .line 49
    .line 50
    if-eqz v5, :cond_4

    .line 51
    .line 52
    instance-of v5, v3, Lcom/android/launcher3/LauncherRootView;

    .line 53
    .line 54
    if-nez v5, :cond_4

    .line 55
    .line 56
    invoke-virtual {v3}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Landroid/view/ViewGroup;

    .line 61
    .line 62
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getAlpha()F

    .line 63
    .line 64
    .line 65
    move-result v5

    .line 66
    mul-float/2addr v4, v5

    .line 67
    goto :goto_0

    .line 68
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    iget v3, v3, Lcom/android/launcher3/X3;->O:F

    .line 73
    .line 74
    cmpg-float v3, v3, v2

    .line 75
    .line 76
    if-gez v3, :cond_5

    .line 77
    .line 78
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 79
    .line 80
    .line 81
    move-result-object v3

    .line 82
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getScaleX()F

    .line 83
    .line 84
    .line 85
    move-result v3

    .line 86
    cmpg-float v3, v3, v2

    .line 87
    .line 88
    if-gtz v3, :cond_5

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 91
    .line 92
    .line 93
    move-result-object v3

    .line 94
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getScaleX()F

    .line 95
    .line 96
    .line 97
    move-result v3

    .line 98
    sub-float v3, v2, v3

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    iget v5, v5, Lcom/android/launcher3/X3;->O:F

    .line 105
    .line 106
    sub-float v5, v2, v5

    .line 107
    .line 108
    div-float/2addr v3, v5

    .line 109
    sub-float v3, v2, v3

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_5
    move v3, v2

    .line 113
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->w2()Lx1/Z;

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-virtual {v5, v6}, Lx1/Z;->g(Lcom/android/launcher3/V4;)Lcom/android/launcher3/M5;

    .line 122
    .line 123
    .line 124
    move-result-object v5

    .line 125
    const/4 v6, 0x0

    .line 126
    if-eqz v5, :cond_9

    .line 127
    .line 128
    instance-of v5, v5, Lcom/android/launcher3/M5$b;

    .line 129
    .line 130
    if-nez v5, :cond_9

    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    invoke-virtual {v5}, Landroid/view/ViewGroup;->getScrollX()I

    .line 137
    .line 138
    .line 139
    move-result v5

    .line 140
    int-to-float v5, v5

    .line 141
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageWidth()I

    .line 146
    .line 147
    .line 148
    move-result p0

    .line 149
    int-to-float p0, p0

    .line 150
    div-float/2addr v5, p0

    .line 151
    float-to-int p0, v5

    .line 152
    int-to-float p0, p0

    .line 153
    invoke-static {p0, v5}, Ljava/lang/Float;->compare(FF)I

    .line 154
    .line 155
    .line 156
    move-result v7

    .line 157
    if-eqz v7, :cond_8

    .line 158
    .line 159
    sub-float/2addr v5, p0

    .line 160
    const p0, 0x3d4ccccd    # 0.05f

    .line 161
    .line 162
    .line 163
    cmpg-float v7, v5, p0

    .line 164
    .line 165
    if-gtz v7, :cond_6

    .line 166
    .line 167
    div-float/2addr v5, p0

    .line 168
    sub-float p0, v2, v5

    .line 169
    .line 170
    goto :goto_2

    .line 171
    :cond_6
    const v7, 0x3f733333    # 0.95f

    .line 172
    .line 173
    .line 174
    cmpl-float v8, v5, v7

    .line 175
    .line 176
    if-ltz v8, :cond_7

    .line 177
    .line 178
    sub-float/2addr v5, v7

    .line 179
    div-float p0, v5, p0

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_7
    move p0, v6

    .line 183
    goto :goto_2

    .line 184
    :cond_8
    move p0, v2

    .line 185
    :goto_2
    invoke-static {v6, p0}, Ljava/lang/Math;->max(FF)F

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    invoke-static {v2, p0}, Ljava/lang/Math;->min(FF)F

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    goto :goto_3

    .line 194
    :cond_9
    move p0, v2

    .line 195
    :goto_3
    sget-boolean v5, Lcom/android/launcher3/blur/f;->b:Z

    .line 196
    .line 197
    const/4 v7, 0x0

    .line 198
    invoke-virtual {v1, v5, v7}, Landroid/graphics/drawable/Drawable;->setVisible(ZZ)Z

    .line 199
    .line 200
    .line 201
    sget-boolean v5, Lcom/android/launcher3/blur/f;->b:Z

    .line 202
    .line 203
    if-eqz v5, :cond_a

    .line 204
    .line 205
    goto :goto_4

    .line 206
    :cond_a
    move v2, v6

    .line 207
    :goto_4
    mul-float/2addr v2, v3

    .line 208
    mul-float/2addr v2, p0

    .line 209
    mul-float/2addr v2, v4

    .line 210
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 211
    .line 212
    .line 213
    move-result p0

    .line 214
    mul-float/2addr v2, p0

    .line 215
    const/high16 p0, 0x437f0000    # 255.0f

    .line 216
    .line 217
    mul-float/2addr v2, p0

    .line 218
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 219
    .line 220
    .line 221
    move-result p0

    .line 222
    invoke-virtual {v1, p0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 223
    .line 224
    .line 225
    sget-boolean p0, Lcom/android/launcher3/blur/f;->b:Z

    .line 226
    .line 227
    if-eqz p0, :cond_b

    .line 228
    .line 229
    goto :goto_5

    .line 230
    :cond_b
    const/4 v1, 0x0

    .line 231
    :goto_5
    invoke-virtual {v0, v1}, Lcom/android/launcher3/blur/a;->setBottomBgBlurDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 232
    .line 233
    .line 234
    :cond_c
    :goto_6
    return-void
.end method
