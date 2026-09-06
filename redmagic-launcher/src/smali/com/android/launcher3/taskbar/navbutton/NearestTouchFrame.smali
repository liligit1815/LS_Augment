.class public Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;
.super Landroid/widget/FrameLayout;
.source "NearestTouchFrame.java"


# instance fields
.field private final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private final i:Z

.field private final j:[I

.field private final k:[I

.field private l:Z

.field private m:Landroid/view/View;

.field private final n:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/view/View;",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation
.end field

.field private final o:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/content/res/Configuration;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Landroid/content/res/Configuration;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g:Ljava/util/List;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->h:Ljava/util/List;

    const/4 p1, 0x2

    .line 5
    new-array p2, p1, [I

    iput-object p2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->j:[I

    .line 6
    new-array p1, p1, [I

    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->k:[I

    .line 7
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 8
    new-instance p1, Lcom/android/launcher3/taskbar/navbutton/f;

    invoke-direct {p1, p0}, Lcom/android/launcher3/taskbar/navbutton/f;-><init>(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;)V

    iput-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->o:Ljava/util/Comparator;

    .line 9
    iget p1, p3, Landroid/content/res/Configuration;->smallestScreenWidthDp:I

    const/16 p2, 0x258

    if-ge p1, p2, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->i:Z

    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/view/View;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->h(Landroid/view/View;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;Landroid/view/View;Landroid/view/View;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->i(Landroid/view/View;Landroid/view/View;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic c(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;IILandroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->j(IILandroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private d(Landroid/view/ViewGroup;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v2}, Landroid/view/View;->isClickable()Z

    .line 13
    .line 14
    .line 15
    move-result v3

    .line 16
    if-eqz v3, :cond_0

    .line 17
    .line 18
    iget-object v3, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :cond_0
    instance-of v3, v2, Landroid/view/ViewGroup;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    check-cast v2, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-direct {p0, v2}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->d(Landroid/view/ViewGroup;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    return-void
.end method

.method private e()V
    .locals 10

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_9

    .line 6
    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto/16 :goto_7

    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g:Ljava/util/List;

    .line 16
    .line 17
    iget-object v1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->o:Ljava/util/Comparator;

    .line 18
    .line 19
    invoke-interface {v0, v1}, Ljava/util/List;->sort(Ljava/util/Comparator;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g:Ljava/util/List;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    new-instance v1, Lcom/android/launcher3/taskbar/navbutton/d;

    .line 29
    .line 30
    invoke-direct {v1}, Lcom/android/launcher3/taskbar/navbutton/d;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-object v1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->h:Ljava/util/List;

    .line 38
    .line 39
    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    new-instance v2, Lcom/android/launcher3/taskbar/navbutton/e;

    .line 43
    .line 44
    invoke-direct {v2, v1}, Lcom/android/launcher3/taskbar/navbutton/e;-><init>(Ljava/util/List;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->forEachOrdered(Ljava/util/function/Consumer;)V

    .line 48
    .line 49
    .line 50
    const/4 v0, 0x0

    .line 51
    move v1, v0

    .line 52
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->h:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-ge v1, v2, :cond_9

    .line 59
    .line 60
    iget-object v2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->h:Ljava/util/List;

    .line 61
    .line 62
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    check-cast v2, Landroid/view/View;

    .line 67
    .line 68
    invoke-virtual {v2}, Landroid/view/View;->isAttachedToWindow()Z

    .line 69
    .line 70
    .line 71
    move-result v3

    .line 72
    if-nez v3, :cond_1

    .line 73
    .line 74
    goto/16 :goto_6

    .line 75
    .line 76
    :cond_1
    invoke-direct {p0, v2}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g(Landroid/view/View;)Landroid/graphics/Rect;

    .line 77
    .line 78
    .line 79
    move-result-object v3

    .line 80
    if-nez v1, :cond_3

    .line 81
    .line 82
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->l:Z

    .line 83
    .line 84
    if-eqz v4, :cond_2

    .line 85
    .line 86
    iput v0, v3, Landroid/graphics/Rect;->top:I

    .line 87
    .line 88
    goto :goto_1

    .line 89
    :cond_2
    iput v0, v3, Landroid/graphics/Rect;->left:I

    .line 90
    .line 91
    :goto_1
    iget-object v4, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 92
    .line 93
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    goto :goto_6

    .line 97
    :cond_3
    iget-object v4, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->h:Ljava/util/List;

    .line 98
    .line 99
    add-int/lit8 v5, v1, -0x1

    .line 100
    .line 101
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    check-cast v4, Landroid/view/View;

    .line 106
    .line 107
    iget-object v5, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 108
    .line 109
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v4

    .line 113
    check-cast v4, Landroid/graphics/Rect;

    .line 114
    .line 115
    iget-boolean v5, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->l:Z

    .line 116
    .line 117
    const/4 v6, 0x1

    .line 118
    if-eqz v5, :cond_5

    .line 119
    .line 120
    iget v5, v3, Landroid/graphics/Rect;->top:I

    .line 121
    .line 122
    iget v7, v4, Landroid/graphics/Rect;->bottom:I

    .line 123
    .line 124
    sub-int v8, v5, v7

    .line 125
    .line 126
    div-int/lit8 v9, v8, 0x2

    .line 127
    .line 128
    sub-int/2addr v5, v9

    .line 129
    iput v5, v3, Landroid/graphics/Rect;->top:I

    .line 130
    .line 131
    rem-int/lit8 v8, v8, 0x2

    .line 132
    .line 133
    if-nez v8, :cond_4

    .line 134
    .line 135
    move v5, v6

    .line 136
    goto :goto_2

    .line 137
    :cond_4
    move v5, v0

    .line 138
    :goto_2
    sub-int/2addr v9, v5

    .line 139
    add-int/2addr v7, v9

    .line 140
    iput v7, v4, Landroid/graphics/Rect;->bottom:I

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_5
    iget v5, v3, Landroid/graphics/Rect;->left:I

    .line 144
    .line 145
    iget v7, v4, Landroid/graphics/Rect;->right:I

    .line 146
    .line 147
    sub-int v8, v5, v7

    .line 148
    .line 149
    div-int/lit8 v9, v8, 0x2

    .line 150
    .line 151
    sub-int/2addr v5, v9

    .line 152
    iput v5, v3, Landroid/graphics/Rect;->left:I

    .line 153
    .line 154
    rem-int/lit8 v8, v8, 0x2

    .line 155
    .line 156
    if-nez v8, :cond_6

    .line 157
    .line 158
    move v5, v6

    .line 159
    goto :goto_3

    .line 160
    :cond_6
    move v5, v0

    .line 161
    :goto_3
    sub-int/2addr v9, v5

    .line 162
    add-int/2addr v7, v9

    .line 163
    iput v7, v4, Landroid/graphics/Rect;->right:I

    .line 164
    .line 165
    :goto_4
    iget-object v4, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g:Ljava/util/List;

    .line 166
    .line 167
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 168
    .line 169
    .line 170
    move-result v4

    .line 171
    sub-int/2addr v4, v6

    .line 172
    if-ne v1, v4, :cond_8

    .line 173
    .line 174
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->l:Z

    .line 175
    .line 176
    if-eqz v4, :cond_7

    .line 177
    .line 178
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    iput v4, v3, Landroid/graphics/Rect;->bottom:I

    .line 183
    .line 184
    goto :goto_5

    .line 185
    :cond_7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 186
    .line 187
    .line 188
    move-result v4

    .line 189
    iput v4, v3, Landroid/graphics/Rect;->right:I

    .line 190
    .line 191
    :cond_8
    :goto_5
    iget-object v4, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 192
    .line 193
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    :goto_6
    add-int/lit8 v1, v1, 0x1

    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :cond_9
    :goto_7
    return-void
.end method

.method private g(Landroid/view/View;)Landroid/graphics/Rect;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->j:[I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationInWindow([I)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->j:[I

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v2, v0, v1

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->k:[I

    .line 12
    .line 13
    aget v1, p0, v1

    .line 14
    .line 15
    sub-int/2addr v2, v1

    .line 16
    const/4 v1, 0x1

    .line 17
    aget v0, v0, v1

    .line 18
    .line 19
    aget p0, p0, v1

    .line 20
    .line 21
    sub-int/2addr v0, p0

    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    add-int/2addr p0, v2

    .line 27
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    add-int/2addr p1, v0

    .line 32
    new-instance v1, Landroid/graphics/Rect;

    .line 33
    .line 34
    invoke-direct {v1, v2, v0, p0, p1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 35
    .line 36
    .line 37
    return-object v1
.end method

.method private synthetic h(Landroid/view/View;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "="

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method

.method private synthetic i(Landroid/view/View;Landroid/view/View;)I
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->l:Z

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->j:[I

    .line 4
    .line 5
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->j:[I

    .line 9
    .line 10
    aget v1, p1, v0

    .line 11
    .line 12
    iget-object v2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->k:[I

    .line 13
    .line 14
    aget v2, v2, v0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    invoke-virtual {p2, p1}, Landroid/view/View;->getLocationInWindow([I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->j:[I

    .line 21
    .line 22
    aget p1, p1, v0

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->k:[I

    .line 25
    .line 26
    aget p0, p0, v0

    .line 27
    .line 28
    sub-int/2addr p1, p0

    .line 29
    sub-int/2addr v1, p1

    .line 30
    return v1
.end method

.method private synthetic j(IILandroid/view/View;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {p0, p3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/graphics/Rect;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Landroid/graphics/Rect;->contains(II)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method


# virtual methods
.method public f(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 3

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
    const-string v1, "NearestTouchFrame:"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->k:[I

    .line 22
    .line 23
    invoke-static {v0}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "%s\tmWindowOffset=%s"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->l:Z

    .line 41
    .line 42
    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    const-string v1, "%s\tmIsVertical=%s"

    .line 51
    .line 52
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->m:Landroid/view/View;

    .line 60
    .line 61
    filled-new-array {p1, v0}, [Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    const-string v1, "%s\tmTouchingChild=%s"

    .line 66
    .line 67
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 75
    .line 76
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-interface {v0}, Ljava/util/Set;->stream()Ljava/util/stream/Stream;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    new-instance v1, Lcom/android/launcher3/taskbar/navbutton/h;

    .line 85
    .line 86
    invoke-direct {v1, p0}, Lcom/android/launcher3/taskbar/navbutton/h;-><init>(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;)V

    .line 87
    .line 88
    .line 89
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const-string v0, "{"

    .line 94
    .line 95
    const-string v1, "}"

    .line 96
    .line 97
    const-string v2, ", "

    .line 98
    .line 99
    invoke-static {v2, v0, v1}, Ljava/util/stream/Collectors;->joining(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/util/stream/Collector;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    const-string p1, "%s\tmTouchableRegions=%s"

    .line 112
    .line 113
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p2, p0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->h:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->n:Ljava/util/Map;

    .line 15
    .line 16
    invoke-interface {p1}, Ljava/util/Map;->clear()V

    .line 17
    .line 18
    .line 19
    invoke-direct {p0, p0}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->d(Landroid/view/ViewGroup;)V

    .line 20
    .line 21
    .line 22
    iget-object p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->k:[I

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getLocationInWindow([I)V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->e()V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->i:Z

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    float-to-int v0, v0

    .line 10
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    float-to-int v1, v1

    .line 15
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-nez v2, :cond_0

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->g:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    new-instance v3, Lcom/android/launcher3/taskbar/navbutton/d;

    .line 28
    .line 29
    invoke-direct {v3}, Lcom/android/launcher3/taskbar/navbutton/d;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Lcom/android/launcher3/taskbar/navbutton/g;

    .line 37
    .line 38
    invoke-direct {v3, p0, v0, v1}, Lcom/android/launcher3/taskbar/navbutton/g;-><init>(Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;II)V

    .line 39
    .line 40
    .line 41
    invoke-interface {v2, v3}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    invoke-interface {v2}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    const/4 v3, 0x0

    .line 50
    invoke-virtual {v2, v3}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    check-cast v2, Landroid/view/View;

    .line 55
    .line 56
    iput-object v2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->m:Landroid/view/View;

    .line 57
    .line 58
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->m:Landroid/view/View;

    .line 59
    .line 60
    if-eqz v2, :cond_2

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    div-int/lit8 v2, v2, 0x2

    .line 67
    .line 68
    sub-int/2addr v2, v0

    .line 69
    int-to-float v0, v2

    .line 70
    iget-object v2, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->m:Landroid/view/View;

    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    div-int/lit8 v2, v2, 0x2

    .line 77
    .line 78
    sub-int/2addr v2, v1

    .line 79
    int-to-float v1, v2

    .line 80
    invoke-virtual {p1, v0, v1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->m:Landroid/view/View;

    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    if-nez v0, :cond_1

    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->m:Landroid/view/View;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-eqz v0, :cond_1

    .line 98
    .line 99
    iget-object p0, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->m:Landroid/view/View;

    .line 100
    .line 101
    invoke-virtual {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    if-eqz p0, :cond_1

    .line 106
    .line 107
    const/4 p0, 0x1

    .line 108
    return p0

    .line 109
    :cond_1
    const/4 p0, 0x0

    .line 110
    return p0

    .line 111
    :cond_2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 112
    .line 113
    .line 114
    move-result p0

    .line 115
    return p0
.end method

.method setIsVertical(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/navbutton/NearestTouchFrame;->l:Z

    .line 2
    .line 3
    return-void
.end method
