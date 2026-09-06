.class public final Lcom/android/launcher3/taskbar/P0;
.super Lcom/android/launcher3/popup/P;
.source "PinToTaskbarShortcut.kt"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Landroid/content/Context;",
        ":",
        "Lcom/android/launcher3/views/k;",
        ">",
        "Lcom/android/launcher3/popup/P<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final g:Z

.field private final h:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/model/data/y;Landroid/view/View;ZLandroid/util/SparseArray;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/android/launcher3/model/data/y;",
            "Landroid/view/View;",
            "Z",
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "originalView"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "mPinnedInfoList"

    .line 7
    .line 8
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    if-eqz p4, :cond_0

    .line 12
    .line 13
    const v0, 0x7f080d58

    .line 14
    .line 15
    .line 16
    :goto_0
    move v2, v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const v0, 0x7f080d8e

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :goto_1
    if-eqz p4, :cond_1

    .line 23
    .line 24
    const v0, 0x7f1402ff

    .line 25
    .line 26
    .line 27
    :goto_2
    move v3, v0

    .line 28
    goto :goto_3

    .line 29
    :cond_1
    const v0, 0x7f14046f

    .line 30
    .line 31
    .line 32
    goto :goto_2

    .line 33
    :goto_3
    move-object v4, p1

    .line 34
    check-cast v4, Lcom/android/launcher3/views/k;

    .line 35
    .line 36
    move-object v1, p0

    .line 37
    move-object v5, p2

    .line 38
    move-object v6, p3

    .line 39
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/popup/P;-><init>(IILcom/android/launcher3/views/k;Lcom/android/launcher3/model/data/y;Landroid/view/View;)V

    .line 40
    .line 41
    .line 42
    iput-boolean p4, v1, Lcom/android/launcher3/taskbar/P0;->g:Z

    .line 43
    .line 44
    iput-object p5, v1, Lcom/android/launcher3/taskbar/P0;->h:Landroid/util/SparseArray;

    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 9

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/popup/P;->dismissTaskMenuView()V

    .line 2
    .line 3
    .line 4
    new-instance p1, Lcom/android/launcher3/taskbar/P0$a;

    .line 5
    .line 6
    invoke-direct {p1}, Lcom/android/launcher3/taskbar/P0$a;-><init>()V

    .line 7
    .line 8
    .line 9
    sget-object v0, Lcom/android/launcher3/P2;->g:Lcom/android/launcher3/P2$a;

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const-string v2, "getContext(...)"

    .line 18
    .line 19
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lcom/android/launcher3/P2$a;->b(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 31
    .line 32
    invoke-static {v1}, Lkotlin/jvm/internal/o;->c(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getCellPosMapper()Lc1/c;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/4 v2, 0x1

    .line 40
    invoke-virtual {v0, v2, v1, p1}, Lcom/android/launcher3/D3;->o0(ZLc1/c;Lz1/y0$b;)Lz1/J3;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/P0;->g:Z

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 49
    .line 50
    const-string p1, "item unpinned through long-press menu"

    .line 51
    .line 52
    invoke-virtual {v3, p0, p1}, Lz1/J3;->B(Lcom/android/launcher3/model/data/y;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 57
    .line 58
    instance-of v0, p1, Lcom/android/launcher3/model/data/d;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    check-cast p1, Lcom/android/launcher3/model/data/d;

    .line 63
    .line 64
    iget-object v0, p0, Lcom/android/launcher3/popup/P;->mOriginalView:Landroid/view/View;

    .line 65
    .line 66
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {p1, v0}, Lcom/android/launcher3/model/data/d;->a(Landroid/content/Context;)Lcom/android/launcher3/model/data/I;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    :goto_0
    move-object v4, p1

    .line 75
    goto :goto_1

    .line 76
    :cond_1
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 77
    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->O()Lcom/android/launcher3/model/data/I;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    goto :goto_0

    .line 87
    :goto_1
    iget-object p1, p0, Lcom/android/launcher3/popup/P;->mTarget:Lcom/android/launcher3/views/k;

    .line 88
    .line 89
    invoke-interface {p1}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-string v0, "getDeviceProfile(...)"

    .line 94
    .line 95
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget v0, p1, Lcom/android/launcher3/h0;->a2:I

    .line 99
    .line 100
    const/4 v1, 0x0

    .line 101
    move v5, v1

    .line 102
    :goto_2
    if-ge v5, v0, :cond_3

    .line 103
    .line 104
    iget-object v6, p0, Lcom/android/launcher3/taskbar/P0;->h:Landroid/util/SparseArray;

    .line 105
    .line 106
    invoke-virtual {v6, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    if-nez v6, :cond_2

    .line 111
    .line 112
    goto :goto_3

    .line 113
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_3
    const/4 v5, -0x1

    .line 117
    :goto_3
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_4

    .line 122
    .line 123
    move v7, v1

    .line 124
    goto :goto_4

    .line 125
    :cond_4
    move v7, v5

    .line 126
    :goto_4
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->T0()Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-eqz v0, :cond_5

    .line 131
    .line 132
    iget p1, p1, Lcom/android/launcher3/h0;->a2:I

    .line 133
    .line 134
    add-int/2addr v5, v2

    .line 135
    sub-int v1, p1, v5

    .line 136
    .line 137
    :cond_5
    move v8, v1

    .line 138
    iget-object p0, p0, Lcom/android/launcher3/popup/P;->mItemInfo:Lcom/android/launcher3/model/data/y;

    .line 139
    .line 140
    check-cast p0, Lcom/android/launcher3/model/data/z;

    .line 141
    .line 142
    iget v6, p0, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 143
    .line 144
    const/16 v5, -0x65

    .line 145
    .line 146
    invoke-virtual/range {v3 .. v8}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 147
    .line 148
    .line 149
    :cond_6
    return-void
.end method
