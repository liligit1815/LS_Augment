.class public Lcom/android/launcher3/folder/FolderNameProvider;
.super Ljava/lang/Object;
.source "FolderNameProvider.java"

# interfaces
.implements Lcom/android/launcher3/util/V1;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/folder/FolderNameProvider$a;
    }
.end annotation


# instance fields
.field protected g:Lcom/android/launcher3/util/A0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/m;",
            ">;"
        }
    .end annotation
.end field

.field protected h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/d;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public static synthetic b(Lcom/android/launcher3/model/data/I;)Landroid/os/UserHandle;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ljava/lang/String;Lcom/android/launcher3/model/data/d;)Z
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/android/launcher3/model/data/d;->l:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/util/A0;Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->id:I

    .line 2
    .line 3
    check-cast p1, Lcom/android/launcher3/model/data/p;

    .line 4
    .line 5
    invoke-virtual {p0, v0, p1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static synthetic e(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/folder/K;Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderNameProvider;->l(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/model/data/d;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 1
    const v0, 0x7f1404a0

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method

.method public static synthetic g(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

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

.method private h(Ljava/lang/String;)Ljava/util/Optional;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Optional<",
            "Lcom/android/launcher3/model/data/d;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderNameProvider;->h:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderNameProvider;->h:Ljava/util/List;

    .line 13
    .line 14
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    new-instance v0, Lcom/android/launcher3/folder/U;

    .line 19
    .line 20
    invoke-direct {v0}, Lcom/android/launcher3/folder/U;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    new-instance v0, Lcom/android/launcher3/folder/V;

    .line 28
    .line 29
    invoke-direct {v0, p1}, Lcom/android/launcher3/folder/V;-><init>(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {p0}, Ljava/util/stream/Stream;->findAny()Ljava/util/Optional;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    return-object p0

    .line 41
    :cond_1
    :goto_0
    invoke-static {}, Ljava/util/Optional;->empty()Ljava/util/Optional;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    return-object p0
.end method

.method public static i(Lz1/y0;)Lcom/android/launcher3/util/A0;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/y0;",
            ")",
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/m;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/android/launcher3/util/A0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/util/A0;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/util/A0;->stream()Ljava/util/stream/Stream;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    new-instance v1, Lcom/android/launcher3/folder/W;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/android/launcher3/folder/W;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    new-instance v1, Lcom/android/launcher3/folder/M;

    .line 22
    .line 23
    invoke-direct {v1, v0}, Lcom/android/launcher3/folder/M;-><init>(Lcom/android/launcher3/util/A0;)V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->forEach(Ljava/util/function/Consumer;)V

    .line 27
    .line 28
    .line 29
    return-object v0
.end method

.method private k(Landroid/content/Context;)Ljava/lang/String;
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NewApi"
        }
    .end annotation

    .line 1
    sget-boolean p0, Lcom/android/launcher3/N5;->f:Z

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const p0, 0x7f1404a0

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    const-class p0, Landroid/app/admin/DevicePolicyManager;

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/app/admin/DevicePolicyManager;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/app/admin/DevicePolicyManager;->getResources()Landroid/app/admin/DevicePolicyResourcesManager;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    new-instance v0, Lcom/android/launcher3/folder/T;

    .line 26
    .line 27
    invoke-direct {v0, p1}, Lcom/android/launcher3/folder/T;-><init>(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    const-string p1, "Launcher.WORK_FOLDER_NAME"

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Landroid/app/admin/DevicePolicyResourcesManager;->getString(Ljava/lang/String;Ljava/util/function/Supplier;)Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    return-object p0
.end method

.method private synthetic l(Lcom/android/launcher3/folder/K;Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    const-string p2, ""

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p2

    .line 12
    :goto_0
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderNameProvider;->q(Lcom/android/launcher3/folder/K;Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method private m(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v0, Lcom/android/launcher3/folder/FolderNameProvider$a;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {v0, p0, v1}, Lcom/android/launcher3/folder/FolderNameProvider$a;-><init>(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/folder/X;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lcom/android/launcher3/D3;->W(Lcom/android/launcher3/D3$d;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private n(Ljava/util/List;Lcom/android/launcher3/util/A0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;",
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/m;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderNameProvider;->h:Ljava/util/List;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/FolderNameProvider;->g:Lcom/android/launcher3/util/A0;

    .line 4
    .line 5
    return-void
.end method

.method public static o(Landroid/content/Context;)Lcom/android/launcher3/folder/FolderNameProvider;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f1401ac

    .line 6
    .line 7
    .line 8
    const-class v2, Lcom/android/launcher3/folder/FolderNameProvider;

    .line 9
    .line 10
    invoke-static {v2, v0, v1}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/android/launcher3/folder/FolderNameProvider;

    .line 15
    .line 16
    invoke-static {}, Lcom/android/launcher3/util/U1;->d()V

    .line 17
    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/FolderNameProvider;->m(Landroid/content/Context;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public static p(Landroid/content/Context;Ljava/util/List;Lcom/android/launcher3/util/A0;)Lcom/android/launcher3/folder/FolderNameProvider;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/d;",
            ">;",
            "Lcom/android/launcher3/util/A0<",
            "Lcom/android/launcher3/model/data/m;",
            ">;)",
            "Lcom/android/launcher3/folder/FolderNameProvider;"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->d()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    const v0, 0x7f1401ac

    .line 9
    .line 10
    .line 11
    const-class v1, Lcom/android/launcher3/folder/FolderNameProvider;

    .line 12
    .line 13
    invoke-static {v1, p0, v0}, Lcom/android/launcher3/util/V1$a;->a(Ljava/lang/Class;Landroid/content/Context;I)Lcom/android/launcher3/util/V1;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/folder/FolderNameProvider;

    .line 18
    .line 19
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderNameProvider;->n(Ljava/util/List;Lcom/android/launcher3/util/A0;)V

    .line 20
    .line 21
    .line 22
    return-object p0
.end method

.method private q(Lcom/android/launcher3/folder/K;Ljava/lang/CharSequence;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_3

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/android/launcher3/folder/K;->b(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    const/4 p0, 0x2

    .line 11
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/K;->h(I)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x4

    .line 15
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/K;->h(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/folder/K;->c()[Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p1}, Lcom/android/launcher3/folder/K;->d()[Ljava/lang/Float;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    array-length v1, p0

    .line 27
    add-int/lit8 v1, v1, -0x1

    .line 28
    .line 29
    :goto_0
    if-lez v1, :cond_2

    .line 30
    .line 31
    add-int/lit8 v2, v1, -0x1

    .line 32
    .line 33
    aget-object v3, p0, v2

    .line 34
    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v3

    .line 41
    if-nez v3, :cond_1

    .line 42
    .line 43
    aget-object v3, p0, v2

    .line 44
    .line 45
    aget-object v2, v0, v2

    .line 46
    .line 47
    invoke-virtual {p1, v1, v3, v2}, Lcom/android/launcher3/folder/K;->g(ILjava/lang/CharSequence;Ljava/lang/Float;)V

    .line 48
    .line 49
    .line 50
    :cond_1
    add-int/lit8 v1, v1, -0x1

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_2
    const/high16 p0, 0x3f800000    # 1.0f

    .line 54
    .line 55
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/4 v0, 0x0

    .line 60
    invoke-virtual {p1, v0, p2, p0}, Lcom/android/launcher3/folder/K;->g(ILjava/lang/CharSequence;Ljava/lang/Float;)V

    .line 61
    .line 62
    .line 63
    :cond_3
    :goto_1
    return-void
.end method

.method private r(Lcom/android/launcher3/folder/K;Ljava/lang/CharSequence;)V
    .locals 3

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Lcom/android/launcher3/folder/K;->b(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    const/4 p0, 0x2

    .line 11
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/K;->h(I)V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x4

    .line 15
    invoke-virtual {p1, p0}, Lcom/android/launcher3/folder/K;->h(I)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/folder/K;->c()[Ljava/lang/CharSequence;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const/4 v0, 0x0

    .line 23
    :goto_0
    array-length v1, p0

    .line 24
    const/high16 v2, 0x3f800000    # 1.0f

    .line 25
    .line 26
    if-ge v0, v1, :cond_3

    .line 27
    .line 28
    aget-object v1, p0, v0

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    :goto_1
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p1, v0, p2, p0}, Lcom/android/launcher3/folder/K;->g(ILjava/lang/CharSequence;Ljava/lang/Float;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_3
    array-length p0, p0

    .line 51
    add-int/lit8 p0, p0, -0x1

    .line 52
    .line 53
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p1, p0, p2, v0}, Lcom/android/launcher3/folder/K;->g(ILjava/lang/CharSequence;Ljava/lang/Float;)V

    .line 58
    .line 59
    .line 60
    :cond_4
    :goto_2
    return-void
.end method


# virtual methods
.method public j(Landroid/content/Context;Ljava/util/ArrayList;Lcom/android/launcher3/folder/K;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;",
            "Lcom/android/launcher3/folder/K;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/util/U1;->d()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Lcom/android/launcher3/folder/L;

    .line 9
    .line 10
    invoke-direct {v1}, Lcom/android/launcher3/folder/L;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ljava/util/Set;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/Set;->size()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x1

    .line 32
    if-ne v1, v2, :cond_0

    .line 33
    .line 34
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-interface {v0, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    if-nez v0, :cond_0

    .line 43
    .line 44
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/FolderNameProvider;->k(Landroid/content/Context;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {p0, p3, p1}, Lcom/android/launcher3/folder/FolderNameProvider;->r(Lcom/android/launcher3/folder/K;Ljava/lang/CharSequence;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    new-instance p2, Lcom/android/launcher3/folder/N;

    .line 56
    .line 57
    invoke-direct {p2}, Lcom/android/launcher3/folder/N;-><init>()V

    .line 58
    .line 59
    .line 60
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    new-instance p2, Lcom/android/launcher3/folder/O;

    .line 65
    .line 66
    invoke-direct {p2}, Lcom/android/launcher3/folder/O;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    new-instance p2, Lcom/android/launcher3/folder/P;

    .line 74
    .line 75
    invoke-direct {p2}, Lcom/android/launcher3/folder/P;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance p2, Lcom/android/launcher3/folder/Q;

    .line 83
    .line 84
    invoke-direct {p2}, Lcom/android/launcher3/folder/Q;-><init>()V

    .line 85
    .line 86
    .line 87
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    invoke-static {}, Ljava/util/stream/Collectors;->toSet()Ljava/util/stream/Collector;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-interface {p1, p2}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Ljava/util/Set;

    .line 100
    .line 101
    invoke-interface {p1}, Ljava/util/Set;->size()I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    if-ne p2, v2, :cond_1

    .line 106
    .line 107
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Ljava/lang/String;

    .line 116
    .line 117
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/FolderNameProvider;->h(Ljava/lang/String;)Ljava/util/Optional;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    new-instance p2, Lcom/android/launcher3/folder/S;

    .line 122
    .line 123
    invoke-direct {p2, p0, p3}, Lcom/android/launcher3/folder/S;-><init>(Lcom/android/launcher3/folder/FolderNameProvider;Lcom/android/launcher3/folder/K;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, p2}, Ljava/util/Optional;->ifPresent(Ljava/util/function/Consumer;)V

    .line 127
    .line 128
    .line 129
    :cond_1
    return-void
.end method
