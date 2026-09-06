.class public final Lcom/android/launcher3/taskbar/allapps/c;
.super Ljava/lang/Object;
.source "TaskbarAllAppsController.java"


# instance fields
.field private a:Lcom/android/launcher3/taskbar/R1;

.field private b:La2/a;

.field private c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

.field private d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

.field private e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

.field private f:[Lcom/android/launcher3/model/data/d;

.field private g:I

.field private h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private j:Z

.field private k:Z

.field private l:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Lcom/android/launcher3/util/L1;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lcom/android/launcher3/model/data/d;->o:[Lcom/android/launcher3/model/data/d;

    .line 5
    .line 6
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->f:[Lcom/android/launcher3/model/data/d;

    .line 7
    .line 8
    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->h:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 13
    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->l:Ljava/util/Map;

    .line 15
    .line 16
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/allapps/c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/allapps/c;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getSearchUiDelegate()LP0/b;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0}, LP0/b;->d()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 20
    .line 21
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 26
    .line 27
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/r;->getSearchView()Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getSearchUiDelegate()LP0/b;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, LP0/b;->f()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    if-eqz v0, :cond_1

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->h()V

    .line 49
    .line 50
    .line 51
    iput-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 52
    .line 53
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 54
    .line 55
    if-eqz v0, :cond_2

    .line 56
    .line 57
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    iget-object v2, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 62
    .line 63
    invoke-virtual {v0, v2}, La2/h;->d(Lcom/android/launcher3/util/G2;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 67
    .line 68
    invoke-virtual {v0, v1}, La2/a;->s(Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;)V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 72
    .line 73
    :cond_2
    iput-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 74
    .line 75
    iput-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 76
    .line 77
    return-void
.end method

.method private n(Z)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/taskbar/allapps/c;->o(ZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private o(ZZ)V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->a:Lcom/android/launcher3/taskbar/R1;

    .line 7
    .line 8
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->v:La2/e;

    .line 9
    .line 10
    invoke-virtual {v0}, La2/e;->s()La2/a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->d(Landroid/content/Context;)Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, La2/a;->s(Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 28
    .line 29
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->h:Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->i(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->i:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 39
    .line 40
    invoke-virtual {v1, v0}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->j(Ljava/util/List;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 44
    .line 45
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->k()V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/b;->getLayoutInflater()Landroid/view/LayoutInflater;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 55
    .line 56
    invoke-virtual {v1}, La2/a;->n()La2/h;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const v2, 0x7f0e022a

    .line 61
    .line 62
    .line 63
    const/4 v3, 0x0

    .line 64
    invoke-virtual {v0, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    check-cast v0, Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 69
    .line 70
    iput-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 73
    .line 74
    invoke-virtual {v0}, La2/a;->n()La2/h;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 79
    .line 80
    invoke-virtual {v0, v1}, La2/h;->c(Lcom/android/launcher3/util/G2;)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 84
    .line 85
    new-instance v1, Lcom/android/launcher3/taskbar/allapps/b;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/allapps/b;-><init>(Lcom/android/launcher3/taskbar/allapps/c;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v0, v1}, Lcom/android/launcher3/views/f;->R(Lcom/android/launcher3/views/f$e;)V

    .line 91
    .line 92
    .line 93
    new-instance v4, Lcom/android/launcher3/taskbar/allapps/l;

    .line 94
    .line 95
    iget-object v5, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 96
    .line 97
    iget-object v6, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 98
    .line 99
    iget-object v7, p0, Lcom/android/launcher3/taskbar/allapps/c;->a:Lcom/android/launcher3/taskbar/R1;

    .line 100
    .line 101
    iget-object v8, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 102
    .line 103
    move v9, p2

    .line 104
    invoke-direct/range {v4 .. v9}, Lcom/android/launcher3/taskbar/allapps/l;-><init>(La2/a;Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;Lcom/android/launcher3/taskbar/R1;Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;Z)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v4, p1}, Lcom/android/launcher3/taskbar/allapps/l;->j(Z)V

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 111
    .line 112
    invoke-virtual {p1}, La2/a;->k()Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 117
    .line 118
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iget-object p2, p0, Lcom/android/launcher3/taskbar/allapps/c;->f:[Lcom/android/launcher3/model/data/d;

    .line 123
    .line 124
    iget v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->g:I

    .line 125
    .line 126
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->l:Ljava/util/Map;

    .line 127
    .line 128
    invoke-virtual {p1, p2, v0, v1, v3}, Lcom/android/launcher3/allapps/D;->y([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Z)V

    .line 129
    .line 130
    .line 131
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 132
    .line 133
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    const-class p2, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 138
    .line 139
    invoke-virtual {p1, p2}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    check-cast p1, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 144
    .line 145
    iget-object p2, p0, Lcom/android/launcher3/taskbar/allapps/c;->h:Ljava/util/List;

    .line 146
    .line 147
    invoke-virtual {p1, p2}, Lcom/android/launcher3/appprediction/PredictionRowView;->setPredictedApps(Ljava/util/List;)V

    .line 148
    .line 149
    .line 150
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 151
    .line 152
    invoke-virtual {p1}, La2/a;->l()Lcom/android/launcher3/taskbar/j2;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iget-boolean p2, p0, Lcom/android/launcher3/taskbar/allapps/c;->j:Z

    .line 157
    .line 158
    invoke-virtual {p1, p2}, Lcom/android/launcher3/taskbar/j2;->z0(Z)V

    .line 159
    .line 160
    .line 161
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->b:La2/a;

    .line 162
    .line 163
    invoke-virtual {p1}, La2/a;->l()Lcom/android/launcher3/taskbar/j2;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->k:Z

    .line 168
    .line 169
    invoke-virtual {p1, p0}, Lcom/android/launcher3/taskbar/j2;->A0(Z)V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method private q(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/allapps/c;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 9
    .line 10
    invoke-virtual {p0, v1}, Lcom/android/launcher3/a;->close(Z)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->a:Lcom/android/launcher3/taskbar/R1;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/android/launcher3/taskbar/R1;->n:Lcom/android/launcher3/taskbar/z3;

    .line 17
    .line 18
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/z3;->v()V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0, v1, p1}, Lcom/android/launcher3/taskbar/allapps/c;->o(ZZ)V

    .line 22
    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public c(Landroid/view/View;)Lcom/android/launcher3/dragndrop/p$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->b(Landroid/view/View;)Lcom/android/launcher3/dragndrop/p$a;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public d()Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getActiveRecyclerView()Lcom/android/launcher3/allapps/AllAppsRecyclerView;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getClipBounds()Landroid/graphics/Rect;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget p0, p0, Landroid/graphics/Rect;->top:I

    .line 12
    .line 13
    return p0
.end method

.method public g(Lcom/android/launcher3/taskbar/R1;Z)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->a:Lcom/android/launcher3/taskbar/R1;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/allapps/c;->n(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public h()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->c:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsSlideInView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

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

.method public i()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/allapps/c;->b()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public j([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V
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
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lcom/android/launcher3/model/data/d;->o:[Lcom/android/launcher3/model/data/d;

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->f:[Lcom/android/launcher3/model/data/d;

    .line 6
    .line 7
    iput p2, p0, Lcom/android/launcher3/taskbar/allapps/c;->g:I

    .line 8
    .line 9
    iput-object p3, p0, Lcom/android/launcher3/taskbar/allapps/c;->l:Ljava/util/Map;

    .line 10
    .line 11
    iget-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p2, p0, Lcom/android/launcher3/taskbar/allapps/c;->f:[Lcom/android/launcher3/model/data/d;

    .line 20
    .line 21
    iget p3, p0, Lcom/android/launcher3/taskbar/allapps/c;->g:I

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->l:Ljava/util/Map;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p1, p2, p3, p0, v0}, Lcom/android/launcher3/allapps/D;->y([Lcom/android/launcher3/model/data/d;ILjava/util/Map;Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public k(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public l(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method public m(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/taskbar/allapps/c;->h:Ljava/util/List;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/taskbar/allapps/c;->d:Lcom/android/launcher3/taskbar/allapps/TaskbarAllAppsContainerView;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getFloatingHeaderView()Lcom/android/launcher3/allapps/FloatingHeaderView;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-class v1, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lcom/android/launcher3/allapps/FloatingHeaderView;->h(Ljava/lang/Class;)Lcom/android/launcher3/allapps/P;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Lcom/android/launcher3/appprediction/PredictionRowView;

    .line 18
    .line 19
    iget-object v1, p0, Lcom/android/launcher3/taskbar/allapps/c;->h:Ljava/util/List;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Lcom/android/launcher3/appprediction/PredictionRowView;->setPredictedApps(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/taskbar/allapps/c;->e:Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/allapps/TaskbarSearchSessionController;->i(Ljava/util/List;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/allapps/c;->q(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/allapps/c;->q(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method
