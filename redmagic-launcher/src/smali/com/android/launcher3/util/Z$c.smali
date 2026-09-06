.class public Lcom/android/launcher3/util/Z$c;
.super Ljava/lang/Object;
.source "DisplayController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/util/Z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public final a:Lcom/android/launcher3/util/window/a;

.field public final b:I

.field public final c:Landroid/graphics/Point;

.field public final d:Landroid/graphics/Rect;

.field public final e:F

.field private final f:I

.field public final g:Lcom/android/launcher3/util/C1;

.field private final h:Lcom/android/launcher3/util/Z$e;

.field public final i:Lcom/android/launcher3/util/p3;

.field public final j:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/p3;",
            ">;"
        }
    .end annotation
.end field

.field private final k:Lx1/u;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lx1/u<",
            "Lcom/android/launcher3/util/window/a;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/p3;",
            ">;>;"
        }
    .end annotation
.end field

.field private final l:Z

.field private final m:Z

.field private final n:Z

.field private final o:Z

.field private final p:Z

.field public q:I

.field private final r:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    new-instance v0, Lcom/android/launcher3/util/window/d;

    invoke-direct {v0}, Lcom/android/launcher3/util/window/d;-><init>()V

    new-instance v1, Landroid/util/ArrayMap;

    invoke-direct {v1}, Landroid/util/ArrayMap;-><init>()V

    invoke-direct {p0, p1, v0, v1}, Lcom/android/launcher3/util/Z$c;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/window/d;Ljava/util/Map;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/util/window/d;Ljava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Lcom/android/launcher3/util/window/d;",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/window/a;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/p3;",
            ">;>;)V"
        }
    .end annotation

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    new-instance v0, Landroid/util/ArraySet;

    invoke-direct {v0}, Landroid/util/ArraySet;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 4
    new-instance v1, Lx1/u;

    invoke-direct {v1}, Lx1/u;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/util/Z$c;->k:Lx1/u;

    .line 5
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/window/d;->getDisplayInfo(Landroid/content/Context;)Lcom/android/launcher3/util/window/a;

    move-result-object v2

    .line 6
    invoke-virtual {v2, p2}, Lcom/android/launcher3/util/window/a;->a(Lcom/android/launcher3/util/window/d;)Lcom/android/launcher3/util/window/a;

    move-result-object v3

    iput-object v3, p0, Lcom/android/launcher3/util/Z$c;->a:Lcom/android/launcher3/util/window/a;

    .line 7
    iget v4, v2, Lcom/android/launcher3/util/window/a;->b:I

    iput v4, p0, Lcom/android/launcher3/util/Z$c;->b:I

    .line 8
    iget-object v4, v2, Lcom/android/launcher3/util/window/a;->a:Landroid/graphics/Point;

    iput-object v4, p0, Lcom/android/launcher3/util/Z$c;->c:Landroid/graphics/Point;

    .line 9
    iget-object v4, v2, Lcom/android/launcher3/util/window/a;->c:Landroid/view/DisplayCutout;

    invoke-static {v4}, Lcom/android/launcher3/util/window/d;->getSafeInsets(Landroid/view/DisplayCutout;)Landroid/graphics/Rect;

    move-result-object v4

    iput-object v4, p0, Lcom/android/launcher3/util/Z$c;->d:Landroid/graphics/Rect;

    .line 10
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v4}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v4

    .line 11
    iget v5, v4, Landroid/content/res/Configuration;->fontScale:F

    iput v5, p0, Lcom/android/launcher3/util/Z$c;->e:F

    .line 12
    iget v5, v4, Landroid/content/res/Configuration;->densityDpi:I

    iput v5, p0, Lcom/android/launcher3/util/Z$c;->f:I

    .line 13
    new-instance v5, Lcom/android/launcher3/util/Z$e;

    iget v6, v4, Landroid/content/res/Configuration;->screenHeightDp:I

    iget v7, v4, Landroid/content/res/Configuration;->screenWidthDp:I

    invoke-direct {v5, v6, v7}, Lcom/android/launcher3/util/Z$e;-><init>(II)V

    iput-object v5, p0, Lcom/android/launcher3/util/Z$c;->h:Lcom/android/launcher3/util/Z$e;

    .line 14
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/window/d;->getNavigationMode(Landroid/content/Context;)Lcom/android/launcher3/util/C1;

    move-result-object v5

    iput-object v5, p0, Lcom/android/launcher3/util/Z$c;->g:Lcom/android/launcher3/util/C1;

    .line 15
    invoke-virtual {v1, p3}, Lo/a;->putAll(Ljava/util/Map;)V

    .line 16
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->k()Ljava/util/List;

    move-result-object p3

    .line 17
    invoke-virtual {p2, p1, v2}, Lcom/android/launcher3/util/window/d;->getRealBounds(Landroid/content/Context;Lcom/android/launcher3/util/window/a;)Lcom/android/launcher3/util/p3;

    move-result-object v5

    iput-object v5, p0, Lcom/android/launcher3/util/Z$c;->i:Lcom/android/launcher3/util/p3;

    if-nez p3, :cond_0

    .line 18
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unexpected normalizedDisplayInfo found, invalidating cache: "

    invoke-virtual {p3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    const-string v6, "DisplayController"

    invoke-static {v6, p3}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "(Invalid Cache) perDisplayBounds : "

    invoke-virtual {p3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-static {v6, p3}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    invoke-virtual {v1}, Lo/r;->clear()V

    .line 21
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/window/d;->estimateInternalDisplayBounds(Landroid/content/Context;)Landroid/util/ArrayMap;

    move-result-object p3

    invoke-virtual {v1, p3}, Lo/a;->putAll(Ljava/util/Map;)V

    .line 22
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->k()Ljava/util/List;

    move-result-object p3

    if-nez p3, :cond_0

    .line 23
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "normalizedDisplayInfo not found in estimation: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/android/launcher3/logging/b;->g(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    invoke-interface {v0, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_0
    if-eqz p3, :cond_1

    .line 25
    iget v6, v2, Lcom/android/launcher3/util/window/a;->b:I

    invoke-interface {p3, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/android/launcher3/util/p3;

    .line 26
    invoke-virtual {v5, v6}, Lcom/android/launcher3/util/p3;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 27
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 28
    iget p3, v2, Lcom/android/launcher3/util/window/a;->b:I

    invoke-interface {v6, p3, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 29
    invoke-virtual {v1, v3, v6}, Lo/r;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    :cond_1
    invoke-virtual {v1}, Lo/a;->values()Ljava/util/Collection;

    move-result-object p3

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/android/launcher3/util/a0;

    invoke-direct {v1, v0}, Lcom/android/launcher3/util/a0;-><init>(Ljava/util/Set;)V

    invoke-interface {p3, v1}, Ljava/util/Collection;->forEach(Ljava/util/function/Consumer;)V

    .line 31
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    move-result-object p3

    sget-object v0, Lcom/android/launcher3/J3;->j:Lcom/android/launcher3/X;

    invoke-virtual {p3, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/util/Z$c;->l:Z

    .line 32
    invoke-static {p1}, Lcom/android/launcher3/J3;->g(Landroid/content/Context;)Lcom/android/launcher3/J3;

    move-result-object p3

    sget-object v0, Lcom/android/launcher3/J3;->k:Lcom/android/launcher3/X;

    invoke-virtual {p3, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/Boolean;

    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/util/Z$c;->m:Z

    const/4 p3, 0x0

    .line 33
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/window/d;->isInDesktopMode(I)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/util/Z$c;->n:Z

    .line 34
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/window/d;->showLockedTaskbarOnHome(Landroid/content/Context;)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/util/Z$c;->o:Z

    .line 35
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/window/d;->showDesktopTaskbarForFreeformDisplay(Landroid/content/Context;)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/util/Z$c;->r:Z

    .line 36
    invoke-virtual {p2, p1}, Lcom/android/launcher3/util/window/d;->isHomeVisible(Landroid/content/Context;)Z

    move-result p1

    iput-boolean p1, p0, Lcom/android/launcher3/util/Z$c;->p:Z

    .line 37
    iget p1, v4, Landroid/content/res/Configuration;->uiMode:I

    iput p1, p0, Lcom/android/launcher3/util/Z$c;->q:I

    return-void
.end method

.method public static synthetic a(II)I
    .locals 0

    .line 1
    or-int/2addr p0, p1

    .line 2
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/util/Z$c;IILcom/android/launcher3/util/p3;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/util/Z$c;->s(IILcom/android/launcher3/util/p3;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic c(Lcom/android/launcher3/util/Z$c;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/Z$c;->f:I

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/util/Z$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic e(Lcom/android/launcher3/util/Z$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->l:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/util/Z$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/util/Z$c;)Lx1/u;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->k:Lx1/u;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/util/Z$c;)Lcom/android/launcher3/util/Z$e;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->h:Lcom/android/launcher3/util/Z$e;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/util/Z$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method private synthetic s(IILcom/android/launcher3/util/p3;)I
    .locals 0

    .line 1
    invoke-virtual {p0, p3}, Lcom/android/launcher3/util/Z$c;->q(Lcom/android/launcher3/util/p3;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    return p1

    .line 8
    :cond_0
    return p2
.end method


# virtual methods
.method public j()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/android/launcher3/util/window/a;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->k:Lx1/u;

    .line 2
    .line 3
    invoke-virtual {p0}, Lo/a;->keySet()Ljava/util/Set;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public k()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/android/launcher3/util/p3;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$c;->k:Lx1/u;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->a:Lcom/android/launcher3/util/window/a;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lo/a;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/util/List;

    .line 10
    .line 11
    return-object p0
.end method

.method public l()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/util/Z$c;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public m()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$c;->j:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/util/b0;

    .line 8
    .line 9
    const/4 v2, 0x2

    .line 10
    const/4 v3, 0x1

    .line 11
    invoke-direct {v1, p0, v2, v3}, Lcom/android/launcher3/util/b0;-><init>(Lcom/android/launcher3/util/Z$c;II)V

    .line 12
    .line 13
    .line 14
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Lcom/android/launcher3/util/c0;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/android/launcher3/util/c0;-><init>()V

    .line 21
    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    invoke-interface {p0, v1, v0}, Ljava/util/stream/IntStream;->reduce(ILjava/util/function/IntBinaryOperator;)I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    const/4 v0, 0x3

    .line 29
    if-ne p0, v0, :cond_0

    .line 30
    .line 31
    return v3

    .line 32
    :cond_0
    if-ne p0, v2, :cond_1

    .line 33
    .line 34
    return v2

    .line 35
    :cond_1
    return v1
.end method

.method public n()Lcom/android/launcher3/util/C1;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/util/Z$c;->g:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$c;->g:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/util/Z$c;->r()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public q(Lcom/android/launcher3/util/p3;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/util/Z$c;->v(Lcom/android/launcher3/util/p3;)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/high16 p1, 0x44160000    # 600.0f

    .line 6
    .line 7
    cmpl-float p0, p0, p1

    .line 8
    .line 9
    if-ltz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public r()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/util/Z$c;->g:Lcom/android/launcher3/util/C1;

    .line 2
    .line 3
    sget-object v1, Lcom/android/launcher3/util/C1;->l:Lcom/android/launcher3/util/C1;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    invoke-static {}, Lcom/android/launcher3/N5;->E()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    invoke-static {}, Lcom/android/launcher3/util/Z;->m()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-static {}, Lcom/android/launcher3/util/Z;->n()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    invoke-static {}, Lf1/a;->e()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x1

    .line 31
    if-eqz v0, :cond_5

    .line 32
    .line 33
    iget-boolean v0, p0, Lcom/android/launcher3/util/Z$c;->r:Z

    .line 34
    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    return v2

    .line 38
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher3/util/Z$c;->o:Z

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    iget-boolean v0, p0, Lcom/android/launcher3/util/Z$c;->p:Z

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    return v2

    .line 47
    :cond_3
    iget-boolean v0, p0, Lcom/android/launcher3/util/Z$c;->n:Z

    .line 48
    .line 49
    if-eqz v0, :cond_4

    .line 50
    .line 51
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->m:Z

    .line 52
    .line 53
    xor-int/2addr p0, v1

    .line 54
    return p0

    .line 55
    :cond_4
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->l:Z

    .line 56
    .line 57
    xor-int/2addr p0, v1

    .line 58
    return p0

    .line 59
    :cond_5
    return v1
.end method

.method public t()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public u()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/util/Z$c;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public v(Lcom/android/launcher3/util/p3;)F
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object p1, p1, Lcom/android/launcher3/util/p3;->a:Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    int-to-float p1, p1

    .line 18
    iget p0, p0, Lcom/android/launcher3/util/Z$c;->f:I

    .line 19
    .line 20
    invoke-static {p1, p0}, Lcom/android/launcher3/N5;->j(FI)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method
