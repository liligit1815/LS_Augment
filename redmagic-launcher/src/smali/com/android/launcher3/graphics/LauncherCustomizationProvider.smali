.class public final Lcom/android/launcher3/graphics/LauncherCustomizationProvider;
.super Lcom/android/launcher3/util/F;
.source "LauncherCustomizationProvider.kt"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/F;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public b(Landroid/content/Context;)Lcom/android/launcher3/util/F$a;
    .locals 0

    .line 1
    const-string p0, "ctx"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lg1/e;->a:Lg1/e;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lg1/e;->b(Landroid/content/Context;)Lg1/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-interface {p0}, Lcom/android/quickstep/dagger/QuickstepBaseAppComponent;->getGridCustomizationsProxy()Ln1/n;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getType(Landroid/net/Uri;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "uri"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "vnd.android.cursor.dir/launcher_grid"

    .line 7
    .line 8
    return-object p0
.end method
