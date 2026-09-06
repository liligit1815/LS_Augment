.class public Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;
.super Lcom/android/launcher3/v;
.source "SecondaryDisplayLauncher.java"

# interfaces
.implements Lz1/y0$b;
.implements Lcom/android/launcher3/dragndrop/j$b;


# instance fields
.field private g:Lcom/android/launcher3/D3;

.field private h:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

.field private i:LJ1/r;

.field private j:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
            ">;"
        }
    .end annotation
.end field

.field private k:Landroid/view/View;

.field private l:Lcom/android/launcher3/popup/n;

.field private m:Z

.field private n:Lz1/G4;

.field private o:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;

.field private final p:[I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/v;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->m:Z

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    new-array v0, v0, [I

    .line 9
    .line 10
    iput-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->p:[I

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic b0(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i0(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c0(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j0(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic d0(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e0(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)Lcom/android/launcher3/allapps/r;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    return-object p0
.end method

.method private g0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Ln1/d;Lcom/android/launcher3/dragndrop/p;)V
    .locals 11

    .line 1
    move-object/from16 v10, p5

    .line 2
    .line 3
    instance-of v1, p1, Lcom/android/launcher3/BubbleTextView;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    move-object v1, p1

    .line 8
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 9
    .line 10
    invoke-virtual {v1}, Lcom/android/launcher3/BubbleTextView;->getIcon()Ls1/o;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Ls1/o;->d()F

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/high16 v1, 0x3f800000    # 1.0f

    .line 22
    .line 23
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->clearFocus()V

    .line 24
    .line 25
    .line 26
    const/4 v2, 0x0

    .line 27
    invoke-virtual {p1, v2}, Landroid/view/View;->setPressed(Z)V

    .line 28
    .line 29
    .line 30
    instance-of v3, p1, Lcom/android/launcher3/BubbleTextView;

    .line 31
    .line 32
    if-eqz v3, :cond_1

    .line 33
    .line 34
    move-object v3, p1

    .line 35
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 36
    .line 37
    invoke-virtual {v3}, Lcom/android/launcher3/BubbleTextView;->M()V

    .line 38
    .line 39
    .line 40
    :cond_1
    instance-of v3, p1, Lcom/android/launcher3/dragndrop/y;

    .line 41
    .line 42
    const/4 v4, 0x0

    .line 43
    if-eqz v3, :cond_2

    .line 44
    .line 45
    check-cast p1, Lcom/android/launcher3/dragndrop/y;

    .line 46
    .line 47
    :goto_1
    move v3, v1

    .line 48
    goto :goto_2

    .line 49
    :cond_2
    move-object p1, v4

    .line 50
    goto :goto_1

    .line 51
    :goto_2
    invoke-virtual {p4}, Ln1/d;->i()Landroid/view/View;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    if-nez v1, :cond_3

    .line 56
    .line 57
    invoke-virtual {p4}, Ln1/d;->f()Landroid/graphics/drawable/Drawable;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    iget-object v5, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->p:[I

    .line 62
    .line 63
    invoke-virtual {p4, v4, v5}, Ln1/d;->m(Landroid/graphics/drawable/Drawable;[I)F

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    :goto_3
    move v9, v0

    .line 68
    goto :goto_4

    .line 69
    :cond_3
    iget-object v5, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->p:[I

    .line 70
    .line 71
    invoke-virtual {p4, v1, v5}, Ln1/d;->n(Landroid/view/View;[I)F

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    goto :goto_3

    .line 76
    :goto_4
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->p:[I

    .line 77
    .line 78
    aget v2, v0, v2

    .line 79
    .line 80
    const/4 v5, 0x1

    .line 81
    aget v0, v0, v5

    .line 82
    .line 83
    new-instance v7, Landroid/graphics/Rect;

    .line 84
    .line 85
    invoke-direct {v7}, Landroid/graphics/Rect;-><init>()V

    .line 86
    .line 87
    .line 88
    if-eqz p1, :cond_4

    .line 89
    .line 90
    invoke-interface {p1, v7}, Lcom/android/launcher3/dragndrop/y;->g(Landroid/graphics/Rect;)V

    .line 91
    .line 92
    .line 93
    iget v5, v7, Landroid/graphics/Rect;->top:I

    .line 94
    .line 95
    add-int/2addr v0, v5

    .line 96
    :cond_4
    iget-object v5, v10, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 97
    .line 98
    if-eqz v5, :cond_5

    .line 99
    .line 100
    invoke-interface {v5}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 101
    .line 102
    .line 103
    move-result-object v5

    .line 104
    iget v5, v5, Landroid/graphics/Point;->x:I

    .line 105
    .line 106
    iget-object v6, v10, Lcom/android/launcher3/dragndrop/p;->d:Lcom/android/launcher3/dragndrop/p$a;

    .line 107
    .line 108
    invoke-interface {v6}, Lcom/android/launcher3/dragndrop/p$a;->d()Landroid/graphics/Point;

    .line 109
    .line 110
    .line 111
    move-result-object v6

    .line 112
    iget v6, v6, Landroid/graphics/Point;->y:I

    .line 113
    .line 114
    if-eqz v5, :cond_5

    .line 115
    .line 116
    if-eqz v6, :cond_5

    .line 117
    .line 118
    add-int/2addr v2, v5

    .line 119
    add-int/2addr v0, v6

    .line 120
    :cond_5
    if-eqz v1, :cond_6

    .line 121
    .line 122
    move v4, v0

    .line 123
    move-object v5, v1

    .line 124
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 125
    .line 126
    mul-float v8, v9, v3

    .line 127
    .line 128
    move-object v6, p3

    .line 129
    move v3, v2

    .line 130
    move-object v2, p1

    .line 131
    move-object v5, p2

    .line 132
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/dragndrop/j;->R(Landroid/view/View;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 133
    .line 134
    .line 135
    return-void

    .line 136
    :cond_6
    move v1, v2

    .line 137
    move-object v2, p1

    .line 138
    move p1, v3

    .line 139
    move v3, v1

    .line 140
    move-object v1, v4

    .line 141
    move v4, v0

    .line 142
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 143
    .line 144
    mul-float v8, v9, p1

    .line 145
    .line 146
    move-object v5, p2

    .line 147
    move-object v6, p3

    .line 148
    move-object/from16 v10, p5

    .line 149
    .line 150
    invoke-virtual/range {v0 .. v10}, Lcom/android/launcher3/dragndrop/j;->Q(Landroid/graphics/drawable/Drawable;Lcom/android/launcher3/dragndrop/y;IILcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Landroid/graphics/Rect;FFLcom/android/launcher3/dragndrop/p;)Lcom/android/launcher3/dragndrop/v;

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method private synthetic i0(Landroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;->i(Landroid/view/View;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method private j0(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    instance-of v1, v0, Lcom/android/launcher3/touch/v$a;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    check-cast v0, Lcom/android/launcher3/touch/v$a;

    .line 17
    .line 18
    invoke-interface {v0, p1}, Lcom/android/launcher3/touch/v$a;->a(Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    instance-of v1, v0, Lcom/android/launcher3/model/data/y;

    .line 23
    .line 24
    if-eqz v1, :cond_4

    .line 25
    .line 26
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 27
    .line 28
    instance-of v1, v0, Lcom/android/launcher3/model/data/z;

    .line 29
    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    move-object v1, v0

    .line 33
    check-cast v1, Lcom/android/launcher3/model/data/z;

    .line 34
    .line 35
    iget v2, v1, Lcom/android/launcher3/model/data/z;->h:I

    .line 36
    .line 37
    and-int/lit16 v2, v2, 0x400

    .line 38
    .line 39
    if-eqz v2, :cond_2

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Lcom/android/launcher3/model/data/z;->w(Landroid/content/Context;)Landroid/content/Intent;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    goto :goto_0

    .line 46
    :cond_2
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/y;->getIntent()Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    :goto_0
    if-eqz v1, :cond_3

    .line 51
    .line 52
    invoke-interface {p0, p1, v1, v0}, Lcom/android/launcher3/views/k;->startActivitySafely(Landroid/view/View;Landroid/content/Intent;Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/util/Y1;

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 57
    .line 58
    const-string p1, "Input must have a valid intent"

    .line 59
    .line 60
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    throw p0

    .line 64
    :cond_4
    :goto_1
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 0

    .line 1
    return-void
.end method

.method public H(Lcom/android/launcher3/BubbleTextView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public K(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Lcom/android/launcher3/util/E;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->l:Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/popup/n;->k(Ljava/util/HashMap;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public O()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public X(Lz1/G4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->n:Lz1/G4;

    .line 2
    .line 3
    return-void
.end method

.method public Y(Ljava/util/HashMap;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public a(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/A;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public c(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public f0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/dragndrop/p;)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    move-object v5, v0

    .line 10
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 11
    .line 12
    new-instance v6, Ln1/d;

    .line 13
    .line 14
    invoke-direct {v6, p1}, Ln1/d;-><init>(Landroid/view/View;)V

    .line 15
    .line 16
    .line 17
    move-object v2, p0

    .line 18
    move-object v3, p1

    .line 19
    move-object v4, p2

    .line 20
    move-object v7, p3

    .line 21
    invoke-direct/range {v2 .. v7}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->g0(Landroid/view/View;Lcom/android/launcher3/m0;Lcom/android/launcher3/model/data/y;Ln1/d;Lcom/android/launcher3/dragndrop/p;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    move-object v3, p1

    .line 26
    new-instance p0, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 29
    .line 30
    .line 31
    const-string p1, "Drag started with a view that has no tag set. This will cause a crash (issue 11627249) down the line. View: "

    .line 32
    .line 33
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, "  tag: "

    .line 40
    .line 41
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 56
    .line 57
    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw p1
.end method

.method public getAllAppsItemLongClickListener()Landroid/view/View$OnLongClickListener;
    .locals 1

    .line 1
    new-instance v0, LJ1/n;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LJ1/n;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getAppsView()Lcom/android/launcher3/allapps/r;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/android/launcher3/allapps/r<",
            "Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDragController()Lcom/android/launcher3/dragndrop/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getItemOnClickListener()Landroid/view/View$OnClickListener;
    .locals 1

    .line 1
    new-instance v0, LJ1/o;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LJ1/o;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public getPopupDataProvider()Lcom/android/launcher3/popup/n;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->l:Lcom/android/launcher3/popup/n;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStringCache()Lz1/G4;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->n:Lz1/G4;

    .line 2
    .line 3
    return-object p0
.end method

.method public h0()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public i([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V
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
    invoke-static {}, Lcom/android/launcher3/util/U1;->c()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {v0, p1, p2, p3}, Lcom/android/launcher3/allapps/D;->x([Lcom/android/launcher3/model/data/d;ILjava/util/Map;)V

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Lcom/android/launcher3/popup/PopupContainerWithArrow;->b0(Landroid/content/Context;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public k0(Z)V
    .locals 8

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    iget-boolean v2, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->m:Z

    .line 4
    .line 5
    if-ne p1, v2, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 9
    .line 10
    invoke-virtual {v2}, Landroid/widget/RelativeLayout;->getWidth()I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    int-to-double v2, v2

    .line 15
    iget-object v4, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 16
    .line 17
    invoke-virtual {v4}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    int-to-double v4, v4

    .line 22
    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->hypot(DD)D

    .line 23
    .line 24
    .line 25
    move-result-wide v2

    .line 26
    double-to-float v2, v2

    .line 27
    invoke-static {p0}, Lcom/android/launcher3/util/F2;->k(Landroid/content/Context;)F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    iget-object v4, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k:Landroid/view/View;

    .line 32
    .line 33
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    int-to-float v4, v4

    .line 38
    const/high16 v5, 0x40000000    # 2.0f

    .line 39
    .line 40
    div-float/2addr v4, v5

    .line 41
    const/4 v5, 0x2

    .line 42
    new-array v5, v5, [F

    .line 43
    .line 44
    aput v4, v5, v1

    .line 45
    .line 46
    aput v4, v5, v0

    .line 47
    .line 48
    iget-object v4, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 49
    .line 50
    iget-object v6, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k:Landroid/view/View;

    .line 51
    .line 52
    invoke-virtual {v4, v6, v5}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantCoordRelativeToSelf(Landroid/view/View;[F)F

    .line 53
    .line 54
    .line 55
    iget-object v4, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 56
    .line 57
    iget-object v6, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 58
    .line 59
    invoke-virtual {v4, v6, v5}, Lcom/android/launcher3/views/BaseDragLayer;->mapCoordInSelfToDescendant(Landroid/view/View;[F)V

    .line 60
    .line 61
    .line 62
    iget-object v4, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 63
    .line 64
    aget v6, v5, v1

    .line 65
    .line 66
    float-to-int v6, v6

    .line 67
    aget v5, v5, v0

    .line 68
    .line 69
    float-to-int v5, v5

    .line 70
    if-eqz p1, :cond_1

    .line 71
    .line 72
    move v7, v3

    .line 73
    goto :goto_0

    .line 74
    :cond_1
    move v7, v2

    .line 75
    :goto_0
    if-eqz p1, :cond_2

    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    move v2, v3

    .line 79
    :goto_1
    invoke-static {v4, v6, v5, v7, v2}, Landroid/view/ViewAnimationUtils;->createCircularReveal(Landroid/view/View;IIFF)Landroid/animation/Animator;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    if-eqz p1, :cond_3

    .line 84
    .line 85
    iput-boolean v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->m:Z

    .line 86
    .line 87
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 88
    .line 89
    invoke-virtual {p1, v1}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k:Landroid/view/View;

    .line 93
    .line 94
    const/4 v0, 0x4

    .line 95
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->o:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;

    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;->c()V

    .line 101
    .line 102
    .line 103
    goto :goto_2

    .line 104
    :cond_3
    iput-boolean v1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->m:Z

    .line 105
    .line 106
    new-instance p1, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher$a;

    .line 107
    .line 108
    invoke-direct {p1, p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher$a;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)V

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, p1}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 112
    .line 113
    .line 114
    :goto_2
    invoke-virtual {v2}, Landroid/animation/Animator;->start()V

    .line 115
    .line 116
    .line 117
    return-void
.end method

.method public onAppsButtonClicked(Landroid/view/View;)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p0, p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k0(Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public onBackPressed()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->finishAutoCancelActionMode()Z

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
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/android/launcher3/dragndrop/j;->G()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-static {p0}, Lcom/android/launcher3/a;->getTopOpenView(Lcom/android/launcher3/views/k;)Lcom/android/launcher3/a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/a;->canHandleBack()Z

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/android/launcher3/a;->onBackInvoked()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    const/4 v0, 0x0

    .line 39
    invoke-virtual {p0, v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k0(Z)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/v;->onCreate(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    invoke-static {p0}, Lcom/android/launcher3/util/m3;->b(Landroid/app/Activity;)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->g:Lcom/android/launcher3/D3;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->u0()V

    .line 26
    .line 27
    .line 28
    new-instance p1, LJ1/r;

    .line 29
    .line 30
    invoke-direct {p1, p0}, LJ1/r;-><init>(Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;)V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 34
    .line 35
    invoke-static {p0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;->a(Landroid/content/Context;)Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->o:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;

    .line 40
    .line 41
    sget-object p1, Lcom/android/launcher3/F1;->L1:Lcom/android/launcher3/util/I;

    .line 42
    .line 43
    invoke-virtual {p1, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/android/launcher3/F1;

    .line 48
    .line 49
    invoke-virtual {p1, p0}, Lcom/android/launcher3/F1;->k0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/android/launcher3/v;->mDeviceProfile:Lcom/android/launcher3/h0;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/android/launcher3/h0;->M()V

    .line 56
    .line 57
    .line 58
    const p1, 0x7f0e01e3

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, p1}, Landroid/app/Activity;->setContentView(I)V

    .line 62
    .line 63
    .line 64
    const p1, 0x7f0b022d

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 72
    .line 73
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->h:Lcom/android/launcher3/secondarydisplay/SecondaryDragLayer;

    .line 74
    .line 75
    const p1, 0x7f0b00e7

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/android/launcher3/allapps/r;

    .line 83
    .line 84
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 85
    .line 86
    const p1, 0x7f0b00b6

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k:Landroid/view/View;

    .line 94
    .line 95
    invoke-static {}, LG2/c;->h()Z

    .line 96
    .line 97
    .line 98
    move-result p1

    .line 99
    if-eqz p1, :cond_0

    .line 100
    .line 101
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k:Landroid/view/View;

    .line 102
    .line 103
    const/4 v0, 0x4

    .line 104
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    .line 105
    .line 106
    .line 107
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 108
    .line 109
    invoke-virtual {p1, p0}, Lcom/android/launcher3/dragndrop/j;->g(Lcom/android/launcher3/dragndrop/j$b;)V

    .line 110
    .line 111
    .line 112
    new-instance p1, Lcom/android/launcher3/popup/n;

    .line 113
    .line 114
    invoke-direct {p1, p0}, Lcom/android/launcher3/popup/n;-><init>(Lcom/android/launcher3/views/k;)V

    .line 115
    .line 116
    .line 117
    iput-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->l:Lcom/android/launcher3/popup/n;

    .line 118
    .line 119
    iget-object p1, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->g:Lcom/android/launcher3/D3;

    .line 120
    .line 121
    invoke-virtual {p1, p0}, Lcom/android/launcher3/D3;->P(Lz1/y0$b;)Z

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onDestroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->g:Lcom/android/launcher3/D3;

    .line 5
    .line 6
    invoke-virtual {v0, p0}, Lcom/android/launcher3/D3;->O0(Lz1/y0$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/app/Activity;->onNewIntent(Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    const-string v0, "android.intent.action.MAIN"

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    const/4 v0, 0x0

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    const-class v1, Landroid/view/inputmethod/InputMethodManager;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Landroid/app/Activity;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    invoke-virtual {v1, p1, v0}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 46
    .line 47
    .line 48
    :cond_0
    invoke-virtual {p0, v0}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->k0(Z)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method protected onPause()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/v;->onPause()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->i:LJ1/r;

    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->l()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public r(Lcom/android/launcher3/model/data/d;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->j:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0, p1}, Lcom/android/launcher3/allapps/D;->D(Lcom/android/launcher3/model/data/d;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public t(Ljava/util/List;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    return-void
.end method

.method public z(Lz1/y0$c;)V
    .locals 2

    .line 1
    iget v0, p1, Lz1/y0$c;->a:I

    .line 2
    .line 3
    const/16 v1, -0x66

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayLauncher;->o:Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lcom/android/launcher3/secondarydisplay/SecondaryDisplayPredictions;->b(Lz1/y0$c;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method
