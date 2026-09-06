.class public Lcom/android/launcher3/allapps/AllAppsRecyclerView;
.super Lcom/android/launcher3/s0;
.source "AllAppsRecyclerView.java"


# static fields
.field private static final r:Z


# instance fields
.field private h:LI/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI/a<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field protected final i:I

.field private final j:Lcom/android/launcher3/allapps/t;

.field private k:I

.field private l:Landroidx/constraintlayout/widget/ConstraintLayout;

.field protected m:Lcom/android/launcher3/allapps/M;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/M<",
            "*>;"
        }
    .end annotation
.end field

.field private n:I

.field private o:I

.field private p:[I

.field private q:Lcom/android/launcher3/views/k;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "SearchLogging"

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/N5;->C(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    sput-boolean v0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->r:Z

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/s0;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {p1}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    move-result-object p1

    iget p1, p1, Lcom/android/launcher3/F1;->H0:I

    iput p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->i:I

    .line 5
    new-instance p1, Lcom/android/launcher3/allapps/t;

    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/t;-><init>(Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V

    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->j:Lcom/android/launcher3/allapps/t;

    return-void
.end method

.method public static synthetic k(Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->o()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private n(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/constraintlayout/widget/ConstraintLayout;",
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/LetterListTextView;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/d;

    .line 2
    .line 3
    invoke-direct {v0}, Landroidx/constraintlayout/widget/d;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/widget/d;->m(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    move v1, p0

    .line 11
    :goto_0
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    if-ge v1, v2, :cond_1

    .line 16
    .line 17
    invoke-interface {p2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/android/launcher3/allapps/LetterListTextView;

    .line 22
    .line 23
    const/4 v3, 0x3

    .line 24
    if-nez v1, :cond_0

    .line 25
    .line 26
    invoke-virtual {v2}, Landroid/widget/TextView;->getId()I

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    invoke-virtual {v0, v4, v3, p0, v3}, Landroidx/constraintlayout/widget/d;->p(IIII)V

    .line 31
    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_0
    invoke-virtual {v2}, Landroid/widget/TextView;->getId()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    add-int/lit8 v5, v1, -0x1

    .line 39
    .line 40
    invoke-interface {p2, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    check-cast v5, Lcom/android/launcher3/allapps/LetterListTextView;

    .line 45
    .line 46
    invoke-virtual {v5}, Landroid/widget/TextView;->getId()I

    .line 47
    .line 48
    .line 49
    move-result v5

    .line 50
    const/4 v6, 0x4

    .line 51
    invoke-virtual {v0, v4, v3, v5, v6}, Landroidx/constraintlayout/widget/d;->p(IIII)V

    .line 52
    .line 53
    .line 54
    :goto_1
    invoke-virtual {v2}, Landroid/widget/TextView;->getId()I

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    .line 59
    .line 60
    .line 61
    move-result v4

    .line 62
    const/4 v5, 0x6

    .line 63
    invoke-virtual {v0, v3, v5, v4, v5}, Landroidx/constraintlayout/widget/d;->p(IIII)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/widget/TextView;->getId()I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    const/4 v4, 0x7

    .line 75
    invoke-virtual {v0, v2, v4, v3, v4}, Landroidx/constraintlayout/widget/d;->p(IIII)V

    .line 76
    .line 77
    .line 78
    add-int/lit8 v1, v1, 0x1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    invoke-interface {p2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    new-instance v1, Lcom/android/launcher3/allapps/u;

    .line 86
    .line 87
    invoke-direct {v1}, Lcom/android/launcher3/allapps/u;-><init>()V

    .line 88
    .line 89
    .line 90
    invoke-interface {p0, v1}, Ljava/util/stream/Stream;->mapToInt(Ljava/util/function/ToIntFunction;)Ljava/util/stream/IntStream;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-interface {p0}, Ljava/util/stream/IntStream;->toArray()[I

    .line 95
    .line 96
    .line 97
    move-result-object v5

    .line 98
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    new-array v6, p0, [F

    .line 103
    .line 104
    const/high16 p0, 0x3f800000    # 1.0f

    .line 105
    .line 106
    invoke-static {v6, p0}, Ljava/util/Arrays;->fill([FF)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    .line 114
    .line 115
    .line 116
    move-result v3

    .line 117
    const/4 v4, 0x4

    .line 118
    const/4 v7, 0x0

    .line 119
    const/4 v2, 0x3

    .line 120
    invoke-virtual/range {v0 .. v7}, Landroidx/constraintlayout/widget/d;->t(IIII[I[FI)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, p1}, Landroidx/constraintlayout/widget/d;->i(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method private synthetic o()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->p:[I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l([I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private p()V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getSearchUiManager()Lcom/android/launcher3/allapps/p0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-interface {v2}, Lcom/android/launcher3/allapps/p0;->getEditText()Lcom/android/launcher3/ExtendedEditText;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 28
    .line 29
    .line 30
    move-result-object v3

    .line 31
    invoke-static {}, Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer;->newBuilder()Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    const/4 v2, -0x1

    .line 38
    goto :goto_0

    .line 39
    :cond_0
    invoke-virtual {v2}, Landroid/widget/EditText;->length()I

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    :goto_0
    invoke-virtual {v4, v2}, Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer$Builder;->setQueryLength(I)Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    invoke-virtual {v3, v2}, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;->setSearchResultContainer(Lcom/android/launcher3/logger/LauncherAtom$SearchResultContainer$Builder;)Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo$Builder;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-virtual {v2}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    check-cast v2, Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;

    .line 56
    .line 57
    iget v3, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->k:I

    .line 58
    .line 59
    if-nez v3, :cond_1

    .line 60
    .line 61
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-interface {p0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->v2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 70
    .line 71
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 72
    .line 73
    .line 74
    return-void

    .line 75
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->Y()Z

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    if-eqz v3, :cond_3

    .line 80
    .line 81
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    iget p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->k:I

    .line 90
    .line 91
    if-lez p0, :cond_2

    .line 92
    .line 93
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->T2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 94
    .line 95
    goto :goto_1

    .line 96
    :cond_2
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->U2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 97
    .line 98
    :goto_1
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 99
    .line 100
    .line 101
    return-void

    .line 102
    :cond_3
    iget-object v0, v0, Lcom/android/launcher3/allapps/r;->B:Lcom/android/launcher3/allapps/AllAppsPagedView;

    .line 103
    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    const/4 v3, 0x1

    .line 111
    if-ne v0, v3, :cond_5

    .line 112
    .line 113
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iget p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->k:I

    .line 122
    .line 123
    if-lez p0, :cond_4

    .line 124
    .line 125
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->R2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_4
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->S2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 129
    .line 130
    :goto_2
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 131
    .line 132
    .line 133
    return-void

    .line 134
    :cond_5
    invoke-virtual {v1}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 135
    .line 136
    .line 137
    move-result-object v0

    .line 138
    invoke-interface {v0, v2}, Lcom/android/launcher3/logging/StatsLogManager$i;->withContainerInfo(Lcom/android/launcher3/logger/LauncherAtom$ContainerInfo;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iget p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->k:I

    .line 143
    .line 144
    if-lez p0, :cond_6

    .line 145
    .line 146
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->u2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 147
    .line 148
    goto :goto_3

    .line 149
    :cond_6
    sget-object p0, Lcom/android/launcher3/logging/StatsLogManager$e;->t2:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 150
    .line 151
    :goto_3
    invoke-interface {v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 152
    .line 153
    .line 154
    return-void
.end method


# virtual methods
.method public c()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/s0;->c()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->j:Lcom/android/launcher3/allapps/t;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/t;->g()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public d(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto/16 :goto_2

    .line 6
    .line 7
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    const/4 v1, -0x1

    .line 16
    if-nez v0, :cond_9

    .line 17
    .line 18
    iget v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->i:I

    .line 19
    .line 20
    if-eqz v0, :cond_9

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_1

    .line 27
    .line 28
    goto/16 :goto_3

    .line 29
    .line 30
    :cond_1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-gez v0, :cond_2

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_2
    invoke-static {}, Lcom/android/launcher3/y0;->m0()Z

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    if-eqz v2, :cond_3

    .line 47
    .line 48
    iget-object v2, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 49
    .line 50
    invoke-virtual {v2}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->g()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_3

    .line 55
    .line 56
    iget-object v2, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 57
    .line 58
    invoke-virtual {v2}, Lcom/android/launcher3/allapps/M;->i()Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-virtual {p0, v2}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->setLettersToScrollLayout(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    :cond_3
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getAvailableScrollBarHeight()I

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->getAvailableScrollHeight()I

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-gtz v3, :cond_4

    .line 74
    .line 75
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 76
    .line 77
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    iget-object v1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->j()Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_8

    .line 88
    .line 89
    iget-object v1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->g()Z

    .line 92
    .line 93
    .line 94
    move-result v1

    .line 95
    if-nez v1, :cond_7

    .line 96
    .line 97
    int-to-float v0, v0

    .line 98
    int-to-float v1, v3

    .line 99
    div-float/2addr v0, v1

    .line 100
    int-to-float v1, v2

    .line 101
    mul-float/2addr v0, v1

    .line 102
    float-to-int v0, v0

    .line 103
    iget-object v1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 104
    .line 105
    invoke-virtual {v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->getThumbOffsetY()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    sub-int v3, v0, v1

    .line 110
    .line 111
    mul-int v4, v3, p1

    .line 112
    .line 113
    int-to-float v4, v4

    .line 114
    const/4 v5, 0x0

    .line 115
    cmpl-float v4, v4, v5

    .line 116
    .line 117
    if-lez v4, :cond_6

    .line 118
    .line 119
    if-gez p1, :cond_5

    .line 120
    .line 121
    mul-int/2addr p1, v1

    .line 122
    int-to-float p1, p1

    .line 123
    int-to-float v4, v0

    .line 124
    div-float/2addr p1, v4

    .line 125
    float-to-int p1, p1

    .line 126
    invoke-static {p1, v3}, Ljava/lang/Math;->max(II)I

    .line 127
    .line 128
    .line 129
    move-result p1

    .line 130
    :goto_0
    add-int/2addr v1, p1

    .line 131
    goto :goto_1

    .line 132
    :cond_5
    sub-int v4, v2, v1

    .line 133
    .line 134
    mul-int/2addr p1, v4

    .line 135
    int-to-float p1, p1

    .line 136
    sub-int v4, v2, v0

    .line 137
    .line 138
    int-to-float v4, v4

    .line 139
    div-float/2addr p1, v4

    .line 140
    float-to-int p1, p1

    .line 141
    invoke-static {p1, v3}, Ljava/lang/Math;->min(II)I

    .line 142
    .line 143
    .line 144
    move-result p1

    .line 145
    goto :goto_0

    .line 146
    :goto_1
    const/4 p1, 0x0

    .line 147
    invoke-static {v2, v1}, Ljava/lang/Math;->min(II)I

    .line 148
    .line 149
    .line 150
    move-result v1

    .line 151
    invoke-static {p1, v1}, Ljava/lang/Math;->max(II)I

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    iget-object v1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 156
    .line 157
    invoke-virtual {v1, p1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 158
    .line 159
    .line 160
    if-ne v0, p1, :cond_7

    .line 161
    .line 162
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 163
    .line 164
    invoke-virtual {p0}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->k()V

    .line 165
    .line 166
    .line 167
    return-void

    .line 168
    :cond_6
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 169
    .line 170
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 171
    .line 172
    .line 173
    :cond_7
    :goto_2
    return-void

    .line 174
    :cond_8
    invoke-virtual {p0, v0, v3}, Lcom/android/launcher3/s0;->j(II)V

    .line 175
    .line 176
    .line 177
    return-void

    .line 178
    :cond_9
    :goto_3
    iget-object p0, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 179
    .line 180
    invoke-virtual {p0, v1}, Lcom/android/launcher3/views/RecyclerViewFastScroller;->setThumbOffsetY(I)V

    .line 181
    .line 182
    .line 183
    return-void
.end method

.method public e(F)Ljava/lang/CharSequence;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->j()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->i()Ljava/util/List;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_1
    int-to-float v1, v2

    .line 26
    mul-float/2addr p1, v1

    .line 27
    float-to-int p1, p1

    .line 28
    add-int/lit8 v2, v2, -0x1

    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    invoke-static {p1, v1, v2}, Lcom/android/launcher3/N5;->c(III)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/android/launcher3/allapps/M$a;

    .line 40
    .line 41
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->j:Lcom/android/launcher3/allapps/t;

    .line 42
    .line 43
    invoke-virtual {v0, p1}, Lcom/android/launcher3/allapps/t;->i(Lcom/android/launcher3/allapps/M$a;)V

    .line 44
    .line 45
    .line 46
    iget v0, p1, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollToPosition(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 52
    .line 53
    return-object p0
.end method

.method public f(Ljava/lang/String;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->i()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, -0x1

    .line 8
    filled-new-array {v1, v1}, [I

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    iput-object v1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->p:[I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    const-wide/16 v3, 0x64

    .line 20
    .line 21
    if-ge v1, v2, :cond_3

    .line 22
    .line 23
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    check-cast v2, Lcom/android/launcher3/allapps/M$a;

    .line 28
    .line 29
    iget-object v5, v2, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 30
    .line 31
    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eqz v5, :cond_2

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    add-int/lit8 p1, p1, -0x1

    .line 42
    .line 43
    if-ne v1, p1, :cond_0

    .line 44
    .line 45
    iget p1, v2, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 46
    .line 47
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/lit8 v0, v0, -0x1

    .line 58
    .line 59
    filled-new-array {p1, v0}, [I

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->p:[I

    .line 64
    .line 65
    goto :goto_1

    .line 66
    :cond_0
    iget p1, v2, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 67
    .line 68
    add-int/lit8 v1, v1, 0x1

    .line 69
    .line 70
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/android/launcher3/allapps/M$a;

    .line 75
    .line 76
    iget v0, v0, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 77
    .line 78
    add-int/lit8 v0, v0, -0x1

    .line 79
    .line 80
    filled-new-array {p1, v0}, [I

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->p:[I

    .line 85
    .line 86
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->j:Lcom/android/launcher3/allapps/t;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/t;->f()I

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iget v0, v2, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 93
    .line 94
    if-ne p1, v0, :cond_1

    .line 95
    .line 96
    const-wide/16 v3, 0x32

    .line 97
    .line 98
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->j:Lcom/android/launcher3/allapps/t;

    .line 99
    .line 100
    invoke-virtual {p1, v2}, Lcom/android/launcher3/allapps/t;->i(Lcom/android/launcher3/allapps/M$a;)V

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/android/launcher3/s0;->g:Lcom/android/launcher3/views/RecyclerViewFastScroller;

    .line 108
    .line 109
    instance-of v0, p1, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;

    .line 110
    .line 111
    if-eqz v0, :cond_4

    .line 112
    .line 113
    check-cast p1, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;

    .line 114
    .line 115
    invoke-virtual {p1}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->getIsSlideInScroller()Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-eqz p1, :cond_4

    .line 120
    .line 121
    new-instance p1, Lcom/android/launcher3/allapps/v;

    .line 122
    .line 123
    invoke-direct {p1, p0}, Lcom/android/launcher3/allapps/v;-><init>(Lcom/android/launcher3/allapps/AllAppsRecyclerView;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, p1, v3, v4}, Landroid/view/ViewGroup;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    .line 127
    .line 128
    .line 129
    :cond_4
    return-void
.end method

.method public getActivityContext()Lcom/android/launcher3/views/k;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->q:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-object p0
.end method

.method public getApps()Lcom/android/launcher3/allapps/M;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/M<",
            "*>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLastTouchX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method public getLetterList()Landroidx/constraintlayout/widget/ConstraintLayout;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 2
    .line 3
    return-object p0
.end method

.method public getPositionScrollTo()[I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->p:[I

    .line 2
    .line 3
    return-object p0
.end method

.method public getScrollBarMarginBottom()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getRootWindowInsets()Landroid/view/WindowInsets;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getSystemWindowInsetBottom()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public getScrollBarTop()I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f0700d1

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method protected getTopPaddingOffset()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    neg-int p0, p0

    .line 6
    return p0
.end method

.method public hasOverlappingRendering()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public i()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->H:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    return v1

    .line 15
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/M;->n()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    xor-int/2addr p0, v1

    .line 22
    return p0
.end method

.method protected isPaddingOffsetRequired()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public l([I)V
    .locals 11

    .line 1
    const/4 v0, 0x2

    .line 2
    const/4 v1, 0x1

    .line 3
    const/4 v2, 0x0

    .line 4
    move v3, v2

    .line 5
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 6
    .line 7
    invoke-virtual {v4}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 12
    .line 13
    .line 14
    move-result v4

    .line 15
    if-ge v3, v4, :cond_2

    .line 16
    .line 17
    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->findViewHolderForAdapterPosition(I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    if-eqz v4, :cond_1

    .line 22
    .line 23
    invoke-virtual {v4}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getItemViewType()I

    .line 24
    .line 25
    .line 26
    move-result v5

    .line 27
    if-ne v5, v0, :cond_1

    .line 28
    .line 29
    iget-object v5, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 30
    .line 31
    invoke-virtual {v5}, Landroid/view/View;->clearAnimation()V

    .line 32
    .line 33
    .line 34
    array-length v5, p1

    .line 35
    const-wide/16 v6, 0x12c

    .line 36
    .line 37
    const-string v8, "alpha"

    .line 38
    .line 39
    if-ne v5, v0, :cond_0

    .line 40
    .line 41
    aget v5, p1, v2

    .line 42
    .line 43
    if-lt v3, v5, :cond_0

    .line 44
    .line 45
    aget v5, p1, v1

    .line 46
    .line 47
    if-gt v3, v5, :cond_0

    .line 48
    .line 49
    iget-object v5, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 50
    .line 51
    invoke-virtual {v5}, Landroid/view/View;->getAlpha()F

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    const/high16 v9, 0x3f800000    # 1.0f

    .line 56
    .line 57
    cmpl-float v5, v5, v9

    .line 58
    .line 59
    if-eqz v5, :cond_1

    .line 60
    .line 61
    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    .line 64
    .line 65
    .line 66
    move-result v5

    .line 67
    new-array v10, v0, [F

    .line 68
    .line 69
    aput v5, v10, v2

    .line 70
    .line 71
    aput v9, v10, v1

    .line 72
    .line 73
    invoke-static {v4, v8, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 78
    .line 79
    .line 80
    sget-object v5, Lcom/android/launcher3/anim/L;->L:Landroid/view/animation/Interpolator;

    .line 81
    .line 82
    invoke-virtual {v4, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 86
    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_0
    iget-object v5, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 90
    .line 91
    invoke-virtual {v5}, Landroid/view/View;->getAlpha()F

    .line 92
    .line 93
    .line 94
    move-result v5

    .line 95
    const v9, 0x3e19999a    # 0.15f

    .line 96
    .line 97
    .line 98
    cmpl-float v5, v5, v9

    .line 99
    .line 100
    if-eqz v5, :cond_1

    .line 101
    .line 102
    iget-object v4, v4, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 103
    .line 104
    invoke-virtual {v4}, Landroid/view/View;->getAlpha()F

    .line 105
    .line 106
    .line 107
    move-result v5

    .line 108
    new-array v10, v0, [F

    .line 109
    .line 110
    aput v5, v10, v2

    .line 111
    .line 112
    aput v9, v10, v1

    .line 113
    .line 114
    invoke-static {v4, v8, v10}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 115
    .line 116
    .line 117
    move-result-object v4

    .line 118
    invoke-virtual {v4, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 119
    .line 120
    .line 121
    sget-object v5, Lcom/android/launcher3/anim/L;->L:Landroid/view/animation/Interpolator;

    .line 122
    .line 123
    invoke-virtual {v4, v5}, Landroid/animation/ObjectAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4}, Landroid/animation/ObjectAnimator;->start()V

    .line 127
    .line 128
    .line 129
    :cond_1
    :goto_1
    add-int/2addr v3, v1

    .line 130
    goto :goto_0

    .line 131
    :cond_2
    return-void
.end method

.method public m(I)Ljava/lang/String;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/M;->i()Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const-string p0, ""

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 v1, 0x0

    .line 17
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    check-cast v2, Lcom/android/launcher3/allapps/M$a;

    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    instance-of v4, v3, Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 28
    .line 29
    if-eqz v4, :cond_1

    .line 30
    .line 31
    check-cast v3, Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 32
    .line 33
    invoke-virtual {v3}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->y()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iput v3, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->n:I

    .line 38
    .line 39
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-ge v1, v3, :cond_4

    .line 44
    .line 45
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v3

    .line 49
    check-cast v3, Lcom/android/launcher3/allapps/M$a;

    .line 50
    .line 51
    iget v4, v3, Lcom/android/launcher3/allapps/M$a;->b:I

    .line 52
    .line 53
    iget v5, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->n:I

    .line 54
    .line 55
    div-int/2addr v4, v5

    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iget-object p0, v2, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    return-object p0

    .line 65
    :cond_2
    if-le v4, p1, :cond_3

    .line 66
    .line 67
    iget-object p0, v2, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 68
    .line 69
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    return-object p0

    .line 74
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 75
    .line 76
    move-object v2, v3

    .line 77
    goto :goto_0

    .line 78
    :cond_4
    iget-object p0, v2, Lcom/android/launcher3/allapps/M$a;->a:Ljava/lang/CharSequence;

    .line 79
    .line 80
    invoke-interface {p0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    return-object p0
.end method

.method public onChildAttachedToWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->h:LI/a;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1}, LI/a;->accept(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onChildAttachedToWindow(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    sget-boolean v0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->r:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " onDraw; time stamp = "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v1

    .line 30
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "SearchLogging"

    .line 38
    .line 39
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    .line 41
    .line 42
    :cond_0
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onDraw(Landroid/graphics/Canvas;)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->q:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->q:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    const/16 v2, 0x100

    .line 15
    .line 16
    invoke-static {v0, v2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->q:Lcom/android/launcher3/views/k;

    .line 23
    .line 24
    invoke-static {v0, v2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    float-to-int v0, v0

    .line 36
    iput v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->o:I

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->setOverScrollMode(I)V

    .line 39
    .line 40
    .line 41
    invoke-super {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public onScrollStateChanged(I)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/s0;->onScrollStateChanged(I)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-eqz p1, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x1

    .line 21
    if-eq p1, v1, :cond_0

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const/4 p1, 0x0

    .line 25
    iput p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->k:I

    .line 26
    .line 27
    invoke-virtual {p0}, Landroid/view/ViewGroup;->requestFocus()Z

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->G1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 35
    .line 36
    invoke-interface {p1, v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->sendToInteractionJankMonitor(Lcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 48
    .line 49
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->hideKeyboard()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getAdapter()Landroidx/recyclerview/widget/RecyclerView$Adapter;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {p1, v0, p0}, Lx1/f;->a(Landroid/content/Context;Landroidx/recyclerview/widget/RecyclerView$Adapter;Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->H1:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 73
    .line 74
    invoke-interface {p1, v0, p0}, Lcom/android/launcher3/logging/StatsLogManager$i;->sendToInteractionJankMonitor(Lcom/android/launcher3/logging/StatsLogManager$d;Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    invoke-direct {p0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->p()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public onScrolled(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->onScrolled(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->k:I

    .line 5
    .line 6
    add-int/2addr p1, p2

    .line 7
    iput p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->k:I

    .line 8
    .line 9
    return-void
.end method

.method protected onSizeChanged(IIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public q()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/s0;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->s(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method s(Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    check-cast v0, Lcom/android/launcher3/views/k;

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->getRecycledViewPool()Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const/4 v1, 0x4

    .line 20
    const/4 v2, 0x1

    .line 21
    invoke-virtual {p0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 22
    .line 23
    .line 24
    const/16 v3, 0x8

    .line 25
    .line 26
    invoke-virtual {p0, v3, v2}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->z0()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    iget v0, v0, Lcom/android/launcher3/h0;->M2:I

    .line 34
    .line 35
    mul-int/2addr v2, v0

    .line 36
    mul-int/2addr v0, v1

    .line 37
    const/4 v1, 0x2

    .line 38
    add-int/2addr v0, v1

    .line 39
    add-int/2addr v2, v0

    .line 40
    if-eqz p1, :cond_0

    .line 41
    .line 42
    mul-int/lit8 v2, v2, 0x2

    .line 43
    .line 44
    :cond_0
    invoke-virtual {p0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 45
    .line 46
    .line 47
    const/16 p1, 0x400

    .line 48
    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p0, p1, v0}, Landroidx/recyclerview/widget/RecyclerView$RecycledViewPool;->setMaxRecycledViews(II)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setActivityContext(Lcom/android/launcher3/views/k;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->q:Lcom/android/launcher3/views/k;

    .line 2
    .line 3
    return-void
.end method

.method public setApps(Lcom/android/launcher3/allapps/M;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/M<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->m:Lcom/android/launcher3/allapps/M;

    .line 2
    .line 3
    return-void
.end method

.method protected setChildAttachedConsumer(LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LI/a<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->h:LI/a;

    .line 2
    .line 3
    return-void
.end method

.method public setLastTouchX(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->o:I

    .line 2
    .line 3
    return-void
.end method

.method public setLettersToScrollLayout(Ljava/util/List;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/allapps/M$a;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 13
    .line 14
    .line 15
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-static {v0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    check-cast v1, Lcom/android/launcher3/views/k;

    .line 24
    .line 25
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getFastScrollerLetterList()Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    iput-object v1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getScrollBarTop()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->getScrollBarMarginBottom()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    const/4 v4, 0x0

    .line 44
    invoke-virtual {v1, v4, v2, v4, v3}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 45
    .line 46
    .line 47
    new-instance v1, Ljava/util/ArrayList;

    .line 48
    .line 49
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 50
    .line 51
    .line 52
    move v2, v4

    .line 53
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 54
    .line 55
    .line 56
    move-result v3

    .line 57
    const/4 v5, 0x4

    .line 58
    if-ge v2, v3, :cond_3

    .line 59
    .line 60
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    check-cast v3, Lcom/android/launcher3/allapps/M$a;

    .line 65
    .line 66
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    const v7, 0x7f0e00d3

    .line 71
    .line 72
    .line 73
    iget-object v8, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 74
    .line 75
    invoke-virtual {v6, v7, v8, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 76
    .line 77
    .line 78
    move-result-object v6

    .line 79
    check-cast v6, Lcom/android/launcher3/allapps/LetterListTextView;

    .line 80
    .line 81
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 82
    .line 83
    .line 84
    move-result v7

    .line 85
    invoke-virtual {v6, v3, v7}, Lcom/android/launcher3/allapps/LetterListTextView;->b(Lcom/android/launcher3/allapps/M$a;I)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v7}, Lcom/android/launcher3/allapps/M$a;->a(I)V

    .line 89
    .line 90
    .line 91
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 92
    .line 93
    .line 94
    move-result v3

    .line 95
    add-int/lit8 v3, v3, -0x1

    .line 96
    .line 97
    if-ne v2, v3, :cond_2

    .line 98
    .line 99
    invoke-virtual {v6, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 100
    .line 101
    .line 102
    :cond_2
    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    iget-object v3, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 106
    .line 107
    invoke-virtual {v3, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 108
    .line 109
    .line 110
    add-int/lit8 v2, v2, 0x1

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :cond_3
    new-instance p1, Lcom/android/launcher3/allapps/LetterListTextView;

    .line 114
    .line 115
    invoke-direct {p1, v0}, Lcom/android/launcher3/allapps/LetterListTextView;-><init>(Landroid/content/Context;)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Landroid/view/View;->generateViewId()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setId(I)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 126
    .line 127
    .line 128
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 132
    .line 133
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 134
    .line 135
    .line 136
    iget-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 137
    .line 138
    invoke-direct {p0, p1, v1}, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->n(Landroidx/constraintlayout/widget/ConstraintLayout;Ljava/util/List;)V

    .line 139
    .line 140
    .line 141
    iget-object p1, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 142
    .line 143
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 144
    .line 145
    .line 146
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsRecyclerView;->l:Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 147
    .line 148
    const/4 p1, 0x0

    .line 149
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setAlpha(F)V

    .line 150
    .line 151
    .line 152
    return-void
.end method
