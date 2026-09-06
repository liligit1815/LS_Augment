.class public final Lcom/android/launcher3/util/h3;
.super Ljava/lang/Object;
.source "WallpaperColorHints.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/util/h3$a;
    }
.end annotation


# static fields
.field public static final d:Lcom/android/launcher3/util/h3$a;

.field public static final e:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Lcom/android/launcher3/util/h3;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Landroid/content/Context;

.field private b:I

.field private final c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/G1;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/h3$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/h3$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/android/launcher3/util/h3;->d:Lcom/android/launcher3/util/h3$a;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/util/c3;

    .line 12
    .line 13
    invoke-direct {v1}, Lcom/android/launcher3/util/c3;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Lcom/android/launcher3/util/h3;->e:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
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
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/util/h3;->a:Landroid/content/Context;

    .line 15
    .line 16
    new-instance p1, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lcom/android/launcher3/util/h3;->c:Ljava/util/List;

    .line 22
    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/util/h3;->j()Landroid/app/WallpaperManager;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x1

    .line 28
    invoke-virtual {p1, v0}, Landroid/app/WallpaperManager;->getWallpaperColors(I)Landroid/app/WallpaperColors;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    if-eqz p1, :cond_0

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/app/WallpaperColors;->getColorHints()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p1, 0x0

    .line 40
    :goto_0
    iput p1, p0, Lcom/android/launcher3/util/h3;->b:I

    .line 41
    .line 42
    new-instance p1, Lcom/android/launcher3/util/d3;

    .line 43
    .line 44
    invoke-direct {p1, p0}, Lcom/android/launcher3/util/d3;-><init>(Lcom/android/launcher3/util/h3;)V

    .line 45
    .line 46
    .line 47
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 48
    .line 49
    new-instance v1, Lcom/android/launcher3/util/e3;

    .line 50
    .line 51
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/util/e3;-><init>(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lcom/android/launcher3/util/f3;

    .line 58
    .line 59
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/util/f3;-><init>(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {p2, v0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public static a(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/h3;->j()Landroid/app/WallpaperManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1}, Landroid/app/WallpaperManager;->removeOnColorsChangedListener(Landroid/app/WallpaperManager$OnColorsChangedListener;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperColors;I)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/android/launcher3/util/h3;->e(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperColors;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/h3;->g(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/android/launcher3/util/h3;->f(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final e(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperColors;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/util/h3;->k(Landroid/app/WallpaperColors;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final f(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/util/h3;->j()Landroid/app/WallpaperManager;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/util/p1;->e()Landroid/os/Handler;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, p1, v0}, Landroid/app/WallpaperManager;->addOnColorsChangedListener(Landroid/app/WallpaperManager$OnColorsChangedListener;Landroid/os/Handler;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static final g(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V
    .locals 2

    .line 1
    sget-object v0, Lcom/android/launcher3/util/m0;->f:Lcom/android/launcher3/util/p1;

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/util/g3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/android/launcher3/util/g3;-><init>(Lcom/android/launcher3/util/h3;Landroid/app/WallpaperManager$OnColorsChangedListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static final h(Landroid/content/Context;)Lcom/android/launcher3/util/h3;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/util/h3;->d:Lcom/android/launcher3/util/h3$a;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/h3$a;->a(Landroid/content/Context;)Lcom/android/launcher3/util/h3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private final j()Landroid/app/WallpaperManager;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/h3;->a:Landroid/content/Context;

    .line 2
    .line 3
    const-class v0, Landroid/app/WallpaperManager;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {p0}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    check-cast p0, Landroid/app/WallpaperManager;

    .line 13
    .line 14
    return-object p0
.end method

.method private final k(Landroid/app/WallpaperColors;I)V
    .locals 0

    .line 1
    and-int/lit8 p2, p2, 0x1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/app/WallpaperColors;->getColorHints()I

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    :goto_0
    iput p1, p0, Lcom/android/launcher3/util/h3;->b:I

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/util/h3;->c:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-eqz p2, :cond_1

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object p2

    .line 31
    check-cast p2, Lcom/android/launcher3/util/G1;

    .line 32
    .line 33
    invoke-interface {p2, p1}, Lcom/android/launcher3/util/G1;->a(I)V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_1
    return-void
.end method


# virtual methods
.method public final i()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/h3;->b:I

    .line 2
    .line 3
    return p0
.end method

.method public final l(Lcom/android/launcher3/util/G1;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/h3;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final m(Lcom/android/launcher3/util/G1;)V
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/util/h3;->c:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
