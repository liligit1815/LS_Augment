.class public final Lcom/android/launcher3/util/m3;
.super Ljava/lang/Object;
.source "WallpaperThemeManager.kt"

# interfaces
.implements Lcom/android/launcher3/util/G1;
.implements Lcom/android/launcher3/util/a;
.implements Landroid/content/ComponentCallbacks;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/m3$a;
    }
.end annotation


# static fields
.field public static final j:Lcom/android/launcher3/util/m3$a;


# instance fields
.field private final g:Landroid/app/Activity;

.field private h:I

.field private i:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/m3$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/m3$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/util/m3;->j:Lcom/android/launcher3/util/m3$a;

    .line 8
    .line 9
    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;)V
    .locals 2

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/util/m3;->g:Landroid/app/Activity;

    const v0, 0x7f150024

    .line 3
    iput v0, p0, Lcom/android/launcher3/util/m3;->h:I

    .line 4
    sget-object v0, Lcom/android/launcher3/util/h3;->d:Lcom/android/launcher3/util/h3$a;

    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/h3$a;->a(Landroid/content/Context;)Lcom/android/launcher3/util/h3;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/h3;->l(Lcom/android/launcher3/util/G1;)V

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/F2;->a(Landroid/content/Context;)I

    move-result v0

    .line 6
    iget v1, p0, Lcom/android/launcher3/util/m3;->h:I

    if-eq v0, v1, :cond_0

    .line 7
    iput v0, p0, Lcom/android/launcher3/util/m3;->h:I

    .line 8
    invoke-virtual {p1, v0}, Landroid/app/Activity;->setTheme(I)V

    .line 9
    :cond_0
    invoke-virtual {p1, p0}, Landroid/app/Activity;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    .line 10
    invoke-virtual {p1, p0}, Landroid/app/Activity;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/app/Activity;Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/util/m3;-><init>(Landroid/app/Activity;)V

    return-void
.end method

.method public static final b(Landroid/app/Activity;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m3;->j:Lcom/android/launcher3/util/m3$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/m3$a;->a(Landroid/app/Activity;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private final c()V
    .locals 4

    .line 1
    const-string v0, "updateTheme: "

    .line 2
    .line 3
    const-string v1, "WallpaperThemeManager"

    .line 4
    .line 5
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 9
    .line 10
    iget-object v2, p0, Lcom/android/launcher3/util/m3;->g:Landroid/app/Activity;

    .line 11
    .line 12
    invoke-virtual {v2}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-string v3, "getBaseContext(...)"

    .line 17
    .line 18
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    if-nez v2, :cond_0

    .line 26
    .line 27
    const-string p0, "updateTheme return, LauncherAppState no create!"

    .line 28
    .line 29
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/util/m3;->g:Landroid/app/Activity;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/app/Activity;->getBaseContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, p0}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    if-eqz p0, :cond_1

    .line 51
    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/H5;->C1()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method


# virtual methods
.method public a(I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/m3;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onActivityDestroyed(Landroid/app/Activity;)V
    .locals 1

    .line 1
    const-string v0, "unused"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, Lcom/android/launcher3/util/h3;->d:Lcom/android/launcher3/util/h3$a;

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/util/m3;->g:Landroid/app/Activity;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/h3$a;->a(Landroid/content/Context;)Lcom/android/launcher3/util/h3;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/h3;->m(Lcom/android/launcher3/util/G1;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onActivitySaveInstanceState(Landroid/app/Activity;Landroid/os/Bundle;)V
    .locals 1

    .line 1
    const-string v0, "activity"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "bundle"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string p1, "launcher.recreate_to_update_theme"

    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/android/launcher3/util/m3;->i:Z

    .line 14
    .line 15
    invoke-virtual {p2, p1, p0}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 1

    .line 1
    const-string v0, "config"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/util/m3;->c()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onLowMemory()V
    .locals 0

    .line 1
    return-void
.end method
