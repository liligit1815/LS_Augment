.class public Lcom/android/launcher3/cloudfolder/a;
.super Ljava/lang/Object;
.source "CloudFolder.java"


# instance fields
.field private a:Landroid/widget/LinearLayout;

.field private b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/android/launcher3/folder/Folder;",
            ">;"
        }
    .end annotation
.end field

.field private c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

.field private d:Lcom/android/launcher3/cloudfolder/RemoteView;

.field private e:Z


# direct methods
.method public constructor <init>(Lcom/android/launcher3/folder/Folder;)V
    .locals 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->b:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lx1/S;->s(Landroid/content/Context;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    iput-boolean v0, p0, Lcom/android/launcher3/cloudfolder/a;->e:Z

    .line 20
    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v1, "CloudFolder: mIsNubiaAppStore="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget-boolean v1, p0, Lcom/android/launcher3/cloudfolder/a;->e:Z

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "CloudFolder"

    .line 41
    .line 42
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    iget-boolean v0, p0, Lcom/android/launcher3/cloudfolder/a;->e:Z

    .line 46
    .line 47
    const/4 v1, 0x0

    .line 48
    if-eqz v0, :cond_0

    .line 49
    .line 50
    new-instance v0, Lcom/android/launcher3/cloudfolder/c;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-static {v3, v1}, Lx1/O;->m0(Landroid/content/Context;Z)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 65
    .line 66
    .line 67
    move-result-object v4

    .line 68
    invoke-static {v4, v1}, Lx1/O;->l0(Landroid/content/Context;Z)I

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-direct {v0, v2, v3, v1}, Lcom/android/launcher3/cloudfolder/c;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    new-instance v0, Lcom/android/launcher3/cloudfolder/b;

    .line 77
    .line 78
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v3, v1}, Lx1/O;->m0(Landroid/content/Context;Z)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-static {v4, v1}, Lx1/O;->l0(Landroid/content/Context;Z)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-direct {v0, v2, v3, v1}, Lcom/android/launcher3/cloudfolder/b;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 99
    .line 100
    .line 101
    :goto_0
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 102
    .line 103
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/a;->h(Lcom/android/launcher3/folder/Folder;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/folder/Folder;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Lcom/android/launcher3/model/data/I;->g0(I)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    sub-int/2addr v2, v0

    .line 18
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/android/launcher3/folderbatch/g;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    sub-int/2addr v1, v0

    .line 39
    invoke-virtual {p1, p0, v1, v0}, Lcom/android/launcher3/model/data/p;->B(Lcom/android/launcher3/model/data/y;IZ)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/model/data/p;->C(Lcom/android/launcher3/model/data/y;Z)V

    .line 44
    .line 45
    .line 46
    :goto_0
    invoke-virtual {p2}, Lcom/android/launcher3/folder/Folder;->R1()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method private c()Landroid/os/Bundle;
    .locals 2

    .line 1
    new-instance p0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v0, "remote_vn"

    .line 7
    .line 8
    const-string v1, "16.0.010.000.2604151532"

    .line 9
    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const-string v0, "remote_vc"

    .line 14
    .line 15
    const v1, 0x27100

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    const-string v0, "remote_pkg"

    .line 22
    .line 23
    const-string v1, "com.zte.mifavor.launcher"

    .line 24
    .line 25
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    const-string v0, "source"

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    invoke-virtual {p0, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 32
    .line 33
    .line 34
    return-object p0
.end method

.method private d(I)I
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/cloudfolder/a;->e:Z

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Ld1/a;->g(I)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    invoke-static {p1}, Ld1/a;->h(I)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method private e(Lcom/android/launcher3/folder/Folder;)I
    .locals 0

    .line 1
    iget-object p0, p1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/model/data/p;->j:I

    .line 4
    .line 5
    add-int/lit8 p0, p0, -0x1

    .line 6
    .line 7
    return p0
.end method

.method private f()Lcom/android/launcher3/folder/Folder;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->b:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->b:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Lcom/android/launcher3/folder/Folder;

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method private h(Lcom/android/launcher3/folder/Folder;)V
    .locals 2

    .line 1
    const v0, 0x7f0b0169

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/view/ViewStub;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const v1, 0x7f0b0283

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Landroid/widget/LinearLayout;

    .line 22
    .line 23
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 24
    .line 25
    const v0, 0x7f0b04cb

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public declared-synchronized b(Ld1/d;)V
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/a;->f()Lcom/android/launcher3/folder/Folder;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    if-eqz v0, :cond_3

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    goto/16 :goto_1

    .line 11
    .line 12
    :cond_0
    iget-object v1, v0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 13
    .line 14
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    invoke-virtual {v2}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    const-string v3, "CloudFolder"

    .line 23
    .line 24
    new-instance v4, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    const-string v5, "Folder add recommend packageName:"

    .line 30
    .line 31
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-object v5, p1, Ld1/d;->c:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-static {v3, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/Folder;->f1(Ld1/d;)Lcom/android/launcher3/model/data/I;

    .line 47
    .line 48
    .line 49
    move-result-object v3

    .line 50
    iget-object p1, p1, Ld1/d;->h:Landroid/graphics/drawable/Drawable;

    .line 51
    .line 52
    invoke-static {p1}, Lx1/O;->G(Landroid/graphics/drawable/Drawable;)Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-static {v5}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 65
    .line 66
    .line 67
    move-result-object v5

    .line 68
    invoke-virtual {v5}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 69
    .line 70
    .line 71
    move-result-object v5

    .line 72
    invoke-virtual {v5, p1}, Lcom/android/launcher3/H5;->b0(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-static {v4, v5}, Lx1/O;->o(Landroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Drawable;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v5

    .line 84
    invoke-static {v5}, Ls1/X;->m0(Landroid/content/Context;)Ls1/X;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    new-instance v6, Ls1/b$c;

    .line 89
    .line 90
    invoke-direct {v6}, Ls1/b$c;-><init>()V

    .line 91
    .line 92
    .line 93
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 94
    .line 95
    .line 96
    move-result-object v7

    .line 97
    invoke-virtual {v6, v7}, Ls1/b$c;->e(Landroid/os/UserHandle;)Ls1/b$c;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    const/4 v7, 0x0

    .line 102
    invoke-virtual {v6, v7}, Ls1/b$c;->b(Z)Ls1/b$c;

    .line 103
    .line 104
    .line 105
    move-result-object v6

    .line 106
    invoke-virtual {v5, v4, v6}, Ls1/b;->e(Landroid/graphics/drawable/Drawable;Ls1/b$c;)Ls1/d;

    .line 107
    .line 108
    .line 109
    move-result-object v4

    .line 110
    iput-object v4, v3, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 111
    .line 112
    invoke-virtual {v5}, Ls1/X;->n0()V

    .line 113
    .line 114
    .line 115
    iput-object p1, v3, Lcom/android/launcher3/model/data/I;->u:Landroid/graphics/Bitmap;

    .line 116
    .line 117
    if-eqz p1, :cond_1

    .line 118
    .line 119
    sget-object p1, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 120
    .line 121
    new-instance v4, Ld1/b;

    .line 122
    .line 123
    invoke-direct {v4, v3, v1, v0}, Ld1/b;-><init>(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/p;Lcom/android/launcher3/folder/Folder;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v4}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :catchall_0
    move-exception p1

    .line 131
    goto :goto_2

    .line 132
    :cond_1
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    invoke-virtual {p1}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    if-eq v2, p1, :cond_2

    .line 141
    .line 142
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getContent()Lcom/android/launcher3/folder/FolderPagedView;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    invoke-virtual {p1, v2}, Lcom/android/launcher3/V4;->setCurrentPage(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 147
    .line 148
    .line 149
    :cond_2
    monitor-exit p0

    .line 150
    return-void

    .line 151
    :cond_3
    :goto_1
    monitor-exit p0

    .line 152
    return-void

    .line 153
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 154
    throw p1
.end method

.method public g(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/a;->f()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_2

    .line 7
    .line 8
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    if-eqz v2, :cond_2

    .line 11
    .line 12
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 13
    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {v0, v2, p1}, Lcom/android/launcher3/folder/Folder;->s1(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 24
    .line 25
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->y(Lcom/android/launcher3/folder/Folder;Landroid/view/MotionEvent;)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    return v1

    .line 32
    :cond_1
    const/4 p0, 0x1

    .line 33
    invoke-virtual {v0, p0}, Lcom/android/launcher3/a;->close(Z)V

    .line 34
    .line 35
    .line 36
    return p0

    .line 37
    :cond_2
    :goto_0
    return v1
.end method

.method public i()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    if-nez p0, :cond_0

    .line 5
    .line 6
    return v0

    .line 7
    :cond_0
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getVisibility()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    return v0
.end method

.method public j(Landroid/view/MotionEvent;)Z
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/a;->f()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    if-nez p0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-virtual {v0, p0, p1}, Lcom/android/launcher3/folder/Folder;->s1(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    :goto_0
    return v1
.end method

.method public k(Lcom/android/launcher3/folder/Folder;II)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "CloudFolder"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/android/launcher3/C2;->Z1(Landroid/content/Context;)Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    const-string p0, "measureFolder launcher is null"

    .line 20
    .line 21
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    :try_start_0
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    iget-boolean v3, v3, Lcom/android/launcher3/h0;->G0:Z

    .line 34
    .line 35
    const v4, 0x7f07035f

    .line 36
    .line 37
    .line 38
    const/high16 v5, 0x40000000    # 2.0f

    .line 39
    .line 40
    if-eqz v3, :cond_2

    .line 41
    .line 42
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    if-eqz v0, :cond_1

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 73
    .line 74
    invoke-static {p2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 75
    .line 76
    .line 77
    move-result p2

    .line 78
    invoke-static {p1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 79
    .line 80
    .line 81
    move-result p1

    .line 82
    invoke-virtual {p0, p2, p1}, Landroid/widget/LinearLayout;->measure(II)V

    .line 83
    .line 84
    .line 85
    return-void

    .line 86
    :catch_0
    move-exception p0

    .line 87
    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-static {p1}, Lx1/O;->F0(Landroid/content/Context;)I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    .line 97
    .line 98
    .line 99
    move-result p1

    .line 100
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 101
    .line 102
    invoke-static {p1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 103
    .line 104
    .line 105
    move-result p1

    .line 106
    invoke-virtual {p0, p1, p3}, Landroid/widget/LinearLayout;->measure(II)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 111
    .line 112
    .line 113
    move-result-object p2

    .line 114
    invoke-virtual {p2}, Lcom/android/launcher3/h0;->T0()Z

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    if-eqz p2, :cond_3

    .line 119
    .line 120
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getResources()Landroid/content/res/Resources;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    invoke-virtual {p1, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 129
    .line 130
    invoke-virtual {v2}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 131
    .line 132
    .line 133
    move-result p2

    .line 134
    invoke-static {p2, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    invoke-static {p1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 139
    .line 140
    .line 141
    move-result p1

    .line 142
    invoke-virtual {p0, p2, p1}, Landroid/widget/LinearLayout;->measure(II)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :cond_3
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 147
    .line 148
    invoke-virtual {p1}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    invoke-static {p1}, Lx1/O;->F0(Landroid/content/Context;)I

    .line 153
    .line 154
    .line 155
    move-result p1

    .line 156
    invoke-static {p1, v5}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    .line 157
    .line 158
    .line 159
    move-result p1

    .line 160
    invoke-virtual {p0, p1, p3}, Landroid/widget/LinearLayout;->measure(II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 161
    .line 162
    .line 163
    return-void

    .line 164
    :goto_0
    const-string p1, "measureFolder error"

    .line 165
    .line 166
    invoke-static {v1, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 170
    .line 171
    .line 172
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/a;->f()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {v0}, Ld1/a;->d(Lcom/android/launcher3/folder/Folder;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    const/16 v2, 0x8

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 25
    .line 26
    .line 27
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 28
    .line 29
    invoke-direct {p0, v0}, Lcom/android/launcher3/cloudfolder/a;->e(Lcom/android/launcher3/folder/Folder;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    invoke-direct {p0, v0}, Lcom/android/launcher3/cloudfolder/a;->d(I)I

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    invoke-virtual {v1, p0}, Lcom/android/launcher3/cloudfolder/RemoteView;->q(I)V

    .line 38
    .line 39
    .line 40
    :cond_1
    :goto_0
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/cloudfolder/RemoteView;->K()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 12
    .line 13
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/a;->a:Landroid/widget/LinearLayout;

    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public n()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/a;->f()Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    const-string v2, "zte.com.market"

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Lcom/android/launcher3/H5;->w0(Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    const-string v2, "CloudFolder"

    .line 27
    .line 28
    if-eqz v1, :cond_1

    .line 29
    .line 30
    const-string p0, "setCloudFolderVisible: healthy use mobile, app store is limited."

    .line 31
    .line 32
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 37
    .line 38
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    if-eqz v1, :cond_2

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Lcom/android/launcher3/q4;->a0()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-nez v3, :cond_2

    .line 53
    .line 54
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->O0:Z

    .line 59
    .line 60
    if-nez v1, :cond_2

    .line 61
    .line 62
    new-instance v1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v3, "folder open  show title:"

    .line 68
    .line 69
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 73
    .line 74
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    const/4 v0, 0x1

    .line 85
    invoke-virtual {p0, v0}, Lcom/android/launcher3/cloudfolder/a;->o(Z)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v3, "folder open not title:"

    .line 95
    .line 96
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object v0, v0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 100
    .line 101
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-static {v2, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 109
    .line 110
    .line 111
    const/4 v0, 0x0

    .line 112
    invoke-virtual {p0, v0}, Lcom/android/launcher3/cloudfolder/a;->o(Z)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method public o(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/a;->f()Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/cloudfolder/a;->q(Lcom/android/launcher3/folder/Folder;)V

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 12
    .line 13
    if-eqz p1, :cond_1

    .line 14
    .line 15
    const/high16 p1, 0x3f800000    # 1.0f

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/cloudfolder/a;->p(FF)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 22
    .line 23
    const/16 p1, 0x8

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public p(FF)V
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "alpha"

    .line 6
    .line 7
    const/4 v1, 0x2

    .line 8
    new-array v1, v1, [F

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    aput p1, v1, v2

    .line 12
    .line 13
    const/4 p1, 0x1

    .line 14
    aput p2, v1, p1

    .line 15
    .line 16
    invoke-static {p0, v0, v1}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    sget p1, LT0/p;->w:I

    .line 21
    .line 22
    int-to-long p1, p1

    .line 23
    invoke-virtual {p0, p1, p2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/animation/ObjectAnimator;->start()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public q(Lcom/android/launcher3/folder/Folder;)V
    .locals 6

    .line 1
    const-string v0, "CloudFolder"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "showNewRecommendView(), folder == null"

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getVisibility()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    const/16 v2, 0x8

    .line 18
    .line 19
    if-ne v1, v2, :cond_3

    .line 20
    .line 21
    invoke-static {p1}, Ld1/a;->d(Lcom/android/launcher3/folder/Folder;)Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-eqz v1, :cond_3

    .line 26
    .line 27
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/a;->e(Lcom/android/launcher3/folder/Folder;)I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/a;->d(I)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/a;->d:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/a;->c()Landroid/os/Bundle;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    const/4 v4, 0x0

    .line 42
    invoke-virtual {v2, v1, v3, v4}, Lcom/android/launcher3/cloudfolder/RemoteView;->I(ILandroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$l;)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    if-eqz v2, :cond_1

    .line 47
    .line 48
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 49
    .line 50
    invoke-virtual {v3}, Landroid/widget/RelativeLayout;->removeAllViews()V

    .line 51
    .line 52
    .line 53
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 54
    .line 55
    invoke-virtual {v3, v2}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 56
    .line 57
    .line 58
    :cond_1
    const/4 v3, 0x0

    .line 59
    const/high16 v5, 0x3f800000    # 1.0f

    .line 60
    .line 61
    invoke-virtual {p0, v3, v5}, Lcom/android/launcher3/cloudfolder/a;->p(FF)V

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 65
    .line 66
    const/4 v5, 0x0

    .line 67
    invoke-virtual {v3, v5}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 68
    .line 69
    .line 70
    new-instance v3, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    const-string v5, "showNewRecommendView(), folderType = "

    .line 76
    .line 77
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string p1, ", id = "

    .line 84
    .line 85
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string p1, ",visibility="

    .line 92
    .line 93
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/a;->c:Lcom/android/launcher3/cloudfolder/RecommendIconPanelContainer;

    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getVisibility()I

    .line 99
    .line 100
    .line 101
    move-result p0

    .line 102
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string p0, ",view="

    .line 106
    .line 107
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    if-eqz v2, :cond_2

    .line 111
    .line 112
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object v4

    .line 120
    :cond_2
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 128
    .line 129
    .line 130
    :cond_3
    return-void
.end method
