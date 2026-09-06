.class public final Lcom/android/launcher3/E5;
.super Landroid/database/ContentObserver;
.source "RemoveAnimationSettingsTracker.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/E5$a;
    }
.end annotation


# static fields
.field public static final d:Lcom/android/launcher3/E5$a;

.field public static final e:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/E5;",
            ">;"
        }
    .end annotation
.end field

.field public static final f:Landroid/net/Uri;

.field public static final g:Landroid/net/Uri;

.field public static final h:Landroid/net/Uri;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Landroid/content/ContentResolver;

.field private final c:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/net/Uri;",
            "Ljava/lang/Float;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/E5$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/E5$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/E5;->d:Lcom/android/launcher3/E5$a;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/A5;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/launcher3/A5;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/E5;->e:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    const-string v0, "window_animation_scale"

    .line 22
    .line 23
    invoke-static {v0}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "getUriFor(...)"

    .line 28
    .line 29
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    sput-object v0, Lcom/android/launcher3/E5;->f:Landroid/net/Uri;

    .line 33
    .line 34
    const-string v0, "transition_animation_scale"

    .line 35
    .line 36
    invoke-static {v0}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sput-object v0, Lcom/android/launcher3/E5;->g:Landroid/net/Uri;

    .line 44
    .line 45
    const-string v0, "animator_duration_scale"

    .line 46
    .line 47
    invoke-static {v0}, Landroid/provider/Settings$Global;->getUriFor(Ljava/lang/String;)Landroid/net/Uri;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sput-object v0, Lcom/android/launcher3/E5;->h:Landroid/net/Uri;

    .line 55
    .line 56
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/K;)V
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "tracker"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Landroid/database/ContentObserver;-><init>(Landroid/os/Handler;)V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/android/launcher3/E5;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/android/launcher3/E5;->b:Landroid/content/ContentResolver;

    .line 30
    .line 31
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 32
    .line 33
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p1, p0, Lcom/android/launcher3/E5;->c:Ljava/util/Map;

    .line 37
    .line 38
    sget-object p1, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 39
    .line 40
    new-instance v0, Lcom/android/launcher3/B5;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Lcom/android/launcher3/B5;-><init>(Lcom/android/launcher3/E5;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 46
    .line 47
    .line 48
    new-instance p1, Lcom/android/launcher3/C5;

    .line 49
    .line 50
    invoke-direct {p1, p0}, Lcom/android/launcher3/C5;-><init>(Lcom/android/launcher3/E5;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/E5;Landroid/net/Uri;FLandroid/net/Uri;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Lcom/android/launcher3/E5;->j(Lcom/android/launcher3/E5;Landroid/net/Uri;FLandroid/net/Uri;)Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lu4/l;Ljava/lang/Object;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/E5;->k(Lu4/l;Ljava/lang/Object;)Ljava/lang/Float;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic c(Lcom/android/launcher3/E5;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/E5;->f(Lcom/android/launcher3/E5;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Lcom/android/launcher3/E5;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/E5;->b:Landroid/content/ContentResolver;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroid/content/ContentResolver;->unregisterContentObserver(Landroid/database/ContentObserver;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/E5;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/E5;->g(Lcom/android/launcher3/E5;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final f(Lcom/android/launcher3/E5;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/E5;->b:Landroid/content/ContentResolver;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/E5;->f:Landroid/net/Uri;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/E5;->b:Landroid/content/ContentResolver;

    .line 10
    .line 11
    sget-object v1, Lcom/android/launcher3/E5;->g:Landroid/net/Uri;

    .line 12
    .line 13
    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/E5;->b:Landroid/content/ContentResolver;

    .line 17
    .line 18
    sget-object v1, Lcom/android/launcher3/E5;->h:Landroid/net/Uri;

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2, p0}, Landroid/content/ContentResolver;->registerContentObserver(Landroid/net/Uri;ZLandroid/database/ContentObserver;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private static final g(Lcom/android/launcher3/E5;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/D5;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/android/launcher3/D5;-><init>(Lcom/android/launcher3/E5;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private final i(Landroid/net/Uri;F)F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/E5;->c:Ljava/util/Map;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/y5;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/android/launcher3/y5;-><init>(Lcom/android/launcher3/E5;Landroid/net/Uri;F)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Lcom/android/launcher3/z5;

    .line 9
    .line 10
    invoke-direct {p0, v1}, Lcom/android/launcher3/z5;-><init>(Lu4/l;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "computeIfAbsent(...)"

    .line 18
    .line 19
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    check-cast p0, Ljava/lang/Number;

    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/Number;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method private static final j(Lcom/android/launcher3/E5;Landroid/net/Uri;FLandroid/net/Uri;)Ljava/lang/Float;
    .locals 1

    .line 1
    const-string v0, "it"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/E5;->l(Landroid/net/Uri;F)F

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method private static final k(Lu4/l;Ljava/lang/Object;)Ljava/lang/Float;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ljava/lang/Float;

    .line 6
    .line 7
    return-object p0
.end method

.method private final l(Landroid/net/Uri;F)F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/E5;->b:Landroid/content/ContentResolver;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p0, p1, p2}, Landroid/provider/Settings$Global;->getFloat(Landroid/content/ContentResolver;Ljava/lang/String;F)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method private final n(Landroid/net/Uri;F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/E5;->l(Landroid/net/Uri;F)F

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-static {p2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    iget-object p0, p0, Lcom/android/launcher3/E5;->c:Ljava/util/Map;

    .line 10
    .line 11
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method static synthetic o(Lcom/android/launcher3/E5;Landroid/net/Uri;FILjava/lang/Object;)V
    .locals 0

    .line 1
    and-int/lit8 p3, p3, 0x2

    .line 2
    .line 3
    if-eqz p3, :cond_0

    .line 4
    .line 5
    const/high16 p2, 0x3f800000    # 1.0f

    .line 6
    .line 7
    :cond_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/E5;->n(Landroid/net/Uri;F)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final h(Landroid/net/Uri;)F
    .locals 1

    .line 1
    const-string v0, "uri"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/high16 v0, 0x3f800000    # 1.0f

    .line 7
    .line 8
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/E5;->i(Landroid/net/Uri;F)F

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final m()Z
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/E5;->f:Landroid/net/Uri;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/E5;->h(Landroid/net/Uri;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    cmpg-float v0, v0, v1

    .line 9
    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    sget-object v0, Lcom/android/launcher3/E5;->g:Landroid/net/Uri;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Lcom/android/launcher3/E5;->h(Landroid/net/Uri;)F

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    cmpg-float v0, v0, v1

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/android/launcher3/E5;->h:Landroid/net/Uri;

    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/android/launcher3/E5;->h(Landroid/net/Uri;)F

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    cmpg-float p0, p0, v1

    .line 29
    .line 30
    if-nez p0, :cond_0

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_0
    const/4 p0, 0x0

    .line 35
    return p0
.end method

.method public onChange(ZLandroid/net/Uri;)V
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    const/4 p1, 0x2

    .line 5
    const/4 v0, 0x0

    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-static {p0, p2, v1, p1, v0}, Lcom/android/launcher3/E5;->o(Lcom/android/launcher3/E5;Landroid/net/Uri;FILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
