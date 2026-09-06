.class public Lcom/android/launcher3/allapps/D;
.super Ljava/lang/Object;
.source "AllAppsStore.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/allapps/D$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private a:Lcom/android/launcher3/util/L1;

.field private b:Lcom/android/launcher3/model/data/d;

.field private c:[Lcom/android/launcher3/model/data/d;

.field private final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/D$a;",
            ">;"
        }
    .end annotation
.end field

.field private final e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/ViewGroup;",
            ">;"
        }
    .end annotation
.end field

.field private f:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private g:I

.field private h:I

.field private i:Z

.field private final j:LG1/d;

.field private final k:Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/android/launcher3/util/L1;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-direct {v0, v1, v1}, Lcom/android/launcher3/util/L1;-><init>(Ljava/lang/String;Landroid/os/UserHandle;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/allapps/D;->a:Lcom/android/launcher3/util/L1;

    .line 11
    .line 12
    new-instance v0, Lcom/android/launcher3/model/data/d;

    .line 13
    .line 14
    invoke-direct {v0}, Lcom/android/launcher3/model/data/d;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/allapps/D;->b:Lcom/android/launcher3/model/data/d;

    .line 18
    .line 19
    sget-object v0, Lcom/android/launcher3/model/data/d;->o:[Lcom/android/launcher3/model/data/d;

    .line 20
    .line 21
    iput-object v0, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 22
    .line 23
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 24
    .line 25
    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/android/launcher3/allapps/D;->d:Ljava/util/List;

    .line 29
    .line 30
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/android/launcher3/allapps/D;->e:Ljava/util/ArrayList;

    .line 36
    .line 37
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 38
    .line 39
    iput-object v0, p0, Lcom/android/launcher3/allapps/D;->f:Ljava/util/Map;

    .line 40
    .line 41
    const/4 v0, 0x0

    .line 42
    iput v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 43
    .line 44
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/D;->i:Z

    .line 45
    .line 46
    new-instance v0, LG1/d;

    .line 47
    .line 48
    invoke-direct {v0}, LG1/d;-><init>()V

    .line 49
    .line 50
    .line 51
    iput-object v0, p0, Lcom/android/launcher3/allapps/D;->j:LG1/d;

    .line 52
    .line 53
    iput-object p1, p0, Lcom/android/launcher3/allapps/D;->k:Landroid/content/Context;

    .line 54
    .line 55
    return-void
.end method

.method private A(Ljava/util/function/Consumer;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Consumer<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/D;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, -0x1

    .line 8
    .line 9
    :goto_0
    if-ltz v0, :cond_2

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/allapps/D;->e:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    check-cast v1, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/4 v3, 0x0

    .line 24
    :goto_1
    if-ge v3, v2, :cond_1

    .line 25
    .line 26
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    instance-of v5, v4, Lcom/android/launcher3/BubbleTextView;

    .line 31
    .line 32
    if-eqz v5, :cond_0

    .line 33
    .line 34
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 35
    .line 36
    invoke-interface {p1, v4}, Ljava/util/function/Consumer;->accept(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    add-int/lit8 v0, v0, -0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return-void
.end method

.method public static synthetic a(Ljava/util/List;Lcom/android/launcher3/model/data/d;)Z
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static synthetic b(Ljava/util/List;ZLcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    invoke-virtual {p2, p1}, Lcom/android/launcher3/BubbleTextView;->C(Z)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/allapps/D;Ljava/util/function/Predicate;Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/allapps/D;->s(Ljava/util/function/Predicate;Lcom/android/launcher3/BubbleTextView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ljava/util/List;Lcom/android/launcher3/model/data/d;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    iput-boolean p0, p1, Lcom/android/launcher3/model/data/y;->isAppVdmcLimited:Z

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/model/data/d;Lcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-ne v0, p0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Lcom/android/launcher3/BubbleTextView;->v(Lcom/android/launcher3/model/data/d;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public static synthetic f(Ljava/util/List;Lcom/android/launcher3/BubbleTextView;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {p1, p0}, Lcom/android/launcher3/BubbleTextView;->F(Z)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public static synthetic g(ZLcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    iput-boolean p0, p1, Lcom/android/launcher3/model/data/y;->isAppLimited:Z

    .line 2
    .line 3
    return-void
.end method

.method private synthetic s(Ljava/util/function/Predicate;Lcom/android/launcher3/BubbleTextView;)V
    .locals 2

    .line 1
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    iget-object v1, p0, Lcom/android/launcher3/allapps/D;->a:Lcom/android/launcher3/util/L1;

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/L1;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->a:Lcom/android/launcher3/util/L1;

    .line 24
    .line 25
    invoke-interface {p1, p0}, Ljava/util/function/Predicate;->test(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/android/launcher3/BubbleTextView;->u(Lcom/android/launcher3/model/data/y;Z)V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method


# virtual methods
.method public B(Ljava/util/List;Z)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/allapps/x;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Lcom/android/launcher3/allapps/x;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Lcom/android/launcher3/allapps/y;

    .line 17
    .line 18
    invoke-direct {v1, p2}, Lcom/android/launcher3/allapps/y;-><init>(Z)V

    .line 19
    .line 20
    .line 21
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Lcom/android/launcher3/allapps/z;

    .line 25
    .line 26
    invoke-direct {v0, p1, p2}, Lcom/android/launcher3/allapps/z;-><init>(Ljava/util/List;Z)V

    .line 27
    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/D;->A(Ljava/util/function/Consumer;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public C(Ljava/util/function/Predicate;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/Predicate<",
            "Lcom/android/launcher3/util/L1;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/w;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Lcom/android/launcher3/allapps/w;-><init>(Lcom/android/launcher3/allapps/D;Ljava/util/function/Predicate;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/D;->A(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public D(Lcom/android/launcher3/model/data/d;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/allapps/A;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lcom/android/launcher3/allapps/A;-><init>(Lcom/android/launcher3/model/data/d;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/D;->A(Ljava/util/function/Consumer;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Lcom/android/launcher3/allapps/B;

    .line 8
    .line 9
    invoke-direct {v1, p1}, Lcom/android/launcher3/allapps/B;-><init>(Ljava/util/List;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 13
    .line 14
    .line 15
    new-instance v0, Lcom/android/launcher3/allapps/C;

    .line 16
    .line 17
    invoke-direct {v0, p1}, Lcom/android/launcher3/allapps/C;-><init>(Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    invoke-direct {p0, v0}, Lcom/android/launcher3/allapps/D;->A(Ljava/util/function/Consumer;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public h(Lcom/android/launcher3/allapps/D$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public i(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 2
    .line 3
    not-int v1, p1

    .line 4
    and-int/2addr v0, v1

    .line 5
    iput v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "disableDeferUpdates: "

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, " mDeferUpdatesFlags="

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget p1, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v0, "AllAppsStore"

    .line 35
    .line 36
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    iget p1, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 40
    .line 41
    if-nez p1, :cond_0

    .line 42
    .line 43
    iget-boolean p1, p0, Lcom/android/launcher3/allapps/D;->i:Z

    .line 44
    .line 45
    if-eqz p1, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/D;->t()V

    .line 48
    .line 49
    .line 50
    const/4 p1, 0x0

    .line 51
    iput-boolean p1, p0, Lcom/android/launcher3/allapps/D;->i:Z

    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public j(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 2
    .line 3
    not-int v1, p1

    .line 4
    and-int/2addr v0, v1

    .line 5
    iput v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 6
    .line 7
    new-instance v0, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v1, "disableDeferUpdatesSilently: "

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string p1, " mDeferUpdatesFlags="

    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    iget p0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    const-string p1, "AllAppsStore"

    .line 35
    .line 36
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public k(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 9

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "\tAllAppsStore Apps[] size: "

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 15
    .line 16
    array-length v1, v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 29
    .line 30
    array-length v1, v1

    .line 31
    if-ge v0, v1, :cond_0

    .line 32
    .line 33
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    iget-object v2, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 42
    .line 43
    aget-object v2, v2, v0

    .line 44
    .line 45
    iget-object v2, v2, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    iget-object v2, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 52
    .line 53
    aget-object v2, v2, v0

    .line 54
    .line 55
    iget-object v2, v2, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    iget-object v2, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 62
    .line 63
    aget-object v2, v2, v0

    .line 64
    .line 65
    iget-object v6, v2, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 66
    .line 67
    iget-object v2, v2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 68
    .line 69
    iget v2, v2, Ls1/d;->d:I

    .line 70
    .line 71
    invoke-static {v2}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    iget-object v2, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 76
    .line 77
    aget-object v2, v2, v0

    .line 78
    .line 79
    iget-object v2, v2, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 80
    .line 81
    iget v2, v2, Ls1/d;->e:I

    .line 82
    .line 83
    invoke-static {v2}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v8

    .line 87
    move-object v2, p1

    .line 88
    filled-new-array/range {v2 .. v8}, [Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    const-string v3, "%s\tPackage index, name, class, description, bitmap flag: %d/%s:%s, %s, %s+%s"

    .line 93
    .line 94
    invoke-static {v1, v3, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    add-int/lit8 v0, v0, 0x1

    .line 102
    .line 103
    move-object p1, v2

    .line 104
    goto :goto_0

    .line 105
    :cond_0
    return-void
.end method

.method public l(I)V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 2
    .line 3
    or-int/2addr v0, p1

    .line 4
    iput v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v1, "enableDeferUpdates: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, " mDeferUpdatesFlags="

    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget p0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 25
    .line 26
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const-string p1, "AllAppsStore"

    .line 34
    .line 35
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public m(Lcom/android/launcher3/util/E;)Lcom/android/launcher3/model/data/d;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/model/data/d;->p:Ljava/util/Comparator;

    .line 2
    .line 3
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/allapps/D;->n(Lcom/android/launcher3/util/E;Ljava/util/Comparator;)Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public n(Lcom/android/launcher3/util/E;Ljava/util/Comparator;)Lcom/android/launcher3/model/data/d;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/util/E;",
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/model/data/d;",
            ">;)",
            "Lcom/android/launcher3/model/data/d;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/D;->b:Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/android/launcher3/util/E;->a:Landroid/content/ComponentName;

    .line 4
    .line 5
    iput-object v1, v0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/android/launcher3/util/E;->b:Landroid/os/UserHandle;

    .line 8
    .line 9
    iput-object p1, v0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 12
    .line 13
    invoke-static {p1, v0, p2}, Ljava/util/Arrays;->binarySearch([Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-gez p1, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x0

    .line 20
    return-object p0

    .line 21
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 22
    .line 23
    aget-object p0, p0, p1

    .line 24
    .line 25
    return-object p0
.end method

.method public o()[Lcom/android/launcher3/model/data/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public p()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 2
    .line 3
    return p0
.end method

.method q()LG1/d;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->j:LG1/d;

    .line 2
    .line 3
    return-object p0
.end method

.method public r(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/D;->g:I

    .line 2
    .line 3
    and-int/2addr p0, p1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public t()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/allapps/D;->h:I

    .line 2
    .line 3
    const-string v1, "AllAppsStore"

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-string v0, "notifyUpdate: deferring update"

    .line 8
    .line 9
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Lcom/android/launcher3/allapps/D;->i:Z

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    const-string v0, "notifyUpdate: notifying listeners"

    .line 17
    .line 18
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->d:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lcom/android/launcher3/allapps/D$a;

    .line 38
    .line 39
    invoke-interface {v0}, Lcom/android/launcher3/allapps/D$a;->c()V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-void
.end method

.method public u(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/allapps/D;->e:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->e:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public v(Lcom/android/launcher3/allapps/D$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->d:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public w([Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/D;->t()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public x([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/d;",
            "I",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/android/launcher3/allapps/D;->y([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public y([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Z)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/d;",
            "I",
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Ljava/lang/Integer;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/android/launcher3/model/data/d;->o:[Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    new-instance p1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "setApps: apps.length="

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 18
    .line 19
    array-length v0, v0

    .line 20
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const-string v0, "AllAppsStore"

    .line 28
    .line 29
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 30
    .line 31
    .line 32
    iput p2, p0, Lcom/android/launcher3/allapps/D;->g:I

    .line 33
    .line 34
    invoke-static {}, Lcom/android/launcher3/resource/g;->l()Lcom/android/launcher3/resource/g;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    iget-object p2, p0, Lcom/android/launcher3/allapps/D;->c:[Lcom/android/launcher3/model/data/d;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Lcom/android/launcher3/resource/g;->u([Lcom/android/launcher3/model/data/d;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/D;->t()V

    .line 44
    .line 45
    .line 46
    iput-object p3, p0, Lcom/android/launcher3/allapps/D;->f:Ljava/util/Map;

    .line 47
    .line 48
    if-eqz p4, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/allapps/D;->j:LG1/d;

    .line 51
    .line 52
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->k:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {p1, p0}, LG1/d;->e(Landroid/content/Context;)V

    .line 55
    .line 56
    .line 57
    :cond_1
    return-void
.end method

.method public z(Landroid/view/ViewGroup;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/D;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method
