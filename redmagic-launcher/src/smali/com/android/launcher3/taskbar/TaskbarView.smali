.class public Lcom/android/launcher3/taskbar/TaskbarView;
.super Landroid/widget/FrameLayout;
.source "TaskbarView.java"

# interfaces
.implements Lcom/android/launcher3/folder/FolderIcon$d;
.implements Lcom/android/launcher3/g1;
.implements Lcom/android/launcher3/X3$b;


# static fields
.field private static final H:Landroid/graphics/Rect;


# instance fields
.field private A:Z

.field private B:I

.field private C:I

.field private final D:I

.field private E:I

.field private F:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;"
        }
    .end annotation
.end field

.field private G:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;"
        }
    .end annotation
.end field

.field private final g:[I

.field private final h:Landroid/graphics/Rect;

.field private final i:I

.field private final j:I

.field private final k:I

.field private final l:I

.field private final m:Z

.field private final n:Lcom/android/launcher3/taskbar/I1;

.field private o:LN2/h;

.field private p:Lcom/android/launcher3/taskbar/E4;

.field private q:Landroid/view/View$OnClickListener;

.field private r:Landroid/view/View$OnLongClickListener;

.field private s:Lcom/android/launcher3/folder/FolderIcon;

.field private final t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

.field private u:LY1/g;

.field private v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

.field private w:I

.field private x:Z

.field private final y:Landroid/view/View;

.field private final z:F


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/taskbar/TaskbarView;->H:Landroid/graphics/Rect;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/taskbar/TaskbarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/android/launcher3/taskbar/TaskbarView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 5

    .line 3
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    const/4 p2, 0x2

    .line 4
    new-array p3, p2, [I

    iput-object p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->g:[I

    const/4 p3, 0x0

    .line 5
    iput-object p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->o:LN2/h;

    const/4 p3, 0x0

    .line 6
    iput p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->B:I

    .line 7
    iput p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->C:I

    .line 8
    sget-object p4, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    iput-object p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->F:Ljava/util/Set;

    .line 9
    iput-object p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->G:Ljava/util/Set;

    .line 10
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    move-result-object p4

    check-cast p4, Lcom/android/launcher3/taskbar/I1;

    iput-object p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 11
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->H0()Landroid/graphics/Rect;

    move-result-object v0

    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    .line 13
    invoke-static {v0}, Lcom/android/launcher3/N5;->D(Landroid/content/res/Resources;)Z

    move-result v1

    iput-boolean v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    const v1, 0x7f070c20

    .line 14
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v1

    iput v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->z:F

    .line 15
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/android/launcher3/taskbar/TaskbarView;->onDeviceProfileChanged(Lcom/android/launcher3/h0;)V

    const v1, 0x7f070b9c

    .line 16
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 17
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v2

    iget v2, v2, Lcom/android/launcher3/h0;->u3:I

    .line 18
    invoke-static {}, Lf1/a;->e()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    move-result v3

    if-nez v3, :cond_0

    .line 19
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->I0()Lcom/android/launcher3/h0;

    move-result-object v2

    .line 20
    iget v2, v2, Lcom/android/launcher3/h0;->u3:I

    :cond_0
    int-to-float v3, v2

    const v4, 0x3f6b851f    # 0.92f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    const v4, 0x7f070b99

    .line 21
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    .line 22
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    sub-int v2, v0, v3

    .line 23
    div-int/2addr v2, p2

    sub-int/2addr v1, v2

    iput v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 24
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    move-result-object v1

    iget v1, v1, Lcom/android/launcher3/h0;->u3:I

    sub-int v1, v0, v1

    div-int/2addr v1, p2

    iput v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->k:I

    const p2, 0x1010212

    .line 25
    invoke-static {p4, p2}, Lcom/android/launcher3/util/F2;->d(Landroid/content/Context;I)I

    move-result p2

    iput p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->l:I

    .line 26
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->setWillNotDraw(Z)V

    .line 27
    new-instance p2, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    invoke-direct {p2, p1}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 28
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    .line 29
    invoke-virtual {p4}, Lcom/android/launcher3/taskbar/I1;->c()Z

    move-result p4

    .line 30
    invoke-virtual {p2, p4}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->h1(Z)I

    move-result p2

    .line 31
    invoke-virtual {v2, p2}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    iput p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->D:I

    .line 32
    invoke-static {}, Lf1/a;->e()Z

    move-result p2

    if-nez p2, :cond_1

    invoke-static {}, Lcom/android/launcher3/y0;->Q()Z

    move-result p2

    if-eqz p2, :cond_2

    .line 33
    :cond_1
    new-instance p2, LY1/g;

    invoke-direct {p2, p1}, LY1/g;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 34
    :cond_2
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    move-result p2

    if-eqz p2, :cond_3

    const p2, 0x7f0e0235

    .line 35
    invoke-static {p2, p0, v0, v1}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->w(ILandroid/view/ViewGroup;II)Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    move-result-object p2

    iput-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 36
    :cond_3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    const p2, 0x7f0e01dc

    invoke-virtual {p1, p2, p0, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    return-void
.end method

.method private B(Ljava/util/List;I)V
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;I)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-le v0, v2, :cond_0

    .line 14
    .line 15
    move v0, v2

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v1

    .line 18
    :goto_0
    if-eqz v0, :cond_6

    .line 19
    .line 20
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 21
    .line 22
    if-eqz v0, :cond_6

    .line 23
    .line 24
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p2, v0

    .line 29
    add-int/lit8 p2, p2, 0x2

    .line 30
    .line 31
    iput p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->C:I

    .line 32
    .line 33
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->B:I

    .line 34
    .line 35
    sub-int/2addr p2, v0

    .line 36
    if-lez p2, :cond_1

    .line 37
    .line 38
    move v0, v2

    .line 39
    goto :goto_1

    .line 40
    :cond_1
    move v0, v1

    .line 41
    :goto_1
    sget-object v3, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 42
    .line 43
    invoke-virtual {v3}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-nez v4, :cond_2

    .line 48
    .line 49
    if-eqz v0, :cond_2

    .line 50
    .line 51
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 52
    .line 53
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 54
    .line 55
    add-int/lit8 v5, v4, 0x1

    .line 56
    .line 57
    iput v5, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 58
    .line 59
    invoke-virtual {p0, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 60
    .line 61
    .line 62
    goto :goto_2

    .line 63
    :cond_2
    invoke-virtual {v3}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    if-eqz v3, :cond_5

    .line 68
    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    iget-boolean v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 72
    .line 73
    if-nez v3, :cond_4

    .line 74
    .line 75
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->G:Ljava/util/Set;

    .line 76
    .line 77
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    .line 78
    .line 79
    .line 80
    move-result v3

    .line 81
    if-eqz v3, :cond_3

    .line 82
    .line 83
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 84
    .line 85
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 86
    .line 87
    invoke-virtual {p0, v3, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 88
    .line 89
    .line 90
    :cond_3
    iget v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 91
    .line 92
    add-int/2addr v3, v2

    .line 93
    iput v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_4
    if-nez v0, :cond_7

    .line 97
    .line 98
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->G:Ljava/util/Set;

    .line 99
    .line 100
    invoke-interface {v3}, Ljava/util/Set;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    if-nez v3, :cond_7

    .line 105
    .line 106
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 107
    .line 108
    invoke-virtual {p0, v3}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 109
    .line 110
    .line 111
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 112
    .line 113
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->r()V

    .line 114
    .line 115
    .line 116
    goto :goto_2

    .line 117
    :cond_5
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 118
    .line 119
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->r()V

    .line 120
    .line 121
    .line 122
    goto :goto_2

    .line 123
    :cond_6
    move p2, v1

    .line 124
    move v0, p2

    .line 125
    :cond_7
    :goto_2
    if-eqz v0, :cond_8

    .line 126
    .line 127
    add-int/2addr p2, v2

    .line 128
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    invoke-static {p2, v3}, Ljava/lang/Math;->min(II)I

    .line 133
    .line 134
    .line 135
    move-result p2

    .line 136
    goto :goto_3

    .line 137
    :cond_8
    move p2, v1

    .line 138
    :goto_3
    if-eqz v0, :cond_b

    .line 139
    .line 140
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 141
    .line 142
    if-eqz v3, :cond_b

    .line 143
    .line 144
    iget-boolean v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 145
    .line 146
    if-eqz v3, :cond_9

    .line 147
    .line 148
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 149
    .line 150
    .line 151
    move-result v3

    .line 152
    sub-int/2addr v3, p2

    .line 153
    goto :goto_4

    .line 154
    :cond_9
    move v3, v1

    .line 155
    :goto_4
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 156
    .line 157
    if-eqz v4, :cond_a

    .line 158
    .line 159
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 160
    .line 161
    .line 162
    move-result v4

    .line 163
    goto :goto_5

    .line 164
    :cond_a
    move v4, p2

    .line 165
    :goto_5
    invoke-interface {p1, v3, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    iget-object v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 170
    .line 171
    invoke-interface {v3}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 172
    .line 173
    .line 174
    move-result-object v5

    .line 175
    new-instance v6, Lcom/android/launcher3/taskbar/v4;

    .line 176
    .line 177
    invoke-direct {v6}, Lcom/android/launcher3/taskbar/v4;-><init>()V

    .line 178
    .line 179
    .line 180
    invoke-interface {v5, v6}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 181
    .line 182
    .line 183
    move-result-object v5

    .line 184
    invoke-interface {v5}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 185
    .line 186
    .line 187
    move-result-object v5

    .line 188
    invoke-virtual {v4, v5}, Lcom/android/launcher3/taskbar/TaskbarOverflowView;->setItems(Ljava/util/List;)V

    .line 189
    .line 190
    .line 191
    new-instance v4, Landroid/util/ArraySet;

    .line 192
    .line 193
    invoke-direct {v4, v3}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    .line 194
    .line 195
    .line 196
    goto :goto_6

    .line 197
    :cond_b
    sget-object v4, Ljava/util/Collections;->EMPTY_SET:Ljava/util/Set;

    .line 198
    .line 199
    :goto_6
    new-instance v3, Landroid/util/ArraySet;

    .line 200
    .line 201
    invoke-direct {v3, p1}, Landroid/util/ArraySet;-><init>(Ljava/util/Collection;)V

    .line 202
    .line 203
    .line 204
    iget-boolean v5, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 205
    .line 206
    if-eqz v5, :cond_c

    .line 207
    .line 208
    move v6, v1

    .line 209
    goto :goto_7

    .line 210
    :cond_c
    move v6, p2

    .line 211
    :goto_7
    if-eqz v5, :cond_d

    .line 212
    .line 213
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 214
    .line 215
    .line 216
    move-result v5

    .line 217
    sub-int/2addr v5, p2

    .line 218
    goto :goto_8

    .line 219
    :cond_d
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    :goto_8
    invoke-interface {p1, v6, v5}, Ljava/util/List;->subList(II)Ljava/util/List;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 228
    .line 229
    .line 230
    move-result-object p1

    .line 231
    :goto_9
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 232
    .line 233
    .line 234
    move-result p2

    .line 235
    const-class v5, Lcom/android/quickstep/util/GroupTask;

    .line 236
    .line 237
    if-eqz p2, :cond_18

    .line 238
    .line 239
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 240
    .line 241
    .line 242
    move-result-object p2

    .line 243
    check-cast p2, Lcom/android/quickstep/util/GroupTask;

    .line 244
    .line 245
    instance-of v6, p2, Lcom/android/quickstep/util/SingleTask;

    .line 246
    .line 247
    if-nez v6, :cond_e

    .line 248
    .line 249
    iget-object v6, p2, Lcom/android/quickstep/util/GroupTask;->taskViewType:Lcom/android/quickstep/views/TaskViewType;

    .line 250
    .line 251
    sget-object v6, Lcom/android/quickstep/views/TaskViewType;->SINGLE:Lcom/android/quickstep/views/TaskViewType;

    .line 252
    .line 253
    const/4 v6, -0x1

    .line 254
    move v7, v2

    .line 255
    goto :goto_a

    .line 256
    :cond_e
    const v6, 0x7f0e022b

    .line 257
    .line 258
    .line 259
    move v7, v1

    .line 260
    :goto_a
    sget-object v8, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 261
    .line 262
    invoke-virtual {v8}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 263
    .line 264
    .line 265
    move-result v8

    .line 266
    if-eqz v8, :cond_10

    .line 267
    .line 268
    iget-object v8, p0, Lcom/android/launcher3/taskbar/TaskbarView;->F:Ljava/util/Set;

    .line 269
    .line 270
    invoke-interface {v8, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result v8

    .line 274
    if-eqz v8, :cond_f

    .line 275
    .line 276
    iget-object v8, p0, Lcom/android/launcher3/taskbar/TaskbarView;->G:Ljava/util/Set;

    .line 277
    .line 278
    invoke-interface {v8, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 279
    .line 280
    .line 281
    move-result v8

    .line 282
    if-nez v8, :cond_f

    .line 283
    .line 284
    goto :goto_b

    .line 285
    :cond_f
    move v8, v1

    .line 286
    goto :goto_c

    .line 287
    :cond_10
    :goto_b
    move v8, v2

    .line 288
    :goto_c
    if-eqz v8, :cond_13

    .line 289
    .line 290
    invoke-direct {p0, v5}, Lcom/android/launcher3/taskbar/TaskbarView;->r(Ljava/lang/Class;)Z

    .line 291
    .line 292
    .line 293
    move-result v9

    .line 294
    if-eqz v9, :cond_13

    .line 295
    .line 296
    iget v9, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 297
    .line 298
    invoke-virtual {p0, v9}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 299
    .line 300
    .line 301
    move-result-object v9

    .line 302
    invoke-virtual {v9}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v10

    .line 306
    check-cast v10, Lcom/android/quickstep/util/GroupTask;

    .line 307
    .line 308
    invoke-virtual {v9}, Landroid/view/View;->getSourceLayoutResId()I

    .line 309
    .line 310
    .line 311
    move-result v11

    .line 312
    if-ne v11, v6, :cond_12

    .line 313
    .line 314
    if-eqz v7, :cond_11

    .line 315
    .line 316
    if-ne v10, p2, :cond_12

    .line 317
    .line 318
    :cond_11
    sget-object v11, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 319
    .line 320
    invoke-virtual {v11}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 321
    .line 322
    .line 323
    move-result v11

    .line 324
    if-eqz v11, :cond_14

    .line 325
    .line 326
    invoke-interface {v3, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result v11

    .line 330
    if-eqz v11, :cond_12

    .line 331
    .line 332
    invoke-interface {v4, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 333
    .line 334
    .line 335
    move-result v10

    .line 336
    if-eqz v10, :cond_14

    .line 337
    .line 338
    :cond_12
    invoke-direct {p0, v9}, Lcom/android/launcher3/taskbar/TaskbarView;->u(Landroid/view/View;)V

    .line 339
    .line 340
    .line 341
    goto :goto_c

    .line 342
    :cond_13
    const/4 v9, 0x0

    .line 343
    :cond_14
    if-nez v9, :cond_15

    .line 344
    .line 345
    invoke-direct {p0, v6}, Lcom/android/launcher3/taskbar/TaskbarView;->n(I)Landroid/view/View;

    .line 346
    .line 347
    .line 348
    move-result-object v9

    .line 349
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    .line 350
    .line 351
    iget v6, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 352
    .line 353
    invoke-direct {v5, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 354
    .line 355
    .line 356
    iget v6, p0, Lcom/android/launcher3/taskbar/TaskbarView;->k:I

    .line 357
    .line 358
    invoke-virtual {v9, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 359
    .line 360
    .line 361
    iget v6, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 362
    .line 363
    invoke-virtual {p0, v9, v6, v5}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 364
    .line 365
    .line 366
    :cond_15
    instance-of v5, v9, Lcom/android/launcher3/BubbleTextView;

    .line 367
    .line 368
    if-eqz v5, :cond_16

    .line 369
    .line 370
    move-object v5, v9

    .line 371
    check-cast v5, Lcom/android/launcher3/BubbleTextView;

    .line 372
    .line 373
    invoke-virtual {p0, v5, p2}, Lcom/android/launcher3/taskbar/TaskbarView;->i(Lcom/android/launcher3/BubbleTextView;Lcom/android/quickstep/util/GroupTask;)V

    .line 374
    .line 375
    .line 376
    :cond_16
    invoke-virtual {p0, v9}, Lcom/android/launcher3/taskbar/TaskbarView;->setClickAndLongClickListenersForIcon(Landroid/view/View;)V

    .line 377
    .line 378
    .line 379
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 380
    .line 381
    .line 382
    move-result p2

    .line 383
    if-eqz p2, :cond_17

    .line 384
    .line 385
    invoke-direct {p0, v9}, Lcom/android/launcher3/taskbar/TaskbarView;->setHoverListenerForIcon(Landroid/view/View;)V

    .line 386
    .line 387
    .line 388
    :cond_17
    iget p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 389
    .line 390
    add-int/2addr p2, v2

    .line 391
    iput p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 392
    .line 393
    goto/16 :goto_9

    .line 394
    .line 395
    :cond_18
    :goto_d
    invoke-direct {p0, v5}, Lcom/android/launcher3/taskbar/TaskbarView;->r(Ljava/lang/Class;)Z

    .line 396
    .line 397
    .line 398
    move-result p1

    .line 399
    if-eqz p1, :cond_19

    .line 400
    .line 401
    iget p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 402
    .line 403
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->u(Landroid/view/View;)V

    .line 408
    .line 409
    .line 410
    goto :goto_d

    .line 411
    :cond_19
    sget-object p1, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 412
    .line 413
    invoke-virtual {p1}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 414
    .line 415
    .line 416
    move-result p1

    .line 417
    if-eqz p1, :cond_1b

    .line 418
    .line 419
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 420
    .line 421
    if-eqz p1, :cond_1b

    .line 422
    .line 423
    if-eqz v0, :cond_1b

    .line 424
    .line 425
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->G:Ljava/util/Set;

    .line 426
    .line 427
    invoke-interface {p1}, Ljava/util/Set;->isEmpty()Z

    .line 428
    .line 429
    .line 430
    move-result p1

    .line 431
    if-eqz p1, :cond_1a

    .line 432
    .line 433
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 434
    .line 435
    iget p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 436
    .line 437
    invoke-virtual {p0, p1, p2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 438
    .line 439
    .line 440
    :cond_1a
    iget p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 441
    .line 442
    add-int/2addr p1, v2

    .line 443
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 444
    .line 445
    :cond_1b
    iput-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->F:Ljava/util/Set;

    .line 446
    .line 447
    iput-object v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->G:Ljava/util/Set;

    .line 448
    .line 449
    return-void
.end method

.method private C(Z)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 9
    .line 10
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 17
    .line 18
    if-ne v0, v1, :cond_0

    .line 19
    .line 20
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 21
    .line 22
    sub-int/2addr v0, p1

    .line 23
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 24
    .line 25
    :cond_0
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 29
    .line 30
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 31
    .line 32
    invoke-virtual {p0, p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_1
    if-nez p1, :cond_2

    .line 37
    .line 38
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 39
    .line 40
    if-eqz p1, :cond_2

    .line 41
    .line 42
    const/4 p1, 0x0

    .line 43
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 44
    .line 45
    iget p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->removeViewAt(I)V

    .line 48
    .line 49
    .line 50
    :cond_2
    return-void
.end method

.method public static synthetic b(I)[Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    new-array p0, p0, [Lcom/android/launcher3/model/data/y;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Lcom/android/quickstep/util/GroupTask;)Lcom/android/systemui/shared/recents/model/Task;
    .locals 0

    .line 1
    check-cast p0, Lcom/android/quickstep/util/SingleTask;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic d(Lcom/android/quickstep/util/GroupTask;)Z
    .locals 0

    .line 1
    instance-of p0, p0, Lcom/android/quickstep/util/SingleTask;

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic e(Lcom/android/launcher3/taskbar/TaskbarView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarView;->s(Landroid/view/View;Landroid/view/MotionEvent;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private f()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->M0:Z

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 17
    .line 18
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 19
    .line 20
    invoke-virtual {p0, v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x2

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method private getIconLayoutWidth()I
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 6
    .line 7
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    iget-boolean v1, v1, Lcom/android/launcher3/h0;->M0:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    add-int/lit8 v0, v0, -0x1

    .line 16
    .line 17
    :cond_0
    iget v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 18
    .line 19
    mul-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 22
    .line 23
    add-int/2addr v1, v2

    .line 24
    mul-int/2addr v1, v0

    .line 25
    invoke-static {}, Lf1/a;->e()Z

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    const/4 v2, 0x1

    .line 32
    if-le v0, v2, :cond_1

    .line 33
    .line 34
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 35
    .line 36
    mul-int/lit8 v0, v0, 0x4

    .line 37
    .line 38
    sub-int/2addr v1, v0

    .line 39
    :cond_1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->D:I

    .line 40
    .line 41
    sub-int/2addr v1, p0

    .line 42
    return v1
.end method

.method private getTaskbarIconsActualBounds()Landroid/graphics/Rect;
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconViews()[Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    array-length v1, v0

    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance p0, Landroid/graphics/Rect;

    .line 9
    .line 10
    invoke-direct {p0}, Landroid/graphics/Rect;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 v1, 0x2

    .line 15
    new-array v2, v1, [I

    .line 16
    .line 17
    new-array v1, v1, [I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    aget-object v4, v0, v3

    .line 21
    .line 22
    invoke-virtual {v4, v2}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 23
    .line 24
    .line 25
    array-length v4, v0

    .line 26
    add-int/lit8 v4, v4, -0x1

    .line 27
    .line 28
    aget-object v0, v0, v4

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Landroid/graphics/Rect;

    .line 34
    .line 35
    aget v2, v2, v3

    .line 36
    .line 37
    aget v1, v1, v3

    .line 38
    .line 39
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 40
    .line 41
    add-int/2addr v1, v4

    .line 42
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-direct {v0, v2, v3, v1, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 47
    .line 48
    .line 49
    return-object v0
.end method

.method private h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/E4;->l()LN2/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 10
    .line 11
    const v1, 0x7f14041d

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {v0, v1}, LN2/h;->e(Z)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    iget-object v0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 33
    .line 34
    const v1, 0x7f14041e

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_1
    iget-object v0, p0, Landroid/widget/FrameLayout;->mContext:Landroid/content/Context;

    .line 46
    .line 47
    const v1, 0x7f14041f

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->announceForAccessibility(Ljava/lang/CharSequence;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method private k()I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget v1, v0, Lcom/android/launcher3/h0;->T0:I

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, v0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 14
    .line 15
    iget v3, v3, Lcom/android/launcher3/F1;->T0:I

    .line 16
    .line 17
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    float-to-int v2, v2

    .line 22
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 23
    .line 24
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/E4;->m()F

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    add-int v4, v2, v3

    .line 33
    .line 34
    iget v5, v0, Lcom/android/launcher3/h0;->h2:I

    .line 35
    .line 36
    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    .line 37
    .line 38
    .line 39
    move-result v4

    .line 40
    sub-int/2addr v1, v4

    .line 41
    iget-boolean v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->A:Z

    .line 42
    .line 43
    const/4 v5, 0x0

    .line 44
    if-eqz v4, :cond_0

    .line 45
    .line 46
    move v3, v5

    .line 47
    :cond_0
    add-int/2addr v2, v3

    .line 48
    if-eqz v4, :cond_1

    .line 49
    .line 50
    move v0, v5

    .line 51
    goto :goto_0

    .line 52
    :cond_1
    iget v0, v0, Lcom/android/launcher3/h0;->h2:I

    .line 53
    .line 54
    :goto_0
    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    sub-int/2addr v1, v0

    .line 59
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 60
    .line 61
    mul-int/lit8 v2, v0, 0x2

    .line 62
    .line 63
    iget v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 64
    .line 65
    add-int/2addr v2, v3

    .line 66
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 67
    .line 68
    const/4 v4, 0x1

    .line 69
    if-eqz v3, :cond_2

    .line 70
    .line 71
    mul-int/lit8 v0, v0, 0x4

    .line 72
    .line 73
    sub-int v0, v2, v0

    .line 74
    .line 75
    sub-int/2addr v1, v0

    .line 76
    move v0, v4

    .line 77
    goto :goto_1

    .line 78
    :cond_2
    move v0, v5

    .line 79
    :goto_1
    invoke-static {}, Lf1/a;->e()Z

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    if-eqz v3, :cond_3

    .line 84
    .line 85
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 86
    .line 87
    invoke-virtual {v3}, Lcom/android/launcher3/taskbar/I1;->i1()Z

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    if-nez v3, :cond_3

    .line 92
    .line 93
    move v3, v4

    .line 94
    goto :goto_2

    .line 95
    :cond_3
    move v3, v5

    .line 96
    :goto_2
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 97
    .line 98
    .line 99
    move-result-object v6

    .line 100
    iget-object v7, p0, Lcom/android/launcher3/taskbar/TaskbarView;->t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 101
    .line 102
    if-nez v3, :cond_4

    .line 103
    .line 104
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 105
    .line 106
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/I1;->c()Z

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    if-eqz p0, :cond_5

    .line 111
    .line 112
    :cond_4
    move v5, v4

    .line 113
    :cond_5
    invoke-virtual {v7, v5}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->h1(Z)I

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    invoke-virtual {v6, p0}, Landroid/content/res/Resources;->getDimension(I)F

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    float-to-int p0, p0

    .line 122
    sub-int p0, v2, p0

    .line 123
    .line 124
    sub-int/2addr v1, p0

    .line 125
    add-int/2addr v0, v4

    .line 126
    invoke-static {v1, v2}, Ljava/lang/Math;->floorDiv(II)I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    add-int/2addr p0, v0

    .line 131
    return p0
.end method

.method private l(LN2/h;)F
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    invoke-virtual {p1, v1}, LN2/h;->e(Z)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iget v0, v0, Lcom/android/launcher3/h0;->h2:I

    .line 16
    .line 17
    if-eqz p1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    sub-int/2addr p0, v0

    .line 24
    int-to-float p0, p0

    .line 25
    return p0

    .line 26
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconLayoutWidth()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    add-int/2addr v0, p0

    .line 31
    int-to-float p0, v0

    .line 32
    return p0
.end method

.method private n(I)Landroid/view/View;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/util/s;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 8
    .line 9
    invoke-virtual {v0, p1, v1, p0}, Lcom/android/launcher3/util/X2;->b(ILandroid/content/Context;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private r(Ljava/lang/Class;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method private synthetic s(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    const/16 v0, 0x2002

    .line 2
    .line 3
    invoke-virtual {p2, v0}, Landroid/view/MotionEvent;->isFromSource(I)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getButtonState()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    and-int/lit8 p2, p2, 0x2

    .line 14
    .line 15
    if-eqz p2, :cond_0

    .line 16
    .line 17
    instance-of p2, p1, Lcom/android/launcher3/BubbleTextView;

    .line 18
    .line 19
    if-eqz p2, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 22
    .line 23
    check-cast p1, Lcom/android/launcher3/BubbleTextView;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/I1;->s2(Lcom/android/launcher3/BubbleTextView;)V

    .line 26
    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    const/4 p0, 0x0

    .line 31
    return p0
.end method

.method private setHoverListenerForIcon(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/taskbar/E4;->p(Landroid/view/View;)Landroid/view/View$OnHoverListener;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnHoverListener(Landroid/view/View$OnHoverListener;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private u(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    instance-of v1, v1, Lcom/android/launcher3/model/data/m;

    .line 16
    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/android/launcher3/util/s;->getViewCache()Lcom/android/launcher3/util/X2;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getSourceLayoutResId()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p0, v1, p1}, Lcom/android/launcher3/util/X2;->c(ILandroid/view/View;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    invoke-virtual {p1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method private v()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 10
    .line 11
    sub-int/2addr v0, v1

    .line 12
    add-int/lit8 v0, v0, -0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 16
    .line 17
    :goto_0
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 22
    .line 23
    if-ne v1, v2, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    if-ne v1, v2, :cond_1

    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 46
    .line 47
    if-eq v1, v2, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 54
    .line 55
    add-int/lit8 v2, v2, 0x1

    .line 56
    .line 57
    if-lt v1, v2, :cond_3

    .line 58
    .line 59
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 60
    .line 61
    iget-boolean v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 62
    .line 63
    if-eqz v2, :cond_2

    .line 64
    .line 65
    add-int/lit8 v0, v0, 0x1

    .line 66
    .line 67
    :cond_2
    invoke-virtual {p0, v1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 68
    .line 69
    .line 70
    :cond_3
    return-void
.end method

.method private w([Lcom/android/launcher3/model/data/y;)V
    .locals 12

    .line 1
    array-length v0, p1

    .line 2
    const/4 v1, 0x0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    const-class v4, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    if-ge v2, v0, :cond_e

    .line 8
    .line 9
    aget-object v5, p1, v2

    .line 10
    .line 11
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/y;->isPredictedItem()Z

    .line 12
    .line 13
    .line 14
    move-result v6

    .line 15
    const/16 v7, 0xa

    .line 16
    .line 17
    const/4 v8, 0x1

    .line 18
    if-eqz v6, :cond_0

    .line 19
    .line 20
    const v6, 0x7f0e0236

    .line 21
    .line 22
    .line 23
    :goto_1
    move v9, v1

    .line 24
    goto :goto_3

    .line 25
    :cond_0
    instance-of v6, v5, Lcom/android/launcher3/model/data/m;

    .line 26
    .line 27
    if-eqz v6, :cond_2

    .line 28
    .line 29
    move-object v6, v5

    .line 30
    check-cast v6, Lcom/android/launcher3/model/data/m;

    .line 31
    .line 32
    iget v6, v6, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 33
    .line 34
    if-ne v6, v7, :cond_1

    .line 35
    .line 36
    const v6, 0x7f0e006e

    .line 37
    .line 38
    .line 39
    goto :goto_2

    .line 40
    :cond_1
    const v6, 0x7f0e00e0

    .line 41
    .line 42
    .line 43
    :goto_2
    move v9, v8

    .line 44
    goto :goto_3

    .line 45
    :cond_2
    const v6, 0x7f0e022b

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :goto_3
    invoke-direct {p0, v4}, Lcom/android/launcher3/taskbar/TaskbarView;->r(Ljava/lang/Class;)Z

    .line 50
    .line 51
    .line 52
    move-result v10

    .line 53
    if-eqz v10, :cond_4

    .line 54
    .line 55
    iget v10, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 56
    .line 57
    invoke-virtual {p0, v10}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 58
    .line 59
    .line 60
    move-result-object v10

    .line 61
    invoke-virtual {v10}, Landroid/view/View;->getSourceLayoutResId()I

    .line 62
    .line 63
    .line 64
    move-result v11

    .line 65
    if-ne v11, v6, :cond_3

    .line 66
    .line 67
    if-eqz v9, :cond_5

    .line 68
    .line 69
    invoke-virtual {v10}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    move-result-object v11

    .line 73
    if-eq v11, v5, :cond_5

    .line 74
    .line 75
    :cond_3
    invoke-direct {p0, v10}, Lcom/android/launcher3/taskbar/TaskbarView;->u(Landroid/view/View;)V

    .line 76
    .line 77
    .line 78
    goto :goto_3

    .line 79
    :cond_4
    const/4 v10, 0x0

    .line 80
    :cond_5
    if-nez v10, :cond_9

    .line 81
    .line 82
    if-eqz v9, :cond_8

    .line 83
    .line 84
    move-object v4, v5

    .line 85
    check-cast v4, Lcom/android/launcher3/model/data/m;

    .line 86
    .line 87
    iget v9, v5, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 88
    .line 89
    const/4 v10, 0x2

    .line 90
    if-eq v9, v10, :cond_7

    .line 91
    .line 92
    if-ne v9, v7, :cond_6

    .line 93
    .line 94
    iget-object v7, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 95
    .line 96
    check-cast v4, Lcom/android/launcher3/model/data/l;

    .line 97
    .line 98
    const/4 v9, 0x5

    .line 99
    invoke-static {v6, v7, p0, v4, v9}, Lcom/android/launcher3/apppairs/AppPairIcon;->c(ILcom/android/launcher3/views/k;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/l;I)Lcom/android/launcher3/apppairs/AppPairIcon;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-virtual {v4, v1}, Lcom/android/launcher3/apppairs/AppPairIcon;->setTextVisible(Z)V

    .line 104
    .line 105
    .line 106
    goto :goto_4

    .line 107
    :cond_6
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 108
    .line 109
    new-instance p1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v0, "Unexpected item type: "

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget v0, v5, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 120
    .line 121
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    throw p0

    .line 132
    :cond_7
    iget-object v7, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 133
    .line 134
    check-cast v4, Lcom/android/launcher3/model/data/p;

    .line 135
    .line 136
    invoke-static {v6, v7, p0, v4}, Lcom/android/launcher3/folder/FolderIcon;->K(ILandroid/content/Context;Landroid/view/ViewGroup;Lcom/android/launcher3/model/data/p;)Lcom/android/launcher3/folder/FolderIcon;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    invoke-virtual {v4, v1}, Lcom/android/launcher3/folder/FolderIcon;->setTextVisible(Z)V

    .line 141
    .line 142
    .line 143
    :goto_4
    move-object v10, v4

    .line 144
    goto :goto_5

    .line 145
    :cond_8
    invoke-direct {p0, v6}, Lcom/android/launcher3/taskbar/TaskbarView;->n(I)Landroid/view/View;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    goto :goto_4

    .line 150
    :goto_5
    new-instance v4, Landroid/widget/FrameLayout$LayoutParams;

    .line 151
    .line 152
    iget v6, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 153
    .line 154
    invoke-direct {v4, v6, v6}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 155
    .line 156
    .line 157
    iget v6, p0, Lcom/android/launcher3/taskbar/TaskbarView;->k:I

    .line 158
    .line 159
    invoke-virtual {v10, v6, v6, v6, v6}, Landroid/view/View;->setPadding(IIII)V

    .line 160
    .line 161
    .line 162
    iget v6, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 163
    .line 164
    invoke-virtual {p0, v10, v6, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 165
    .line 166
    .line 167
    goto :goto_6

    .line 168
    :cond_9
    instance-of v4, v10, Lcom/android/launcher3/folder/FolderIcon;

    .line 169
    .line 170
    if-eqz v4, :cond_a

    .line 171
    .line 172
    move-object v4, v10

    .line 173
    check-cast v4, Lcom/android/launcher3/folder/FolderIcon;

    .line 174
    .line 175
    invoke-virtual {v4, v1}, Lcom/android/launcher3/folder/FolderIcon;->b0(Z)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v4}, Lcom/android/launcher3/folder/FolderIcon;->getFolder()Lcom/android/launcher3/folder/Folder;

    .line 179
    .line 180
    .line 181
    move-result-object v4

    .line 182
    invoke-virtual {v4}, Lcom/android/launcher3/folder/Folder;->Q1()V

    .line 183
    .line 184
    .line 185
    :cond_a
    :goto_6
    instance-of v4, v10, Lcom/android/launcher3/BubbleTextView;

    .line 186
    .line 187
    if-eqz v4, :cond_c

    .line 188
    .line 189
    move-object v4, v10

    .line 190
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 191
    .line 192
    instance-of v6, v5, Lcom/android/launcher3/model/data/I;

    .line 193
    .line 194
    if-eqz v6, :cond_c

    .line 195
    .line 196
    check-cast v5, Lcom/android/launcher3/model/data/I;

    .line 197
    .line 198
    instance-of v6, v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 199
    .line 200
    if-eqz v6, :cond_b

    .line 201
    .line 202
    check-cast v4, Lcom/android/launcher3/uioverrides/PredictedAppIcon;

    .line 203
    .line 204
    invoke-virtual {v4, v5, v3}, Lcom/android/launcher3/uioverrides/PredictedAppIcon;->m1(Lcom/android/launcher3/model/data/I;I)Z

    .line 205
    .line 206
    .line 207
    move-result v4

    .line 208
    if-eqz v4, :cond_c

    .line 209
    .line 210
    add-int/lit8 v3, v3, 0x1

    .line 211
    .line 212
    goto :goto_7

    .line 213
    :cond_b
    invoke-virtual {v4, v5}, Lcom/android/launcher3/BubbleTextView;->y(Lcom/android/launcher3/model/data/I;)V

    .line 214
    .line 215
    .line 216
    :cond_c
    :goto_7
    invoke-virtual {p0, v10}, Lcom/android/launcher3/taskbar/TaskbarView;->setClickAndLongClickListenersForIcon(Landroid/view/View;)V

    .line 217
    .line 218
    .line 219
    invoke-static {}, Lcom/android/launcher3/y0;->k()Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    if-eqz v4, :cond_d

    .line 224
    .line 225
    invoke-direct {p0, v10}, Lcom/android/launcher3/taskbar/TaskbarView;->setHoverListenerForIcon(Landroid/view/View;)V

    .line 226
    .line 227
    .line 228
    :cond_d
    iget v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 229
    .line 230
    add-int/2addr v4, v8

    .line 231
    iput v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 232
    .line 233
    add-int/lit8 v2, v2, 0x1

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :cond_e
    :goto_8
    invoke-direct {p0, v4}, Lcom/android/launcher3/taskbar/TaskbarView;->r(Ljava/lang/Class;)Z

    .line 238
    .line 239
    .line 240
    move-result p1

    .line 241
    if-eqz p1, :cond_f

    .line 242
    .line 243
    iget p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 244
    .line 245
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->u(Landroid/view/View;)V

    .line 250
    .line 251
    .line 252
    goto :goto_8

    .line 253
    :cond_f
    return-void
.end method

.method private y([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->f()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 10
    .line 11
    :cond_0
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->E:I

    .line 18
    .line 19
    :goto_0
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 26
    .line 27
    if-ne v0, v1, :cond_2

    .line 28
    .line 29
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 30
    .line 31
    if-nez v0, :cond_2

    .line 32
    .line 33
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 34
    .line 35
    add-int/lit8 v0, v0, 0x1

    .line 36
    .line 37
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 38
    .line 39
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 40
    .line 41
    if-eqz v0, :cond_3

    .line 42
    .line 43
    invoke-interface {p2}, Ljava/util/List;->reversed()Ljava/util/List;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    array-length v1, p1

    .line 48
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/taskbar/TaskbarView;->B(Ljava/util/List;I)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :cond_3
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->w([Lcom/android/launcher3/model/data/y;)V

    .line 53
    .line 54
    .line 55
    :goto_1
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    xor-int/lit8 v0, v0, 0x1

    .line 60
    .line 61
    invoke-direct {p0, v0}, Lcom/android/launcher3/taskbar/TaskbarView;->C(Z)V

    .line 62
    .line 63
    .line 64
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 65
    .line 66
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 71
    .line 72
    if-ne v0, v1, :cond_4

    .line 73
    .line 74
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 75
    .line 76
    add-int/lit8 v0, v0, 0x1

    .line 77
    .line 78
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 79
    .line 80
    :cond_4
    iget-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 81
    .line 82
    if-eqz v0, :cond_5

    .line 83
    .line 84
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->w([Lcom/android/launcher3/model/data/y;)V

    .line 85
    .line 86
    .line 87
    goto :goto_2

    .line 88
    :cond_5
    array-length p1, p1

    .line 89
    invoke-direct {p0, p2, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->B(Ljava/util/List;I)V

    .line 90
    .line 91
    .line 92
    :goto_2
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 93
    .line 94
    if-nez p1, :cond_6

    .line 95
    .line 96
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->V0()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-nez p1, :cond_6

    .line 103
    .line 104
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->v()V

    .line 105
    .line 106
    .line 107
    :cond_6
    return-void
.end method

.method private z([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 3
    .line 4
    iput-boolean v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 5
    .line 6
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 26
    .line 27
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    .line 28
    .line 29
    .line 30
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->w([Lcom/android/launcher3/model/data/y;)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 34
    .line 35
    const/4 v2, 0x1

    .line 36
    if-eqz v1, :cond_2

    .line 37
    .line 38
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    .line 39
    .line 40
    .line 41
    move-result v1

    .line 42
    if-nez v1, :cond_2

    .line 43
    .line 44
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 45
    .line 46
    iget v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 47
    .line 48
    add-int/lit8 v4, v3, 0x1

    .line 49
    .line 50
    iput v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->w:I

    .line 51
    .line 52
    invoke-virtual {p0, v1, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 53
    .line 54
    .line 55
    iput-boolean v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 56
    .line 57
    :cond_2
    array-length v1, p1

    .line 58
    invoke-direct {p0, p2, v1}, Lcom/android/launcher3/taskbar/TaskbarView;->B(Ljava/util/List;I)V

    .line 59
    .line 60
    .line 61
    iget-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 62
    .line 63
    iget-boolean v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 64
    .line 65
    if-eqz v1, :cond_3

    .line 66
    .line 67
    array-length p1, p1

    .line 68
    goto :goto_0

    .line 69
    :cond_3
    move p1, v0

    .line 70
    :goto_0
    invoke-virtual {p0, p2, p1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 71
    .line 72
    .line 73
    iget-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 78
    .line 79
    if-eqz p1, :cond_5

    .line 80
    .line 81
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-le p1, v2, :cond_5

    .line 86
    .line 87
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 88
    .line 89
    iget-boolean p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 90
    .line 91
    if-eqz p2, :cond_4

    .line 92
    .line 93
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    add-int/lit8 v2, p2, -0x1

    .line 98
    .line 99
    :cond_4
    invoke-virtual {p0, p1, v2}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 100
    .line 101
    .line 102
    :cond_5
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    iget-boolean p1, p1, Lcom/android/launcher3/h0;->M0:Z

    .line 109
    .line 110
    if-eqz p1, :cond_7

    .line 111
    .line 112
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 113
    .line 114
    iget-boolean p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->m:Z

    .line 115
    .line 116
    if-eqz p2, :cond_6

    .line 117
    .line 118
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    :cond_6
    invoke-virtual {p0, p1, v0}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;I)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 126
    .line 127
    const/4 p1, 0x4

    .line 128
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 129
    .line 130
    .line 131
    :cond_7
    return-void
.end method


# virtual methods
.method A()Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->B:I

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->k()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    iput v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->B:I

    .line 16
    .line 17
    if-eq v0, v2, :cond_2

    .line 18
    .line 19
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->C:I

    .line 20
    .line 21
    if-gt p0, v0, :cond_1

    .line 22
    .line 23
    if-le p0, v2, :cond_2

    .line 24
    .line 25
    :cond_1
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_2
    return v1
.end method

.method public a(Lcom/android/launcher3/folder/FolderIcon;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->s:Lcom/android/launcher3/folder/FolderIcon;

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected g()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isVisibleToUser()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->h()V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-static {p0}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/android/launcher3/views/k;

    .line 19
    .line 20
    invoke-interface {p0}, Lcom/android/launcher3/views/k;->getDragLayer()Lcom/android/launcher3/views/BaseDragLayer;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    const/16 v0, 0x800

    .line 25
    .line 26
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->sendAccessibilityEvent(I)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public getAllAppsButtonContainer()Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 2
    .line 3
    return-object p0
.end method

.method public getAllAppsButtonTranslationXOffsetUsedForLayout()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public getIconTouchSize()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 2
    .line 3
    return p0
.end method

.method public getIconViews()[Landroid/view/View;
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    new-array p0, v1, [Landroid/view/View;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 12
    .line 13
    invoke-virtual {v2}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-boolean v2, v2, Lcom/android/launcher3/h0;->M0:Z

    .line 18
    .line 19
    sub-int v2, v0, v2

    .line 20
    .line 21
    new-array v2, v2, [Landroid/view/View;

    .line 22
    .line 23
    move v3, v1

    .line 24
    :goto_0
    if-ge v1, v0, :cond_2

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    iget-object v5, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 31
    .line 32
    if-ne v4, v5, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    add-int/lit8 v4, v3, 0x1

    .line 36
    .line 37
    invoke-virtual {p0, v1}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    aput-object v5, v2, v3

    .line 42
    .line 43
    move v3, v4

    .line 44
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-object v2
.end method

.method getMaxNumIconViews()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->B:I

    .line 2
    .line 3
    return p0
.end method

.method public getQsb()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTaskbarDividerViewContainer()LY1/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTaskbarOverflowView()Lcom/android/launcher3/taskbar/TaskbarOverflowView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTransientTaskbarIconLayoutBounds()Landroid/graphics/Rect;
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public getTransientTaskbarIconLayoutBoundsInParent()Landroid/graphics/Rect;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getTop()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iput v1, v0, Landroid/graphics/Rect;->top:I

    .line 13
    .line 14
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getBottom()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    iput p0, v0, Landroid/graphics/Rect;->bottom:I

    .line 19
    .line 20
    return-object v0
.end method

.method public i(Lcom/android/launcher3/BubbleTextView;Lcom/android/quickstep/util/GroupTask;)V
    .locals 1

    .line 1
    instance-of p0, p2, Lcom/android/quickstep/util/SingleTask;

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    check-cast p2, Lcom/android/quickstep/util/SingleTask;

    .line 6
    .line 7
    invoke-virtual {p2}, Lcom/android/quickstep/util/SingleTask;->getTask()Lcom/android/systemui/shared/recents/model/Task;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget-object v0, p0, Lcom/android/systemui/shared/recents/model/Task;->icon:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable$ConstantState;->newDrawable()Landroid/graphics/drawable/Drawable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/android/systemui/shared/recents/model/Task;->titleDescription:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/BubbleTextView;->z(Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->setTag(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    :cond_1
    return-void
.end method

.method public j()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public m(LN2/h;)F
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/E4;->x()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->o:LN2/h;

    .line 10
    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->p2()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTransientTaskbarIconLayoutBoundsInParent()Landroid/graphics/Rect;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {p0, p1}, Lcom/android/launcher3/taskbar/TaskbarView;->l(LN2/h;)F

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    iget p1, v0, Landroid/graphics/Rect;->right:I

    .line 31
    .line 32
    int-to-float p1, p1

    .line 33
    sub-float/2addr p0, p1

    .line 34
    return p0

    .line 35
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method protected o(Lcom/android/launcher3/taskbar/E4;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const v1, 0x7f140420

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->setAccessibilityPaneTitle(Ljava/lang/CharSequence;)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/E4;->o()Landroid/view/View$OnClickListener;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->q:Landroid/view/View$OnClickListener;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/E4;->q()Landroid/view/View$OnLongClickListener;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->r:Landroid/view/View$OnLongClickListener;

    .line 30
    .line 31
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->t:Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/android/launcher3/taskbar/customization/TaskbarAllAppsButtonContainer;->setUpCallbacks(Lcom/android/launcher3/taskbar/E4;)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->F0()LY1/h;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-virtual {v0}, LY1/h;->e()Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 53
    .line 54
    invoke-virtual {v0, p1}, LY1/g;->setUpCallbacks(Lcom/android/launcher3/taskbar/E4;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 58
    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/E4;->r()Landroid/view/View$OnClickListener;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->v:Lcom/android/launcher3/taskbar/TaskbarOverflowView;

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/E4;->s()Landroid/view/View$OnLongClickListener;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    invoke-virtual {p1, v0}, Landroid/widget/FrameLayout;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    invoke-static {}, Lcom/android/launcher3/y0;->E0()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_2

    .line 86
    .line 87
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->F0()LY1/h;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    invoke-virtual {p1}, LY1/h;->e()Z

    .line 94
    .line 95
    .line 96
    move-result p1

    .line 97
    if-eqz p1, :cond_2

    .line 98
    .line 99
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/E4;->v()Landroid/view/View$OnTouchListener;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-virtual {p0, p1}, Landroid/widget/FrameLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    invoke-static {}, Lcom/android/launcher3/y0;->G0()Z

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    if-eqz p1, :cond_3

    .line 113
    .line 114
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->k()I

    .line 115
    .line 116
    .line 117
    move-result p1

    .line 118
    iput p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->B:I

    .line 119
    .line 120
    :cond_3
    return-void
.end method

.method protected onAttachedToWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onAttachedToWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->addOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method protected onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 5
    .line 6
    invoke-interface {v0, p0}, Lcom/android/launcher3/views/k;->removeOnDeviceProfileChangeListener(Lcom/android/launcher3/X3$b;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onDeviceProfileChanged(Lcom/android/launcher3/h0;)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/I1;->p2()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->A:Z

    .line 8
    .line 9
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->s:Lcom/android/launcher3/folder/FolderIcon;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->s:Lcom/android/launcher3/folder/FolderIcon;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLeft()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    int-to-float v0, v0

    .line 18
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->s:Lcom/android/launcher3/folder/FolderIcon;

    .line 19
    .line 20
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getTranslationX()F

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-float/2addr v0, v1

    .line 25
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->s:Lcom/android/launcher3/folder/FolderIcon;

    .line 26
    .line 27
    invoke-virtual {v1}, Landroid/widget/FrameLayout;->getTop()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    int-to-float v1, v1

    .line 32
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->s:Lcom/android/launcher3/folder/FolderIcon;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/android/launcher3/folder/FolderIcon;->getFolderBackground()Lcom/android/launcher3/folder/u0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->l:I

    .line 42
    .line 43
    invoke-virtual {v0, p1, p0}, Lcom/android/launcher3/folder/u0;->s0(Landroid/graphics/Canvas;I)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 5

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getIconLayoutWidth()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isLayoutRtl()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/taskbar/I1;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget v2, v1, Lcom/android/launcher3/h0;->h2:I

    .line 16
    .line 17
    add-int/2addr p2, p4

    .line 18
    add-int/2addr p2, p1

    .line 19
    div-int/lit8 p2, p2, 0x2

    .line 20
    .line 21
    iget-boolean v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->A:Z

    .line 22
    .line 23
    if-eqz v3, :cond_5

    .line 24
    .line 25
    iget v3, v1, Lcom/android/launcher3/h0;->j2:I

    .line 26
    .line 27
    iget-object v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 28
    .line 29
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/E4;->x()Z

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    if-eqz v4, :cond_0

    .line 34
    .line 35
    iget-object v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->o:LN2/h;

    .line 36
    .line 37
    if-eqz v4, :cond_0

    .line 38
    .line 39
    iget-object v4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 40
    .line 41
    invoke-virtual {v4}, Lcom/android/launcher3/taskbar/I1;->p2()Z

    .line 42
    .line 43
    .line 44
    move-result v4

    .line 45
    if-eqz v4, :cond_0

    .line 46
    .line 47
    iget-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->o:LN2/h;

    .line 48
    .line 49
    invoke-direct {p0, p2}, Lcom/android/launcher3/taskbar/TaskbarView;->l(LN2/h;)F

    .line 50
    .line 51
    .line 52
    move-result p2

    .line 53
    float-to-int p2, p2

    .line 54
    goto :goto_3

    .line 55
    :cond_0
    if-eqz v0, :cond_1

    .line 56
    .line 57
    sub-int v3, p4, v3

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_1
    add-int/2addr v3, p1

    .line 61
    :goto_0
    if-eqz v0, :cond_2

    .line 62
    .line 63
    sub-int v4, v3, p1

    .line 64
    .line 65
    if-le v2, v4, :cond_4

    .line 66
    .line 67
    goto :goto_1

    .line 68
    :cond_2
    sub-int v4, p4, v2

    .line 69
    .line 70
    if-le v3, v4, :cond_4

    .line 71
    .line 72
    :goto_1
    if-eqz v0, :cond_3

    .line 73
    .line 74
    sub-int v3, p2, p1

    .line 75
    .line 76
    sub-int/2addr v2, v3

    .line 77
    goto :goto_2

    .line 78
    :cond_3
    sub-int v2, p4, v2

    .line 79
    .line 80
    sub-int/2addr v2, p2

    .line 81
    :goto_2
    add-int/2addr p2, v2

    .line 82
    goto :goto_3

    .line 83
    :cond_4
    move p2, v3

    .line 84
    :cond_5
    :goto_3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getDisplay()Landroid/view/Display;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    invoke-virtual {v2}, Landroid/view/Display;->getCutout()Landroid/view/DisplayCutout;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    if-eqz v2, :cond_7

    .line 93
    .line 94
    invoke-virtual {v2}, Landroid/view/DisplayCutout;->getBoundingRectBottom()Landroid/graphics/Rect;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v3}, Landroid/graphics/Rect;->isEmpty()Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-nez v3, :cond_7

    .line 103
    .line 104
    invoke-virtual {v2}, Landroid/view/DisplayCutout;->getBoundingRectBottom()Landroid/graphics/Rect;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    sub-int v3, p2, p1

    .line 109
    .line 110
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-gt v3, v4, :cond_7

    .line 115
    .line 116
    invoke-virtual {v2}, Landroid/graphics/Rect;->centerX()I

    .line 117
    .line 118
    .line 119
    move-result v3

    .line 120
    if-gt v3, p2, :cond_7

    .line 121
    .line 122
    if-nez v0, :cond_6

    .line 123
    .line 124
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    add-int/2addr p2, p1

    .line 129
    goto :goto_4

    .line 130
    :cond_6
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 131
    .line 132
    .line 133
    move-result p1

    .line 134
    sub-int p2, p4, p1

    .line 135
    .line 136
    :cond_7
    :goto_4
    sget-object p1, Lcom/android/launcher3/taskbar/TaskbarView;->H:Landroid/graphics/Rect;

    .line 137
    .line 138
    iget-object p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 139
    .line 140
    invoke-virtual {p1, p4}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    .line 141
    .line 142
    .line 143
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 144
    .line 145
    iput p2, p1, Landroid/graphics/Rect;->right:I

    .line 146
    .line 147
    sub-int/2addr p5, p3

    .line 148
    iget p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 149
    .line 150
    sub-int p4, p5, p3

    .line 151
    .line 152
    div-int/lit8 p4, p4, 0x2

    .line 153
    .line 154
    iput p4, p1, Landroid/graphics/Rect;->top:I

    .line 155
    .line 156
    add-int/2addr p4, p3

    .line 157
    iput p4, p1, Landroid/graphics/Rect;->bottom:I

    .line 158
    .line 159
    if-eqz v0, :cond_8

    .line 160
    .line 161
    iget p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->D:I

    .line 162
    .line 163
    add-int/2addr p2, p1

    .line 164
    :cond_8
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 165
    .line 166
    invoke-virtual {p1}, Lcom/android/launcher3/taskbar/E4;->E()V

    .line 167
    .line 168
    .line 169
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getChildCount()I

    .line 170
    .line 171
    .line 172
    move-result p1

    .line 173
    :goto_5
    if-lez p1, :cond_c

    .line 174
    .line 175
    add-int/lit8 p3, p1, -0x1

    .line 176
    .line 177
    invoke-virtual {p0, p3}, Landroid/widget/FrameLayout;->getChildAt(I)Landroid/view/View;

    .line 178
    .line 179
    .line 180
    move-result-object p3

    .line 181
    iget-object p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->y:Landroid/view/View;

    .line 182
    .line 183
    if-ne p3, p4, :cond_a

    .line 184
    .line 185
    if-eqz v0, :cond_9

    .line 186
    .line 187
    iget p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 188
    .line 189
    add-int/2addr p4, p2

    .line 190
    iget v2, v1, Lcom/android/launcher3/h0;->o2:I

    .line 191
    .line 192
    add-int/2addr v2, p4

    .line 193
    goto :goto_6

    .line 194
    :cond_9
    iget p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 195
    .line 196
    sub-int v2, p2, p4

    .line 197
    .line 198
    iget p4, v1, Lcom/android/launcher3/h0;->o2:I

    .line 199
    .line 200
    sub-int p4, v2, p4

    .line 201
    .line 202
    :goto_6
    iget v3, v1, Lcom/android/launcher3/h0;->p2:I

    .line 203
    .line 204
    sub-int v4, p5, v3

    .line 205
    .line 206
    div-int/lit8 v4, v4, 0x2

    .line 207
    .line 208
    add-int/2addr v3, v4

    .line 209
    invoke-virtual {p3, p4, v4, v2, v3}, Landroid/view/View;->layout(IIII)V

    .line 210
    .line 211
    .line 212
    goto :goto_8

    .line 213
    :cond_a
    iget-object p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->u:LY1/g;

    .line 214
    .line 215
    if-ne p3, p4, :cond_b

    .line 216
    .line 217
    iget p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 218
    .line 219
    add-int/2addr p2, p4

    .line 220
    iget p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 221
    .line 222
    sub-int p4, p2, p4

    .line 223
    .line 224
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 225
    .line 226
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 227
    .line 228
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 229
    .line 230
    invoke-virtual {p3, p4, v3, p2, v2}, Landroid/view/View;->layout(IIII)V

    .line 231
    .line 232
    .line 233
    iget p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 234
    .line 235
    add-int/2addr p4, p2

    .line 236
    :goto_7
    move p2, p4

    .line 237
    goto :goto_8

    .line 238
    :cond_b
    iget p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 239
    .line 240
    sub-int/2addr p2, p4

    .line 241
    iget p4, p0, Lcom/android/launcher3/taskbar/TaskbarView;->i:I

    .line 242
    .line 243
    sub-int p4, p2, p4

    .line 244
    .line 245
    iget-object v2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 246
    .line 247
    iget v3, v2, Landroid/graphics/Rect;->top:I

    .line 248
    .line 249
    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    .line 250
    .line 251
    invoke-virtual {p3, p4, v3, p2, v2}, Landroid/view/View;->layout(IIII)V

    .line 252
    .line 253
    .line 254
    iget p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->j:I

    .line 255
    .line 256
    sub-int/2addr p4, p2

    .line 257
    goto :goto_7

    .line 258
    :goto_8
    add-int/lit8 p1, p1, -0x1

    .line 259
    .line 260
    goto :goto_5

    .line 261
    :cond_c
    iget-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 262
    .line 263
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 264
    .line 265
    if-nez v0, :cond_d

    .line 266
    .line 267
    iget p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->D:I

    .line 268
    .line 269
    add-int/2addr p2, p3

    .line 270
    iput p2, p1, Landroid/graphics/Rect;->left:I

    .line 271
    .line 272
    :cond_d
    iget p2, p1, Landroid/graphics/Rect;->right:I

    .line 273
    .line 274
    iget p3, p1, Landroid/graphics/Rect;->left:I

    .line 275
    .line 276
    sub-int/2addr p2, p3

    .line 277
    int-to-float p2, p2

    .line 278
    iget p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->z:F

    .line 279
    .line 280
    cmpg-float p2, p2, p3

    .line 281
    .line 282
    if-gez p2, :cond_e

    .line 283
    .line 284
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    .line 285
    .line 286
    .line 287
    move-result p1

    .line 288
    iget p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->z:F

    .line 289
    .line 290
    float-to-int p2, p2

    .line 291
    div-int/lit8 p2, p2, 0x2

    .line 292
    .line 293
    iget-object p3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 294
    .line 295
    add-int p4, p1, p2

    .line 296
    .line 297
    iput p4, p3, Landroid/graphics/Rect;->right:I

    .line 298
    .line 299
    sub-int/2addr p1, p2

    .line 300
    iput p1, p3, Landroid/graphics/Rect;->left:I

    .line 301
    .line 302
    :cond_e
    sget-object p1, Lcom/android/launcher3/taskbar/TaskbarView;->H:Landroid/graphics/Rect;

    .line 303
    .line 304
    iget-object p2, p0, Lcom/android/launcher3/taskbar/TaskbarView;->h:Landroid/graphics/Rect;

    .line 305
    .line 306
    invoke-virtual {p1, p2}, Landroid/graphics/Rect;->equals(Ljava/lang/Object;)Z

    .line 307
    .line 308
    .line 309
    move-result p1

    .line 310
    if-nez p1, :cond_f

    .line 311
    .line 312
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 313
    .line 314
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/E4;->B()V

    .line 315
    .line 316
    .line 317
    :cond_f
    return-void
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->x:Z

    .line 2
    .line 3
    return p0
.end method

.method public q(Landroid/view/MotionEvent;)Z
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->g:[I

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->getLocationOnScreen([I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    float-to-int v0, v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->g:[I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    aget v1, v1, v2

    .line 15
    .line 16
    sub-int/2addr v0, v1

    .line 17
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    float-to-int v1, v1

    .line 22
    iget-object v3, p0, Lcom/android/launcher3/taskbar/TaskbarView;->g:[I

    .line 23
    .line 24
    const/4 v4, 0x1

    .line 25
    aget v3, v3, v4

    .line 26
    .line 27
    sub-int/2addr v1, v3

    .line 28
    invoke-virtual {p1}, Landroid/view/MotionEvent;->recycle()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->isShown()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    invoke-direct {p0}, Lcom/android/launcher3/taskbar/TaskbarView;->getTaskbarIconsActualBounds()Landroid/graphics/Rect;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-virtual {p0, v0, v1}, Landroid/graphics/Rect;->contains(II)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_0

    .line 46
    .line 47
    return v4

    .line 48
    :cond_0
    return v2
.end method

.method public setClickAndLongClickListenersForIcon(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->q:Landroid/view/View$OnClickListener;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->r:Landroid/view/View$OnLongClickListener;

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Lcom/android/launcher3/taskbar/s4;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/android/launcher3/taskbar/s4;-><init>(Lcom/android/launcher3/taskbar/TaskbarView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setInsets(Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setVisibility(I)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eq v0, p1, :cond_0

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 v0, 0x0

    .line 10
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 11
    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->p:Lcom/android/launcher3/taskbar/E4;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/taskbar/E4;->C()V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public t(LN2/h;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->o:LN2/h;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lcom/android/launcher3/taskbar/TaskbarView;->o:LN2/h;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method protected x([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Lcom/android/launcher3/model/data/y;",
            "Ljava/util/List<",
            "Lcom/android/quickstep/util/GroupTask;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/taskbar/TaskbarView;->n:Lcom/android/launcher3/taskbar/I1;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/taskbar/I1;->Q0()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-static {p1}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Lcom/android/launcher3/G;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/G;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Lcom/android/launcher3/taskbar/t4;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/t4;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->toArray(Ljava/util/function/IntFunction;)[Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, [Lcom/android/launcher3/model/data/y;

    .line 33
    .line 34
    invoke-interface {p2}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    new-instance v0, Lcom/android/launcher3/taskbar/u4;

    .line 39
    .line 40
    invoke-direct {v0}, Lcom/android/launcher3/taskbar/u4;-><init>()V

    .line 41
    .line 42
    .line 43
    invoke-interface {p2, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    invoke-interface {p2}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    sget-object v0, Landroid/window/DesktopModeFlags;->ENABLE_TASKBAR_RECENTS_LAYOUT_TRANSITION:Landroid/window/DesktopModeFlags;

    .line 52
    .line 53
    invoke-virtual {v0}, Landroid/window/DesktopModeFlags;->isTrue()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarView;->y([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/taskbar/TaskbarView;->z([Lcom/android/launcher3/model/data/y;Ljava/util/List;)V

    .line 64
    .line 65
    .line 66
    return-void
.end method
