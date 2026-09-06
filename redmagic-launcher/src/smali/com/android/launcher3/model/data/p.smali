.class public Lcom/android/launcher3/model/data/p;
.super Lcom/android/launcher3/model/data/m;
.source "FolderInfo.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/model/data/p$b;,
        Lcom/android/launcher3/model/data/p$a;
    }
.end annotation


# instance fields
.field public g:I

.field public h:Lcom/android/launcher3/folder/K;

.field public final i:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field private final p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/p$a;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/m;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/model/data/p;->i:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, 0x2

    .line 16
    if-nez v0, :cond_0

    .line 17
    .line 18
    move v0, v1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v0, 0x3

    .line 21
    :goto_0
    iput v0, p0, Lcom/android/launcher3/model/data/p;->m:I

    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    move v0, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    const/4 v0, 0x4

    .line 32
    :goto_1
    iput v0, p0, Lcom/android/launcher3/model/data/p;->n:I

    .line 33
    .line 34
    invoke-static {}, Lx1/c0;->d()Z

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    invoke-static {}, Lcom/android/launcher3/resource/o0;->x()Lcom/android/launcher3/resource/g0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/resource/g0;->G0()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-nez v0, :cond_2

    .line 55
    .line 56
    const v0, 0x3bffffff

    .line 57
    .line 58
    .line 59
    goto :goto_2

    .line 60
    :cond_2
    const v0, -0x7f0e0e0f

    .line 61
    .line 62
    .line 63
    :goto_2
    iput v0, p0, Lcom/android/launcher3/model/data/p;->o:I

    .line 64
    .line 65
    new-instance v0, Ljava/util/ArrayList;

    .line 66
    .line 67
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    .line 69
    .line 70
    iput-object v0, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 71
    .line 72
    iput v1, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 73
    .line 74
    return-void
.end method

.method public static synthetic A([Ljava/lang/CharSequence;Ljava/lang/String;I)Z
    .locals 1

    .line 1
    aget-object v0, p0, p2

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    aget-object p0, p0, p2

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_0
    const/4 p0, 0x0

    .line 24
    return p0
.end method

.method public static R(I)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    const/4 v0, 0x6

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/16 v0, 0xa

    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 14
    return p0
.end method

.method public static synthetic z(I)[Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    new-array p0, p0, [Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public B(Lcom/android/launcher3/model/data/y;IZ)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->t2(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-ge v0, v1, :cond_0

    .line 15
    .line 16
    iget-object v1, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/model/data/p$a;

    .line 23
    .line 24
    invoke-interface {v1, p1, p2, p3}, Lcom/android/launcher3/model/data/p$a;->a(Lcom/android/launcher3/model/data/y;IZ)V

    .line 25
    .line 26
    .line 27
    add-int/lit8 v0, v0, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    return-void

    .line 31
    :cond_1
    new-instance p0, Ljava/lang/RuntimeException;

    .line 32
    .line 33
    const-string p1, "tried to add an illegal type into a folder"

    .line 34
    .line 35
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw p0
.end method

.method public C(Lcom/android/launcher3/model/data/y;Z)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p0, p1, v0, p2}, Lcom/android/launcher3/model/data/p;->B(Lcom/android/launcher3/model/data/y;IZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public D(Lcom/android/launcher3/model/data/p$a;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public E()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public F()Ljava/util/OptionalInt;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 2
    .line 3
    const-string v1, "Expected valid folder label, but found null"

    .line 4
    .line 5
    invoke-static {v0, v1}, LI/h;->g(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Ljava/lang/CharSequence;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iget-object v1, p0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {v1}, Lcom/android/launcher3/folder/K;->f()Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/android/launcher3/folder/K;->c()[Ljava/lang/CharSequence;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    array-length v1, p0

    .line 33
    const/4 v2, 0x0

    .line 34
    invoke-static {v2, v1}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    new-instance v2, Lcom/android/launcher3/model/data/n;

    .line 39
    .line 40
    invoke-direct {v2, p0, v0}, Lcom/android/launcher3/model/data/n;-><init>([Ljava/lang/CharSequence;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-interface {v1, v2}, Ljava/util/stream/IntStream;->filter(Ljava/util/function/IntPredicate;)Ljava/util/stream/IntStream;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-interface {p0}, Ljava/util/stream/IntStream;->sequential()Ljava/util/stream/IntStream;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-interface {p0}, Ljava/util/stream/IntStream;->findFirst()Ljava/util/OptionalInt;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_1
    :goto_0
    invoke-static {}, Ljava/util/OptionalInt;->empty()Ljava/util/OptionalInt;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    return-object p0
.end method

.method public G()I
    .locals 2

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/p;->o:I

    .line 2
    .line 3
    const v0, 0xffffff

    .line 4
    .line 5
    .line 6
    and-int v1, p0, v0

    .line 7
    .line 8
    if-eq v1, v0, :cond_1

    .line 9
    .line 10
    const v0, 0x7fffffff

    .line 11
    .line 12
    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const v0, -0x7f0e0e0f

    .line 16
    .line 17
    .line 18
    if-eq p0, v0, :cond_1

    .line 19
    .line 20
    const/high16 v0, 0x40000000    # 2.0f

    .line 21
    .line 22
    if-ne p0, v0, :cond_0

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return p0

    .line 26
    :cond_1
    :goto_0
    const p0, -0x7fd3d3d4

    .line 27
    .line 28
    .line 29
    return p0
.end method

.method public H()Lcom/android/launcher3/logger/LauncherAtom$FromState;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->I()Lcom/android/launcher3/model/data/p$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    if-eq p0, v0, :cond_2

    .line 11
    .line 12
    const/4 v0, 0x2

    .line 13
    if-eq p0, v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x3

    .line 16
    if-eq p0, v0, :cond_0

    .line 17
    .line 18
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$FromState;->FROM_STATE_UNSPECIFIED:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$FromState;->FROM_CUSTOM:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$FromState;->FROM_SUGGESTED:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 25
    .line 26
    return-object p0

    .line 27
    :cond_2
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$FromState;->FROM_EMPTY:Lcom/android/launcher3/logger/LauncherAtom$FromState;

    .line 28
    .line 29
    return-object p0
.end method

.method public I()Lcom/android/launcher3/model/data/p$b;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/model/data/p$b;->h:Lcom/android/launcher3/model/data/p$b;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Lcom/android/launcher3/model/data/p$b;->i:Lcom/android/launcher3/model/data/p$b;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const/16 v0, 0x10

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    sget-object p0, Lcom/android/launcher3/model/data/p$b;->k:Lcom/android/launcher3/model/data/p$b;

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_2
    sget-object p0, Lcom/android/launcher3/model/data/p$b;->j:Lcom/android/launcher3/model/data/p$b;

    .line 29
    .line 30
    return-object p0
.end method

.method public J()Lcom/android/launcher3/logger/LauncherAtom$ToState;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_STATE_UNSPECIFIED:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 9
    .line 10
    if-eqz v0, :cond_e

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/android/launcher3/folder/K;->f()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/model/data/p;->h:Lcom/android/launcher3/folder/K;

    .line 20
    .line 21
    const/4 v1, 0x1

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/android/launcher3/folder/K;->e()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    move v0, v1

    .line 31
    goto :goto_0

    .line 32
    :cond_2
    const/4 v0, 0x0

    .line 33
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 34
    .line 35
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    if-nez v2, :cond_4

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_EMPTY_WITH_VALID_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_3
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_EMPTY_WITH_VALID_SUGGESTIONS_AND_EMPTY_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_4
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->F()Ljava/util/OptionalInt;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0}, Ljava/util/OptionalInt;->isPresent()Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-nez v2, :cond_6

    .line 58
    .line 59
    if-eqz v0, :cond_5

    .line 60
    .line 61
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_CUSTOM_WITH_VALID_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 62
    .line 63
    return-object p0

    .line 64
    :cond_5
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_CUSTOM_WITH_VALID_SUGGESTIONS_AND_EMPTY_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 65
    .line 66
    return-object p0

    .line 67
    :cond_6
    invoke-virtual {p0}, Ljava/util/OptionalInt;->getAsInt()I

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_d

    .line 72
    .line 73
    if-eq p0, v1, :cond_b

    .line 74
    .line 75
    const/4 v1, 0x2

    .line 76
    if-eq p0, v1, :cond_9

    .line 77
    .line 78
    const/4 v1, 0x3

    .line 79
    if-eq p0, v1, :cond_7

    .line 80
    .line 81
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_STATE_UNSPECIFIED:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 82
    .line 83
    return-object p0

    .line 84
    :cond_7
    if-eqz v0, :cond_8

    .line 85
    .line 86
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION3_WITH_VALID_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_8
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION3_WITH_EMPTY_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_9
    if-eqz v0, :cond_a

    .line 93
    .line 94
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION2_WITH_VALID_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_a
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION2_WITH_EMPTY_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 98
    .line 99
    return-object p0

    .line 100
    :cond_b
    if-eqz v0, :cond_c

    .line 101
    .line 102
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION1_WITH_VALID_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_c
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION1_WITH_EMPTY_PRIMARY:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_d
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_SUGGESTION0:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 109
    .line 110
    return-object p0

    .line 111
    :cond_e
    :goto_1
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 112
    .line 113
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-lez p0, :cond_f

    .line 118
    .line 119
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_CUSTOM_WITH_EMPTY_SUGGESTIONS:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 120
    .line 121
    return-object p0

    .line 122
    :cond_f
    sget-object p0, Lcom/android/launcher3/logger/LauncherAtom$ToState;->TO_EMPTY_WITH_EMPTY_SUGGESTIONS:Lcom/android/launcher3/logger/LauncherAtom$ToState;

    .line 123
    .line 124
    return-object p0
.end method

.method public K(I)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/p;->g:I

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

.method public L(Lcom/android/launcher3/model/data/y;Z)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/model/data/p$a;

    .line 17
    .line 18
    filled-new-array {p1}, [Lcom/android/launcher3/model/data/y;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-interface {v1, p2, v2}, Lcom/android/launcher3/model/data/p$a;->t(Z[Lcom/android/launcher3/model/data/y;)V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    return-void
.end method

.method public M(Ljava/util/List;Z)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-ge v0, v1, :cond_0

    .line 9
    .line 10
    iget-object v1, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/model/data/p$a;

    .line 17
    .line 18
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    new-instance v3, Lcom/android/launcher3/model/data/o;

    .line 23
    .line 24
    invoke-direct {v3}, Lcom/android/launcher3/model/data/o;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, [Lcom/android/launcher3/model/data/y;

    .line 32
    .line 33
    invoke-interface {v1, p2, v2}, Lcom/android/launcher3/model/data/p$a;->t(Z[Lcom/android/launcher3/model/data/y;)V

    .line 34
    .line 35
    .line 36
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    return-void
.end method

.method public N(Lcom/android/launcher3/model/data/p$a;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->p:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/android/launcher3/model/data/p;->o:I

    .line 2
    .line 3
    const v0, 0x7fffffff

    .line 4
    .line 5
    .line 6
    if-ne p1, v0, :cond_0

    .line 7
    .line 8
    const p1, -0x7f0e0e0f

    .line 9
    .line 10
    .line 11
    iput p1, p0, Lcom/android/launcher3/model/data/p;->o:I

    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public P(IZLz1/J3;)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    or-int/2addr p1, v0

    .line 6
    iput p1, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    not-int p1, p1

    .line 10
    and-int/2addr p1, v0

    .line 11
    iput p1, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 12
    .line 13
    :goto_0
    if-eqz p3, :cond_1

    .line 14
    .line 15
    iget p1, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 16
    .line 17
    if-eq v0, p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p3, p0}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public Q(Ljava/lang/CharSequence;Lz1/J3;)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_2

    .line 12
    :cond_0
    if-eqz p1, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 15
    .line 16
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    goto :goto_2

    .line 23
    :cond_1
    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 24
    .line 25
    if-nez p1, :cond_2

    .line 26
    .line 27
    sget-object p1, Lcom/android/launcher3/model/data/p$b;->h:Lcom/android/launcher3/model/data/p$b;

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    if-nez p1, :cond_3

    .line 35
    .line 36
    sget-object p1, Lcom/android/launcher3/model/data/p$b;->i:Lcom/android/launcher3/model/data/p$b;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->F()Ljava/util/OptionalInt;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ljava/util/OptionalInt;->isPresent()Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    sget-object p1, Lcom/android/launcher3/model/data/p$b;->j:Lcom/android/launcher3/model/data/p$b;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_4
    sget-object p1, Lcom/android/launcher3/model/data/p$b;->k:Lcom/android/launcher3/model/data/p$b;

    .line 53
    .line 54
    :goto_0
    sget-object v0, Lcom/android/launcher3/model/data/p$b;->k:Lcom/android/launcher3/model/data/p$b;

    .line 55
    .line 56
    invoke-virtual {p1, v0}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p1

    .line 60
    if-eqz p1, :cond_5

    .line 61
    .line 62
    iget p1, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 63
    .line 64
    or-int/lit8 p1, p1, 0x10

    .line 65
    .line 66
    iput p1, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_5
    iget p1, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 70
    .line 71
    and-int/lit8 p1, p1, -0x11

    .line 72
    .line 73
    iput p1, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 74
    .line 75
    :goto_1
    if-eqz p2, :cond_6

    .line 76
    .line 77
    invoke-virtual {p2, p0}, Lz1/J3;->b0(Lcom/android/launcher3/model/data/y;)V

    .line 78
    .line 79
    .line 80
    :cond_6
    :goto_2
    return-void
.end method

.method public buildProto(Lcom/android/launcher3/model/data/m;Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-virtual {p1, v0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;->setCardinality(I)Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    sget-object v0, Lcom/android/launcher3/model/data/p$b;->j:Lcom/android/launcher3/model/data/p$b;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->I()Lcom/android/launcher3/model/data/p$b;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/Enum;->equals(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p1, v0}, Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;->setLabelInfo(Ljava/lang/String;)Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;

    .line 36
    .line 37
    .line 38
    :cond_0
    invoke-virtual {p0, p2}, Lcom/android/launcher3/model/data/y;->getDefaultItemInfoBuilder(Landroid/content/Context;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    invoke-virtual {p2, p1}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setFolderIcon(Lcom/android/launcher3/logger/LauncherAtom$FolderIcon$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    iget p2, p0, Lcom/android/launcher3/model/data/y;->rank:I

    .line 47
    .line 48
    invoke-virtual {p1, p2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setRank(I)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->I()Lcom/android/launcher3/model/data/p$b;

    .line 53
    .line 54
    .line 55
    move-result-object p2

    .line 56
    invoke-static {p2}, Lcom/android/launcher3/model/data/p$b;->c(Lcom/android/launcher3/model/data/p$b;)Lcom/android/launcher3/logger/LauncherAtom$Attribute;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p1, p2}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->addItemAttributes(Lcom/android/launcher3/logger/LauncherAtom$Attribute;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getContainerInfo()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;->setContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logger/LauncherAtom$ItemInfo$Builder;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    check-cast p0, Lcom/android/launcher3/logger/LauncherAtom$ItemInfo;

    .line 77
    .line 78
    return-object p0
.end method

.method public copyFrom(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/model/data/y;->copyFrom(Lcom/android/launcher3/model/data/y;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/android/launcher3/model/data/p;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    check-cast p1, Lcom/android/launcher3/model/data/p;

    .line 9
    .line 10
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->i:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method protected dumpProperties()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/model/data/y;->dumpProperties()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->I()Lcom/android/launcher3/model/data/p$b;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "%s; labelState=%s"

    .line 14
    .line 15
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public makeShallowCopy()Lcom/android/launcher3/model/data/y;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/model/data/p;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/model/data/p;->copyFrom(Lcom/android/launcher3/model/data/y;)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method

.method public onAddToDatabase(Lcom/android/launcher3/util/G;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/model/data/m;->onAddToDatabase(Lcom/android/launcher3/util/G;)V

    .line 2
    .line 3
    .line 4
    iget p0, p0, Lcom/android/launcher3/model/data/p;->g:I

    .line 5
    .line 6
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    const-string v0, "options"

    .line 11
    .line 12
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/util/G;->j(Ljava/lang/String;Ljava/lang/Integer;)Lcom/android/launcher3/util/G;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public v(Lcom/android/launcher3/model/data/y;)V
    .locals 1

    .line 1
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/model/data/p;->R(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/RuntimeException;

    .line 18
    .line 19
    const-string p1, "tried to add an illegal type into a folder"

    .line 20
    .line 21
    invoke-direct {p0, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    throw p0
.end method

.method public x()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->i:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    instance-of v2, v1, Lcom/android/launcher3/model/data/I;

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    check-cast v1, Lcom/android/launcher3/model/data/I;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    instance-of v2, v1, Lcom/android/launcher3/model/data/l;

    .line 35
    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    check-cast v1, Lcom/android/launcher3/model/data/l;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/l;->x()Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_2
    return-object v0
.end method

.method public y()Ljava/util/ArrayList;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/p;->i:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method
