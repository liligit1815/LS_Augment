.class public Lcom/android/launcher3/hybridhotseat/a;
.super Ljava/lang/Object;
.source "HotseatEduController.java"


# instance fields
.field private final a:Lcom/android/launcher3/C2;

.field private final b:Lcom/android/launcher3/Hotseat;

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;"
        }
    .end annotation
.end field

.field private d:Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;

.field private e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field

.field private f:Lcom/android/launcher3/util/x0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/C2;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

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
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->f:Lcom/android/launcher3/util/x0;

    .line 13
    .line 14
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 15
    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/hybridhotseat/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/a;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Lcom/android/launcher3/hybridhotseat/a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/a;->f()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/hybridhotseat/a;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/hybridhotseat/a;->h(I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static e()Landroid/content/Intent;
    .locals 2

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.settings.ACTION_CONTENT_SUGGESTIONS_SETTINGS"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/high16 v1, 0x10000000

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    return-object v0
.end method

.method private synthetic f()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/hybridhotseat/a;->e()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic g()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/hybridhotseat/a;->e()Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private synthetic h(I)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 24
    .line 25
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 26
    .line 27
    const/16 p1, -0x67

    .line 28
    .line 29
    if-eq p0, p1, :cond_0

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_0
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method private j()I
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const/4 v4, 0x1

    .line 14
    const/4 v5, -0x1

    .line 15
    if-ge v2, v3, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0, v2}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    invoke-virtual {v0, v3}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    invoke-virtual {v3, v4}, Lcom/android/launcher3/CellLayout;->e0(Z)Z

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v0, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 38
    .line 39
    iget v0, v0, Lcom/android/launcher3/F1;->G0:I

    .line 40
    .line 41
    sub-int/2addr v0, v4

    .line 42
    move v10, v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    move v10, v1

    .line 48
    move v2, v5

    .line 49
    :goto_1
    if-ne v2, v5, :cond_2

    .line 50
    .line 51
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-virtual {v0}, Lz1/k2;->F()I

    .line 62
    .line 63
    .line 64
    move-result v2

    .line 65
    filled-new-array {v2}, [I

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-static {v0}, Lcom/android/launcher3/util/x0;->C([I)Lcom/android/launcher3/util/x0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->f:Lcom/android/launcher3/util/x0;

    .line 74
    .line 75
    :cond_2
    move v8, v2

    .line 76
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 77
    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    iget-object v2, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 87
    .line 88
    invoke-virtual {v2}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget v2, v2, Lcom/android/launcher3/h0;->a2:I

    .line 93
    .line 94
    move v9, v1

    .line 95
    :goto_2
    if-ge v9, v2, :cond_8

    .line 96
    .line 97
    if-nez v0, :cond_3

    .line 98
    .line 99
    move v3, v9

    .line 100
    goto :goto_3

    .line 101
    :cond_3
    move v3, v1

    .line 102
    :goto_3
    if-nez v0, :cond_4

    .line 103
    .line 104
    move v5, v1

    .line 105
    goto :goto_4

    .line 106
    :cond_4
    sub-int v5, v2, v9

    .line 107
    .line 108
    sub-int/2addr v5, v4

    .line 109
    :goto_4
    iget-object v6, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 110
    .line 111
    invoke-virtual {v6, v3, v5}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    if-eqz v3, :cond_7

    .line 116
    .line 117
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    if-nez v5, :cond_5

    .line 122
    .line 123
    goto :goto_5

    .line 124
    :cond_5
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    move-object v6, v3

    .line 129
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 130
    .line 131
    iget v3, v6, Lcom/android/launcher3/model/data/y;->container:I

    .line 132
    .line 133
    const/16 v5, -0x67

    .line 134
    .line 135
    if-ne v3, v5, :cond_6

    .line 136
    .line 137
    goto :goto_5

    .line 138
    :cond_6
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 139
    .line 140
    invoke-virtual {v3}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 141
    .line 142
    .line 143
    move-result-object v5

    .line 144
    const/16 v7, -0x64

    .line 145
    .line 146
    invoke-virtual/range {v5 .. v10}, Lz1/J3;->T(Lcom/android/launcher3/model/data/y;IIII)V

    .line 147
    .line 148
    .line 149
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/a;->e:Ljava/util/ArrayList;

    .line 150
    .line 151
    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    .line 153
    .line 154
    :cond_7
    :goto_5
    add-int/lit8 v9, v9, 0x1

    .line 155
    .line 156
    goto :goto_2

    .line 157
    :cond_8
    return v8
.end method

.method private p(ZLjava/lang/String;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Lcom/android/launcher3/h0;->T0()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    const/4 v2, 0x1

    .line 22
    sub-int/2addr v0, v2

    .line 23
    :goto_0
    const/4 v3, -0x1

    .line 24
    const/4 v4, 0x0

    .line 25
    if-le v0, v3, :cond_4

    .line 26
    .line 27
    if-nez v1, :cond_0

    .line 28
    .line 29
    move v3, v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    move v3, v4

    .line 32
    :goto_1
    if-nez v1, :cond_1

    .line 33
    .line 34
    move v5, v4

    .line 35
    goto :goto_2

    .line 36
    :cond_1
    move v5, v0

    .line 37
    :goto_2
    iget-object v6, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 38
    .line 39
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 40
    .line 41
    .line 42
    move-result-object v6

    .line 43
    invoke-virtual {v6, v3, v5}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    instance-of v5, v3, Lcom/android/launcher3/BubbleTextView;

    .line 48
    .line 49
    if-eqz v5, :cond_3

    .line 50
    .line 51
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    instance-of v5, v5, Lcom/android/launcher3/model/data/I;

    .line 56
    .line 57
    if-eqz v5, :cond_3

    .line 58
    .line 59
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v5

    .line 63
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 64
    .line 65
    iget v5, v5, Lcom/android/launcher3/model/data/y;->container:I

    .line 66
    .line 67
    const/16 v6, -0x65

    .line 68
    .line 69
    if-ne v5, v6, :cond_2

    .line 70
    .line 71
    move v5, v2

    .line 72
    goto :goto_3

    .line 73
    :cond_2
    move v5, v4

    .line 74
    :goto_3
    if-ne v5, p1, :cond_3

    .line 75
    .line 76
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 77
    .line 78
    goto :goto_4

    .line 79
    :cond_3
    add-int/lit8 v0, v0, -0x1

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_4
    const/4 v3, 0x0

    .line 83
    :goto_4
    if-nez v3, :cond_5

    .line 84
    .line 85
    const-string p0, "HotseatEduController"

    .line 86
    .line 87
    const-string p1, "Unable to find suitable view for ArrowTip"

    .line 88
    .line 89
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    .line 91
    .line 92
    return v4

    .line 93
    :cond_5
    invoke-static {v3}, Lcom/android/launcher3/N5;->u(Landroid/view/View;)Landroid/graphics/Rect;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    new-instance v0, Lcom/android/launcher3/views/q;

    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 100
    .line 101
    invoke-direct {v0, p0}, Lcom/android/launcher3/views/q;-><init>(Landroid/content/Context;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 109
    .line 110
    const v1, 0x800005

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, p2, v1, p0, p1}, Lcom/android/launcher3/views/q;->c0(Ljava/lang/String;III)Lcom/android/launcher3/views/q;

    .line 114
    .line 115
    .line 116
    return v2
.end method


# virtual methods
.method d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->g2()Lcom/android/launcher3/D3;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->H0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method i()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-static {v0}, Lq1/t;->c(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Lcom/android/launcher3/hybridhotseat/a;->j()I

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    new-instance v1, Lq1/b;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Lq1/b;-><init>(Lcom/android/launcher3/hybridhotseat/a;)V

    .line 14
    .line 15
    .line 16
    const p0, 0x7f140203

    .line 17
    .line 18
    .line 19
    const v2, 0x7f14020d

    .line 20
    .line 21
    .line 22
    const/4 v3, 0x0

    .line 23
    invoke-static {v0, p0, v2, v3, v1}, Lcom/android/launcher3/views/W;->U(Landroid/content/Context;IILjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method k()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->removeAllViewsInLayout()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->e:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->e:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    add-int/lit8 v1, v1, -0x1

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    iget v0, v0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 29
    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    new-instance v2, Ljava/util/ArrayList;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/android/launcher3/hybridhotseat/a;->e:Ljava/util/ArrayList;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-eqz v4, :cond_1

    .line 51
    .line 52
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    check-cast v4, Lcom/android/launcher3/model/data/y;

    .line 57
    .line 58
    iget v5, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 59
    .line 60
    if-ne v5, v0, :cond_0

    .line 61
    .line 62
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 71
    .line 72
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/a;->f:Lcom/android/launcher3/util/x0;

    .line 73
    .line 74
    invoke-virtual {v0, p0, v2, v1}, Lcom/android/launcher3/C2;->n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-void
.end method

.method l(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/I;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/hybridhotseat/a;->c:Ljava/util/List;

    .line 2
    .line 3
    return-void
.end method

.method m()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->c:Ljava/util/List;

    .line 2
    .line 3
    if-eqz v0, :cond_2

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
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->d:Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0, v1}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->handleClose(Z)V

    .line 18
    .line 19
    .line 20
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 21
    .line 22
    invoke-static {v0}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->q0(Lcom/android/launcher3/C2;)Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iput-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->d:Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->setHotseatEduController(Lcom/android/launcher3/hybridhotseat/a;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->d:Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;

    .line 32
    .line 33
    iget-object p0, p0, Lcom/android/launcher3/hybridhotseat/a;->c:Ljava/util/List;

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Lcom/android/launcher3/hybridhotseat/HotseatEduDialog;->u0(Ljava/util/List;)V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_0
    return-void
.end method

.method n()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    iget v1, v1, Lcom/android/launcher3/h0;->a2:I

    .line 18
    .line 19
    if-ge v0, v1, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    new-instance v1, Lq1/c;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lq1/c;-><init>(Lcom/android/launcher3/hybridhotseat/a;)V

    .line 26
    .line 27
    .line 28
    const p0, 0x7f14020e

    .line 29
    .line 30
    .line 31
    const v2, 0x7f14020d

    .line 32
    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-static {v0, p0, v2, v3, v1}, Lcom/android/launcher3/views/W;->U(Landroid/content/Context;IILjava/lang/Runnable;Ljava/lang/Runnable;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 40
    .line 41
    const v1, 0x7f14020f

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v1, 0x1

    .line 49
    invoke-direct {p0, v1, v0}, Lcom/android/launcher3/hybridhotseat/a;->p(ZLjava/lang/String;)Z

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method o()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->b:Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x0

    .line 18
    invoke-virtual {v1, v2}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    invoke-virtual {v1, v3}, Lcom/android/launcher3/Workspace;->n(I)Lcom/android/launcher3/CellLayout;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-static {v2, v0}, Ljava/util/stream/IntStream;->range(II)Ljava/util/stream/IntStream;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v3, Lq1/a;

    .line 31
    .line 32
    invoke-direct {v3, p0}, Lq1/a;-><init>(Lcom/android/launcher3/hybridhotseat/a;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v0, v3}, Ljava/util/stream/IntStream;->anyMatch(Ljava/util/function/IntPredicate;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-virtual {v1, v2}, Lcom/android/launcher3/CellLayout;->e0(Z)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v0, :cond_0

    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/hybridhotseat/a;->m()V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    const v2, 0x7f14020f

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    const v2, 0x7f140204

    .line 60
    .line 61
    .line 62
    :goto_0
    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/hybridhotseat/a;->p(ZLjava/lang/String;)Z

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    if-eqz v0, :cond_2

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/hybridhotseat/a;->a:Lcom/android/launcher3/C2;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    sget-object v1, Lcom/android/launcher3/logging/StatsLogManager$e;->a0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 83
    .line 84
    invoke-interface {v0, v1}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 85
    .line 86
    .line 87
    :cond_2
    invoke-virtual {p0}, Lcom/android/launcher3/hybridhotseat/a;->d()V

    .line 88
    .line 89
    .line 90
    return-void
.end method
