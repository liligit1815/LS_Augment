.class public final Lcom/android/launcher3/N5;
.super Ljava/lang/Object;
.source "Utilities.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/N5$a;
    }
.end annotation


# static fields
.field private static final a:Landroid/graphics/Matrix;

.field private static final b:Landroid/graphics/Matrix;

.field public static final c:[Ljava/lang/String;

.field public static final d:[Landroid/app/Person;

.field public static final e:Z

.field public static final f:Z

.field public static final g:Z

.field public static final h:Z

.field public static final i:Z

.field public static final j:Z

.field private static k:Z

.field private static l:Ljava/lang/Boolean;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/N5;->a:Landroid/graphics/Matrix;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Matrix;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/N5;->b:Landroid/graphics/Matrix;

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    new-array v1, v0, [Ljava/lang/String;

    .line 17
    .line 18
    sput-object v1, Lcom/android/launcher3/N5;->c:[Ljava/lang/String;

    .line 19
    .line 20
    new-array v1, v0, [Landroid/app/Person;

    .line 21
    .line 22
    sput-object v1, Lcom/android/launcher3/N5;->d:[Landroid/app/Person;

    .line 23
    .line 24
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 25
    .line 26
    const/4 v2, 0x1

    .line 27
    sput-boolean v2, Lcom/android/launcher3/N5;->e:Z

    .line 28
    .line 29
    const/16 v3, 0x21

    .line 30
    .line 31
    if-lt v1, v3, :cond_0

    .line 32
    .line 33
    move v3, v2

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    move v3, v0

    .line 36
    :goto_0
    sput-boolean v3, Lcom/android/launcher3/N5;->f:Z

    .line 37
    .line 38
    const/16 v3, 0x22

    .line 39
    .line 40
    if-lt v1, v3, :cond_1

    .line 41
    .line 42
    move v3, v2

    .line 43
    goto :goto_1

    .line 44
    :cond_1
    move v3, v0

    .line 45
    :goto_1
    sput-boolean v3, Lcom/android/launcher3/N5;->g:Z

    .line 46
    .line 47
    const/16 v3, 0x23

    .line 48
    .line 49
    if-lt v1, v3, :cond_2

    .line 50
    .line 51
    move v3, v2

    .line 52
    goto :goto_2

    .line 53
    :cond_2
    move v3, v0

    .line 54
    :goto_2
    sput-boolean v3, Lcom/android/launcher3/N5;->h:Z

    .line 55
    .line 56
    const/16 v3, 0x24

    .line 57
    .line 58
    if-lt v1, v3, :cond_3

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    move v2, v0

    .line 62
    :goto_3
    sput-boolean v2, Lcom/android/launcher3/N5;->i:Z

    .line 63
    .line 64
    invoke-static {}, Lcom/android/launcher3/y0;->Y()Z

    .line 65
    .line 66
    .line 67
    sput-boolean v0, Lcom/android/launcher3/N5;->j:Z

    .line 68
    .line 69
    invoke-static {}, Landroid/app/ActivityManager;->isRunningInTestHarness()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    sput-boolean v0, Lcom/android/launcher3/N5;->k:Z

    .line 74
    .line 75
    const/4 v0, 0x0

    .line 76
    sput-object v0, Lcom/android/launcher3/N5;->l:Ljava/lang/Boolean;

    .line 77
    .line 78
    return-void
.end method

.method public static A(Landroid/util/DisplayMetrics;)Z
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->C1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    :cond_0
    sget-boolean v0, Lx1/O;->p0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget p0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 20
    .line 21
    sget v0, Lx1/O;->q0:F

    .line 22
    .line 23
    sget v3, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 24
    .line 25
    div-int/lit16 v3, v3, 0xa0

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    mul-float/2addr v0, v3

    .line 29
    cmpl-float p0, p0, v0

    .line 30
    .line 31
    if-lez p0, :cond_1

    .line 32
    .line 33
    return v2

    .line 34
    :cond_1
    return v1

    .line 35
    :cond_2
    iget p0, p0, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 36
    .line 37
    sget v0, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 38
    .line 39
    div-int/lit16 v0, v0, 0xa0

    .line 40
    .line 41
    int-to-float v0, v0

    .line 42
    cmpl-float p0, p0, v0

    .line 43
    .line 44
    if-lez p0, :cond_3

    .line 45
    .line 46
    return v2

    .line 47
    :cond_3
    return v1
.end method

.method public static B(Landroid/content/Context;Landroid/content/ComponentName;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "Launcher.Utilities"

    .line 3
    .line 4
    if-nez p1, :cond_0

    .line 5
    .line 6
    const-string p0, "isPkgAndActivityEnable,componentName is null"

    .line 7
    .line 8
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 9
    .line 10
    .line 11
    return v0

    .line 12
    :cond_0
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    invoke-static {p0, v2}, Lx1/O;->h3(Landroid/content/Context;Ljava/lang/String;)Z

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    if-nez v3, :cond_1

    .line 21
    .line 22
    new-instance p0, Ljava/lang/StringBuilder;

    .line 23
    .line 24
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string p1, "isPkgAndActivityEnable,Package is not enable:"

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    return v0

    .line 43
    :cond_1
    :try_start_0
    const-class v2, Landroid/content/pm/LauncherApps;

    .line 44
    .line 45
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    check-cast p0, Landroid/content/pm/LauncherApps;

    .line 50
    .line 51
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-virtual {p0, p1, v2}, Landroid/content/pm/LauncherApps;->isActivityEnabled(Landroid/content/ComponentName;Landroid/os/UserHandle;)Z

    .line 56
    .line 57
    .line 58
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    return p0

    .line 60
    :catch_0
    move-exception p0

    .line 61
    new-instance v2, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v3, "isActivityEnable componentName:"

    .line 67
    .line 68
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/content/ComponentName;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    const-string p1, " error:"

    .line 79
    .line 80
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    return v0
.end method

.method public static C(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {p0, v0}, Landroid/util/Log;->isLoggable(Ljava/lang/String;I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static D(Landroid/content/res/Resources;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-ne p0, v0, :cond_0

    .line 11
    .line 12
    return v0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public static E()Z
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/N5;->k:Z

    .line 2
    .line 3
    return v0
.end method

.method public static F()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/N5;->l:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-string v0, "zte_tablet_enable"

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-static {v0, v1}, Lcom/zte/feature/Feature;->getBoolean(Ljava/lang/String;Z)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sput-object v0, Lcom/android/launcher3/N5;->l:Ljava/lang/Boolean;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "isTableDevice:"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    sget-object v1, Lcom/android/launcher3/N5;->l:Ljava/lang/Boolean;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "Launcher.Utilities"

    .line 38
    .line 39
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    sget-object v0, Lcom/android/launcher3/N5;->l:Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    return v0
.end method

.method public static G(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0

    .line 16
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 17
    return p0
.end method

.method public static H(Landroid/content/Context;)Z
    .locals 1

    .line 1
    const-class v0, Landroid/app/WallpaperManager;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/app/WallpaperManager;

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/app/WallpaperManager;->isSetWallpaperAllowed()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static I(IF)Landroid/graphics/ColorFilter;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpl-float v0, p1, v0

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x0

    .line 7
    return-object p0

    .line 8
    :cond_0
    new-instance v0, Landroid/graphics/LightingColorFilter;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-static {v1, v2, p1}, LB/a;->e(IIF)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-static {v2, p0, p1}, LB/a;->e(IIF)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-direct {v0, v1, p0}, Landroid/graphics/LightingColorFilter;-><init>(II)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public static J(FFFFFLandroid/view/animation/Interpolator;)F
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/N5;->b(FFF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static/range {p0 .. p5}, Lcom/android/launcher3/N5;->N(FFFFFLandroid/view/animation/Interpolator;)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static K(Landroid/view/View;Landroid/view/View;[F)V
    .locals 3

    .line 1
    sget-object v0, Lcom/android/launcher3/N5;->a:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getWindowId()Landroid/view/WindowId;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p1}, Landroid/view/View;->getWindowId()Landroid/view/WindowId;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    :goto_0
    if-eq p0, p1, :cond_1

    .line 22
    .line 23
    sget-object v0, Lcom/android/launcher3/N5;->a:Landroid/graphics/Matrix;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    neg-int v1, v1

    .line 30
    int-to-float v1, v1

    .line 31
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    neg-int v2, v2

    .line 36
    int-to-float v2, v2

    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->postConcat(Landroid/graphics/Matrix;)Z

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Landroid/view/View;->getLeft()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    int-to-float v1, v1

    .line 52
    invoke-virtual {p0}, Landroid/view/View;->getTop()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    int-to-float v2, v2

    .line 57
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 58
    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Landroid/view/View;

    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    sget-object p1, Lcom/android/launcher3/N5;->a:Landroid/graphics/Matrix;

    .line 68
    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getScrollX()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    neg-int v0, v0

    .line 74
    int-to-float v0, v0

    .line 75
    invoke-virtual {p0}, Landroid/view/View;->getScrollY()I

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    neg-int p0, p0

    .line 80
    int-to-float p0, p0

    .line 81
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/android/launcher3/N5;->b:Landroid/graphics/Matrix;

    .line 85
    .line 86
    invoke-virtual {p1, p0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static L(FFF)F
    .locals 0

    .line 1
    sub-float/2addr p2, p1

    .line 2
    mul-float/2addr p0, p2

    .line 3
    add-float/2addr p1, p0

    .line 4
    return p1
.end method

.method public static M(Landroid/view/View;Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 6

    .line 1
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    iget v2, p2, Landroid/graphics/Rect;->right:I

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    iget v3, p2, Landroid/graphics/Rect;->bottom:I

    .line 11
    .line 12
    int-to-float v3, v3

    .line 13
    const/4 v4, 0x4

    .line 14
    new-array v4, v4, [F

    .line 15
    .line 16
    const/4 v5, 0x0

    .line 17
    aput v0, v4, v5

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    aput v1, v4, v0

    .line 21
    .line 22
    const/4 v1, 0x2

    .line 23
    aput v2, v4, v1

    .line 24
    .line 25
    const/4 v2, 0x3

    .line 26
    aput v3, v4, v2

    .line 27
    .line 28
    invoke-static {p0, p1, v4}, Lcom/android/launcher3/N5;->K(Landroid/view/View;Landroid/view/View;[F)V

    .line 29
    .line 30
    .line 31
    aget p0, v4, v5

    .line 32
    .line 33
    float-to-int p0, p0

    .line 34
    aget p1, v4, v0

    .line 35
    .line 36
    float-to-int p1, p1

    .line 37
    aget v0, v4, v1

    .line 38
    .line 39
    float-to-int v0, v0

    .line 40
    aget v1, v4, v2

    .line 41
    .line 42
    float-to-int v1, v1

    .line 43
    invoke-virtual {p2, p0, p1, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public static N(FFFFFLandroid/view/animation/Interpolator;)F
    .locals 1

    .line 1
    cmpl-float v0, p1, p2

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    cmpl-float v0, p3, p4

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-interface {p5, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p0, p3, p4}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0

    .line 23
    :cond_1
    :goto_0
    return p3
.end method

.method public static O(IIIIILandroid/view/animation/Interpolator;)I
    .locals 0

    .line 1
    if-eq p1, p2, :cond_1

    .line 2
    .line 3
    if-ne p3, p4, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    int-to-float p0, p0

    .line 7
    int-to-float p1, p1

    .line 8
    int-to-float p2, p2

    .line 9
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/N5;->r(FFF)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-interface {p5, p0}, Landroid/view/animation/Interpolator;->getInterpolation(F)F

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    int-to-float p1, p3

    .line 18
    int-to-float p2, p4

    .line 19
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/N5;->L(FFF)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    float-to-int p0, p0

    .line 24
    return p0

    .line 25
    :cond_1
    :goto_0
    const-string p0, "Launcher.Utilities"

    .line 26
    .line 27
    const-string p1, "mapToRange: range has 0 length"

    .line 28
    .line 29
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return p3
.end method

.method public static P([FFF)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p0

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    aget v1, p0, v0

    .line 6
    .line 7
    add-float/2addr v1, p1

    .line 8
    aput v1, p0, v0

    .line 9
    .line 10
    add-int/lit8 v1, v0, 0x1

    .line 11
    .line 12
    aget v2, p0, v1

    .line 13
    .line 14
    add-float/2addr v2, p2

    .line 15
    aput v2, p0, v1

    .line 16
    .line 17
    add-int/lit8 v0, v0, 0x2

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    return-void
.end method

.method public static Q(Landroid/view/View;FFF)Z
    .locals 2

    .line 1
    neg-float v0, p3

    .line 2
    cmpl-float v1, p1, v0

    .line 3
    .line 4
    if-ltz v1, :cond_0

    .line 5
    .line 6
    cmpl-float v0, p2, v0

    .line 7
    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    int-to-float v0, v0

    .line 15
    add-float/2addr v0, p3

    .line 16
    cmpg-float p1, p1, v0

    .line 17
    .line 18
    if-gez p1, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    int-to-float p0, p0

    .line 25
    add-float/2addr p0, p3

    .line 26
    cmpg-float p0, p2, p0

    .line 27
    .line 28
    if-gez p0, :cond_0

    .line 29
    .line 30
    const/4 p0, 0x1

    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public static R(Landroid/os/Handler;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p1, v0}, Landroid/os/Message;->setAsynchronous(Z)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static S(Landroid/content/Context;ILjava/lang/CharSequence;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance v0, Landroid/text/SpannableString;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "  "

    .line 9
    .line 10
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-direct {v0, p2}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Ln1/F;

    .line 24
    .line 25
    invoke-direct {p2, p0, p1}, Ln1/F;-><init>(Landroid/content/Context;I)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    const/16 p1, 0x22

    .line 30
    .line 31
    const/4 v1, 0x0

    .line 32
    invoke-virtual {v0, p2, v1, p0, p1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 33
    .line 34
    .line 35
    return-object v0
.end method

.method public static T(F)I
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x43200000    # 160.0f

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->C1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    :cond_0
    sget-boolean v0, Lx1/O;->p0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget v0, Lx1/O;->q0:F

    .line 20
    .line 21
    mul-float/2addr v0, p0

    .line 22
    sget p0, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 23
    .line 24
    int-to-float p0, p0

    .line 25
    mul-float/2addr v0, p0

    .line 26
    div-float/2addr v0, v1

    .line 27
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    return p0

    .line 32
    :cond_1
    sget v0, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 33
    .line 34
    int-to-float v0, v0

    .line 35
    mul-float/2addr p0, v0

    .line 36
    div-float/2addr p0, v1

    .line 37
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    return p0
.end method

.method public static U(FLandroid/util/DisplayMetrics;)I
    .locals 1

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    invoke-static {p0, p1, v0}, Lcom/android/launcher3/N5;->V(FLandroid/util/DisplayMetrics;F)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static V(FLandroid/util/DisplayMetrics;F)I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0, p0, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    mul-float/2addr p2, p0

    .line 7
    invoke-static {p2}, Lc2/a;->g(F)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static W(FLandroid/util/DisplayMetrics;F)I
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x43200000    # 160.0f

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->C1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    :cond_0
    sget-boolean v0, Lx1/O;->p0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    sget v0, Lx1/O;->q0:F

    .line 20
    .line 21
    mul-float/2addr v0, p2

    .line 22
    mul-float/2addr v0, p0

    .line 23
    sget p0, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 24
    .line 25
    int-to-float p0, p0

    .line 26
    mul-float/2addr v0, p0

    .line 27
    div-float/2addr v0, v1

    .line 28
    iget p0, p1, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 29
    .line 30
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 31
    .line 32
    div-float/2addr p0, p1

    .line 33
    mul-float/2addr v0, p0

    .line 34
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0

    .line 39
    :cond_1
    mul-float/2addr p2, p0

    .line 40
    sget p0, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 41
    .line 42
    int-to-float p0, p0

    .line 43
    mul-float/2addr p2, p0

    .line 44
    div-float/2addr p2, v1

    .line 45
    iget p0, p1, Landroid/util/DisplayMetrics;->scaledDensity:F

    .line 46
    .line 47
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 48
    .line 49
    div-float/2addr p0, p1

    .line 50
    mul-float/2addr p2, p0

    .line 51
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    return p0
.end method

.method public static X(Landroid/graphics/Rect;III)V
    .locals 2

    .line 1
    rem-int/lit8 p3, p3, 0x4

    .line 2
    .line 3
    add-int/lit8 p3, p3, 0x4

    .line 4
    .line 5
    rem-int/lit8 p3, p3, 0x4

    .line 6
    .line 7
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eq p3, v1, :cond_2

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    if-eq p3, v1, :cond_1

    .line 14
    .line 15
    const/4 p1, 0x3

    .line 16
    if-eq p3, p1, :cond_0

    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    sub-int p1, p2, p1

    .line 22
    .line 23
    iput p1, p0, Landroid/graphics/Rect;->left:I

    .line 24
    .line 25
    iget p1, p0, Landroid/graphics/Rect;->right:I

    .line 26
    .line 27
    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 28
    .line 29
    iget p1, p0, Landroid/graphics/Rect;->top:I

    .line 30
    .line 31
    sub-int/2addr p2, p1

    .line 32
    iput p2, p0, Landroid/graphics/Rect;->right:I

    .line 33
    .line 34
    iput v0, p0, Landroid/graphics/Rect;->top:I

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget p2, p0, Landroid/graphics/Rect;->right:I

    .line 38
    .line 39
    sub-int p2, p1, p2

    .line 40
    .line 41
    iput p2, p0, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    sub-int/2addr p1, v0

    .line 44
    iput p1, p0, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    iget p2, p0, Landroid/graphics/Rect;->top:I

    .line 48
    .line 49
    iput p2, p0, Landroid/graphics/Rect;->left:I

    .line 50
    .line 51
    iget p2, p0, Landroid/graphics/Rect;->right:I

    .line 52
    .line 53
    sub-int p2, p1, p2

    .line 54
    .line 55
    iput p2, p0, Landroid/graphics/Rect;->top:I

    .line 56
    .line 57
    iget p2, p0, Landroid/graphics/Rect;->bottom:I

    .line 58
    .line 59
    iput p2, p0, Landroid/graphics/Rect;->right:I

    .line 60
    .line 61
    sub-int/2addr p1, v0

    .line 62
    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 63
    .line 64
    return-void
.end method

.method public static Y([F[I)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    array-length v1, p0

    .line 3
    if-ge v0, v1, :cond_0

    .line 4
    .line 5
    aget v1, p0, v0

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aput v1, p1, v0

    .line 12
    .line 13
    add-int/lit8 v0, v0, 0x1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return-void
.end method

.method public static Z(Landroid/graphics/Rect;F)V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    cmpl-float v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/graphics/Rect;->exactCenterX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Landroid/graphics/Rect;->exactCenterY()F

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget v2, p0, Landroid/graphics/Rect;->left:I

    .line 16
    .line 17
    int-to-float v2, v2

    .line 18
    sub-float/2addr v2, v0

    .line 19
    mul-float/2addr v2, p1

    .line 20
    add-float/2addr v2, v0

    .line 21
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    iput v2, p0, Landroid/graphics/Rect;->left:I

    .line 26
    .line 27
    iget v2, p0, Landroid/graphics/Rect;->top:I

    .line 28
    .line 29
    int-to-float v2, v2

    .line 30
    sub-float/2addr v2, v1

    .line 31
    mul-float/2addr v2, p1

    .line 32
    add-float/2addr v2, v1

    .line 33
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    iput v2, p0, Landroid/graphics/Rect;->top:I

    .line 38
    .line 39
    iget v2, p0, Landroid/graphics/Rect;->right:I

    .line 40
    .line 41
    int-to-float v2, v2

    .line 42
    sub-float/2addr v2, v0

    .line 43
    mul-float/2addr v2, p1

    .line 44
    add-float/2addr v0, v2

    .line 45
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    iput v0, p0, Landroid/graphics/Rect;->right:I

    .line 50
    .line 51
    iget v0, p0, Landroid/graphics/Rect;->bottom:I

    .line 52
    .line 53
    int-to-float v0, v0

    .line 54
    sub-float/2addr v0, v1

    .line 55
    mul-float/2addr v0, p1

    .line 56
    add-float/2addr v1, v0

    .line 57
    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    iput p1, p0, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method public static a(Landroid/app/ActivityOptions;)Landroid/app/ActivityOptions;
    .locals 1

    .line 1
    sget-boolean v0, Lcom/android/launcher3/N5;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0, v0}, Landroid/app/ActivityOptions;->setPendingIntentBackgroundActivityStartMode(I)Landroid/app/ActivityOptions;

    .line 7
    .line 8
    .line 9
    :cond_0
    return-object p0
.end method

.method public static a0(Landroid/graphics/RectF;F)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p1}, Lcom/android/launcher3/N5;->b0(Landroid/graphics/RectF;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static b(FFF)F
    .locals 0

    .line 1
    invoke-static {p0, p2}, Ljava/lang/Math;->min(FF)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static b0(Landroid/graphics/RectF;FF)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/graphics/RectF;->centerX()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/graphics/RectF;->centerY()F

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    neg-float v2, v0

    .line 10
    neg-float v3, v1

    .line 11
    invoke-virtual {p0, v2, v3}, Landroid/graphics/RectF;->offset(FF)V

    .line 12
    .line 13
    .line 14
    iget v2, p0, Landroid/graphics/RectF;->left:F

    .line 15
    .line 16
    mul-float/2addr v2, p1

    .line 17
    iput v2, p0, Landroid/graphics/RectF;->left:F

    .line 18
    .line 19
    iget v2, p0, Landroid/graphics/RectF;->top:F

    .line 20
    .line 21
    mul-float/2addr v2, p2

    .line 22
    iput v2, p0, Landroid/graphics/RectF;->top:F

    .line 23
    .line 24
    iget v2, p0, Landroid/graphics/RectF;->right:F

    .line 25
    .line 26
    mul-float/2addr v2, p1

    .line 27
    iput v2, p0, Landroid/graphics/RectF;->right:F

    .line 28
    .line 29
    iget p1, p0, Landroid/graphics/RectF;->bottom:F

    .line 30
    .line 31
    mul-float/2addr p1, p2

    .line 32
    iput p1, p0, Landroid/graphics/RectF;->bottom:F

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public static c(III)I
    .locals 0

    .line 1
    invoke-static {p0, p2}, Ljava/lang/Math;->min(II)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static c0(Landroid/graphics/RectF;FFF)V
    .locals 2

    .line 1
    neg-float v0, p1

    .line 2
    neg-float v1, p2

    .line 3
    invoke-virtual {p0, v0, v1}, Landroid/graphics/RectF;->offset(FF)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Landroid/graphics/RectF;->left:F

    .line 7
    .line 8
    mul-float/2addr v0, p3

    .line 9
    iput v0, p0, Landroid/graphics/RectF;->left:F

    .line 10
    .line 11
    iget v0, p0, Landroid/graphics/RectF;->top:F

    .line 12
    .line 13
    mul-float/2addr v0, p3

    .line 14
    iput v0, p0, Landroid/graphics/RectF;->top:F

    .line 15
    .line 16
    iget v0, p0, Landroid/graphics/RectF;->right:F

    .line 17
    .line 18
    mul-float/2addr v0, p3

    .line 19
    iput v0, p0, Landroid/graphics/RectF;->right:F

    .line 20
    .line 21
    iget v0, p0, Landroid/graphics/RectF;->bottom:F

    .line 22
    .line 23
    mul-float/2addr v0, p3

    .line 24
    iput v0, p0, Landroid/graphics/RectF;->bottom:F

    .line 25
    .line 26
    invoke-virtual {p0, p1, p2}, Landroid/graphics/RectF;->offset(FF)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public static d(JJJ)J
    .locals 0

    .line 1
    invoke-static {p0, p1, p4, p5}, Ljava/lang/Math;->min(JJ)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    invoke-static {p2, p3, p0, p1}, Ljava/lang/Math;->max(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0
.end method

.method public static d0(Landroid/graphics/Rect;FF)F
    .locals 3

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/high16 v1, 0x3f800000    # 1.0f

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    cmpg-float v1, v0, v1

    .line 12
    .line 13
    if-gez v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v1, v1

    .line 20
    sub-float/2addr p1, v0

    .line 21
    mul-float/2addr v1, p1

    .line 22
    const/high16 p1, 0x3f000000    # 0.5f

    .line 23
    .line 24
    mul-float/2addr v1, p1

    .line 25
    float-to-int v1, v1

    .line 26
    iget v2, p0, Landroid/graphics/Rect;->left:I

    .line 27
    .line 28
    add-int/2addr v2, v1

    .line 29
    iput v2, p0, Landroid/graphics/Rect;->left:I

    .line 30
    .line 31
    iget v2, p0, Landroid/graphics/Rect;->right:I

    .line 32
    .line 33
    sub-int/2addr v2, v1

    .line 34
    iput v2, p0, Landroid/graphics/Rect;->right:I

    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    int-to-float v1, v1

    .line 41
    sub-float/2addr p2, v0

    .line 42
    mul-float/2addr v1, p2

    .line 43
    mul-float/2addr v1, p1

    .line 44
    float-to-int p1, v1

    .line 45
    iget p2, p0, Landroid/graphics/Rect;->top:I

    .line 46
    .line 47
    add-int/2addr p2, p1

    .line 48
    iput p2, p0, Landroid/graphics/Rect;->top:I

    .line 49
    .line 50
    iget p2, p0, Landroid/graphics/Rect;->bottom:I

    .line 51
    .line 52
    sub-int/2addr p2, p1

    .line 53
    iput p2, p0, Landroid/graphics/Rect;->bottom:I

    .line 54
    .line 55
    :cond_0
    return v0
.end method

.method public static e(FFF)F
    .locals 1

    .line 1
    cmpg-float v0, p1, p2

    .line 2
    .line 3
    if-gez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p0, p2}, Ljava/lang/Math;->min(FF)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p1, p0}, Ljava/lang/Math;->max(FF)F

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-static {p2, p0}, Ljava/lang/Math;->max(FF)F

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    return p0
.end method

.method public static e0(FF)F
    .locals 0

    .line 1
    mul-float/2addr p0, p0

    .line 2
    mul-float/2addr p1, p1

    .line 3
    add-float/2addr p0, p1

    .line 4
    return p0
.end method

.method public static f(F)I
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    iget v0, p0, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 14
    .line 15
    iget p0, p0, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 16
    .line 17
    sub-float/2addr v0, p0

    .line 18
    float-to-double v0, v0

    .line 19
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide v0

    .line 23
    double-to-int p0, v0

    .line 24
    return p0
.end method

.method public static f0(Landroid/content/Context;)F
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-float p0, p0

    .line 10
    mul-float/2addr p0, p0

    .line 11
    return p0
.end method

.method public static g(Ljava/lang/String;Lcom/android/launcher3/util/x0;)Ljava/lang/String;
    .locals 1

    .line 1
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/util/x0;->B()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p0, p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string p1, "%s IN (%s)"

    .line 12
    .line 13
    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static g0(Ljava/lang/CharSequence;)Ljava/lang/String;
    .locals 2

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v1, "(^\\h+|\\h+$)"

    .line 11
    .line 12
    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/N;->a:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public static h0(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    new-instance v0, Landroid/text/SpannableString;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/text/style/TtsSpan$TextBuilder;

    .line 7
    .line 8
    invoke-direct {p0, p1}, Landroid/text/style/TtsSpan$TextBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/text/style/TtsSpan$TextBuilder;->build()Landroid/text/style/TtsSpan;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {v0}, Landroid/text/SpannableString;->length()I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/16 v1, 0x12

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-virtual {v0, p0, v2, p1, v1}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static i(F)I
    .locals 1

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 10
    .line 11
    mul-float/2addr p0, v0

    .line 12
    float-to-int p0, p0

    .line 13
    return p0
.end method

.method public static j(FI)F
    .locals 1

    .line 1
    int-to-float p1, p1

    .line 2
    const/high16 v0, 0x43200000    # 160.0f

    .line 3
    .line 4
    div-float/2addr p1, v0

    .line 5
    div-float/2addr p0, p1

    .line 6
    return p0
.end method

.method public static k(Landroid/view/View;Ljava/util/function/Predicate;)Landroid/view/View;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(",
            "Landroid/view/View;",
            "Ljava/util/function/Predicate<",
            "Landroid/view/View;",
            ">;)TT;"
        }
    .end annotation

    .line 1
    invoke-interface {p1, p0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    instance-of v0, p0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz v0, :cond_2

    .line 11
    .line 12
    check-cast p0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    const/4 v1, 0x0

    .line 19
    :goto_0
    if-ge v1, v0, :cond_2

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v2, p1}, Lcom/android/launcher3/N5;->k(Landroid/view/View;Ljava/util/function/Predicate;)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    return-object v2

    .line 32
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_2
    const/4 p0, 0x0

    .line 36
    return-object p0
.end method

.method public static l(Lcom/android/launcher3/views/BaseDragLayer;Landroid/view/View;Landroid/graphics/Rect;Z[FLandroid/graphics/RectF;)V
    .locals 4

    .line 1
    if-nez p4, :cond_0

    .line 2
    .line 3
    const/4 p4, 0x4

    .line 4
    new-array p4, p4, [F

    .line 5
    .line 6
    :cond_0
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    int-to-float v0, v0

    .line 9
    const/4 v1, 0x0

    .line 10
    aput v0, p4, v1

    .line 11
    .line 12
    iget v0, p2, Landroid/graphics/Rect;->top:I

    .line 13
    .line 14
    int-to-float v0, v0

    .line 15
    const/4 v2, 0x1

    .line 16
    aput v0, p4, v2

    .line 17
    .line 18
    iget v0, p2, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    int-to-float v0, v0

    .line 21
    const/4 v3, 0x2

    .line 22
    aput v0, p4, v3

    .line 23
    .line 24
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 25
    .line 26
    int-to-float p2, p2

    .line 27
    const/4 v0, 0x3

    .line 28
    aput p2, p4, v0

    .line 29
    .line 30
    invoke-static {p1, p0, p4, v1, p3}, Lcom/android/launcher3/N5;->n(Landroid/view/View;Landroid/view/View;[FZZ)F

    .line 31
    .line 32
    .line 33
    aget p0, p4, v1

    .line 34
    .line 35
    aget p1, p4, v3

    .line 36
    .line 37
    invoke-static {p0, p1}, Ljava/lang/Math;->min(FF)F

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    aget p1, p4, v2

    .line 42
    .line 43
    aget p2, p4, v0

    .line 44
    .line 45
    invoke-static {p1, p2}, Ljava/lang/Math;->min(FF)F

    .line 46
    .line 47
    .line 48
    move-result p1

    .line 49
    aget p2, p4, v1

    .line 50
    .line 51
    aget p3, p4, v3

    .line 52
    .line 53
    invoke-static {p2, p3}, Ljava/lang/Math;->max(FF)F

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    aget p3, p4, v2

    .line 58
    .line 59
    aget p4, p4, v0

    .line 60
    .line 61
    invoke-static {p3, p4}, Ljava/lang/Math;->max(FF)F

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    invoke-virtual {p5, p0, p1, p2, p3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public static m(Landroid/view/View;Landroid/view/View;[FZ)F
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, p3, v0}, Lcom/android/launcher3/N5;->n(Landroid/view/View;Landroid/view/View;[FZZ)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public static n(Landroid/view/View;Landroid/view/View;[FZZ)F
    .locals 4

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    :goto_0
    if-eq v1, p1, :cond_4

    .line 5
    .line 6
    if-eqz v1, :cond_4

    .line 7
    .line 8
    if-ne v1, p0, :cond_0

    .line 9
    .line 10
    if-eqz p3, :cond_1

    .line 11
    .line 12
    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getScrollX()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    neg-int v2, v2

    .line 17
    int-to-float v2, v2

    .line 18
    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    neg-int v3, v3

    .line 23
    int-to-float v3, v3

    .line 24
    invoke-static {p2, v2, v3}, Lcom/android/launcher3/N5;->P([FFF)V

    .line 25
    .line 26
    .line 27
    :cond_1
    if-nez p4, :cond_2

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/view/View;->getMatrix()Landroid/graphics/Matrix;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-virtual {v2, p2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 34
    .line 35
    .line 36
    :cond_2
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v2, v2

    .line 41
    invoke-virtual {v1}, Landroid/view/View;->getTop()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-float v3, v3

    .line 46
    invoke-static {p2, v2, v3}, Lcom/android/launcher3/N5;->P([FFF)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Landroid/view/View;->getScaleX()F

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    mul-float/2addr v0, v2

    .line 54
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    instance-of v2, v2, Landroid/view/View;

    .line 59
    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Landroid/view/View;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_3
    const/4 v1, 0x0

    .line 70
    goto :goto_0

    .line 71
    :cond_4
    return v0
.end method

.method public static o(Landroid/content/Context;Lcom/android/launcher3/model/data/y;IIZ)Landroid/util/Pair;
    .locals 7
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "UseCompatLoadingForDrawables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/content/Context;",
            ":",
            "Lcom/android/launcher3/views/k;",
            ">(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "IIZ)",
            "Landroid/util/Pair<",
            "Landroid/graphics/drawable/Drawable;",
            "Landroid/graphics/drawable/Drawable;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, p1, Lcom/android/launcher3/model/data/z;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    move-object v3, p1

    .line 11
    check-cast v3, Lcom/android/launcher3/model/data/z;

    .line 12
    .line 13
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/z;->x()Lt1/g;

    .line 14
    .line 15
    .line 16
    move-result-object v4

    .line 17
    invoke-virtual {v4}, Lt1/g;->e()Z

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    if-nez v4, :cond_0

    .line 22
    .line 23
    iget-object v3, v3, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/android/launcher3/N5;->p(Landroid/content/Context;)Landroid/graphics/Path;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    invoke-virtual {v3, p0, p4, v4}, Ls1/d;->f(Landroid/content/Context;ZLandroid/graphics/Path;)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    move-object v3, v2

    .line 35
    :goto_0
    instance-of v4, p1, Lcom/android/launcher3/widget/y0;

    .line 36
    .line 37
    const/4 v5, 0x0

    .line 38
    if-eqz v4, :cond_1

    .line 39
    .line 40
    move-object p2, p1

    .line 41
    check-cast p2, Lcom/android/launcher3/widget/y0;

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Lcom/android/launcher3/widget/y0;->P(Landroid/content/Context;)LD1/i;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    invoke-virtual {p2, p3}, LD1/i;->h(Lt1/f;)Landroid/graphics/drawable/Drawable;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    goto/16 :goto_2

    .line 56
    .line 57
    :cond_1
    iget v4, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 58
    .line 59
    if-nez v4, :cond_3

    .line 60
    .line 61
    const-class p2, Landroid/content/pm/LauncherApps;

    .line 62
    .line 63
    invoke-virtual {p0, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    check-cast p2, Landroid/content/pm/LauncherApps;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 70
    .line 71
    .line 72
    move-result-object p3

    .line 73
    iget-object v4, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 74
    .line 75
    invoke-virtual {p2, p3, v4}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    if-nez p2, :cond_2

    .line 80
    .line 81
    return-object v2

    .line 82
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    invoke-virtual {p3, p2}, Lt1/f;->u(Landroid/content/pm/LauncherActivityInfo;)Landroid/graphics/drawable/Drawable;

    .line 87
    .line 88
    .line 89
    move-result-object p2

    .line 90
    goto/16 :goto_2

    .line 91
    .line 92
    :cond_3
    const/4 v6, 0x6

    .line 93
    if-ne v4, v6, :cond_9

    .line 94
    .line 95
    invoke-static {p1}, LN1/e;->d(Lcom/android/launcher3/model/data/y;)LN1/e;

    .line 96
    .line 97
    .line 98
    move-result-object p2

    .line 99
    invoke-virtual {p2, p0}, LN1/e;->a(Landroid/content/Context;)LN1/f;

    .line 100
    .line 101
    .line 102
    move-result-object p2

    .line 103
    const/16 p3, 0xb

    .line 104
    .line 105
    invoke-virtual {p2, p3}, LN1/f;->d(I)LN1/f$a;

    .line 106
    .line 107
    .line 108
    move-result-object p2

    .line 109
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 110
    .line 111
    .line 112
    move-result p3

    .line 113
    if-eqz p3, :cond_4

    .line 114
    .line 115
    return-object v2

    .line 116
    :cond_4
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object p2

    .line 120
    check-cast p2, Landroid/content/pm/ShortcutInfo;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 123
    .line 124
    .line 125
    move-result-object p3

    .line 126
    iget p3, p3, Lcom/android/launcher3/F1;->O0:I

    .line 127
    .line 128
    invoke-static {p0, p2, p3}, Ls1/h;->c(Landroid/content/Context;Landroid/content/pm/ShortcutInfo;I)Landroid/graphics/drawable/Drawable;

    .line 129
    .line 130
    .line 131
    move-result-object p3

    .line 132
    instance-of v4, p1, Lcom/android/launcher3/model/data/I;

    .line 133
    .line 134
    if-eqz v4, :cond_5

    .line 135
    .line 136
    move-object v4, p1

    .line 137
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 138
    .line 139
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/z;->C()Z

    .line 140
    .line 141
    .line 142
    move-result v4

    .line 143
    if-nez v4, :cond_5

    .line 144
    .line 145
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    .line 146
    .line 147
    invoke-direct {v3, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 148
    .line 149
    .line 150
    goto :goto_1

    .line 151
    :cond_5
    invoke-virtual {p2}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    const-string v6, "com.zte.halo.app"

    .line 156
    .line 157
    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v4

    .line 161
    if-eqz v4, :cond_6

    .line 162
    .line 163
    invoke-virtual {p2}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v4

    .line 167
    const-string v6, "ai_agent_"

    .line 168
    .line 169
    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    if-eqz v4, :cond_6

    .line 174
    .line 175
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    .line 176
    .line 177
    invoke-direct {v3, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 178
    .line 179
    .line 180
    goto :goto_1

    .line 181
    :cond_6
    const-string v4, "com.jiutian.yidonglingxi"

    .line 182
    .line 183
    invoke-virtual {p2}, Landroid/content/pm/ShortcutInfo;->getPackage()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v6

    .line 187
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 188
    .line 189
    .line 190
    move-result v4

    .line 191
    if-eqz v4, :cond_7

    .line 192
    .line 193
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    .line 194
    .line 195
    invoke-direct {v3, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 196
    .line 197
    .line 198
    goto :goto_1

    .line 199
    :cond_7
    iget v4, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 200
    .line 201
    const/4 v6, -0x1

    .line 202
    if-eq v4, v6, :cond_8

    .line 203
    .line 204
    if-nez v3, :cond_8

    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    invoke-virtual {v0, p2}, Ls1/P;->D0(Landroid/content/pm/ShortcutInfo;)Ls1/d;

    .line 211
    .line 212
    .line 213
    move-result-object p2

    .line 214
    sget-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 215
    .line 216
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    check-cast v0, Ln1/C;

    .line 221
    .line 222
    invoke-virtual {v0}, Ln1/C;->m()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    invoke-static {p0}, Lcom/android/launcher3/N5;->p(Landroid/content/Context;)Landroid/graphics/Path;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {p2, p0, v0, v3}, Ls1/d;->o(Landroid/content/Context;ILandroid/graphics/Path;)Ls1/o;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    :cond_8
    :goto_1
    move-object p2, p3

    .line 235
    goto :goto_2

    .line 236
    :cond_9
    const/4 v0, 0x2

    .line 237
    if-ne v4, v0, :cond_b

    .line 238
    .line 239
    move-object v0, p0

    .line 240
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 241
    .line 242
    iget v3, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 243
    .line 244
    new-instance v4, Landroid/graphics/Point;

    .line 245
    .line 246
    invoke-direct {v4, p2, p3}, Landroid/graphics/Point;-><init>(II)V

    .line 247
    .line 248
    .line 249
    invoke-static {v0, v3, v4}, Lcom/android/launcher3/dragndrop/E;->e(Lcom/android/launcher3/views/k;ILandroid/graphics/Point;)Lcom/android/launcher3/dragndrop/E;

    .line 250
    .line 251
    .line 252
    move-result-object p2

    .line 253
    if-nez p2, :cond_a

    .line 254
    .line 255
    return-object v2

    .line 256
    :cond_a
    invoke-virtual {p2}, Lcom/android/launcher3/dragndrop/E;->f()Landroid/graphics/drawable/Drawable;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    goto :goto_2

    .line 261
    :cond_b
    move-object p2, v2

    .line 262
    :goto_2
    if-nez p2, :cond_c

    .line 263
    .line 264
    return-object v2

    .line 265
    :cond_c
    instance-of p3, p2, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 266
    .line 267
    if-eqz p3, :cond_d

    .line 268
    .line 269
    check-cast p2, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 270
    .line 271
    goto :goto_4

    .line 272
    :cond_d
    invoke-static {}, Lx1/O;->e4()Ljava/lang/Boolean;

    .line 273
    .line 274
    .line 275
    move-result-object p3

    .line 276
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 277
    .line 278
    .line 279
    move-result p3

    .line 280
    if-eqz p3, :cond_f

    .line 281
    .line 282
    invoke-static {p0}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 283
    .line 284
    .line 285
    move-result-object p3

    .line 286
    :try_start_0
    invoke-virtual {p3, p2}, Ls1/b;->l0(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 287
    .line 288
    .line 289
    move-result-object p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    invoke-virtual {p3}, Ls1/X;->close()V

    .line 291
    .line 292
    .line 293
    goto :goto_4

    .line 294
    :catchall_0
    move-exception p0

    .line 295
    if-eqz p3, :cond_e

    .line 296
    .line 297
    :try_start_1
    invoke-virtual {p3}, Ls1/X;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 298
    .line 299
    .line 300
    goto :goto_3

    .line 301
    :catchall_1
    move-exception p1

    .line 302
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 303
    .line 304
    .line 305
    :cond_e
    :goto_3
    throw p0

    .line 306
    :cond_f
    :goto_4
    if-nez p2, :cond_10

    .line 307
    .line 308
    return-object v2

    .line 309
    :cond_10
    sget-boolean p3, Lcom/android/launcher3/N5;->f:Z

    .line 310
    .line 311
    if-eqz p3, :cond_12

    .line 312
    .line 313
    if-eqz p4, :cond_12

    .line 314
    .line 315
    instance-of p3, p2, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 316
    .line 317
    if-eqz p3, :cond_12

    .line 318
    .line 319
    sget-object p3, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 320
    .line 321
    invoke-virtual {p3, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object p3

    .line 325
    check-cast p3, Ln1/C;

    .line 326
    .line 327
    invoke-virtual {p3}, Ln1/C;->l()Ls1/U;

    .line 328
    .line 329
    .line 330
    move-result-object p3

    .line 331
    if-eqz p3, :cond_12

    .line 332
    .line 333
    move-object v0, p2

    .line 334
    check-cast v0, Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 335
    .line 336
    if-eqz v1, :cond_11

    .line 337
    .line 338
    move-object v1, p1

    .line 339
    check-cast v1, Lcom/android/launcher3/model/data/z;

    .line 340
    .line 341
    iget-object v2, v1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 342
    .line 343
    :cond_11
    invoke-interface {p3, p0, v0, v2}, Ls1/U;->a(Landroid/content/Context;Landroid/graphics/drawable/AdaptiveIconDrawable;Ls1/d;)Landroid/graphics/drawable/AdaptiveIconDrawable;

    .line 344
    .line 345
    .line 346
    move-result-object p3

    .line 347
    if-eqz p3, :cond_12

    .line 348
    .line 349
    move-object p2, p3

    .line 350
    :cond_12
    if-nez v3, :cond_13

    .line 351
    .line 352
    sget-object p3, Ls1/d;->i:Ls1/d;

    .line 353
    .line 354
    sget-object v0, LD1/t;->g:Lcom/android/launcher3/util/I;

    .line 355
    .line 356
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    check-cast v0, LD1/t;

    .line 361
    .line 362
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 363
    .line 364
    invoke-virtual {v0, p1}, LD1/t;->o(Landroid/os/UserHandle;)Lcom/android/launcher3/util/N2;

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    sget-object v0, Lcom/android/launcher3/util/p0;->a:Lcom/android/launcher3/util/p0;

    .line 369
    .line 370
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/N2;->a(Lcom/android/launcher3/util/p0;)Lcom/android/launcher3/util/p0;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    invoke-virtual {p3, p1}, Ls1/d;->t(Lcom/android/launcher3/util/p0;)Ls1/d;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    invoke-static {p0}, Lcom/android/launcher3/N5;->p(Landroid/content/Context;)Landroid/graphics/Path;

    .line 379
    .line 380
    .line 381
    move-result-object p3

    .line 382
    invoke-virtual {p1, p0, p4, p3}, Ls1/d;->f(Landroid/content/Context;ZLandroid/graphics/Path;)Landroid/graphics/drawable/Drawable;

    .line 383
    .line 384
    .line 385
    move-result-object v3

    .line 386
    if-nez v3, :cond_13

    .line 387
    .line 388
    new-instance v3, Landroid/graphics/drawable/ColorDrawable;

    .line 389
    .line 390
    invoke-direct {v3, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 391
    .line 392
    .line 393
    :cond_13
    invoke-static {p2, v3}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    return-object p0
.end method

.method public static p(Landroid/content/Context;)Landroid/graphics/Path;
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->E()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    check-cast p0, Ln1/C;

    .line 14
    .line 15
    invoke-virtual {p0}, Ln1/C;->j()Ln1/t;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/high16 v0, 0x42c80000    # 100.0f

    .line 20
    .line 21
    invoke-interface {p0, v0}, Ln1/t;->b(F)Landroid/graphics/Path;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method public static q(Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/PointF;)V
    .locals 3

    .line 1
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 5
    .line 6
    int-to-float v1, v1

    .line 7
    sub-float/2addr v0, v1

    .line 8
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    invoke-virtual {p0}, Landroid/graphics/Rect;->width()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    int-to-float v2, v2

    .line 18
    sub-float/2addr v1, v2

    .line 19
    div-float/2addr v0, v1

    .line 20
    iget v1, p1, Landroid/graphics/Rect;->left:I

    .line 21
    .line 22
    int-to-float v1, v1

    .line 23
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    int-to-float v2, v2

    .line 28
    mul-float/2addr v2, v0

    .line 29
    add-float/2addr v1, v2

    .line 30
    iput v1, p2, Landroid/graphics/PointF;->x:F

    .line 31
    .line 32
    iget v0, p0, Landroid/graphics/Rect;->top:I

    .line 33
    .line 34
    int-to-float v0, v0

    .line 35
    iget v1, p1, Landroid/graphics/Rect;->top:I

    .line 36
    .line 37
    int-to-float v1, v1

    .line 38
    sub-float/2addr v0, v1

    .line 39
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    int-to-float v1, v1

    .line 44
    invoke-virtual {p0}, Landroid/graphics/Rect;->height()I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    int-to-float p0, p0

    .line 49
    sub-float/2addr v1, p0

    .line 50
    div-float/2addr v0, v1

    .line 51
    iget p0, p1, Landroid/graphics/Rect;->top:I

    .line 52
    .line 53
    int-to-float p0, p0

    .line 54
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    int-to-float p1, p1

    .line 59
    mul-float/2addr p1, v0

    .line 60
    add-float/2addr p0, p1

    .line 61
    iput p0, p2, Landroid/graphics/PointF;->y:F

    .line 62
    .line 63
    return-void
.end method

.method public static r(FFF)F
    .locals 0

    .line 1
    sub-float/2addr p0, p1

    .line 2
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    sub-float/2addr p2, p1

    .line 7
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    div-float/2addr p0, p1

    .line 12
    return p0
.end method

.method public static s(Lcom/android/launcher3/h0;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/h0;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/y2$b;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/android/launcher3/util/y2$b;

    .line 2
    .line 3
    const v0, 0x7f140328

    .line 4
    .line 5
    .line 6
    const v1, 0x7f080d72

    .line 7
    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-direct {p0, v1, v0, v2, v2}, Lcom/android/launcher3/util/y2$b;-><init>(IIII)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public static t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 1
    :try_start_0
    const-string v0, "android.os.SystemProperties"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "get"

    .line 8
    .line 9
    const-class v2, Ljava/lang/String;

    .line 10
    .line 11
    filled-new-array {v2}, [Ljava/lang/Class;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-virtual {v0, v1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Ljava/lang/String;

    .line 29
    .line 30
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    if-nez v0, :cond_0

    .line 35
    .line 36
    return-object p0

    .line 37
    :catch_0
    move-exception p0

    .line 38
    new-instance v0, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v1, "Unable to read system properties"

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v0, "Launcher.Utilities"

    .line 60
    .line 61
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    :cond_0
    return-object p1
.end method

.method public static u(Landroid/view/View;)Landroid/graphics/Rect;
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 5
    .line 6
    .line 7
    new-instance v1, Landroid/graphics/Rect;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    aget v2, v0, v2

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    aget v4, v0, v3

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 16
    .line 17
    .line 18
    move-result v5

    .line 19
    add-int/2addr v5, v2

    .line 20
    aget v0, v0, v3

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/2addr v0, p0

    .line 27
    invoke-direct {v1, v2, v4, v5, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 28
    .line 29
    .line 30
    return-object v1
.end method

.method public static v(Ljava/lang/Exception;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Landroid/os/TransactionTooLargeException;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of p0, p0, Landroid/os/DeadObjectException;

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 21
    return p0
.end method

.method public static w()Z
    .locals 2

    .line 1
    const-string v0, "sys.boot_completed"

    .line 2
    .line 3
    const-string v1, "1"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/android/launcher3/N5;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    return v0
.end method

.method public static x(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget p0, p0, Landroid/content/res/Configuration;->uiMode:I

    .line 10
    .line 11
    and-int/lit8 p0, p0, 0x30

    .line 12
    .line 13
    const/16 v0, 0x20

    .line 14
    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static y(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-object p0, p0, Landroid/content/res/Configuration;->locale:Ljava/util/Locale;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0
.end method

.method public static z(Landroid/util/DisplayMetrics;)Z
    .locals 4

    .line 1
    invoke-static {}, Lx1/O;->w3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Lx1/O;->C1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_2

    .line 14
    .line 15
    :cond_0
    sget-boolean v0, Lx1/O;->p0:Z

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 20
    .line 21
    sget v0, Lx1/O;->q0:F

    .line 22
    .line 23
    sget v3, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 24
    .line 25
    div-int/lit16 v3, v3, 0xa0

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    mul-float/2addr v0, v3

    .line 29
    cmpl-float p0, p0, v0

    .line 30
    .line 31
    if-lez p0, :cond_1

    .line 32
    .line 33
    return v2

    .line 34
    :cond_1
    return v1

    .line 35
    :cond_2
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 36
    .line 37
    sget v0, Landroid/util/DisplayMetrics;->DENSITY_DEVICE_STABLE:I

    .line 38
    .line 39
    div-int/lit16 v0, v0, 0xa0

    .line 40
    .line 41
    int-to-float v0, v0

    .line 42
    cmpl-float p0, p0, v0

    .line 43
    .line 44
    if-lez p0, :cond_3

    .line 45
    .line 46
    return v2

    .line 47
    :cond_3
    return v1
.end method
