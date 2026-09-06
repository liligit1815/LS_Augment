.class public Lcom/android/launcher3/widget/U;
.super Landroid/appwidget/AppWidgetProviderInfo;
.source "LauncherAppWidgetProviderInfo.java"

# interfaces
.implements Lt1/h;


# instance fields
.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field protected m:Z

.field private n:Landroid/content/pm/PackageManager;

.field public o:I

.field public p:I

.field private q:Z

.field private r:Z

.field public s:Z

.field public t:Z

.field public u:Z

.field public v:Ljava/lang/String;

.field private w:Z


# direct methods
.method protected constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/appwidget/AppWidgetProviderInfo;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/android/launcher3/widget/U;->q:Z

    .line 3
    iput-boolean v0, p0, Lcom/android/launcher3/widget/U;->r:Z

    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/widget/U;->s:Z

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/widget/U;->t:Z

    .line 6
    iput-boolean v0, p0, Lcom/android/launcher3/widget/U;->u:Z

    .line 7
    const-string v1, ""

    iput-object v1, p0, Lcom/android/launcher3/widget/U;->v:Ljava/lang/String;

    .line 8
    iput-boolean v0, p0, Lcom/android/launcher3/widget/U;->w:Z

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 9
    invoke-direct {p0, p1}, Landroid/appwidget/AppWidgetProviderInfo;-><init>(Landroid/os/Parcel;)V

    const/4 p1, 0x0

    .line 10
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->q:Z

    .line 11
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->r:Z

    .line 12
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->s:Z

    .line 13
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->t:Z

    .line 14
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->u:Z

    .line 15
    const-string v0, ""

    iput-object v0, p0, Lcom/android/launcher3/widget/U;->v:Ljava/lang/String;

    .line 16
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->w:Z

    return-void
.end method

.method public static j(Landroid/content/Context;Landroid/appwidget/AppWidgetProviderInfo;)Lcom/android/launcher3/widget/U;
    .locals 2

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/U;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/widget/U;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-virtual {p1, v0, v1}, Landroid/appwidget/AppWidgetProviderInfo;->writeToParcel(Landroid/os/Parcel;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->setDataPosition(I)V

    .line 17
    .line 18
    .line 19
    new-instance p1, Lcom/android/launcher3/widget/U;

    .line 20
    .line 21
    invoke-direct {p1, v0}, Lcom/android/launcher3/widget/U;-><init>(Landroid/os/Parcel;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/os/Parcel;->recycle()V

    .line 25
    .line 26
    .line 27
    :goto_0
    invoke-virtual {p1, p0}, Lcom/android/launcher3/widget/U;->w(Landroid/content/Context;)V

    .line 28
    .line 29
    .line 30
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/widget/U;->v(Landroid/content/Context;Lcom/android/launcher3/F1;)V

    .line 35
    .line 36
    .line 37
    return-object p1
.end method

.method private q(IIIF)I
    .locals 0

    .line 1
    add-int/2addr p2, p1

    .line 2
    add-int/2addr p2, p3

    .line 3
    int-to-float p0, p2

    .line 4
    int-to-float p1, p3

    .line 5
    add-float/2addr p4, p1

    .line 6
    div-float/2addr p0, p4

    .line 7
    float-to-double p0, p0

    .line 8
    invoke-static {p0, p1}, Ljava/lang/Math;->ceil(D)D

    .line 9
    .line 10
    .line 11
    move-result-wide p0

    .line 12
    double-to-int p0, p0

    .line 13
    const/4 p1, 0x1

    .line 14
    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private r(Landroid/graphics/Rect;IIF)I
    .locals 1

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->left:I

    .line 2
    .line 3
    iget p1, p1, Landroid/graphics/Rect;->right:I

    .line 4
    .line 5
    add-int/2addr v0, p1

    .line 6
    invoke-direct {p0, v0, p2, p3, p4}, Lcom/android/launcher3/widget/U;->q(IIIF)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method private t(Landroid/graphics/Rect;IIF)I
    .locals 1

    .line 1
    iget v0, p1, Landroid/graphics/Rect;->top:I

    .line 2
    .line 3
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 4
    .line 5
    add-int/2addr v0, p1

    .line 6
    invoke-direct {p0, v0, p2, p3, p4}, Lcom/android/launcher3/widget/U;->q(IIIF)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method


# virtual methods
.method public A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/U;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public B()Z
    .locals 1

    .line 1
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "#custom-widget-"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public C()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/U;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method public D()Z
    .locals 1

    .line 1
    iget-object v0, p0, Landroid/appwidget/AppWidgetProviderInfo;->configure:Landroid/content/ComponentName;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->u()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    const/4 v0, 0x1

    .line 10
    and-int/2addr p0, v0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    return v0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method protected E(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->w:Z

    .line 2
    .line 3
    return-void
.end method

.method protected F(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->q:Z

    .line 2
    .line 3
    return-void
.end method

.method public a()Landroid/content/pm/ApplicationInfo;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetProviderInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Landroid/content/pm/ActivityInfo;->applicationInfo:Landroid/content/pm/ApplicationInfo;

    .line 6
    .line 7
    return-object p0
.end method

.method public clone()Landroid/appwidget/AppWidgetProviderInfo;
    .locals 1

    .line 2
    instance-of v0, p0, Lk2/b;

    if-eqz v0, :cond_0

    return-object p0

    .line 3
    :cond_0
    invoke-super {p0}, Landroid/appwidget/AppWidgetProviderInfo;->clone()Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->clone()Landroid/appwidget/AppWidgetProviderInfo;

    move-result-object p0

    return-object p0
.end method

.method public final e()Landroid/os/UserHandle;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetProviderInfo;->getProfile()Landroid/os/UserHandle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final g()Landroid/content/ComponentName;
    .locals 0

    .line 1
    iget-object p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLabel()Ljava/lang/CharSequence;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/U;->n:Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    invoke-super {p0, v0}, Landroid/appwidget/AppWidgetProviderInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public h(Lt1/f;)Landroid/graphics/drawable/Drawable;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetProviderInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1, p0}, Lt1/f;->t(Landroid/content/pm/ActivityInfo;)Landroid/graphics/drawable/Drawable;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public l()Landroid/graphics/Point;
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Point;

    .line 2
    .line 3
    iget v1, p0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 4
    .line 5
    and-int/lit8 v2, v1, 0x1

    .line 6
    .line 7
    const/4 v3, -0x1

    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    iget v2, p0, Lcom/android/launcher3/widget/U;->i:I

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    move v2, v3

    .line 14
    :goto_0
    and-int/lit8 v1, v1, 0x2

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    iget v3, p0, Lcom/android/launcher3/widget/U;->j:I

    .line 19
    .line 20
    :cond_1
    invoke-direct {v0, v2, v3}, Landroid/graphics/Point;-><init>(II)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method public u()I
    .locals 0

    .line 1
    iget p0, p0, Landroid/appwidget/AppWidgetProviderInfo;->widgetFeatures:I

    .line 2
    .line 3
    return p0
.end method

.method public v(Landroid/content/Context;Lcom/android/launcher3/F1;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iput-object v3, v0, Lcom/android/launcher3/widget/U;->n:Landroid/content/pm/PackageManager;

    .line 16
    .line 17
    iget v3, v2, Lcom/android/launcher3/F1;->H0:I

    .line 18
    .line 19
    iget v4, v2, Lcom/android/launcher3/F1;->G0:I

    .line 20
    .line 21
    new-instance v5, Landroid/graphics/Rect;

    .line 22
    .line 23
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v6, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 27
    .line 28
    invoke-static {v1, v6, v5}, Landroid/appwidget/AppWidgetHostView;->getDefaultPaddingForWidget(Landroid/content/Context;Landroid/content/ComponentName;Landroid/graphics/Rect;)Landroid/graphics/Rect;

    .line 29
    .line 30
    .line 31
    iget-boolean v6, v0, Lcom/android/launcher3/widget/U;->t:Z

    .line 32
    .line 33
    if-eqz v6, :cond_0

    .line 34
    .line 35
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual {v6}, Lcom/android/launcher3/resource/B;->s()Z

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-eqz v6, :cond_0

    .line 44
    .line 45
    invoke-virtual {v2, v1}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    iget v7, v6, Lcom/android/launcher3/X3;->m0:I

    .line 50
    .line 51
    iget v8, v6, Lcom/android/launcher3/X3;->n0:I

    .line 52
    .line 53
    iget v6, v6, Lcom/android/launcher3/X3;->o0:I

    .line 54
    .line 55
    invoke-virtual {v5, v7, v8, v7, v6}, Landroid/graphics/Rect;->set(IIII)V

    .line 56
    .line 57
    .line 58
    :cond_0
    new-instance v6, Landroid/graphics/Point;

    .line 59
    .line 60
    invoke-direct {v6}, Landroid/graphics/Point;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v7, v2, Lcom/android/launcher3/F1;->I1:Ljava/util/List;

    .line 64
    .line 65
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v7

    .line 69
    const/4 v9, 0x0

    .line 70
    const/4 v10, 0x0

    .line 71
    const/4 v11, 0x0

    .line 72
    const/4 v12, 0x0

    .line 73
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v13

    .line 77
    if-eqz v13, :cond_b

    .line 78
    .line 79
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v13

    .line 83
    check-cast v13, Lcom/android/launcher3/h0;

    .line 84
    .line 85
    iget-boolean v14, v13, Lcom/android/launcher3/h0;->N0:Z

    .line 86
    .line 87
    if-eqz v14, :cond_1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->r0()Z

    .line 91
    .line 92
    .line 93
    move-result v14

    .line 94
    if-eqz v14, :cond_2

    .line 95
    .line 96
    iget-object v14, v13, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 97
    .line 98
    iget v15, v14, Lcom/android/launcher3/F1;->P0:I

    .line 99
    .line 100
    if-nez v15, :cond_2

    .line 101
    .line 102
    iget-boolean v14, v14, Lcom/android/launcher3/F1;->C1:Z

    .line 103
    .line 104
    iget-boolean v15, v13, Lcom/android/launcher3/h0;->N0:Z

    .line 105
    .line 106
    if-eq v14, v15, :cond_2

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :cond_2
    invoke-virtual {v13, v6}, Lcom/android/launcher3/h0;->l0(Landroid/graphics/Point;)Landroid/graphics/Point;

    .line 110
    .line 111
    .line 112
    iget v14, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 113
    .line 114
    iget-object v15, v13, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 115
    .line 116
    iget v15, v15, Landroid/graphics/Point;->x:I

    .line 117
    .line 118
    iget v8, v6, Landroid/graphics/Point;->x:I

    .line 119
    .line 120
    int-to-float v8, v8

    .line 121
    invoke-direct {v0, v5, v14, v15, v8}, Lcom/android/launcher3/widget/U;->r(Landroid/graphics/Rect;IIF)I

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    invoke-static {v9, v8}, Ljava/lang/Math;->max(II)I

    .line 126
    .line 127
    .line 128
    move-result v8

    .line 129
    iget v9, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 130
    .line 131
    iget-object v14, v13, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 132
    .line 133
    iget v14, v14, Landroid/graphics/Point;->y:I

    .line 134
    .line 135
    iget v15, v6, Landroid/graphics/Point;->y:I

    .line 136
    .line 137
    int-to-float v15, v15

    .line 138
    invoke-direct {v0, v5, v9, v14, v15}, Lcom/android/launcher3/widget/U;->t(Landroid/graphics/Rect;IIF)I

    .line 139
    .line 140
    .line 141
    move-result v9

    .line 142
    invoke-static {v10, v9}, Ljava/lang/Math;->max(II)I

    .line 143
    .line 144
    .line 145
    move-result v9

    .line 146
    iget v10, v0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 147
    .line 148
    if-lez v10, :cond_3

    .line 149
    .line 150
    iget-object v14, v13, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 151
    .line 152
    iget v14, v14, Landroid/graphics/Point;->x:I

    .line 153
    .line 154
    iget v15, v6, Landroid/graphics/Point;->x:I

    .line 155
    .line 156
    int-to-float v15, v15

    .line 157
    invoke-direct {v0, v5, v10, v14, v15}, Lcom/android/launcher3/widget/U;->r(Landroid/graphics/Rect;IIF)I

    .line 158
    .line 159
    .line 160
    move-result v10

    .line 161
    invoke-static {v3, v10}, Ljava/lang/Math;->min(II)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    :cond_3
    iget v10, v0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 166
    .line 167
    if-lez v10, :cond_4

    .line 168
    .line 169
    iget-object v14, v13, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 170
    .line 171
    iget v14, v14, Landroid/graphics/Point;->y:I

    .line 172
    .line 173
    iget v15, v6, Landroid/graphics/Point;->y:I

    .line 174
    .line 175
    int-to-float v15, v15

    .line 176
    invoke-direct {v0, v5, v10, v14, v15}, Lcom/android/launcher3/widget/U;->t(Landroid/graphics/Rect;IIF)I

    .line 177
    .line 178
    .line 179
    move-result v10

    .line 180
    invoke-static {v4, v10}, Ljava/lang/Math;->min(II)I

    .line 181
    .line 182
    .line 183
    move-result v4

    .line 184
    :cond_4
    iget v10, v0, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 185
    .line 186
    iget-object v14, v13, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 187
    .line 188
    iget v14, v14, Landroid/graphics/Point;->x:I

    .line 189
    .line 190
    iget v15, v6, Landroid/graphics/Point;->x:I

    .line 191
    .line 192
    int-to-float v15, v15

    .line 193
    invoke-direct {v0, v5, v10, v14, v15}, Lcom/android/launcher3/widget/U;->r(Landroid/graphics/Rect;IIF)I

    .line 194
    .line 195
    .line 196
    move-result v10

    .line 197
    invoke-static {v11, v10}, Ljava/lang/Math;->max(II)I

    .line 198
    .line 199
    .line 200
    move-result v10

    .line 201
    iget v11, v0, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 202
    .line 203
    iget-object v14, v13, Lcom/android/launcher3/h0;->p1:Landroid/graphics/Point;

    .line 204
    .line 205
    iget v14, v14, Landroid/graphics/Point;->y:I

    .line 206
    .line 207
    iget v15, v6, Landroid/graphics/Point;->y:I

    .line 208
    .line 209
    int-to-float v15, v15

    .line 210
    invoke-direct {v0, v5, v11, v14, v15}, Lcom/android/launcher3/widget/U;->t(Landroid/graphics/Rect;IIF)I

    .line 211
    .line 212
    .line 213
    move-result v11

    .line 214
    invoke-static {v12, v11}, Ljava/lang/Math;->max(II)I

    .line 215
    .line 216
    .line 217
    move-result v11

    .line 218
    iget v12, v2, Lcom/android/launcher3/F1;->H0:I

    .line 219
    .line 220
    if-le v10, v12, :cond_5

    .line 221
    .line 222
    new-instance v10, Ljava/lang/StringBuilder;

    .line 223
    .line 224
    iget v10, v2, Lcom/android/launcher3/F1;->H0:I

    .line 225
    .line 226
    :cond_5
    iget v12, v2, Lcom/android/launcher3/F1;->H0:I

    .line 227
    .line 228
    if-le v8, v12, :cond_6

    .line 229
    .line 230
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 231
    .line 232
    iget v13, v13, Lcom/android/launcher3/h0;->T0:I

    .line 233
    .line 234
    if-gt v12, v13, :cond_6

    .line 235
    .line 236
    new-instance v8, Ljava/lang/StringBuilder;

    .line 237
    .line 238
    iget v8, v2, Lcom/android/launcher3/F1;->H0:I

    .line 239
    .line 240
    :cond_6
    sget-boolean v12, Lcom/android/launcher3/N5;->e:Z

    .line 241
    .line 242
    if-eqz v12, :cond_a

    .line 243
    .line 244
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeWidth:I

    .line 245
    .line 246
    if-nez v12, :cond_8

    .line 247
    .line 248
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->minWidth:I

    .line 249
    .line 250
    if-nez v12, :cond_8

    .line 251
    .line 252
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeWidth:I

    .line 253
    .line 254
    if-nez v12, :cond_8

    .line 255
    .line 256
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellWidth:I

    .line 257
    .line 258
    if-eqz v12, :cond_8

    .line 259
    .line 260
    new-instance v3, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    iget v3, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellWidth:I

    .line 263
    .line 264
    iget v8, v2, Lcom/android/launcher3/F1;->H0:I

    .line 265
    .line 266
    if-le v3, v8, :cond_7

    .line 267
    .line 268
    iput v8, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellWidth:I

    .line 269
    .line 270
    :cond_7
    iget v3, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellWidth:I

    .line 271
    .line 272
    move v8, v3

    .line 273
    move v10, v8

    .line 274
    :cond_8
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->minResizeHeight:I

    .line 275
    .line 276
    if-nez v12, :cond_a

    .line 277
    .line 278
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->minHeight:I

    .line 279
    .line 280
    if-nez v12, :cond_a

    .line 281
    .line 282
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->maxResizeHeight:I

    .line 283
    .line 284
    if-nez v12, :cond_a

    .line 285
    .line 286
    iget v12, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellHeight:I

    .line 287
    .line 288
    if-eqz v12, :cond_a

    .line 289
    .line 290
    new-instance v4, Ljava/lang/StringBuilder;

    .line 291
    .line 292
    iget v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellHeight:I

    .line 293
    .line 294
    iget v9, v2, Lcom/android/launcher3/F1;->G0:I

    .line 295
    .line 296
    if-le v4, v9, :cond_9

    .line 297
    .line 298
    iput v9, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellHeight:I

    .line 299
    .line 300
    :cond_9
    iget v4, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellHeight:I

    .line 301
    .line 302
    move v12, v4

    .line 303
    move v9, v8

    .line 304
    move v11, v10

    .line 305
    move v10, v12

    .line 306
    goto :goto_1

    .line 307
    :cond_a
    move v12, v11

    .line 308
    move v11, v10

    .line 309
    move v10, v9

    .line 310
    move v9, v8

    .line 311
    :goto_1
    iput v11, v0, Lcom/android/launcher3/widget/U;->o:I

    .line 312
    .line 313
    iput v12, v0, Lcom/android/launcher3/widget/U;->p:I

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :cond_b
    invoke-static {v3, v9}, Ljava/lang/Math;->max(II)I

    .line 318
    .line 319
    .line 320
    move-result v3

    .line 321
    invoke-static {v4, v10}, Ljava/lang/Math;->max(II)I

    .line 322
    .line 323
    .line 324
    move-result v4

    .line 325
    iget v5, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellWidth:I

    .line 326
    .line 327
    if-lt v5, v9, :cond_c

    .line 328
    .line 329
    if-gt v5, v3, :cond_c

    .line 330
    .line 331
    iget v6, v0, Landroid/appwidget/AppWidgetProviderInfo;->targetCellHeight:I

    .line 332
    .line 333
    if-lt v6, v10, :cond_c

    .line 334
    .line 335
    if-gt v6, v4, :cond_c

    .line 336
    .line 337
    move v11, v5

    .line 338
    move v12, v6

    .line 339
    :cond_c
    invoke-static {v11, v9}, Ljava/lang/Math;->min(II)I

    .line 340
    .line 341
    .line 342
    move-result v5

    .line 343
    iput v5, v0, Lcom/android/launcher3/widget/U;->i:I

    .line 344
    .line 345
    invoke-static {v12, v10}, Ljava/lang/Math;->min(II)I

    .line 346
    .line 347
    .line 348
    move-result v5

    .line 349
    iput v5, v0, Lcom/android/launcher3/widget/U;->j:I

    .line 350
    .line 351
    iput v3, v0, Lcom/android/launcher3/widget/U;->k:I

    .line 352
    .line 353
    iput v4, v0, Lcom/android/launcher3/widget/U;->l:I

    .line 354
    .line 355
    invoke-static {v11, v9}, Ljava/lang/Math;->min(II)I

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    iget v4, v2, Lcom/android/launcher3/F1;->H0:I

    .line 360
    .line 361
    if-gt v3, v4, :cond_d

    .line 362
    .line 363
    invoke-static {v12, v10}, Ljava/lang/Math;->min(II)I

    .line 364
    .line 365
    .line 366
    move-result v3

    .line 367
    iget v4, v2, Lcom/android/launcher3/F1;->G0:I

    .line 368
    .line 369
    if-gt v3, v4, :cond_d

    .line 370
    .line 371
    const/4 v8, 0x1

    .line 372
    goto :goto_2

    .line 373
    :cond_d
    const/4 v8, 0x0

    .line 374
    :goto_2
    iput-boolean v8, v0, Lcom/android/launcher3/widget/U;->m:Z

    .line 375
    .line 376
    iget v3, v2, Lcom/android/launcher3/F1;->H0:I

    .line 377
    .line 378
    invoke-static {v11, v3}, Ljava/lang/Math;->min(II)I

    .line 379
    .line 380
    .line 381
    move-result v3

    .line 382
    iput v3, v0, Lcom/android/launcher3/widget/U;->g:I

    .line 383
    .line 384
    iget v3, v2, Lcom/android/launcher3/F1;->G0:I

    .line 385
    .line 386
    invoke-static {v12, v3}, Ljava/lang/Math;->min(II)I

    .line 387
    .line 388
    .line 389
    move-result v3

    .line 390
    iput v3, v0, Lcom/android/launcher3/widget/U;->h:I

    .line 391
    .line 392
    iget-object v3, v0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 393
    .line 394
    invoke-static {v1, v3}, Lx1/O;->g4(Landroid/content/Context;Landroid/content/ComponentName;)Z

    .line 395
    .line 396
    .line 397
    move-result v1

    .line 398
    if-eqz v1, :cond_e

    .line 399
    .line 400
    iget v1, v2, Lcom/android/launcher3/F1;->H0:I

    .line 401
    .line 402
    iput v1, v0, Lcom/android/launcher3/widget/U;->g:I

    .line 403
    .line 404
    new-instance v1, Ljava/lang/StringBuilder;

    .line 405
    .line 406
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 407
    .line 408
    .line 409
    const-string v2, "initSpans needResizeForGoogleSearchWidget spanX="

    .line 410
    .line 411
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 412
    .line 413
    .line 414
    iget v2, v0, Lcom/android/launcher3/widget/U;->g:I

    .line 415
    .line 416
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 417
    .line 418
    .line 419
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    const-string v2, "LauncherAppWidgetProviderInfo"

    .line 424
    .line 425
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 426
    .line 427
    .line 428
    :cond_e
    iget v1, v0, Landroid/appwidget/AppWidgetProviderInfo;->resizeMode:I

    .line 429
    .line 430
    if-nez v1, :cond_f

    .line 431
    .line 432
    iget v1, v0, Lcom/android/launcher3/widget/U;->g:I

    .line 433
    .line 434
    iput v1, v0, Lcom/android/launcher3/widget/U;->i:I

    .line 435
    .line 436
    iget v1, v0, Lcom/android/launcher3/widget/U;->h:I

    .line 437
    .line 438
    iput v1, v0, Lcom/android/launcher3/widget/U;->j:I

    .line 439
    .line 440
    :cond_f
    return-void
.end method

.method protected w(Landroid/content/Context;)V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/U;->n:Landroid/content/pm/PackageManager;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lcom/android/launcher3/widget/U;->n:Landroid/content/pm/PackageManager;

    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Landroid/appwidget/AppWidgetProviderInfo;->getActivityInfo()Landroid/content/pm/ActivityInfo;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    const/4 v0, 0x1

    .line 20
    const-string v1, ""

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    if-eqz p1, :cond_a

    .line 24
    .line 25
    iget-object v3, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 26
    .line 27
    if-eqz v3, :cond_a

    .line 28
    .line 29
    new-instance v3, Ljava/lang/StringBuilder;

    .line 30
    .line 31
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object v4, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 35
    .line 36
    const-string v5, "hideInLauncherWidgetList"

    .line 37
    .line 38
    invoke-virtual {v4, v5}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    const-string v4, "true"

    .line 53
    .line 54
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v3

    .line 58
    new-instance v5, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    iget-object v6, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 64
    .line 65
    const-string v7, "miuiWidget"

    .line 66
    .line 67
    invoke-virtual {v6, v7}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v6

    .line 71
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 82
    .line 83
    .line 84
    move-result v5

    .line 85
    if-nez v5, :cond_2

    .line 86
    .line 87
    new-instance v5, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 90
    .line 91
    .line 92
    iget-object v6, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 93
    .line 94
    const-string v7, "MyOSWidget"

    .line 95
    .line 96
    invoke-virtual {v6, v7}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v5

    .line 110
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v5

    .line 114
    if-eqz v5, :cond_1

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_1
    move v5, v2

    .line 118
    goto :goto_1

    .line 119
    :cond_2
    :goto_0
    move v5, v0

    .line 120
    :goto_1
    new-instance v6, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    iget-object v7, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 126
    .line 127
    const-string v8, "GroupWidget"

    .line 128
    .line 129
    invoke-virtual {v7, v8}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v7

    .line 133
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v6

    .line 143
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->G()Z

    .line 148
    .line 149
    .line 150
    move-result v7

    .line 151
    const-string v8, "com.zte.widget.view.groupwidget.GroupWidget4x2"

    .line 152
    .line 153
    const-string v9, "com.zte.personalagent"

    .line 154
    .line 155
    if-eqz v7, :cond_4

    .line 156
    .line 157
    if-eqz v6, :cond_4

    .line 158
    .line 159
    const-string v7, "gen_nubia_cn_zte_nebulaos2_pq84a01"

    .line 160
    .line 161
    invoke-static {}, Lx1/O;->k0()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v10

    .line 165
    invoke-virtual {v7, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v7

    .line 169
    if-eqz v7, :cond_3

    .line 170
    .line 171
    iget-object v7, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 172
    .line 173
    if-eqz v7, :cond_3

    .line 174
    .line 175
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v7

    .line 179
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v7

    .line 183
    if-eqz v7, :cond_3

    .line 184
    .line 185
    iget-object v7, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 186
    .line 187
    invoke-virtual {v7}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v7

    .line 191
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v7

    .line 195
    if-eqz v7, :cond_3

    .line 196
    .line 197
    move v3, v2

    .line 198
    goto :goto_2

    .line 199
    :cond_3
    iget-object v7, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 200
    .line 201
    if-eqz v7, :cond_4

    .line 202
    .line 203
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v7

    .line 207
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v7

    .line 211
    if-eqz v7, :cond_4

    .line 212
    .line 213
    iget-object v7, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 214
    .line 215
    invoke-virtual {v7}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result v7

    .line 223
    if-eqz v7, :cond_4

    .line 224
    .line 225
    invoke-static {}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->d()Z

    .line 226
    .line 227
    .line 228
    move-result v3

    .line 229
    xor-int/2addr v3, v0

    .line 230
    :cond_4
    :goto_2
    invoke-static {}, Lcom/android/launcher3/widget/group/GroupWidgetUtils;->d()Z

    .line 231
    .line 232
    .line 233
    move-result v7

    .line 234
    if-eqz v7, :cond_5

    .line 235
    .line 236
    iget-object v7, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 237
    .line 238
    if-eqz v7, :cond_5

    .line 239
    .line 240
    invoke-virtual {v7}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v7

    .line 244
    invoke-virtual {v9, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v7

    .line 248
    if-eqz v7, :cond_5

    .line 249
    .line 250
    iget-object v7, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 251
    .line 252
    invoke-virtual {v7}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v7

    .line 256
    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v7

    .line 260
    if-eqz v7, :cond_5

    .line 261
    .line 262
    move v3, v2

    .line 263
    :cond_5
    invoke-static {}, Lcom/android/launcher3/blur/f;->g()Z

    .line 264
    .line 265
    .line 266
    move-result v7

    .line 267
    if-eqz v7, :cond_9

    .line 268
    .line 269
    if-nez v6, :cond_6

    .line 270
    .line 271
    new-instance v7, Ljava/lang/StringBuilder;

    .line 272
    .line 273
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 274
    .line 275
    .line 276
    iget-object p1, p1, Landroid/content/pm/ActivityInfo;->metaData:Landroid/os/Bundle;

    .line 277
    .line 278
    const-string v8, "supportBackgroundBlur"

    .line 279
    .line 280
    invoke-virtual {p1, v8}, Landroid/os/Bundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 285
    .line 286
    .line 287
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object p1

    .line 294
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result p1

    .line 298
    if-eqz p1, :cond_6

    .line 299
    .line 300
    move p1, v0

    .line 301
    goto :goto_3

    .line 302
    :cond_6
    move p1, v2

    .line 303
    :goto_3
    invoke-static {}, Lcom/android/launcher3/blur/f;->h()Z

    .line 304
    .line 305
    .line 306
    move-result v4

    .line 307
    if-eqz v4, :cond_b

    .line 308
    .line 309
    iget-object v4, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 310
    .line 311
    if-eqz v4, :cond_b

    .line 312
    .line 313
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v4

    .line 317
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 318
    .line 319
    .line 320
    move-result v4

    .line 321
    if-nez v4, :cond_b

    .line 322
    .line 323
    iget-object v4, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 324
    .line 325
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v4

    .line 329
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 330
    .line 331
    .line 332
    move-result v4

    .line 333
    if-nez v4, :cond_b

    .line 334
    .line 335
    iget-object v4, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 336
    .line 337
    invoke-virtual {v4}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v4

    .line 341
    const-string v7, "com.zte.mifavor.suggest"

    .line 342
    .line 343
    invoke-virtual {v7, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 344
    .line 345
    .line 346
    move-result v4

    .line 347
    if-eqz v4, :cond_7

    .line 348
    .line 349
    iget-object v4, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 350
    .line 351
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v4

    .line 355
    const-string v7, "SuggestWidget2x2"

    .line 356
    .line 357
    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 358
    .line 359
    .line 360
    move-result v4

    .line 361
    if-nez v4, :cond_8

    .line 362
    .line 363
    iget-object v4, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 364
    .line 365
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v4

    .line 369
    const-string v7, "SuggestWidget4x2"

    .line 370
    .line 371
    invoke-virtual {v4, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 372
    .line 373
    .line 374
    move-result v4

    .line 375
    if-nez v4, :cond_8

    .line 376
    .line 377
    :cond_7
    iget-object v4, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 378
    .line 379
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 380
    .line 381
    .line 382
    move-result-object v4

    .line 383
    const-string v7, "cn.nubia.neostore.widget.rec.RecAppsWidget"

    .line 384
    .line 385
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 386
    .line 387
    .line 388
    move-result v4

    .line 389
    if-eqz v4, :cond_b

    .line 390
    .line 391
    :cond_8
    move p1, v0

    .line 392
    goto :goto_4

    .line 393
    :cond_9
    move p1, v2

    .line 394
    goto :goto_4

    .line 395
    :cond_a
    move p1, v2

    .line 396
    move v3, p1

    .line 397
    move v5, v3

    .line 398
    move v6, v5

    .line 399
    :cond_b
    :goto_4
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->u:Z

    .line 400
    .line 401
    iput-boolean v3, p0, Lcom/android/launcher3/widget/U;->s:Z

    .line 402
    .line 403
    iput-boolean v6, p0, Lcom/android/launcher3/widget/U;->r:Z

    .line 404
    .line 405
    iget-object p1, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 406
    .line 407
    if-eqz p1, :cond_c

    .line 408
    .line 409
    sget-object v3, Lx1/O;->i:Ljava/util/List;

    .line 410
    .line 411
    invoke-virtual {p1}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p1

    .line 415
    invoke-interface {v3, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    move-result p1

    .line 419
    goto :goto_5

    .line 420
    :cond_c
    move p1, v2

    .line 421
    :goto_5
    iget-object v3, p0, Landroid/appwidget/AppWidgetProviderInfo;->provider:Landroid/content/ComponentName;

    .line 422
    .line 423
    if-eqz v3, :cond_d

    .line 424
    .line 425
    sget-object v4, Lx1/O;->j:Ljava/util/List;

    .line 426
    .line 427
    invoke-virtual {v3}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v3

    .line 431
    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 432
    .line 433
    .line 434
    move-result v3

    .line 435
    goto :goto_6

    .line 436
    :cond_d
    move v3, v2

    .line 437
    :goto_6
    if-nez v5, :cond_e

    .line 438
    .line 439
    if-eqz p1, :cond_f

    .line 440
    .line 441
    :cond_e
    if-nez v3, :cond_f

    .line 442
    .line 443
    move p1, v0

    .line 444
    goto :goto_7

    .line 445
    :cond_f
    move p1, v2

    .line 446
    :goto_7
    iput-boolean p1, p0, Lcom/android/launcher3/widget/U;->t:Z

    .line 447
    .line 448
    iget-boolean p1, p0, Lcom/android/launcher3/widget/U;->r:Z

    .line 449
    .line 450
    if-nez p1, :cond_10

    .line 451
    .line 452
    iget-boolean p1, p0, Lcom/android/launcher3/widget/U;->q:Z

    .line 453
    .line 454
    if-eqz p1, :cond_11

    .line 455
    .line 456
    :cond_10
    iput-boolean v0, p0, Lcom/android/launcher3/widget/U;->t:Z

    .line 457
    .line 458
    invoke-static {}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->G()Z

    .line 459
    .line 460
    .line 461
    move-result p1

    .line 462
    if-eqz p1, :cond_11

    .line 463
    .line 464
    invoke-static {p0}, Lcom/android/launcher3/widget/custom/future/AIFutureWidgetUtils;->D(Landroid/appwidget/AppWidgetProviderInfo;)Z

    .line 465
    .line 466
    .line 467
    move-result p1

    .line 468
    if-eqz p1, :cond_11

    .line 469
    .line 470
    iput-boolean v2, p0, Lcom/android/launcher3/widget/U;->t:Z

    .line 471
    .line 472
    :cond_11
    iget-boolean p1, p0, Lcom/android/launcher3/widget/U;->t:Z

    .line 473
    .line 474
    if-eqz p1, :cond_13

    .line 475
    .line 476
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->getLabel()Ljava/lang/CharSequence;

    .line 477
    .line 478
    .line 479
    move-result-object p1

    .line 480
    invoke-static {p1}, Lx1/i0;->a(Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object p1

    .line 484
    invoke-static {p1}, Lx1/O;->i0(Ljava/lang/String;)Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object p1

    .line 488
    if-nez p1, :cond_12

    .line 489
    .line 490
    goto :goto_8

    .line 491
    :cond_12
    move-object v1, p1

    .line 492
    :goto_8
    iput-object v1, p0, Lcom/android/launcher3/widget/U;->v:Ljava/lang/String;

    .line 493
    .line 494
    :cond_13
    return-void
.end method

.method public x()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/U;->w:Z

    .line 2
    .line 3
    return p0
.end method

.method public y()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/U;->r:Z

    .line 2
    .line 3
    return p0
.end method

.method public z()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->D()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/widget/U;->u()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    and-int/lit8 p0, p0, 0x4

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method
