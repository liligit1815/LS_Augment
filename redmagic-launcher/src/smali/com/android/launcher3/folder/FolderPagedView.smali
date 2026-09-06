.class public Lcom/android/launcher3/folder/FolderPagedView;
.super Lcom/android/launcher3/T6;
.source "FolderPagedView.java"

# interfaces
.implements Lcom/android/launcher3/views/u;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/android/launcher3/T6<",
        "Lcom/android/launcher3/pageindicators/PageIndicatorDots;",
        ">;",
        "Lcom/android/launcher3/views/u;"
    }
.end annotation


# static fields
.field private static final F:[I


# instance fields
.field private A:F

.field private B:F

.field private C:F

.field private D:F

.field private E:Landroid/graphics/Rect;

.field public final j:Z

.field private final k:Lcom/android/launcher3/keyboard/b;

.field final l:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroid/view/View;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private final m:Lcom/android/launcher3/folder/A;

.field private final n:Lcom/android/launcher3/util/X2;

.field private o:I

.field private p:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private q:I
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation
.end field

.field private r:Lcom/android/launcher3/folder/Folder;

.field private s:Landroid/graphics/Path;

.field private t:Z

.field private u:Z

.field private v:Lcom/android/launcher3/globalsearch/r$b;

.field private w:I

.field private x:I

.field private y:I

.field private z:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [I

    .line 3
    .line 4
    sput-object v0, Lcom/android/launcher3/folder/FolderPagedView;->F:[I

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/android/launcher3/views/k;

    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v0

    invoke-static {v0}, Lcom/android/launcher3/folder/A;->b(Lcom/android/launcher3/h0;)Lcom/android/launcher3/folder/A;

    move-result-object v0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/folder/FolderPagedView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/android/launcher3/folder/A;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;Lcom/android/launcher3/folder/A;)V
    .locals 3

    .line 3
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/T6;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 4
    new-instance v0, Landroid/util/ArrayMap;

    invoke-direct {v0}, Landroid/util/ArrayMap;-><init>()V

    iput-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->l:Landroid/util/ArrayMap;

    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->t:Z

    const v1, 0x3db60b61

    .line 6
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->z:F

    const v1, 0x3d638e39

    .line 7
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->A:F

    const v1, 0x3d360b61

    .line 8
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->B:F

    const/high16 v1, 0x3ef00000    # 0.46875f

    .line 9
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->C:F

    const v1, 0x3d2aaaab

    .line 10
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->D:F

    .line 11
    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    iput-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 12
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/android/launcher3/views/k;

    .line 13
    iput-object p3, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 14
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    invoke-static {p3}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result p3

    iput-boolean p3, p0, Lcom/android/launcher3/folder/FolderPagedView;->j:Z

    const/4 p3, 0x1

    .line 15
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->setImportantForAccessibility(I)V

    .line 16
    new-instance v2, Lcom/android/launcher3/keyboard/b;

    invoke-direct {v2, p0}, Lcom/android/launcher3/keyboard/b;-><init>(Landroid/view/View;)V

    iput-object v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->k:Lcom/android/launcher3/keyboard/b;

    .line 17
    invoke-interface {v1}, Lcom/android/launcher3/views/k;->getViewCache()Lcom/android/launcher3/util/X2;

    move-result-object v1

    iput-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->n:Lcom/android/launcher3/util/X2;

    .line 18
    sget-object v1, Lcom/android/launcher3/x5;->d2:[I

    invoke-virtual {p1, p2, v1, v0, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 19
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    move-result-object p2

    invoke-virtual {p2}, Lcom/android/launcher3/resource/B;->v()Z

    move-result p2

    const/4 v1, -0x1

    if-eqz p2, :cond_0

    .line 20
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    goto :goto_0

    .line 21
    :cond_0
    invoke-virtual {p1, p3, v1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    :goto_0
    iput p2, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 22
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 23
    invoke-direct {p0}, Lcom/android/launcher3/folder/FolderPagedView;->k0()V

    return-void
.end method

.method public static synthetic Q(Lcom/android/launcher3/K5;)I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public static synthetic R(Lcom/android/launcher3/folder/FolderPagedView;Lcom/android/launcher3/pageindicators/a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->o0(Lcom/android/launcher3/pageindicators/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic S(Lcom/android/launcher3/K5;)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    add-int/lit8 p0, p0, -0x1

    .line 6
    .line 7
    return p0
.end method

.method public static synthetic T(Ljava/util/concurrent/atomic/AtomicInteger;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    return p0
.end method

.method public static synthetic U(Lcom/android/launcher3/folder/FolderPagedView;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/folder/FolderPagedView;->n0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private Z()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method private j0(Ljava/util/function/ToIntFunction;)Landroid/view/View;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/function/ToIntFunction<",
            "Lcom/android/launcher3/K5;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    const/4 v2, 0x0

    .line 7
    if-lt v0, v1, :cond_3

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    return-object v2

    .line 23
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {p1, v0}, Ljava/util/function/ToIntFunction;->applyAsInt(Ljava/lang/Object;)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 36
    .line 37
    if-lez p0, :cond_2

    .line 38
    .line 39
    rem-int v1, p1, p0

    .line 40
    .line 41
    div-int/2addr p1, p0

    .line 42
    invoke-virtual {v0, v1, p1}, Lcom/android/launcher3/K5;->f(II)Landroid/view/View;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0

    .line 47
    :cond_2
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    return-object p0

    .line 52
    :cond_3
    :goto_0
    return-object v2
.end method

.method private k0()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 12
    .line 13
    iget v2, v0, Lcom/android/launcher3/h0;->U0:I

    .line 14
    .line 15
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 16
    .line 17
    iget v4, p0, Lcom/android/launcher3/folder/FolderPagedView;->B:F

    .line 18
    .line 19
    int-to-float v5, v1

    .line 20
    mul-float/2addr v4, v5

    .line 21
    float-to-int v4, v4

    .line 22
    iput v4, v3, Landroid/graphics/Rect;->left:I

    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {v3}, Lcom/android/launcher3/resource/B;->s()Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    const/4 v4, 0x0

    .line 33
    if-eqz v3, :cond_0

    .line 34
    .line 35
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 36
    .line 37
    iput v4, v3, Landroid/graphics/Rect;->left:I

    .line 38
    .line 39
    :cond_0
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 40
    .line 41
    iget v6, v3, Landroid/graphics/Rect;->left:I

    .line 42
    .line 43
    iput v6, v3, Landroid/graphics/Rect;->right:I

    .line 44
    .line 45
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v6

    .line 49
    const v7, 0x7f07035d

    .line 50
    .line 51
    .line 52
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 53
    .line 54
    .line 55
    move-result v6

    .line 56
    iput v6, v3, Landroid/graphics/Rect;->top:I

    .line 57
    .line 58
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 61
    .line 62
    .line 63
    move-result-object v6

    .line 64
    const v7, 0x7f070359

    .line 65
    .line 66
    .line 67
    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    iput v6, v3, Landroid/graphics/Rect;->bottom:I

    .line 72
    .line 73
    iget v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->z:F

    .line 74
    .line 75
    mul-float/2addr v3, v5

    .line 76
    float-to-int v3, v3

    .line 77
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-virtual {v6}, Lcom/android/launcher3/resource/B;->s()Z

    .line 82
    .line 83
    .line 84
    move-result v6

    .line 85
    if-eqz v6, :cond_1

    .line 86
    .line 87
    iget v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->A:F

    .line 88
    .line 89
    mul-float/2addr v3, v5

    .line 90
    float-to-int v3, v3

    .line 91
    :cond_1
    iget v6, v0, Lcom/android/launcher3/X3;->b0:I

    .line 92
    .line 93
    iput v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->x:I

    .line 94
    .line 95
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 96
    .line 97
    iget v6, v6, Landroid/graphics/Rect;->left:I

    .line 98
    .line 99
    add-int/2addr v3, v6

    .line 100
    mul-int/lit8 v3, v3, 0x2

    .line 101
    .line 102
    sub-int/2addr v1, v3

    .line 103
    iget-object v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 104
    .line 105
    invoke-virtual {v3}, Lcom/android/launcher3/folder/A;->c()I

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    div-int/2addr v1, v3

    .line 110
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->w:I

    .line 111
    .line 112
    iget v1, v0, Lcom/android/launcher3/h0;->D1:I

    .line 113
    .line 114
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->y:I

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/android/launcher3/h0;->T0()Z

    .line 117
    .line 118
    .line 119
    move-result v1

    .line 120
    if-eqz v1, :cond_2

    .line 121
    .line 122
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 123
    .line 124
    iput v4, v1, Landroid/graphics/Rect;->left:I

    .line 125
    .line 126
    iput v4, v1, Landroid/graphics/Rect;->right:I

    .line 127
    .line 128
    iget v3, p0, Lcom/android/launcher3/folder/FolderPagedView;->D:F

    .line 129
    .line 130
    int-to-float v2, v2

    .line 131
    mul-float/2addr v3, v2

    .line 132
    float-to-int v2, v3

    .line 133
    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 134
    .line 135
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->C:F

    .line 136
    .line 137
    mul-float/2addr v5, v1

    .line 138
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 139
    .line 140
    invoke-virtual {v1}, Lcom/android/launcher3/folder/A;->c()I

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    int-to-float v1, v1

    .line 145
    div-float/2addr v5, v1

    .line 146
    float-to-int v1, v5

    .line 147
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->w:I

    .line 148
    .line 149
    :cond_2
    invoke-static {}, Lcom/android/launcher3/N5;->F()Z

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    if-eqz v1, :cond_5

    .line 154
    .line 155
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    iget-boolean v2, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 160
    .line 161
    if-eqz v2, :cond_3

    .line 162
    .line 163
    const v2, 0x7f0c0080

    .line 164
    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_3
    const v2, 0x7f0c007f

    .line 168
    .line 169
    .line 170
    :goto_0
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getInteger(I)I

    .line 171
    .line 172
    .line 173
    move-result v1

    .line 174
    int-to-float v1, v1

    .line 175
    invoke-static {v1}, Lcom/android/launcher3/N5;->T(F)I

    .line 176
    .line 177
    .line 178
    move-result v1

    .line 179
    iput v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->x:I

    .line 180
    .line 181
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 186
    .line 187
    if-eqz v0, :cond_4

    .line 188
    .line 189
    const v0, 0x7f0c0082

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_4
    const v0, 0x7f0c0081

    .line 194
    .line 195
    .line 196
    :goto_1
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    int-to-float v0, v0

    .line 201
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    iput v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->w:I

    .line 206
    .line 207
    :cond_5
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->s()Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-eqz v0, :cond_6

    .line 216
    .line 217
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    const v1, 0x7f070348

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    iput v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->w:I

    .line 229
    .line 230
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    iget-boolean v0, v0, Lcom/android/launcher3/r4;->M:Z

    .line 243
    .line 244
    if-eqz v0, :cond_6

    .line 245
    .line 246
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 247
    .line 248
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    const v2, 0x7f07035e

    .line 253
    .line 254
    .line 255
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 260
    .line 261
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 262
    .line 263
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    const v1, 0x7f07035a

    .line 268
    .line 269
    .line 270
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    iput p0, v0, Landroid/graphics/Rect;->bottom:I

    .line 275
    .line 276
    :cond_6
    return-void
.end method

.method private synthetic n0(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    instance-of p1, p1, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    instance-of p1, p2, Lcom/android/launcher3/BubbleTextView;

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 10
    .line 11
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 32
    .line 33
    invoke-virtual {p0, p2}, Lcom/android/launcher3/G4;->y(Lcom/android/launcher3/BubbleTextView;)V

    .line 34
    .line 35
    .line 36
    :cond_0
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method private synthetic o0(Lcom/android/launcher3/pageindicators/a;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/pageindicators/a;->g:Lcom/android/launcher3/pageindicators/a;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    iget p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 6
    .line 7
    add-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget p1, p0, Lcom/android/launcher3/V4;->mCurrentPage:I

    .line 11
    .line 12
    add-int/lit8 p1, p1, -0x1

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/V4;->snapToPageImmediately(I)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method private setupContentDimensions(I)V
    .locals 3

    .line 1
    iput p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->o:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Lcom/android/launcher3/folder/A;->k(I)Lcom/android/launcher3/folder/A;

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/folder/A;->d()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/folder/A;->e()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->q:I

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    add-int/lit8 p1, p1, -0x1

    .line 29
    .line 30
    :goto_0
    if-ltz p1, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 37
    .line 38
    iget v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->q:I

    .line 39
    .line 40
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 41
    .line 42
    .line 43
    add-int/lit8 p1, p1, -0x1

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    return-void
.end method


# virtual methods
.method public V(Landroid/view/View;Lcom/android/launcher3/model/data/y;I)V
    .locals 8

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p0, "FolderPagedView"

    .line 4
    .line 5
    const-string p1, "addViewForRank: view is null  return !!!"

    .line 6
    .line 7
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/folder/A;->f()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    div-int v0, p3, v0

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    move-object v6, v1

    .line 24
    check-cast v6, Lc1/b;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 27
    .line 28
    invoke-virtual {v1, p3}, Lcom/android/launcher3/folder/A;->g(I)Landroid/graphics/Point;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {v6, p3}, Lc1/b;->f(Landroid/graphics/Point;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getViewId()I

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    const/4 v7, 0x1

    .line 44
    const/4 v4, -0x1

    .line 45
    move-object v3, p1

    .line 46
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public W()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->t:Z

    .line 2
    .line 3
    return p0
.end method

.method public X(Ljava/util/List;)V
    .locals 18
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "RtlHardcoded"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    new-instance v2, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v5

    .line 18
    if-ge v4, v5, :cond_0

    .line 19
    .line 20
    invoke-virtual {v0, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v5

    .line 24
    check-cast v5, Lcom/android/launcher3/CellLayout;

    .line 25
    .line 26
    invoke-virtual {v5}, Lcom/android/launcher3/CellLayout;->removeAllViews()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 36
    .line 37
    iget-object v5, v0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 38
    .line 39
    invoke-virtual {v5}, Lcom/android/launcher3/folder/Folder;->getInfo()Lcom/android/launcher3/model/data/p;

    .line 40
    .line 41
    .line 42
    move-result-object v5

    .line 43
    invoke-virtual {v4, v5}, Lcom/android/launcher3/folder/A;->l(Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/A;

    .line 44
    .line 45
    .line 46
    invoke-direct {v0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->setupContentDimensions(I)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    const/4 v4, 0x0

    .line 54
    move v5, v3

    .line 55
    move v7, v5

    .line 56
    move v8, v7

    .line 57
    move-object v6, v4

    .line 58
    :goto_1
    const/4 v9, 0x1

    .line 59
    if-ge v5, v1, :cond_8

    .line 60
    .line 61
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    .line 62
    .line 63
    .line 64
    move-result v10

    .line 65
    if-le v10, v5, :cond_1

    .line 66
    .line 67
    move-object/from16 v10, p1

    .line 68
    .line 69
    invoke-interface {v10, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v11

    .line 73
    check-cast v11, Landroid/view/View;

    .line 74
    .line 75
    move-object v13, v11

    .line 76
    goto :goto_2

    .line 77
    :cond_1
    move-object/from16 v10, p1

    .line 78
    .line 79
    move-object v13, v4

    .line 80
    :goto_2
    if-eqz v6, :cond_3

    .line 81
    .line 82
    iget-object v11, v0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 83
    .line 84
    invoke-virtual {v11}, Lcom/android/launcher3/folder/A;->f()I

    .line 85
    .line 86
    .line 87
    move-result v11

    .line 88
    if-lt v7, v11, :cond_2

    .line 89
    .line 90
    goto :goto_4

    .line 91
    :cond_2
    :goto_3
    move-object v12, v6

    .line 92
    goto :goto_6

    .line 93
    :cond_3
    :goto_4
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 94
    .line 95
    .line 96
    move-result v6

    .line 97
    if-eqz v6, :cond_4

    .line 98
    .line 99
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object v6

    .line 103
    check-cast v6, Lcom/android/launcher3/CellLayout;

    .line 104
    .line 105
    goto :goto_5

    .line 106
    :cond_4
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->c0()Lcom/android/launcher3/CellLayout;

    .line 107
    .line 108
    .line 109
    move-result-object v6

    .line 110
    :goto_5
    move v7, v3

    .line 111
    goto :goto_3

    .line 112
    :goto_6
    if-eqz v13, :cond_7

    .line 113
    .line 114
    invoke-virtual {v13}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 115
    .line 116
    .line 117
    move-result-object v6

    .line 118
    check-cast v6, Lc1/b;

    .line 119
    .line 120
    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v11

    .line 124
    check-cast v11, Lcom/android/launcher3/model/data/y;

    .line 125
    .line 126
    iget-object v14, v0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 127
    .line 128
    invoke-virtual {v14, v8}, Lcom/android/launcher3/folder/A;->g(I)Landroid/graphics/Point;

    .line 129
    .line 130
    .line 131
    move-result-object v14

    .line 132
    invoke-virtual {v6, v14}, Lc1/b;->f(Landroid/graphics/Point;)V

    .line 133
    .line 134
    .line 135
    invoke-virtual {v13}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 136
    .line 137
    .line 138
    move-result-object v14

    .line 139
    if-eqz v14, :cond_5

    .line 140
    .line 141
    new-instance v14, Ljava/lang/StringBuilder;

    .line 142
    .line 143
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v15, "arrangeChildren: target view has parent: "

    .line 147
    .line 148
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    iget-object v15, v11, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 152
    .line 153
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    const-string v15, ", parent: "

    .line 157
    .line 158
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v13}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 162
    .line 163
    .line 164
    move-result-object v15

    .line 165
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v14

    .line 172
    const-string v15, "FolderPagedView"

    .line 173
    .line 174
    invoke-static {v15, v14}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    invoke-virtual {v13}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 178
    .line 179
    .line 180
    move-result-object v14

    .line 181
    check-cast v14, Landroid/view/ViewGroup;

    .line 182
    .line 183
    instance-of v15, v14, Lcom/android/launcher3/K5;

    .line 184
    .line 185
    if-eqz v15, :cond_5

    .line 186
    .line 187
    invoke-virtual {v14, v13}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 188
    .line 189
    .line 190
    :cond_5
    invoke-static {v13}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 191
    .line 192
    .line 193
    move-result v14

    .line 194
    if-eqz v14, :cond_6

    .line 195
    .line 196
    iget-object v14, v0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 197
    .line 198
    iput-boolean v9, v14, Lcom/android/launcher3/folder/Folder;->x0:Z

    .line 199
    .line 200
    :cond_6
    invoke-virtual {v11}, Lcom/android/launcher3/model/data/y;->getViewId()I

    .line 201
    .line 202
    .line 203
    move-result v15

    .line 204
    const/16 v17, 0x1

    .line 205
    .line 206
    const/4 v14, -0x1

    .line 207
    move-object/from16 v16, v6

    .line 208
    .line 209
    invoke-virtual/range {v12 .. v17}, Lcom/android/launcher3/CellLayout;->e(Landroid/view/View;IILc1/b;Z)Z

    .line 210
    .line 211
    .line 212
    iget-object v6, v0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 213
    .line 214
    invoke-virtual {v6, v8}, Lcom/android/launcher3/folder/A;->h(I)Z

    .line 215
    .line 216
    .line 217
    move-result v6

    .line 218
    if-eqz v6, :cond_7

    .line 219
    .line 220
    instance-of v6, v13, Lcom/android/launcher3/BubbleTextView;

    .line 221
    .line 222
    if-eqz v6, :cond_7

    .line 223
    .line 224
    check-cast v13, Lcom/android/launcher3/BubbleTextView;

    .line 225
    .line 226
    invoke-virtual {v13}, Lcom/android/launcher3/BubbleTextView;->W0()V

    .line 227
    .line 228
    .line 229
    :cond_7
    add-int/lit8 v8, v8, 0x1

    .line 230
    .line 231
    add-int/2addr v7, v9

    .line 232
    add-int/lit8 v5, v5, 0x1

    .line 233
    .line 234
    move-object v6, v12

    .line 235
    goto/16 :goto_1

    .line 236
    .line 237
    :cond_8
    move v1, v3

    .line 238
    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    if-eqz v4, :cond_9

    .line 243
    .line 244
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    check-cast v1, Landroid/view/View;

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Lcom/android/launcher3/V4;->removeView(Landroid/view/View;)V

    .line 251
    .line 252
    .line 253
    move v1, v9

    .line 254
    goto :goto_7

    .line 255
    :cond_9
    if-eqz v1, :cond_a

    .line 256
    .line 257
    invoke-virtual {v0, v3}, Lcom/android/launcher3/V4;->setCurrentPage(I)V

    .line 258
    .line 259
    .line 260
    :cond_a
    iget-object v1, v0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 261
    .line 262
    if-eqz v1, :cond_c

    .line 263
    .line 264
    check-cast v1, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 265
    .line 266
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 267
    .line 268
    .line 269
    move-result v2

    .line 270
    if-le v2, v9, :cond_b

    .line 271
    .line 272
    goto :goto_8

    .line 273
    :cond_b
    const/16 v3, 0x8

    .line 274
    .line 275
    :goto_8
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    .line 276
    .line 277
    .line 278
    :cond_c
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    if-eqz v1, :cond_d

    .line 283
    .line 284
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getMfvPageIndicator()Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    invoke-virtual {v1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->x()V

    .line 289
    .line 290
    .line 291
    :cond_d
    iget-object v0, v0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 292
    .line 293
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getFolderName()Lcom/android/launcher3/folder/FolderNameEditText;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-virtual {v0, v9}, Landroid/widget/EditText;->setGravity(I)V

    .line 298
    .line 299
    .line 300
    return-void
.end method

.method public Y(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->t:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->v0()V

    .line 6
    .line 7
    .line 8
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    new-instance v0, Lcom/android/launcher3/folder/c0;

    .line 13
    .line 14
    invoke-direct {v0, p0}, Lcom/android/launcher3/folder/c0;-><init>(Lcom/android/launcher3/folder/FolderPagedView;)V

    .line 15
    .line 16
    .line 17
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    check-cast p1, Ljava/util/List;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->X(Ljava/util/List;)V

    .line 32
    .line 33
    .line 34
    const/4 p1, 0x1

    .line 35
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->t:Z

    .line 36
    .line 37
    new-instance p1, Lcom/android/launcher3/folder/d0;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Lcom/android/launcher3/folder/d0;-><init>(Lcom/android/launcher3/folder/FolderPagedView;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 43
    .line 44
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 45
    .line 46
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz v0, :cond_1

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 53
    .line 54
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 55
    .line 56
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->o()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_1

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->m0(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 71
    .line 72
    .line 73
    :cond_1
    return-void
.end method

.method public a0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eq v0, v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->snapToPage(I)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public b0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->l:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/util/ArrayMap;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->l:Landroid/util/ArrayMap;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Landroid/util/ArrayMap;-><init>(Landroid/util/ArrayMap;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/util/ArrayMap;->entrySet()Ljava/util/Set;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ljava/util/Map$Entry;

    .line 35
    .line 36
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Landroid/view/View;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    .line 47
    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Ljava/lang/Runnable;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_0
    return-void
.end method

.method public c0()Lcom/android/launcher3/CellLayout;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-interface {v0}, Lcom/android/launcher3/views/k;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->n:Lcom/android/launcher3/util/X2;

    .line 9
    .line 10
    const v1, 0x7f0e00e1

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v0, v1, v2, p0}, Lcom/android/launcher3/util/X2;->b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->w:I

    .line 24
    .line 25
    iget v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->x:I

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/CellLayout;->A0(II)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->setMotionEventSplittingEnabled(Z)V

    .line 36
    .line 37
    .line 38
    const/4 v1, 0x1

    .line 39
    invoke-virtual {v0, v1}, Lcom/android/launcher3/CellLayout;->setInvertIfRtl(Z)V

    .line 40
    .line 41
    .line 42
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 43
    .line 44
    iget v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->q:I

    .line 45
    .line 46
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 47
    .line 48
    .line 49
    const/4 v1, -0x1

    .line 50
    invoke-virtual {p0}, Landroid/view/ViewGroup;->generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p0, v0, v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 55
    .line 56
    .line 57
    return-object v0
.end method

.method protected canAnnouncePageDescription()Z
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/V4;->canAnnouncePageDescription()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/folder/FolderPagedView;->Z()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method protected canScroll(FF)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    const p1, 0x7ffefffe

    .line 6
    .line 7
    .line 8
    invoke-static {p0, p1}, Lcom/android/launcher3/a;->getTopOpenViewWithType(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    if-nez p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public d0(Lcom/android/launcher3/model/data/y;I)Landroid/view/View;
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->e0(Lcom/android/launcher3/model/data/y;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->t:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 13
    .line 14
    invoke-virtual {v1}, Lcom/android/launcher3/folder/Folder;->getIconsInReadingOrder()Ljava/util/ArrayList;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p2, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->X(Ljava/util/List;)V

    .line 25
    .line 26
    .line 27
    return-object p1
.end method

.method protected determineScrollingStart(Landroid/view/MotionEvent;F)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/V4;->determineScrollingStart(Landroid/view/MotionEvent;F)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Lcom/android/launcher3/V4;->mIsBeingDragged:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    iget-object p1, p1, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 13
    .line 14
    const/16 p2, 0x100

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 25
    .line 26
    invoke-static {p0, p2}, Lcom/android/launcher3/a;->getOpenView(Lcom/android/launcher3/views/k;I)Lcom/android/launcher3/a;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, Lcom/android/launcher3/a;->close(Z)V

    .line 32
    .line 33
    .line 34
    :cond_0
    return-void
.end method

.method protected dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->s:Landroid/graphics/Path;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->s:Landroid/graphics/Path;

    .line 10
    .line 11
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 12
    .line 13
    .line 14
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->k:Lcom/android/launcher3/keyboard/b;

    .line 15
    .line 16
    invoke-virtual {v1, p1}, Lcom/android/launcher3/keyboard/a;->e(Landroid/graphics/Canvas;)V

    .line 17
    .line 18
    .line 19
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 23
    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->k:Lcom/android/launcher3/keyboard/b;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Lcom/android/launcher3/keyboard/a;->e(Landroid/graphics/Canvas;)V

    .line 29
    .line 30
    .line 31
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public e0(Lcom/android/launcher3/model/data/y;)Landroid/view/View;
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return-object v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/android/launcher3/model/data/l;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    move-object v2, p1

    .line 10
    check-cast v2, Lcom/android/launcher3/model/data/l;

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-static {v3}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    check-cast v3, Lcom/android/launcher3/views/k;

    .line 21
    .line 22
    const/4 v4, 0x2

    .line 23
    const v5, 0x7f0e00db

    .line 24
    .line 25
    .line 26
    invoke-static {v5, v3, v0, v2, v4}, Lcom/android/launcher3/apppairs/AppPairIcon;->c(ILcom/android/launcher3/views/k;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/l;I)Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->n:Lcom/android/launcher3/util/X2;

    .line 32
    .line 33
    const v3, 0x7f0e00dc

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v2, v3, v4, v0}, Lcom/android/launcher3/util/X2;->b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    move-object v2, v0

    .line 45
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 46
    .line 47
    move-object v3, p1

    .line 48
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 49
    .line 50
    invoke-virtual {v2, v3}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 54
    .line 55
    iget-object v2, v2, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 56
    .line 57
    invoke-interface {v2}, Lcom/android/launcher3/views/k;->getItemOnClickListener()Landroid/view/View$OnClickListener;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 62
    .line 63
    .line 64
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 65
    .line 66
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 67
    .line 68
    .line 69
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->k:Lcom/android/launcher3/keyboard/b;

    .line 70
    .line 71
    invoke-virtual {v0, v2}, Landroid/view/View;->setOnFocusChangeListener(Landroid/view/View$OnFocusChangeListener;)V

    .line 72
    .line 73
    .line 74
    const/4 v2, 0x1

    .line 75
    if-nez v1, :cond_3

    .line 76
    .line 77
    move-object v1, v0

    .line 78
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 79
    .line 80
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-static {v4}, Lcom/android/launcher3/util/F2;->m(Landroid/content/Context;)I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    const v5, 0x7f040781

    .line 93
    .line 94
    .line 95
    invoke-static {v3, v5, v4}, Lcom/android/launcher3/util/F2;->e(Landroid/content/Context;II)I

    .line 96
    .line 97
    .line 98
    move-result v3

    .line 99
    invoke-virtual {v1, v3}, Lcom/android/launcher3/BubbleTextView;->setTextColor(I)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->o:Lcom/android/launcher3/views/k;

    .line 105
    .line 106
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getForeColor()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    const/4 v3, -0x1

    .line 111
    if-ne v3, p0, :cond_2

    .line 112
    .line 113
    move p0, v2

    .line 114
    goto :goto_1

    .line 115
    :cond_2
    const/4 p0, 0x0

    .line 116
    :goto_1
    invoke-static {v1, p0}, Lcom/android/launcher3/O6;->f(Landroid/widget/TextView;Z)V

    .line 117
    .line 118
    .line 119
    :cond_3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    check-cast p0, Lc1/b;

    .line 124
    .line 125
    if-nez p0, :cond_4

    .line 126
    .line 127
    new-instance p0, Lc1/b;

    .line 128
    .line 129
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 130
    .line 131
    iget v2, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 132
    .line 133
    iget v3, p1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 134
    .line 135
    iget p1, p1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 136
    .line 137
    invoke-direct {p0, v1, v2, v3, p1}, Lc1/b;-><init>(IIII)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v0, p0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 141
    .line 142
    .line 143
    return-object v0

    .line 144
    :cond_4
    iget v1, p1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 145
    .line 146
    invoke-virtual {p0, v1}, Lc1/b;->e(I)V

    .line 147
    .line 148
    .line 149
    iget p1, p1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 150
    .line 151
    invoke-virtual {p0, p1}, Lc1/b;->g(I)V

    .line 152
    .line 153
    .line 154
    iput v2, p0, Lc1/b;->g:I

    .line 155
    .line 156
    iput v2, p0, Lc1/b;->f:I

    .line 157
    .line 158
    return-object v0
.end method

.method public f0(II)I
    .locals 8

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->validateNewPage(I)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    :cond_0
    move-object v2, v1

    .line 20
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    sub-int v3, p1, v1

    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    sub-int v4, p2, p1

    .line 31
    .line 32
    sget-object v7, Lcom/android/launcher3/folder/FolderPagedView;->F:[I

    .line 33
    .line 34
    const/4 v5, 0x1

    .line 35
    const/4 v6, 0x1

    .line 36
    invoke-virtual/range {v2 .. v7}, Lcom/android/launcher3/CellLayout;->G(IIII[I)[I

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 40
    .line 41
    invoke-virtual {p1}, Lcom/android/launcher3/folder/Folder;->isLayoutRtl()Z

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/4 p2, 0x1

    .line 46
    const/4 v1, 0x0

    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    aget v2, v7, v1

    .line 54
    .line 55
    sub-int/2addr p1, v2

    .line 56
    sub-int/2addr p1, p2

    .line 57
    aput p1, v7, v1

    .line 58
    .line 59
    :cond_1
    iget p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->o:I

    .line 60
    .line 61
    sub-int/2addr p1, p2

    .line 62
    iget-object v2, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/android/launcher3/folder/A;->f()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    mul-int/2addr v0, v2

    .line 69
    aget p2, v7, p2

    .line 70
    .line 71
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 72
    .line 73
    mul-int/2addr p2, p0

    .line 74
    add-int/2addr v0, p2

    .line 75
    aget p0, v7, v1

    .line 76
    .line 77
    add-int/2addr v0, p0

    .line 78
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    return p0
.end method

.method public g0(I)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/view/View;",
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
    if-ltz p1, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/lit8 v1, v1, -0x1

    .line 13
    .line 14
    if-le p1, v1, :cond_0

    .line 15
    .line 16
    goto :goto_1

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    const/4 p1, 0x0

    .line 31
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-ge p1, v1, :cond_2

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    add-int/lit8 p1, p1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    :goto_1
    return-object v0
.end method

.method public getAccessibilityDescription()Ljava/lang/String;
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 6
    .line 7
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->q:I

    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {v1, p0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const v1, 0x7f1401ad

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0
.end method

.method public getAllocatedContentSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->o:I

    .line 2
    .line 3
    return p0
.end method

.method protected getChildGap(II)I
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    add-int/2addr p1, p0

    .line 10
    return p1
.end method

.method public getCurrentCellLayout()Lcom/android/launcher3/CellLayout;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public getDesiredHeight()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->x:I

    .line 28
    .line 29
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->q:I

    .line 30
    .line 31
    mul-int/2addr v0, v1

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/2addr v0, v1

    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    :goto_0
    add-int/2addr v0, p0

    .line 42
    return v0

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x0

    .line 48
    if-lez v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getDesiredHeight()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    add-int/2addr v0, v1

    .line 63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    return v1
.end method

.method public getDesiredWidth()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getItemCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    iget-object v0, v0, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/q4;->a0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->w:I

    .line 28
    .line 29
    iget v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 30
    .line 31
    mul-int/2addr v0, v1

    .line 32
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    add-int/2addr v0, v1

    .line 37
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    :goto_0
    add-int/2addr v0, p0

    .line 42
    return v0

    .line 43
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getPageCount()I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    const/4 v1, 0x0

    .line 48
    if-lez v0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getDesiredWidth()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    add-int/2addr v0, v1

    .line 63
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    return v1
.end method

.method public getFirstItem()Landroid/view/View;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/a0;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/folder/a0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->j0(Ljava/util/function/ToIntFunction;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public getFolderCellWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->w:I

    .line 2
    .line 3
    return p0
.end method

.method public getGridCountX()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 2
    .line 3
    return p0
.end method

.method public getGridCountY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->q:I

    .line 2
    .line 3
    return p0
.end method

.method public getItemCount()I
    .locals 4

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-gez v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    move v2, v1

    .line 12
    :goto_0
    if-gt v1, v0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 15
    .line 16
    .line 17
    move-result-object v3

    .line 18
    invoke-virtual {v3}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    add-int/2addr v2, v3

    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    return v2
.end method

.method public getLastItem()Landroid/view/View;
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/folder/Z;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/folder/Z;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->j0(Ljava/util/function/ToIntFunction;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public bridge synthetic getPageAt(I)Landroid/view/View;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method getTotalChildCount()I
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lcom/android/launcher3/folder/b0;

    .line 7
    .line 8
    invoke-direct {v1, v0}, Lcom/android/launcher3/folder/b0;-><init>(Ljava/util/concurrent/atomic/AtomicInteger;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->m0(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public h0(I)Lcom/android/launcher3/CellLayout;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 6
    .line 7
    return-object p0
.end method

.method public i0(I)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/List<",
            "Landroid/view/View;",
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
    if-ltz p1, :cond_5

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/lit8 v1, v1, -0x1

    .line 13
    .line 14
    if-le p1, v1, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/launcher3/CellLayout;

    .line 22
    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-nez p0, :cond_2

    .line 31
    .line 32
    goto :goto_2

    .line 33
    :cond_2
    const/4 p1, 0x0

    .line 34
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-ge p1, v1, :cond_5

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    goto :goto_1

    .line 51
    :cond_3
    instance-of v2, v1, Lcom/android/launcher3/BubbleTextView;

    .line 52
    .line 53
    if-eqz v2, :cond_4

    .line 54
    .line 55
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    :cond_4
    :goto_1
    add-int/lit8 p1, p1, 0x1

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_5
    :goto_2
    return-object v0
.end method

.method public iniMfvPageIndicator(Landroid/view/View;)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->g(Landroid/view/ViewGroup;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->p()V

    .line 19
    .line 20
    .line 21
    new-instance p1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v1, 0x0

    .line 31
    :goto_0
    if-ge v1, v0, :cond_0

    .line 32
    .line 33
    invoke-virtual {p0, v1}, Lcom/android/launcher3/V4;->getMfvPageIndicatorMarker(I)Lcom/android/launcher3/pageindicators/b;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    add-int/lit8 v1, v1, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 44
    .line 45
    invoke-virtual {p0, p1}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->e(Ljava/util/List;)V

    .line 46
    .line 47
    .line 48
    :cond_1
    return-void
.end method

.method public initParentViews(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->v()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->initParentViews(Landroid/view/View;)V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->iniMfvPageIndicator(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public l0()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/folder/A;->f()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public m0(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    :goto_0
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v2

    .line 7
    if-ge v1, v2, :cond_3

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    move v3, v0

    .line 14
    :goto_1
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 15
    .line 16
    .line 17
    move-result v4

    .line 18
    if-ge v3, v4, :cond_2

    .line 19
    .line 20
    move v4, v0

    .line 21
    :goto_2
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    if-ge v4, v5, :cond_1

    .line 26
    .line 27
    invoke-virtual {v2, v4, v3}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    if-eqz v5, :cond_0

    .line 32
    .line 33
    invoke-virtual {v5}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    check-cast v6, Lcom/android/launcher3/model/data/y;

    .line 38
    .line 39
    invoke-interface {p1, v6, v5}, Lcom/android/launcher3/util/Y0$a;->a(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z

    .line 40
    .line 41
    .line 42
    move-result v6

    .line 43
    if-eqz v6, :cond_0

    .line 44
    .line 45
    return-object v5

    .line 46
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 47
    .line 48
    goto :goto_2

    .line 49
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const/4 p0, 0x0

    .line 56
    return-object p0
.end method

.method protected notifyPageSwitchListener(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->notifyPageSwitchListener(I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/folder/Folder;->s2()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->E:Landroid/graphics/Rect;

    .line 5
    .line 6
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 7
    .line 8
    iget v2, v0, Landroid/graphics/Rect;->top:I

    .line 9
    .line 10
    iget v3, v0, Landroid/graphics/Rect;->right:I

    .line 11
    .line 12
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 13
    .line 14
    invoke-virtual {p0, v1, v2, v3, v0}, Landroid/view/ViewGroup;->setPadding(IIII)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "FolderPagedView"

    .line 12
    .line 13
    const-string p1, "onInterceptTouchEvent: folder.mIsOpen=false , return!!"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/V4;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method protected onPageBeginTransition()V
    .locals 1

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/V4;->onPageBeginTransition()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    add-int/lit8 v0, v0, -0x1

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->w0(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getCurrentPage()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/lit8 v0, v0, 0x1

    .line 18
    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->w0(I)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method protected onPageEndTransition()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/V4;->onPageEndTransition()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/android/launcher3/folder/FolderPagedView;->v:Lcom/android/launcher3/globalsearch/r$b;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-interface {p0}, Lcom/android/launcher3/globalsearch/r$b;->b()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Lcom/android/launcher3/T6;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    iget p2, p0, Lcom/android/launcher3/V4;->mMaxScroll:I

    .line 5
    .line 6
    if-lez p2, :cond_0

    .line 7
    .line 8
    iget-object p0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    check-cast p0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->d(II)V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/a;->isOpen()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    const-string p0, "FolderPagedView"

    .line 12
    .line 13
    const-string p1, "onTouchEvent: folder.mIsOpen=false, return!!"

    .line 14
    .line 15
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-super {p0, p1}, Lcom/android/launcher3/T6;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public p0(I)Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/A;->f()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    div-int/2addr p1, v0

    .line 8
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-ne p1, p0, :cond_0

    .line 13
    .line 14
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public q0(II)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move/from16 v2, p2

    .line 6
    .line 7
    iget-boolean v3, v0, Lcom/android/launcher3/folder/FolderPagedView;->t:Z

    .line 8
    .line 9
    if-nez v3, :cond_0

    .line 10
    .line 11
    goto/16 :goto_8

    .line 12
    .line 13
    :cond_0
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderPagedView;->b0()V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    iget-object v4, v0, Lcom/android/launcher3/folder/FolderPagedView;->m:Lcom/android/launcher3/folder/A;

    .line 21
    .line 22
    invoke-virtual {v4}, Lcom/android/launcher3/folder/A;->f()I

    .line 23
    .line 24
    .line 25
    move-result v4

    .line 26
    div-int v5, v2, v4

    .line 27
    .line 28
    rem-int v6, v2, v4

    .line 29
    .line 30
    if-eq v5, v3, :cond_1

    .line 31
    .line 32
    const-string v5, "FolderPagedView"

    .line 33
    .line 34
    const-string v7, "Cannot animate when the target cell is invisible"

    .line 35
    .line 36
    invoke-static {v5, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    .line 38
    .line 39
    :cond_1
    rem-int v5, v1, v4

    .line 40
    .line 41
    div-int v7, v1, v4

    .line 42
    .line 43
    if-ne v2, v1, :cond_2

    .line 44
    .line 45
    goto/16 :goto_8

    .line 46
    .line 47
    :cond_2
    const/4 v8, -0x1

    .line 48
    const/4 v9, 0x0

    .line 49
    const/4 v10, 0x1

    .line 50
    if-le v2, v1, :cond_4

    .line 51
    .line 52
    if-ge v7, v3, :cond_3

    .line 53
    .line 54
    mul-int v8, v3, v4

    .line 55
    .line 56
    move v5, v9

    .line 57
    goto :goto_0

    .line 58
    :cond_3
    move v1, v8

    .line 59
    :goto_0
    move v2, v10

    .line 60
    goto :goto_2

    .line 61
    :cond_4
    if-le v7, v3, :cond_5

    .line 62
    .line 63
    add-int/lit8 v2, v3, 0x1

    .line 64
    .line 65
    mul-int/2addr v2, v4

    .line 66
    sub-int/2addr v2, v10

    .line 67
    add-int/lit8 v5, v4, -0x1

    .line 68
    .line 69
    goto :goto_1

    .line 70
    :cond_5
    move v1, v8

    .line 71
    move v2, v1

    .line 72
    :goto_1
    move/from16 v18, v8

    .line 73
    .line 74
    move v8, v2

    .line 75
    move/from16 v2, v18

    .line 76
    .line 77
    :goto_2
    if-eq v1, v8, :cond_a

    .line 78
    .line 79
    add-int v7, v1, v2

    .line 80
    .line 81
    div-int v11, v7, v4

    .line 82
    .line 83
    rem-int v12, v7, v4

    .line 84
    .line 85
    iget v13, v0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 86
    .line 87
    rem-int v14, v12, v13

    .line 88
    .line 89
    div-int/2addr v12, v13

    .line 90
    invoke-virtual {v0, v11}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 91
    .line 92
    .line 93
    move-result-object v13

    .line 94
    invoke-virtual {v13, v14, v12}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 95
    .line 96
    .line 97
    move-result-object v12

    .line 98
    if-eqz v12, :cond_9

    .line 99
    .line 100
    if-eq v3, v11, :cond_6

    .line 101
    .line 102
    invoke-virtual {v13, v12}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v12}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v11

    .line 109
    check-cast v11, Lcom/android/launcher3/model/data/I;

    .line 110
    .line 111
    invoke-virtual {v0, v12, v11, v1}, Lcom/android/launcher3/folder/FolderPagedView;->V(Landroid/view/View;Lcom/android/launcher3/model/data/y;I)V

    .line 112
    .line 113
    .line 114
    goto :goto_6

    .line 115
    :cond_6
    invoke-virtual {v12}, Landroid/view/View;->getTranslationX()F

    .line 116
    .line 117
    .line 118
    move-result v11

    .line 119
    new-instance v13, Lcom/android/launcher3/folder/FolderPagedView$a;

    .line 120
    .line 121
    invoke-direct {v13, v0, v12, v11, v1}, Lcom/android/launcher3/folder/FolderPagedView$a;-><init>(Lcom/android/launcher3/folder/FolderPagedView;Landroid/view/View;FI)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v12}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    if-lez v2, :cond_7

    .line 129
    .line 130
    move v11, v10

    .line 131
    goto :goto_3

    .line 132
    :cond_7
    move v11, v9

    .line 133
    :goto_3
    iget-boolean v14, v0, Lcom/android/launcher3/folder/FolderPagedView;->j:Z

    .line 134
    .line 135
    xor-int/2addr v11, v14

    .line 136
    if-eqz v11, :cond_8

    .line 137
    .line 138
    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    .line 139
    .line 140
    .line 141
    move-result v11

    .line 142
    neg-int v11, v11

    .line 143
    :goto_4
    int-to-float v11, v11

    .line 144
    goto :goto_5

    .line 145
    :cond_8
    invoke-virtual {v12}, Landroid/view/View;->getWidth()I

    .line 146
    .line 147
    .line 148
    move-result v11

    .line 149
    goto :goto_4

    .line 150
    :goto_5
    invoke-virtual {v1, v11}, Landroid/view/ViewPropertyAnimator;->translationXBy(F)Landroid/view/ViewPropertyAnimator;

    .line 151
    .line 152
    .line 153
    move-result-object v1

    .line 154
    const-wide/16 v14, 0xe6

    .line 155
    .line 156
    invoke-virtual {v1, v14, v15}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    const-wide/16 v14, 0x0

    .line 161
    .line 162
    invoke-virtual {v1, v14, v15}, Landroid/view/ViewPropertyAnimator;->setStartDelay(J)Landroid/view/ViewPropertyAnimator;

    .line 163
    .line 164
    .line 165
    move-result-object v1

    .line 166
    invoke-virtual {v1, v13}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    .line 167
    .line 168
    .line 169
    iget-object v1, v0, Lcom/android/launcher3/folder/FolderPagedView;->l:Landroid/util/ArrayMap;

    .line 170
    .line 171
    invoke-virtual {v1, v12, v13}, Landroid/util/ArrayMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    :cond_9
    :goto_6
    move v1, v7

    .line 175
    goto :goto_2

    .line 176
    :cond_a
    sub-int v1, v6, v5

    .line 177
    .line 178
    mul-int/2addr v1, v2

    .line 179
    if-gtz v1, :cond_b

    .line 180
    .line 181
    goto :goto_8

    .line 182
    :cond_b
    invoke-virtual {v0, v3}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 183
    .line 184
    .line 185
    move-result-object v10

    .line 186
    const/high16 v1, 0x41f00000    # 30.0f

    .line 187
    .line 188
    move v15, v9

    .line 189
    :goto_7
    if-eq v5, v6, :cond_d

    .line 190
    .line 191
    add-int v3, v5, v2

    .line 192
    .line 193
    iget v4, v0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 194
    .line 195
    rem-int v7, v3, v4

    .line 196
    .line 197
    div-int v4, v3, v4

    .line 198
    .line 199
    invoke-virtual {v10, v7, v4}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 200
    .line 201
    .line 202
    move-result-object v11

    .line 203
    iget v4, v0, Lcom/android/launcher3/folder/FolderPagedView;->p:I

    .line 204
    .line 205
    rem-int v12, v5, v4

    .line 206
    .line 207
    div-int v13, v5, v4

    .line 208
    .line 209
    const/16 v16, 0x1

    .line 210
    .line 211
    const/16 v17, 0x1

    .line 212
    .line 213
    const/16 v14, 0xe6

    .line 214
    .line 215
    invoke-virtual/range {v10 .. v17}, Lcom/android/launcher3/CellLayout;->g(Landroid/view/View;IIIIZZ)Z

    .line 216
    .line 217
    .line 218
    move-result v4

    .line 219
    if-eqz v4, :cond_c

    .line 220
    .line 221
    int-to-float v4, v15

    .line 222
    add-float/2addr v4, v1

    .line 223
    float-to-int v4, v4

    .line 224
    const v5, 0x3f666666    # 0.9f

    .line 225
    .line 226
    .line 227
    mul-float/2addr v1, v5

    .line 228
    move v15, v4

    .line 229
    :cond_c
    move v5, v3

    .line 230
    goto :goto_7

    .line 231
    :cond_d
    :goto_8
    return-void
.end method

.method public r0(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    if-ltz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1, p1}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    add-int/lit8 v0, v0, -0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    return-void
.end method

.method public s0(II)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    add-int/2addr v0, v1

    .line 10
    sub-int/2addr p1, v0

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    add-int/2addr v0, v1

    .line 20
    sub-int/2addr p2, v0

    .line 21
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/lit8 v0, v0, -0x1

    .line 26
    .line 27
    :goto_0
    if-ltz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    check-cast v1, Lcom/android/launcher3/CellLayout;

    .line 34
    .line 35
    invoke-virtual {v1, p1, p2}, Lcom/android/launcher3/CellLayout;->B0(II)V

    .line 36
    .line 37
    .line 38
    add-int/lit8 v0, v0, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_0
    return-void
.end method

.method setCanAnnouncePageDescriptionForFolder(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->u:Z

    .line 2
    .line 3
    return-void
.end method

.method public setClipPath(Landroid/graphics/Path;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->s:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setFolder(Lcom/android/launcher3/folder/Folder;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->v()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Lcom/android/launcher3/V4;->mPageIndicatorViewId:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iput-object v0, p0, Lcom/android/launcher3/V4;->mPageIndicator:Landroid/view/View;

    .line 20
    .line 21
    check-cast v0, Lcom/android/launcher3/pageindicators/PageIndicatorDots;

    .line 22
    .line 23
    new-instance v1, Lcom/android/launcher3/folder/Y;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Lcom/android/launcher3/folder/Y;-><init>(Lcom/android/launcher3/folder/FolderPagedView;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Lcom/android/launcher3/pageindicators/PageIndicatorDots;->setArrowClickListener(Ljava/util/function/Consumer;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->initParentViews(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public setGSLocationAnimCallback(Lcom/android/launcher3/globalsearch/r$b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/FolderPagedView;->v:Lcom/android/launcher3/globalsearch/r$b;

    .line 2
    .line 3
    return-void
.end method

.method public setMfvPageIndicatorColor(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/pageindicators/c;->setColor(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public t0()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "FolderPagedView"

    .line 8
    .line 9
    const-string v0, "setFocusOnFirstChild--getCurrentCellLayout() == null"

    .line 10
    .line 11
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/folder/FolderPagedView;->getCurrentCellLayout()Lcom/android/launcher3/CellLayout;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-nez p0, :cond_1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const/4 v0, 0x0

    .line 23
    invoke-virtual {p0, v0, v0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_2

    .line 28
    .line 29
    :goto_0
    return-void

    .line 30
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->requestFocus()Z

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public u0(I)V
    .locals 7

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 p1, 0x0

    .line 6
    :goto_0
    iget-boolean v0, p0, Lcom/android/launcher3/folder/FolderPagedView;->j:Z

    .line 7
    .line 8
    xor-int/2addr p1, v0

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    const p1, -0x4270a3d7    # -0.07f

    .line 12
    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    const p1, 0x3d8f5c29    # 0.07f

    .line 16
    .line 17
    .line 18
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getWidth()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    int-to-float v0, v0

    .line 23
    mul-float/2addr p1, v0

    .line 24
    float-to-int p1, p1

    .line 25
    invoke-virtual {p0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    invoke-virtual {p0, v0}, Lcom/android/launcher3/V4;->getScrollForPage(I)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr v0, p1

    .line 34
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    sub-int v4, v0, p1

    .line 39
    .line 40
    if-eqz v4, :cond_2

    .line 41
    .line 42
    iget-object v1, p0, Lcom/android/launcher3/V4;->mScroller:Landroid/widget/OverScroller;

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    const/4 v5, 0x0

    .line 49
    const/16 v6, 0x1f4

    .line 50
    .line 51
    const/4 v3, 0x0

    .line 52
    invoke-virtual/range {v1 .. v6}, Landroid/widget/OverScroller;->startScroll(IIIII)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/android/launcher3/T6;->invalidate()V

    .line 56
    .line 57
    .line 58
    :cond_2
    return-void
.end method

.method public v0()V
    .locals 8

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    add-int/lit8 v0, v0, -0x1

    .line 6
    .line 7
    :goto_0
    const/4 v1, 0x0

    .line 8
    if-ltz v0, :cond_5

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    check-cast v2, Lcom/android/launcher3/CellLayout;

    .line 15
    .line 16
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 21
    .line 22
    .line 23
    move-result v4

    .line 24
    add-int/lit8 v4, v4, -0x1

    .line 25
    .line 26
    :goto_1
    if-ltz v4, :cond_4

    .line 27
    .line 28
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    invoke-virtual {v5, v1}, Landroid/view/View;->setVisibility(I)V

    .line 33
    .line 34
    .line 35
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 36
    .line 37
    invoke-virtual {v6}, Lcom/android/launcher3/folder/Folder;->p1()Z

    .line 38
    .line 39
    .line 40
    move-result v6

    .line 41
    if-eqz v6, :cond_0

    .line 42
    .line 43
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 44
    .line 45
    iget-object v6, v6, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 46
    .line 47
    const/16 v7, 0x8

    .line 48
    .line 49
    invoke-virtual {v6, v7}, Lcom/android/launcher3/model/data/p;->K(I)Z

    .line 50
    .line 51
    .line 52
    move-result v6

    .line 53
    if-nez v6, :cond_0

    .line 54
    .line 55
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    instance-of v6, v6, Lcom/android/launcher3/BubbleTextView;

    .line 60
    .line 61
    if-eqz v6, :cond_0

    .line 62
    .line 63
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    check-cast v6, Lcom/android/launcher3/BubbleTextView;

    .line 68
    .line 69
    invoke-virtual {v6}, Lcom/android/launcher3/BubbleTextView;->getDownloadInstallDrawable()Lr1/c;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    if-eqz v6, :cond_0

    .line 74
    .line 75
    const-string v6, "FolderPagedView"

    .line 76
    .line 77
    const-string v7, "unbindItems resetDownloadInstallDrawable "

    .line 78
    .line 79
    invoke-static {v6, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    check-cast v6, Lcom/android/launcher3/BubbleTextView;

    .line 87
    .line 88
    invoke-virtual {v6}, Lcom/android/launcher3/BubbleTextView;->D0()V

    .line 89
    .line 90
    .line 91
    :cond_0
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 92
    .line 93
    iget-object v6, v6, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 94
    .line 95
    invoke-virtual {v6}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    if-eqz v6, :cond_1

    .line 100
    .line 101
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 102
    .line 103
    iget-object v6, v6, Lcom/android/launcher3/folder/Folder;->n:Lcom/android/launcher3/folder/g0;

    .line 104
    .line 105
    invoke-virtual {v6}, Lcom/android/launcher3/folder/g0;->e()Lcom/android/launcher3/C2;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    invoke-virtual {v6}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-virtual {v6}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 114
    .line 115
    .line 116
    move-result-object v6

    .line 117
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    check-cast v7, Lcom/android/launcher3/BubbleTextView;

    .line 122
    .line 123
    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    move-result v6

    .line 127
    if-eqz v6, :cond_1

    .line 128
    .line 129
    goto :goto_2

    .line 130
    :cond_1
    invoke-static {v5}, Lcom/android/launcher3/folderbatch/g;->e(Landroid/view/View;)Z

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    if-eqz v6, :cond_2

    .line 135
    .line 136
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->r:Lcom/android/launcher3/folder/Folder;

    .line 137
    .line 138
    iput-boolean v1, v6, Lcom/android/launcher3/folder/Folder;->x0:Z

    .line 139
    .line 140
    :cond_2
    instance-of v6, v5, Lcom/android/launcher3/BubbleTextView;

    .line 141
    .line 142
    if-eqz v6, :cond_3

    .line 143
    .line 144
    iget-object v6, p0, Lcom/android/launcher3/folder/FolderPagedView;->n:Lcom/android/launcher3/util/X2;

    .line 145
    .line 146
    const v7, 0x7f0e00dc

    .line 147
    .line 148
    .line 149
    invoke-virtual {v6, v7, v5}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 150
    .line 151
    .line 152
    :cond_3
    :goto_2
    add-int/lit8 v4, v4, -0x1

    .line 153
    .line 154
    goto/16 :goto_1

    .line 155
    .line 156
    :cond_4
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->removeAllViews()V

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->n:Lcom/android/launcher3/util/X2;

    .line 160
    .line 161
    const v3, 0x7f0e00e1

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1, v3, v2}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 165
    .line 166
    .line 167
    add-int/lit8 v0, v0, -0x1

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/android/launcher3/V4;->mMfvPageIndicator:Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;

    .line 175
    .line 176
    if-eqz v0, :cond_6

    .line 177
    .line 178
    invoke-virtual {v0}, Lcom/android/launcher3/pageindicators/MfvPageIndicatorImpl;->p()V

    .line 179
    .line 180
    .line 181
    :cond_6
    iput-boolean v1, p0, Lcom/android/launcher3/folder/FolderPagedView;->t:Z

    .line 182
    .line 183
    return-void
.end method

.method public w0(I)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/folder/FolderPagedView;->h0(I)Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    add-int/lit8 p1, p1, -0x1

    .line 16
    .line 17
    :goto_0
    if-ltz p1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 24
    .line 25
    if-eqz v1, :cond_0

    .line 26
    .line 27
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/BubbleTextView;->W0()V

    .line 30
    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_0
    instance-of v1, v0, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 34
    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    check-cast v0, Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/android/launcher3/apppairs/AppPairIcon;->n()V

    .line 40
    .line 41
    .line 42
    :cond_1
    :goto_1
    add-int/lit8 p1, p1, -0x1

    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    return-void
.end method
