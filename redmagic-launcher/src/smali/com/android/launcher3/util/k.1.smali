.class public final Lcom/android/launcher3/util/k;
.super Ljava/lang/Object;
.source "ApplicationInfoWrapper.kt"


# instance fields
.field private final a:Lh4/e;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 1

    const-string v0, "ctx"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "intent"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 5
    new-instance v0, Lcom/android/launcher3/util/h;

    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/util/h;-><init>(Landroid/content/Context;Landroid/content/Intent;)V

    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;-><init>(Lu4/a;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V
    .locals 1

    const-string v0, "ctx"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "pkg"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "user"

    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    new-instance v0, Lcom/android/launcher3/util/j;

    invoke-direct {v0, p1, p2, p3}, Lcom/android/launcher3/util/j;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)V

    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;-><init>(Lu4/a;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/pm/ApplicationInfo;)V
    .locals 1

    .line 3
    new-instance v0, Lcom/android/launcher3/util/i;

    invoke-direct {v0, p1}, Lcom/android/launcher3/util/i;-><init>(Landroid/content/pm/ApplicationInfo;)V

    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;-><init>(Lu4/a;)V

    return-void
.end method

.method private constructor <init>(Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "+",
            "Landroid/content/pm/ApplicationInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    sget-object v0, Lh4/i;->i:Lh4/i;

    invoke-static {v0, p1}, Lh4/f;->a(Lh4/i;Lu4/a;)Lh4/e;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/util/k;->a:Lh4/e;

    return-void
.end method

.method public static synthetic a(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/k;->f(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/util/k;->d(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/util/k;->e(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final d(Landroid/content/pm/ApplicationInfo;)Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    return-object p0
.end method

.method private static final e(Landroid/content/Context;Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-class v1, Landroid/content/pm/LauncherApps;

    .line 3
    .line 4
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    check-cast p0, Landroid/content/pm/LauncherApps;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    const/16 v1, 0x2000

    .line 13
    .line 14
    invoke-virtual {p0, p1, v1, p2}, Landroid/content/pm/LauncherApps;->getApplicationInfo(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    if-eqz p0, :cond_1

    .line 19
    .line 20
    iget-boolean p1, p0, Landroid/content/pm/ApplicationInfo;->enabled:Z

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    iget p1, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 25
    .line 26
    const/high16 p2, 0x800000

    .line 27
    .line 28
    and-int/2addr p1, p2

    .line 29
    if-nez p1, :cond_0

    .line 30
    .line 31
    sget-boolean p1, Lcom/android/launcher3/N5;->h:Z

    .line 32
    .line 33
    if-eqz p1, :cond_1

    .line 34
    .line 35
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    iget-boolean p1, p0, Landroid/content/pm/ApplicationInfo;->isArchived:Z
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    :cond_0
    return-object p0

    .line 46
    :catch_0
    :cond_1
    return-object v0
.end method

.method private static final f(Landroid/content/Context;Landroid/content/Intent;)Landroid/content/pm/ApplicationInfo;
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    invoke-virtual {p1}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    if-nez v1, :cond_2

    .line 17
    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/content/Intent;->getPackage()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    if-nez v1, :cond_2

    .line 23
    .line 24
    const/high16 v1, 0x10000

    .line 25
    .line 26
    invoke-virtual {p0, p1, v1}, Landroid/content/pm/PackageManager;->resolveActivity(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_1

    .line 31
    .line 32
    iget-object p0, p0, Landroid/content/pm/ResolveInfo;->activityInfo:Landroid/content/pm/ActivityInfo;

    .line 33
    .line 34
    if-eqz p0, :cond_1

    .line 35
    .line 36
    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 37
    .line 38
    return-object p0

    .line 39
    :cond_1
    return-object v0

    .line 40
    :cond_2
    const/4 p1, 0x0

    .line 41
    invoke-virtual {p0, v1, p1}, Landroid/content/pm/PackageManager;->getApplicationInfo(Ljava/lang/String;I)Landroid/content/pm/ApplicationInfo;

    .line 42
    .line 43
    .line 44
    move-result-object p0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 45
    return-object p0

    .line 46
    :catch_0
    return-object v0
.end method

.method private final g()Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/k;->a:Lh4/e;

    .line 2
    .line 3
    invoke-interface {p0}, Lh4/e;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/content/pm/ApplicationInfo;

    .line 8
    .line 9
    return-object p0
.end method

.method private final i(I)Z
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/k;->g()Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 9
    .line 10
    and-int/2addr p0, p1

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    return v0
.end method


# virtual methods
.method public final h()Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/k;->g()Landroid/content/pm/ApplicationInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final j()Z
    .locals 2

    .line 1
    sget-boolean v0, Lcom/android/launcher3/N5;->h:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lcom/android/launcher3/util/k;->g()Landroid/content/pm/ApplicationInfo;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    if-eqz p0, :cond_0

    .line 17
    .line 18
    iget-boolean p0, p0, Landroid/content/pm/ApplicationInfo;->isArchived:Z

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    move p0, v1

    .line 22
    :goto_0
    if-eqz p0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    return v1
.end method

.method public final k()Z
    .locals 1

    .line 1
    const/high16 v0, 0x800000

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;->i(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final l()Z
    .locals 1

    .line 1
    const/high16 v0, 0x40000

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;->i(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final m()Z
    .locals 1

    .line 1
    const/high16 v0, 0x800000

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;->i(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/high16 v0, 0x40000000    # 2.0f

    .line 10
    .line 11
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;->i(I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

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

.method public final n()Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/util/k;->i(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method
