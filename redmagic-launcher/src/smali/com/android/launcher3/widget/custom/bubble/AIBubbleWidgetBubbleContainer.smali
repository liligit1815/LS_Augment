.class public Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;
.super Landroid/widget/FrameLayout;
.source "AIBubbleWidgetBubbleContainer.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;,
        Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;
    }
.end annotation


# static fields
.field private static final B:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/util/List<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final C:I

.field private static final D:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/graphics/PointF;",
            ">;"
        }
    .end annotation
.end field

.field private static final E:I

.field private static final F:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final G:Landroid/view/animation/PathInterpolator;

.field private static H:I


# instance fields
.field private A:J

.field private g:Landroid/view/ViewGroup;

.field private h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

.field private i:Z

.field private j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation
.end field

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation
.end field

.field private l:Landroid/animation/AnimatorSet;

.field private m:Z

.field private n:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation
.end field

.field private o:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation
.end field

.field private p:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation
.end field

.field private q:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;",
            ">;"
        }
    .end annotation
.end field

.field private r:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;",
            ">;"
        }
    .end annotation
.end field

.field private s:Landroid/widget/ImageView;

.field private t:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;"
        }
    .end annotation
.end field

.field private u:Z

.field private v:Ljava/util/Random;

.field private w:Landroid/animation/AnimatorSet;

.field private x:Landroid/animation/TimeAnimator;

.field private y:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;",
            ">;"
        }
    .end annotation
.end field

.field private z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 12

    .line 1
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 2
    .line 3
    const v1, 0x3e3851ec    # 0.18f

    .line 4
    .line 5
    .line 6
    const v2, 0x3e947ae1    # 0.29f

    .line 7
    .line 8
    .line 9
    const/16 v3, 0x28

    .line 10
    .line 11
    const/4 v4, 0x0

    .line 12
    invoke-direct {v0, v1, v2, v3, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 13
    .line 14
    .line 15
    new-instance v5, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 16
    .line 17
    const v6, 0x3f59999a    # 0.85f

    .line 18
    .line 19
    .line 20
    const v7, 0x3eb851ec    # 0.36f

    .line 21
    .line 22
    .line 23
    const/16 v8, 0x20

    .line 24
    .line 25
    invoke-direct {v5, v6, v7, v8, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 26
    .line 27
    .line 28
    new-instance v7, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 29
    .line 30
    const v9, 0x3edc28f6    # 0.43f

    .line 31
    .line 32
    .line 33
    const v10, 0x3f4a3d71    # 0.79f

    .line 34
    .line 35
    .line 36
    const/16 v11, 0x18

    .line 37
    .line 38
    invoke-direct {v7, v9, v10, v11, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 39
    .line 40
    .line 41
    filled-new-array {v0, v5, v7}, [Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v5, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 50
    .line 51
    const v7, 0x3f19999a    # 0.6f

    .line 52
    .line 53
    .line 54
    const v9, 0x3db851ec    # 0.09f

    .line 55
    .line 56
    .line 57
    invoke-direct {v5, v7, v9, v11, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 58
    .line 59
    .line 60
    new-instance v7, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 61
    .line 62
    const/high16 v9, 0x3f000000    # 0.5f

    .line 63
    .line 64
    invoke-direct {v7, v6, v9, v3, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 65
    .line 66
    .line 67
    new-instance v6, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 68
    .line 69
    const v9, 0x3ecccccd    # 0.4f

    .line 70
    .line 71
    .line 72
    const v11, 0x3f47ae14    # 0.78f

    .line 73
    .line 74
    .line 75
    invoke-direct {v6, v9, v11, v8, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 76
    .line 77
    .line 78
    filled-new-array {v5, v7, v6}, [Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    new-instance v6, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 87
    .line 88
    const v7, 0x3e99999a    # 0.3f

    .line 89
    .line 90
    .line 91
    invoke-direct {v6, v7, v2, v8, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 92
    .line 93
    .line 94
    new-instance v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 95
    .line 96
    const v7, 0x3f3d70a4    # 0.74f

    .line 97
    .line 98
    .line 99
    const v9, 0x3f0ccccd    # 0.55f

    .line 100
    .line 101
    .line 102
    invoke-direct {v2, v7, v9, v3, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 103
    .line 104
    .line 105
    new-instance v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 106
    .line 107
    const v7, 0x3ee66666    # 0.45f

    .line 108
    .line 109
    .line 110
    invoke-direct {v3, v7, v10, v8, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;-><init>(FFILcom/android/launcher3/widget/custom/bubble/g;)V

    .line 111
    .line 112
    .line 113
    filled-new-array {v6, v2, v3}, [Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    const/4 v3, 0x3

    .line 122
    new-array v3, v3, [Ljava/util/List;

    .line 123
    .line 124
    const/4 v4, 0x0

    .line 125
    aput-object v0, v3, v4

    .line 126
    .line 127
    const/4 v0, 0x1

    .line 128
    aput-object v5, v3, v0

    .line 129
    .line 130
    const/4 v0, 0x2

    .line 131
    aput-object v2, v3, v0

    .line 132
    .line 133
    invoke-static {v3}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->B:Ljava/util/List;

    .line 138
    .line 139
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-nez v2, :cond_0

    .line 144
    .line 145
    invoke-interface {v0, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    check-cast v0, Ljava/util/List;

    .line 150
    .line 151
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    :cond_0
    sput v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->C:I

    .line 156
    .line 157
    new-instance v0, Landroid/graphics/PointF;

    .line 158
    .line 159
    const v2, 0x3ea3d70a    # 0.32f

    .line 160
    .line 161
    .line 162
    const v3, 0x3ed70a3d    # 0.42f

    .line 163
    .line 164
    .line 165
    invoke-direct {v0, v2, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 166
    .line 167
    .line 168
    new-instance v2, Landroid/graphics/PointF;

    .line 169
    .line 170
    const/high16 v3, 0x3e800000    # 0.25f

    .line 171
    .line 172
    invoke-direct {v2, v3, v1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 173
    .line 174
    .line 175
    new-instance v1, Landroid/graphics/PointF;

    .line 176
    .line 177
    const v3, 0x3e851eb8    # 0.26f

    .line 178
    .line 179
    .line 180
    const v4, 0x3f3851ec    # 0.72f

    .line 181
    .line 182
    .line 183
    invoke-direct {v1, v4, v3}, Landroid/graphics/PointF;-><init>(FF)V

    .line 184
    .line 185
    .line 186
    new-instance v3, Landroid/graphics/PointF;

    .line 187
    .line 188
    const v5, 0x3e8f5c29    # 0.28f

    .line 189
    .line 190
    .line 191
    const v6, 0x3f28f5c3    # 0.66f

    .line 192
    .line 193
    .line 194
    invoke-direct {v3, v5, v6}, Landroid/graphics/PointF;-><init>(FF)V

    .line 195
    .line 196
    .line 197
    new-instance v5, Landroid/graphics/PointF;

    .line 198
    .line 199
    invoke-direct {v5, v11, v4}, Landroid/graphics/PointF;-><init>(FF)V

    .line 200
    .line 201
    .line 202
    filled-new-array {v0, v2, v1, v3, v5}, [Landroid/graphics/PointF;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->D:Ljava/util/List;

    .line 211
    .line 212
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    sput v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->E:I

    .line 217
    .line 218
    const-string v0, "com.android.calendar"

    .line 219
    .line 220
    const-string v1, "com.android.messaging"

    .line 221
    .line 222
    const-string v2, "com.tencent.mm"

    .line 223
    .line 224
    const-string v3, "com.android.contacts"

    .line 225
    .line 226
    filled-new-array {v2, v3, v0, v1}, [Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->F:Ljava/util/List;

    .line 235
    .line 236
    new-instance v0, Landroid/view/animation/PathInterpolator;

    .line 237
    .line 238
    const v1, 0x3eb33333    # 0.35f

    .line 239
    .line 240
    .line 241
    const/high16 v2, 0x3f800000    # 1.0f

    .line 242
    .line 243
    const v3, 0x3f266666    # 0.65f

    .line 244
    .line 245
    .line 246
    const/4 v4, 0x0

    .line 247
    invoke-direct {v0, v3, v4, v1, v2}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 248
    .line 249
    .line 250
    sput-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->G:Landroid/view/animation/PathInterpolator;

    .line 251
    .line 252
    const/16 v0, 0x1770

    .line 253
    .line 254
    sput v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->H:I

    .line 255
    .line 256
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x0

    .line 3
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->i:Z

    .line 4
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j:Ljava/util/ArrayList;

    .line 5
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->k:Ljava/util/ArrayList;

    const/4 p2, 0x0

    .line 6
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->l:Landroid/animation/AnimatorSet;

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->m:Z

    .line 8
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->n:Ljava/util/ArrayList;

    .line 9
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 10
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 11
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->q:Ljava/util/ArrayList;

    .line 12
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->r:Ljava/util/ArrayList;

    .line 13
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 14
    new-instance p3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$e;

    invoke-direct {p3, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$e;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)V

    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->t:Ljava/util/Comparator;

    .line 15
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 16
    new-instance p3, Ljava/util/Random;

    invoke-direct {p3}, Ljava/util/Random;-><init>()V

    iput-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v:Ljava/util/Random;

    .line 17
    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 18
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 19
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z:Z

    return-void
.end method

.method private B(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;)Z"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_5

    .line 2
    .line 3
    if-eqz p3, :cond_5

    .line 4
    .line 5
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eq p0, v0, :cond_0

    .line 14
    .line 15
    goto :goto_2

    .line 16
    :cond_0
    new-instance p0, Ljava/util/HashMap;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v0, Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p2

    .line 30
    :cond_1
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-eqz v1, :cond_2

    .line 35
    .line 36
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 41
    .line 42
    if-eqz v1, :cond_1

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    iget-object v2, v1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 51
    .line 52
    invoke-virtual {v1, p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->getShowInfoCompareString(Z)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {p0, v2, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    invoke-virtual {p3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    :cond_3
    :goto_1
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result p3

    .line 68
    if-eqz p3, :cond_4

    .line 69
    .line 70
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    check-cast p3, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 75
    .line 76
    if-eqz p3, :cond_3

    .line 77
    .line 78
    invoke-virtual {p3}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 79
    .line 80
    .line 81
    move-result v1

    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    iget-object v1, p3, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p3, p1}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->getShowInfoCompareString(Z)Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p3

    .line 90
    invoke-virtual {v0, v1, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_4
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->equals(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    move-result p0

    .line 98
    return p0

    .line 99
    :cond_5
    :goto_2
    const/4 p0, 0x0

    .line 100
    return p0
.end method

.method private synthetic C(Landroid/view/View;)V
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getParent()Landroid/view/ViewParent;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;->getFloatingLayout()Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetFloatingLayout;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getVisibility()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_0

    .line 36
    .line 37
    new-instance p0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v0, "AIBubbleWidgetBubbleView onClick ignoreClick, AIBubbleData="

    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p1, "AIBubbleWidgetBubbleContainer"

    .line 59
    .line 60
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :cond_0
    sget-object v0, Lcom/android/launcher3/widget/custom/bubble/l;->u:Lcom/android/launcher3/util/I;

    .line 65
    .line 66
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {v0, p0}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, Lcom/android/launcher3/widget/custom/bubble/l;

    .line 75
    .line 76
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 77
    .line 78
    invoke-virtual {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/l;->P(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void
.end method

.method private synthetic D(Landroid/view/View;)Z
    .locals 1

    .line 1
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    instance-of v0, v0, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    move-object v0, p1

    .line 14
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 21
    .line 22
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->F(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    const/4 p0, 0x1

    .line 26
    return p0
.end method

.method private synthetic E(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->N(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private F(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 3
    .line 4
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 5
    .line 6
    .line 7
    const-string v2, "onBubbleViewLongClick bubbleData="

    .line 8
    .line 9
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v2, " contains="

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-virtual {v2, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v2, "AIBubbleWidgetBubbleContainer"

    .line 34
    .line 35
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    if-eqz p2, :cond_1

    .line 48
    .line 49
    iget-object v1, p2, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->pkg:Ljava/lang/String;

    .line 50
    .line 51
    invoke-static {v1}, Lh1/a;->C(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 55
    .line 56
    if-nez v1, :cond_4

    .line 57
    .line 58
    new-instance v1, Landroid/widget/ImageView;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-direct {v1, v2}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 65
    .line 66
    .line 67
    iput-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 68
    .line 69
    new-instance v1, Landroid/graphics/drawable/AnimationDrawable;

    .line 70
    .line 71
    invoke-direct {v1}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    .line 72
    .line 73
    .line 74
    move v2, v0

    .line 75
    :goto_0
    const/16 v3, 0x19

    .line 76
    .line 77
    if-gt v2, v3, :cond_3

    .line 78
    .line 79
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    new-instance v4, Ljava/lang/StringBuilder;

    .line 84
    .line 85
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 86
    .line 87
    .line 88
    const-string v5, "bubbleburst_"

    .line 89
    .line 90
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v5

    .line 101
    const-string v6, "%02d"

    .line 102
    .line 103
    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    invoke-static {v3, v4}, Lf1/d;->f(Landroid/content/Context;Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    if-eqz v3, :cond_2

    .line 119
    .line 120
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    invoke-virtual {v4, v3}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    if-eqz v3, :cond_2

    .line 129
    .line 130
    const/16 v4, 0x14

    .line 131
    .line 132
    invoke-virtual {v1, v3, v4}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 133
    .line 134
    .line 135
    :cond_2
    add-int/2addr v2, v0

    .line 136
    goto :goto_0

    .line 137
    :cond_3
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/AnimationDrawable;->setOneShot(Z)V

    .line 138
    .line 139
    .line 140
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 141
    .line 142
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    const v1, 0x7f070085

    .line 150
    .line 151
    .line 152
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 157
    .line 158
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    .line 159
    .line 160
    invoke-direct {v2, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 161
    .line 162
    .line 163
    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 164
    .line 165
    .line 166
    :cond_4
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 167
    .line 168
    const v1, 0x7f0b007b

    .line 169
    .line 170
    .line 171
    invoke-virtual {p1, v1, v0}, Landroid/view/ViewGroup;->setTag(ILjava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 175
    .line 176
    const v1, 0x7f0b0075

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    invoke-virtual {v0, v1, v2}, Landroid/widget/ImageView;->setTag(ILjava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 187
    .line 188
    invoke-virtual {v0}, Landroid/widget/ImageView;->getParent()Landroid/view/ViewParent;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    if-nez v0, :cond_5

    .line 193
    .line 194
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 195
    .line 196
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 197
    .line 198
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 199
    .line 200
    .line 201
    :cond_5
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 202
    .line 203
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->getDefaultAndAnimScaleXY()F

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 208
    .line 209
    .line 210
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 211
    .line 212
    invoke-virtual {p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->getDefaultAndAnimScaleXY()F

    .line 213
    .line 214
    .line 215
    move-result v1

    .line 216
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setScaleY(F)V

    .line 217
    .line 218
    .line 219
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 220
    .line 221
    invoke-virtual {v0}, Landroid/widget/ImageView;->requestLayout()V

    .line 222
    .line 223
    .line 224
    const/4 v0, 0x0

    .line 225
    const/high16 v1, 0x3f800000    # 1.0f

    .line 226
    .line 227
    const/4 v2, 0x2

    .line 228
    new-array v2, v2, [F

    .line 229
    .line 230
    fill-array-data v2, :array_0

    .line 231
    .line 232
    .line 233
    invoke-static {v2}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    const-wide/16 v3, 0x1f4

    .line 238
    .line 239
    invoke-virtual {v2, v3, v4}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 240
    .line 241
    .line 242
    sget-object v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->G:Landroid/view/animation/PathInterpolator;

    .line 243
    .line 244
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 245
    .line 246
    .line 247
    new-instance v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;

    .line 248
    .line 249
    invoke-direct {v3, p0, v1, v0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$c;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;FFLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v2, v3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 253
    .line 254
    .line 255
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;

    .line 256
    .line 257
    invoke-direct {v1, p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$d;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;F)V

    .line 258
    .line 259
    .line 260
    invoke-virtual {v2, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->start()V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private M(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 5

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/4 v2, 0x0

    .line 25
    :goto_0
    if-ge v2, v1, :cond_1

    .line 26
    .line 27
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v:Ljava/util/Random;

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 30
    .line 31
    .line 32
    move-result v4

    .line 33
    sub-int v4, v1, v4

    .line 34
    .line 35
    invoke-virtual {v3, v4}, Ljava/util/Random;->nextInt(I)I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    add-int/lit8 v2, v2, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    return-object p1
.end method

.method private N(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    if-nez p1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->q:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->r:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    :goto_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    instance-of p0, p0, Landroid/view/ViewGroup;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    check-cast p0, Landroid/view/ViewGroup;

    .line 30
    .line 31
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    invoke-virtual {p2, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n(Z)V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_1
    return-void
.end method

.method private O(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->r(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    instance-of p2, p2, Landroid/view/ViewGroup;

    .line 14
    .line 15
    if-nez p2, :cond_1

    .line 16
    .line 17
    iget-boolean p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n(Z)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    :goto_0
    return-void
.end method

.method private P(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    if-eqz p2, :cond_1

    .line 4
    .line 5
    invoke-virtual {p2}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 13
    .line 14
    .line 15
    iget-boolean p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 16
    .line 17
    invoke-virtual {p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n(Z)V

    .line 18
    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->C(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Landroid/animation/Animator;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public static synthetic c(Ljava/util/ArrayList;)Z
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/d;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/widget/custom/bubble/d;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->D(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic e(Landroid/animation/Animator;)Z
    .locals 0

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x1

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x0

    .line 6
    return p0
.end method

.method public static synthetic f(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->E(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic h(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->A:J

    .line 2
    .line 3
    return-wide v0
.end method

.method static bridge synthetic j(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Landroid/widget/ImageView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->s:Landroid/widget/ImageView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic k(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->k:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic l(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Ljava/util/ArrayList;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->n:Ljava/util/ArrayList;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic m(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic n(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->A:J

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic o(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->w:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic p(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Landroid/animation/AnimatorSet;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->l:Landroid/animation/AnimatorSet;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic q(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;ZZZ)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v(ZZZ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic r(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->N(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic s()Ljava/util/List;
    .locals 1

    .line 1
    sget-object v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->F:Ljava/util/List;

    .line 2
    .line 3
    return-object v0
.end method

.method static bridge synthetic t()I
    .locals 1

    .line 1
    sget v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->H:I

    .line 2
    .line 3
    return v0
.end method

.method private u(ZZ)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v(ZZZ)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method private v(ZZZ)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Landroid/animation/TimeAnimator;

    .line 6
    .line 7
    invoke-direct {v0}, Landroid/animation/TimeAnimator;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$g;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/animation/TimeAnimator;->setTimeListener(Landroid/animation/TimeAnimator$TimeListener;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 19
    .line 20
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v1, "doBubbleViewListFloatingAnim prepare="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string v1, ", mCanDo="

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z:Z

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v1, ", canDo="

    .line 46
    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    const-string v1, ", start="

    .line 54
    .line 55
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string v1, ", isEmpty="

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 69
    .line 70
    .line 71
    move-result v1

    .line 72
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v1, ", isRunning="

    .line 76
    .line 77
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 81
    .line 82
    const/4 v2, 0x0

    .line 83
    if-eqz v1, :cond_1

    .line 84
    .line 85
    invoke-virtual {v1}, Landroid/animation/TimeAnimator;->isRunning()Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    goto :goto_0

    .line 94
    :cond_1
    move-object v1, v2

    .line 95
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    const-string v1, ", isPaused="

    .line 99
    .line 100
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 104
    .line 105
    if-eqz v1, :cond_2

    .line 106
    .line 107
    invoke-virtual {v1}, Landroid/animation/TimeAnimator;->isPaused()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 112
    .line 113
    .line 114
    move-result-object v1

    .line 115
    goto :goto_1

    .line 116
    :cond_2
    move-object v1, v2

    .line 117
    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const-string v1, "AIBubbleWidgetBubbleContainer"

    .line 125
    .line 126
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z:Z

    .line 130
    .line 131
    if-eqz p1, :cond_3

    .line 132
    .line 133
    if-eqz p2, :cond_3

    .line 134
    .line 135
    const/4 p1, 0x1

    .line 136
    goto :goto_2

    .line 137
    :cond_3
    const/4 p1, 0x0

    .line 138
    :goto_2
    if-eqz p1, :cond_6

    .line 139
    .line 140
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 141
    .line 142
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 143
    .line 144
    .line 145
    move-result p2

    .line 146
    if-nez p2, :cond_6

    .line 147
    .line 148
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 149
    .line 150
    invoke-virtual {p2}, Landroid/animation/TimeAnimator;->isRunning()Z

    .line 151
    .line 152
    .line 153
    move-result p2

    .line 154
    if-eqz p2, :cond_4

    .line 155
    .line 156
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 157
    .line 158
    invoke-virtual {p2}, Landroid/animation/TimeAnimator;->isPaused()Z

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    if-eqz p2, :cond_6

    .line 163
    .line 164
    :cond_4
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 165
    .line 166
    invoke-virtual {p1}, Landroid/animation/TimeAnimator;->isPaused()Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-eqz p1, :cond_5

    .line 171
    .line 172
    const-string p1, "doBubbleViewListFloatingAnim resume"

    .line 173
    .line 174
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 178
    .line 179
    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->resume()V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_5
    const-string p1, "doBubbleViewListFloatingAnim start"

    .line 184
    .line 185
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 189
    .line 190
    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->start()V

    .line 191
    .line 192
    .line 193
    return-void

    .line 194
    :cond_6
    if-nez p1, :cond_8

    .line 195
    .line 196
    iget-object p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 197
    .line 198
    invoke-virtual {p2}, Landroid/animation/TimeAnimator;->isRunning()Z

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    if-eqz p2, :cond_8

    .line 203
    .line 204
    if-eqz p3, :cond_7

    .line 205
    .line 206
    const-string p1, "doBubbleViewListFloatingAnim pause"

    .line 207
    .line 208
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 212
    .line 213
    invoke-virtual {p0}, Landroid/animation/TimeAnimator;->pause()V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :cond_7
    const-string p1, "doBubbleViewListFloatingAnim, mTimeAnimator end, set null!"

    .line 218
    .line 219
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 220
    .line 221
    .line 222
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 223
    .line 224
    invoke-virtual {p1}, Landroid/animation/TimeAnimator;->end()V

    .line 225
    .line 226
    .line 227
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 228
    .line 229
    invoke-virtual {p1, v2}, Landroid/animation/TimeAnimator;->setTimeListener(Landroid/animation/TimeAnimator$TimeListener;)V

    .line 230
    .line 231
    .line 232
    iput-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 233
    .line 234
    return-void

    .line 235
    :cond_8
    if-nez p1, :cond_9

    .line 236
    .line 237
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 238
    .line 239
    invoke-virtual {p1}, Landroid/animation/TimeAnimator;->isRunning()Z

    .line 240
    .line 241
    .line 242
    move-result p1

    .line 243
    if-nez p1, :cond_9

    .line 244
    .line 245
    const-string p1, "doBubbleViewListFloatingAnim, mTimeAnimator set null!"

    .line 246
    .line 247
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 248
    .line 249
    .line 250
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 251
    .line 252
    invoke-virtual {p1, v2}, Landroid/animation/TimeAnimator;->setTimeListener(Landroid/animation/TimeAnimator$TimeListener;)V

    .line 253
    .line 254
    .line 255
    iput-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x:Landroid/animation/TimeAnimator;

    .line 256
    .line 257
    :cond_9
    return-void
.end method

.method private x(ZZ)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ)",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;",
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
    const/4 v1, 0x0

    .line 7
    :goto_0
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 8
    .line 9
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-ge v1, v2, :cond_3

    .line 14
    .line 15
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    instance-of v3, v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 22
    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    if-eqz p2, :cond_0

    .line 26
    .line 27
    move-object v3, v2

    .line 28
    check-cast v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l()Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    if-nez v3, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    if-eqz p1, :cond_1

    .line 38
    .line 39
    move-object v3, v2

    .line 40
    check-cast v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 41
    .line 42
    invoke-virtual {v3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l()Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-eqz v3, :cond_1

    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_1
    check-cast v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    return-object v0
.end method

.method private y(Z)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->q:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->q:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    check-cast p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_0
    if-eqz p1, :cond_1

    .line 22
    .line 23
    iget-object v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->r:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->r:Ljava/util/ArrayList;

    .line 32
    .line 33
    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    check-cast p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 38
    .line 39
    return-object p0

    .line 40
    :cond_1
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    const v2, 0x7f0e003c

    .line 49
    .line 50
    .line 51
    iget-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 52
    .line 53
    invoke-virtual {v1, v2, v3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 58
    .line 59
    if-nez p1, :cond_2

    .line 60
    .line 61
    new-instance p1, Lcom/android/launcher3/widget/custom/bubble/e;

    .line 62
    .line 63
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/bubble/e;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 67
    .line 68
    .line 69
    new-instance p1, Lcom/android/launcher3/widget/custom/bubble/f;

    .line 70
    .line 71
    invoke-direct {p1, p0}, Lcom/android/launcher3/widget/custom/bubble/f;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 75
    .line 76
    .line 77
    new-instance p1, Lcom/android/launcher3/O6;

    .line 78
    .line 79
    invoke-direct {p1}, Lcom/android/launcher3/O6;-><init>()V

    .line 80
    .line 81
    .line 82
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 89
    .line 90
    .line 91
    move-result-object p0

    .line 92
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/O6;->j(Landroid/content/Context;Landroid/view/View;)V

    .line 93
    .line 94
    .line 95
    :cond_2
    return-object v0
.end method

.method private z(IIIZ)Ljava/util/ArrayList;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(IIIZ)",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Integer;",
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
    if-lez p1, :cond_3

    .line 7
    .line 8
    if-ltz p2, :cond_3

    .line 9
    .line 10
    if-lez p3, :cond_3

    .line 11
    .line 12
    if-lt p2, p3, :cond_0

    .line 13
    .line 14
    goto :goto_3

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    move v2, v1

    .line 17
    :goto_0
    if-ge v2, p1, :cond_3

    .line 18
    .line 19
    if-nez v2, :cond_1

    .line 20
    .line 21
    if-eqz p4, :cond_1

    .line 22
    .line 23
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    goto :goto_2

    .line 31
    :cond_1
    const/4 v3, 0x1

    .line 32
    if-lt v2, v3, :cond_2

    .line 33
    .line 34
    add-int/lit8 v3, v2, -0x1

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Ljava/lang/Integer;

    .line 41
    .line 42
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    move v3, v1

    .line 48
    :goto_1
    add-int/2addr v3, p2

    .line 49
    iget-object v4, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v:Ljava/util/Random;

    .line 50
    .line 51
    sub-int v5, p3, p2

    .line 52
    .line 53
    invoke-virtual {v4, v5}, Ljava/util/Random;->nextInt(I)I

    .line 54
    .line 55
    .line 56
    move-result v4

    .line 57
    add-int/2addr v3, v4

    .line 58
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_3
    :goto_3
    return-object v0
.end method


# virtual methods
.method protected A()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 2
    .line 3
    return p0
.end method

.method protected G()V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetBubbleContainer"

    .line 2
    .line 3
    const-string v1, "onDestroy"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0, v0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v(ZZZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method protected H()V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetBubbleContainer"

    .line 2
    .line 3
    const-string v1, "onLauncherPaused"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->i:Z

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    invoke-direct {p0, v1, v1, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v(ZZZ)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method protected I()V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetBubbleContainer"

    .line 2
    .line 3
    const-string v1, "onLauncherResumed"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 9
    .line 10
    xor-int/lit8 v0, v0, 0x1

    .line 11
    .line 12
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->i:Z

    .line 13
    .line 14
    xor-int/lit8 v1, v1, 0x1

    .line 15
    .line 16
    invoke-direct {p0, v0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u(ZZ)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method protected J()V
    .locals 1

    .line 1
    const-string p0, "AIBubbleWidgetBubbleContainer"

    .line 2
    .line 3
    const-string v0, "onLauncherStarted"

    .line 4
    .line 5
    invoke-static {p0, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method protected K()V
    .locals 2

    .line 1
    const-string v0, "AIBubbleWidgetBubbleContainer"

    .line 2
    .line 3
    const-string v1, "onLauncherStopped"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, v0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u(ZZ)V

    .line 10
    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->i:Z

    .line 13
    .line 14
    return-void
.end method

.method public L(Z)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "prepareOrResetUnlockAnim prepare="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, " mPrepareForUnlockAnim="

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "AIBubbleWidgetBubbleContainer"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-boolean v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 34
    .line 35
    if-ne v0, p1, :cond_0

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_0
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 39
    .line 40
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->w:Landroid/animation/AnimatorSet;

    .line 41
    .line 42
    if-eqz p1, :cond_1

    .line 43
    .line 44
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    if-eqz p1, :cond_1

    .line 49
    .line 50
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->w:Landroid/animation/AnimatorSet;

    .line 51
    .line 52
    invoke-virtual {p1}, Landroid/animation/AnimatorSet;->end()V

    .line 53
    .line 54
    .line 55
    :cond_1
    const/4 p1, 0x0

    .line 56
    invoke-direct {p0, p1, p1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x(ZZ)Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-eqz v0, :cond_2

    .line 69
    .line 70
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    check-cast v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 75
    .line 76
    iget-boolean v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n(Z)V

    .line 79
    .line 80
    .line 81
    goto :goto_0

    .line 82
    :cond_2
    :goto_1
    return-void
.end method

.method protected Q(ZLjava/util/ArrayList;Z)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    new-instance v4, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    const-string v5, "updateViews force="

    .line 15
    .line 16
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v5, " fromSettings="

    .line 23
    .line 24
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string v5, " dataList="

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    const-string v6, "AIBubbleWidgetBubbleContainer"

    .line 43
    .line 44
    invoke-static {v6, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    if-nez v2, :cond_0

    .line 48
    .line 49
    goto/16 :goto_d

    .line 50
    .line 51
    :cond_0
    const/4 v4, 0x0

    .line 52
    const/4 v7, 0x1

    .line 53
    const/4 v8, 0x0

    .line 54
    if-eqz v3, :cond_3

    .line 55
    .line 56
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->l:Landroid/animation/AnimatorSet;

    .line 57
    .line 58
    if-eqz v9, :cond_1

    .line 59
    .line 60
    invoke-virtual {v9}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 61
    .line 62
    .line 63
    move-result v9

    .line 64
    if-eqz v9, :cond_1

    .line 65
    .line 66
    iput-boolean v1, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->m:Z

    .line 67
    .line 68
    new-instance v1, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 71
    .line 72
    .line 73
    iput-object v1, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->n:Ljava/util/ArrayList;

    .line 74
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v1, "updateViews fromSettings="

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v1, " mUpdateViewsAnimatorSet running return"

    .line 95
    .line 96
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    invoke-static {v6, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    iput-object v4, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->n:Ljava/util/ArrayList;

    .line 108
    .line 109
    iput-boolean v8, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->m:Z

    .line 110
    .line 111
    iget-object v5, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->k:Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-nez v5, :cond_2

    .line 118
    .line 119
    iget-object v5, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j:Ljava/util/ArrayList;

    .line 120
    .line 121
    invoke-direct {v0, v7, v2, v5}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->B(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 122
    .line 123
    .line 124
    move-result v5

    .line 125
    if-nez v5, :cond_2

    .line 126
    .line 127
    iget-object v5, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->k:Ljava/util/ArrayList;

    .line 128
    .line 129
    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 130
    .line 131
    .line 132
    :cond_2
    new-instance v5, Ljava/util/ArrayList;

    .line 133
    .line 134
    invoke-direct {v5, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 135
    .line 136
    .line 137
    iput-object v5, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->j:Ljava/util/ArrayList;

    .line 138
    .line 139
    :cond_3
    new-instance v5, Ljava/util/ArrayList;

    .line 140
    .line 141
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 142
    .line 143
    .line 144
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    :cond_4
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 149
    .line 150
    .line 151
    move-result v10

    .line 152
    if-eqz v10, :cond_6

    .line 153
    .line 154
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v10

    .line 158
    check-cast v10, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 159
    .line 160
    if-eqz v10, :cond_4

    .line 161
    .line 162
    invoke-virtual {v10}, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;->isAvailable()Z

    .line 163
    .line 164
    .line 165
    move-result v11

    .line 166
    if-eqz v11, :cond_4

    .line 167
    .line 168
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v11

    .line 172
    if-nez v11, :cond_4

    .line 173
    .line 174
    iget-object v11, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->k:Ljava/util/ArrayList;

    .line 175
    .line 176
    invoke-virtual {v11, v10}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 177
    .line 178
    .line 179
    move-result v11

    .line 180
    if-eqz v11, :cond_5

    .line 181
    .line 182
    new-instance v11, Ljava/lang/StringBuilder;

    .line 183
    .line 184
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .line 186
    .line 187
    const-string v12, "updateViews ignore data, mTempCachedLongClickDeleteList contains, data="

    .line 188
    .line 189
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 193
    .line 194
    .line 195
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    invoke-static {v6, v10}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 200
    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_5
    invoke-virtual {v5, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_6
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 208
    .line 209
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 210
    .line 211
    .line 212
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 213
    .line 214
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 215
    .line 216
    .line 217
    new-instance v5, Ljava/util/ArrayList;

    .line 218
    .line 219
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 220
    .line 221
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 222
    .line 223
    .line 224
    move-result v9

    .line 225
    sget v10, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->E:I

    .line 226
    .line 227
    if-le v9, v10, :cond_7

    .line 228
    .line 229
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 230
    .line 231
    invoke-virtual {v9, v8, v10}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    .line 232
    .line 233
    .line 234
    move-result-object v9

    .line 235
    goto :goto_1

    .line 236
    :cond_7
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->o:Ljava/util/ArrayList;

    .line 237
    .line 238
    :goto_1
    invoke-direct {v5, v9}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 239
    .line 240
    .line 241
    if-nez v1, :cond_8

    .line 242
    .line 243
    iget-object v1, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 244
    .line 245
    invoke-direct {v0, v8, v5, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->B(ZLjava/util/ArrayList;Ljava/util/ArrayList;)Z

    .line 246
    .line 247
    .line 248
    move-result v1

    .line 249
    if-eqz v1, :cond_8

    .line 250
    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    const-string v2, "updateViews isTwoAIBubbleDataListShowDataEquals return, mShowDataList="

    .line 257
    .line 258
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    iget-object v0, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 262
    .line 263
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    invoke-static {v6, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    :cond_8
    invoke-direct {v0, v8, v8}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x(ZZ)Ljava/util/ArrayList;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 279
    .line 280
    .line 281
    move-result v1

    .line 282
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 283
    .line 284
    invoke-virtual {v9}, Ljava/util/ArrayList;->clear()V

    .line 285
    .line 286
    .line 287
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 288
    .line 289
    invoke-virtual {v9, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 290
    .line 291
    .line 292
    new-instance v5, Ljava/lang/StringBuilder;

    .line 293
    .line 294
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 295
    .line 296
    .line 297
    const-string v9, "updateViews mShowDataList="

    .line 298
    .line 299
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 303
    .line 304
    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    invoke-static {v6, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 312
    .line 313
    .line 314
    new-instance v5, Ljava/util/ArrayList;

    .line 315
    .line 316
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 317
    .line 318
    .line 319
    new-instance v6, Ljava/util/ArrayList;

    .line 320
    .line 321
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 322
    .line 323
    .line 324
    new-instance v9, Ljava/util/ArrayList;

    .line 325
    .line 326
    iget-object v10, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 327
    .line 328
    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 329
    .line 330
    .line 331
    new-instance v10, Ljava/util/ArrayList;

    .line 332
    .line 333
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 334
    .line 335
    .line 336
    new-instance v11, Ljava/util/ArrayList;

    .line 337
    .line 338
    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 339
    .line 340
    .line 341
    move v12, v8

    .line 342
    :goto_2
    iget-object v13, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 343
    .line 344
    invoke-virtual {v13}, Landroid/view/ViewGroup;->getChildCount()I

    .line 345
    .line 346
    .line 347
    move-result v13

    .line 348
    if-ge v12, v13, :cond_d

    .line 349
    .line 350
    iget-object v13, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 351
    .line 352
    invoke-virtual {v13, v12}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 353
    .line 354
    .line 355
    move-result-object v13

    .line 356
    instance-of v14, v13, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 357
    .line 358
    if-nez v14, :cond_9

    .line 359
    .line 360
    goto :goto_3

    .line 361
    :cond_9
    move-object v14, v13

    .line 362
    check-cast v14, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 363
    .line 364
    invoke-virtual {v14}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->l()Z

    .line 365
    .line 366
    .line 367
    move-result v15

    .line 368
    if-eqz v15, :cond_a

    .line 369
    .line 370
    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    goto :goto_3

    .line 374
    :cond_a
    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v15

    .line 378
    instance-of v15, v15, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 379
    .line 380
    if-nez v15, :cond_b

    .line 381
    .line 382
    goto :goto_3

    .line 383
    :cond_b
    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v13

    .line 387
    check-cast v13, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 388
    .line 389
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result v15

    .line 393
    if-eqz v15, :cond_c

    .line 394
    .line 395
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 396
    .line 397
    .line 398
    move-result v13

    .line 399
    invoke-virtual {v9, v13}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v13

    .line 403
    check-cast v13, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 404
    .line 405
    iget-boolean v15, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 406
    .line 407
    invoke-virtual {v14, v13, v15}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->q(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)Ljava/util/ArrayList;

    .line 408
    .line 409
    .line 410
    move-result-object v13

    .line 411
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 412
    .line 413
    .line 414
    goto :goto_3

    .line 415
    :cond_c
    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 416
    .line 417
    .line 418
    :goto_3
    add-int/lit8 v12, v12, 0x1

    .line 419
    .line 420
    goto :goto_2

    .line 421
    :cond_d
    move v12, v8

    .line 422
    :goto_4
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 423
    .line 424
    .line 425
    move-result v13

    .line 426
    const v14, 0x7f0b007b

    .line 427
    .line 428
    .line 429
    if-ge v12, v13, :cond_10

    .line 430
    .line 431
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v13

    .line 435
    check-cast v13, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 436
    .line 437
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    .line 438
    .line 439
    .line 440
    move-result v15

    .line 441
    if-nez v15, :cond_f

    .line 442
    .line 443
    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v15

    .line 447
    check-cast v15, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 448
    .line 449
    invoke-virtual {v15, v14}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v14

    .line 453
    if-nez v14, :cond_e

    .line 454
    .line 455
    iget-boolean v14, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 456
    .line 457
    invoke-virtual {v15, v13, v14}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->o(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;Z)Ljava/util/ArrayList;

    .line 458
    .line 459
    .line 460
    move-result-object v13

    .line 461
    invoke-virtual {v6, v13}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 462
    .line 463
    .line 464
    goto :goto_5

    .line 465
    :cond_e
    invoke-virtual {v15, v13}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->s(Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 466
    .line 467
    .line 468
    invoke-virtual {v15, v7, v4, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    .line 469
    .line 470
    .line 471
    move-result-object v13

    .line 472
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 473
    .line 474
    .line 475
    goto :goto_5

    .line 476
    :cond_f
    invoke-direct {v0, v8}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y(Z)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 477
    .line 478
    .line 479
    move-result-object v14

    .line 480
    invoke-direct {v0, v14, v13}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->P(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;)V

    .line 481
    .line 482
    .line 483
    invoke-virtual {v14, v7, v4, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    .line 484
    .line 485
    .line 486
    move-result-object v13

    .line 487
    invoke-virtual {v5, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    :goto_5
    add-int/lit8 v12, v12, 0x1

    .line 491
    .line 492
    goto :goto_4

    .line 493
    :cond_10
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    .line 494
    .line 495
    .line 496
    move-result v9

    .line 497
    if-nez v9, :cond_12

    .line 498
    .line 499
    move v9, v8

    .line 500
    :goto_6
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 501
    .line 502
    .line 503
    move-result v12

    .line 504
    if-ge v9, v12, :cond_12

    .line 505
    .line 506
    invoke-virtual {v10, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 507
    .line 508
    .line 509
    move-result-object v12

    .line 510
    check-cast v12, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 511
    .line 512
    new-instance v13, Lcom/android/launcher3/widget/custom/bubble/a;

    .line 513
    .line 514
    invoke-direct {v13, v0, v12}, Lcom/android/launcher3/widget/custom/bubble/a;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 515
    .line 516
    .line 517
    invoke-virtual {v12, v14}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 518
    .line 519
    .line 520
    move-result-object v15

    .line 521
    if-nez v15, :cond_11

    .line 522
    .line 523
    invoke-virtual {v12, v8, v4, v13}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    .line 524
    .line 525
    .line 526
    move-result-object v12

    .line 527
    invoke-virtual {v5, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 528
    .line 529
    .line 530
    goto :goto_7

    .line 531
    :cond_11
    invoke-interface {v13}, Ljava/lang/Runnable;->run()V

    .line 532
    .line 533
    .line 534
    :goto_7
    add-int/lit8 v9, v9, 0x1

    .line 535
    .line 536
    goto :goto_6

    .line 537
    :cond_12
    new-instance v9, Ljava/util/ArrayList;

    .line 538
    .line 539
    sget-object v10, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->D:Ljava/util/List;

    .line 540
    .line 541
    invoke-direct {v9, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 542
    .line 543
    .line 544
    invoke-direct {v0, v9}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->M(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 545
    .line 546
    .line 547
    move-result-object v9

    .line 548
    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 549
    .line 550
    .line 551
    move-result-object v12

    .line 552
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 553
    .line 554
    .line 555
    invoke-interface {v10, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 556
    .line 557
    .line 558
    move-result-object v10

    .line 559
    check-cast v10, Landroid/graphics/PointF;

    .line 560
    .line 561
    invoke-virtual {v9, v8, v10}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 562
    .line 563
    .line 564
    move v10, v8

    .line 565
    move v12, v10

    .line 566
    :goto_8
    iget-object v13, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 567
    .line 568
    invoke-virtual {v13}, Landroid/view/ViewGroup;->getChildCount()I

    .line 569
    .line 570
    .line 571
    move-result v13

    .line 572
    if-ge v10, v13, :cond_16

    .line 573
    .line 574
    iget-object v13, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 575
    .line 576
    invoke-virtual {v13, v10}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 577
    .line 578
    .line 579
    move-result-object v13

    .line 580
    instance-of v14, v13, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 581
    .line 582
    if-nez v14, :cond_13

    .line 583
    .line 584
    goto :goto_9

    .line 585
    :cond_13
    invoke-virtual {v13}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 586
    .line 587
    .line 588
    move-result-object v14

    .line 589
    instance-of v14, v14, Lcom/android/launcher3/widget/custom/bubble/data/AIBubbleData;

    .line 590
    .line 591
    if-nez v14, :cond_14

    .line 592
    .line 593
    goto :goto_9

    .line 594
    :cond_14
    const v14, 0x7f0b0075

    .line 595
    .line 596
    .line 597
    invoke-virtual {v13, v14}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 598
    .line 599
    .line 600
    move-result-object v15

    .line 601
    instance-of v4, v15, Landroid/graphics/PointF;

    .line 602
    .line 603
    if-eqz v4, :cond_15

    .line 604
    .line 605
    check-cast v15, Landroid/graphics/PointF;

    .line 606
    .line 607
    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 608
    .line 609
    .line 610
    move-result v4

    .line 611
    if-eqz v4, :cond_15

    .line 612
    .line 613
    invoke-virtual {v9, v15}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 614
    .line 615
    .line 616
    goto :goto_9

    .line 617
    :cond_15
    invoke-virtual {v9, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 618
    .line 619
    .line 620
    move-result-object v4

    .line 621
    check-cast v4, Landroid/graphics/PointF;

    .line 622
    .line 623
    add-int/lit8 v12, v12, 0x1

    .line 624
    .line 625
    invoke-virtual {v9}, Ljava/util/ArrayList;->size()I

    .line 626
    .line 627
    .line 628
    move-result v15

    .line 629
    sub-int/2addr v15, v7

    .line 630
    invoke-static {v12, v15}, Ljava/lang/Math;->min(II)I

    .line 631
    .line 632
    .line 633
    move-result v12

    .line 634
    invoke-virtual {v13, v14, v4}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 635
    .line 636
    .line 637
    :goto_9
    add-int/lit8 v10, v10, 0x1

    .line 638
    .line 639
    const/4 v4, 0x0

    .line 640
    goto :goto_8

    .line 641
    :cond_16
    if-eqz v1, :cond_18

    .line 642
    .line 643
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 644
    .line 645
    .line 646
    move-result v4

    .line 647
    if-eqz v4, :cond_18

    .line 648
    .line 649
    iget-object v4, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 650
    .line 651
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 652
    .line 653
    .line 654
    move-result v4

    .line 655
    if-nez v4, :cond_18

    .line 656
    .line 657
    sget-object v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->B:Ljava/util/List;

    .line 658
    .line 659
    iget-object v9, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v:Ljava/util/Random;

    .line 660
    .line 661
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 662
    .line 663
    .line 664
    move-result v10

    .line 665
    invoke-virtual {v9, v10}, Ljava/util/Random;->nextInt(I)I

    .line 666
    .line 667
    .line 668
    move-result v9

    .line 669
    invoke-interface {v4, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 670
    .line 671
    .line 672
    move-result-object v4

    .line 673
    check-cast v4, Ljava/util/List;

    .line 674
    .line 675
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 676
    .line 677
    .line 678
    move-result-object v4

    .line 679
    :goto_a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 680
    .line 681
    .line 682
    move-result v9

    .line 683
    if-eqz v9, :cond_18

    .line 684
    .line 685
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 686
    .line 687
    .line 688
    move-result-object v9

    .line 689
    check-cast v9, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;

    .line 690
    .line 691
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 692
    .line 693
    .line 694
    move-result v10

    .line 695
    if-nez v10, :cond_17

    .line 696
    .line 697
    invoke-virtual {v11, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 698
    .line 699
    .line 700
    move-result-object v10

    .line 701
    check-cast v10, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 702
    .line 703
    invoke-direct {v0, v10, v9}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->O(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;)V

    .line 704
    .line 705
    .line 706
    goto :goto_a

    .line 707
    :cond_17
    invoke-direct {v0, v7}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y(Z)Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 708
    .line 709
    .line 710
    move-result-object v10

    .line 711
    invoke-direct {v0, v10, v9}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->O(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$h;)V

    .line 712
    .line 713
    .line 714
    goto :goto_a

    .line 715
    :cond_18
    iget-object v4, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 716
    .line 717
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    .line 718
    .line 719
    .line 720
    move-result v4

    .line 721
    if-eqz v4, :cond_19

    .line 722
    .line 723
    invoke-virtual {v11}, Ljava/util/ArrayList;->isEmpty()Z

    .line 724
    .line 725
    .line 726
    move-result v4

    .line 727
    if-nez v4, :cond_19

    .line 728
    .line 729
    move v4, v8

    .line 730
    :goto_b
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    .line 731
    .line 732
    .line 733
    move-result v9

    .line 734
    if-ge v4, v9, :cond_19

    .line 735
    .line 736
    invoke-virtual {v11, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 737
    .line 738
    .line 739
    move-result-object v9

    .line 740
    check-cast v9, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 741
    .line 742
    new-instance v10, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$a;

    .line 743
    .line 744
    invoke-direct {v10, v0, v9}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$a;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;)V

    .line 745
    .line 746
    .line 747
    const/4 v12, 0x0

    .line 748
    invoke-virtual {v9, v8, v12, v10}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    .line 749
    .line 750
    .line 751
    move-result-object v9

    .line 752
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 753
    .line 754
    .line 755
    add-int/lit8 v4, v4, 0x1

    .line 756
    .line 757
    goto :goto_b

    .line 758
    :cond_19
    if-eqz v1, :cond_1a

    .line 759
    .line 760
    iget-object v1, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->p:Ljava/util/ArrayList;

    .line 761
    .line 762
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 763
    .line 764
    .line 765
    move-result v1

    .line 766
    if-nez v1, :cond_1a

    .line 767
    .line 768
    invoke-direct {v0, v8, v7}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x(ZZ)Ljava/util/ArrayList;

    .line 769
    .line 770
    .line 771
    move-result-object v1

    .line 772
    sget v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->C:I

    .line 773
    .line 774
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 775
    .line 776
    .line 777
    move-result v9

    .line 778
    invoke-static {v4, v9}, Ljava/lang/Math;->max(II)I

    .line 779
    .line 780
    .line 781
    move-result v4

    .line 782
    const/16 v9, 0x12c

    .line 783
    .line 784
    const/16 v10, 0x1f4

    .line 785
    .line 786
    invoke-direct {v0, v4, v9, v10, v8}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z(IIIZ)Ljava/util/ArrayList;

    .line 787
    .line 788
    .line 789
    move-result-object v4

    .line 790
    :goto_c
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 791
    .line 792
    .line 793
    move-result v9

    .line 794
    if-ge v8, v9, :cond_1a

    .line 795
    .line 796
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 797
    .line 798
    .line 799
    move-result-object v9

    .line 800
    check-cast v9, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 801
    .line 802
    invoke-virtual {v9, v7}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->n(Z)V

    .line 803
    .line 804
    .line 805
    const/4 v12, 0x0

    .line 806
    invoke-virtual {v9, v7, v12, v12}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->j(ZLjava/lang/Runnable;Ljava/lang/Runnable;)Landroid/animation/ValueAnimator;

    .line 807
    .line 808
    .line 809
    move-result-object v9

    .line 810
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 811
    .line 812
    .line 813
    move-result-object v10

    .line 814
    check-cast v10, Ljava/lang/Integer;

    .line 815
    .line 816
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 817
    .line 818
    .line 819
    move-result v10

    .line 820
    int-to-long v10, v10

    .line 821
    invoke-virtual {v9, v10, v11}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 822
    .line 823
    .line 824
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 825
    .line 826
    .line 827
    add-int/lit8 v8, v8, 0x1

    .line 828
    .line 829
    goto :goto_c

    .line 830
    :cond_1a
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/b;

    .line 831
    .line 832
    invoke-direct {v1}, Lcom/android/launcher3/widget/custom/bubble/b;-><init>()V

    .line 833
    .line 834
    .line 835
    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 836
    .line 837
    .line 838
    new-instance v1, Lcom/android/launcher3/widget/custom/bubble/c;

    .line 839
    .line 840
    invoke-direct {v1}, Lcom/android/launcher3/widget/custom/bubble/c;-><init>()V

    .line 841
    .line 842
    .line 843
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->removeIf(Ljava/util/function/Predicate;)Z

    .line 844
    .line 845
    .line 846
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 847
    .line 848
    .line 849
    move-result v1

    .line 850
    if-eqz v1, :cond_1c

    .line 851
    .line 852
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 853
    .line 854
    .line 855
    move-result v1

    .line 856
    if-nez v1, :cond_1b

    .line 857
    .line 858
    goto :goto_e

    .line 859
    :cond_1b
    :goto_d
    return-void

    .line 860
    :cond_1c
    :goto_e
    new-instance v1, Landroid/animation/AnimatorSet;

    .line 861
    .line 862
    invoke-direct {v1}, Landroid/animation/AnimatorSet;-><init>()V

    .line 863
    .line 864
    .line 865
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    .line 866
    .line 867
    .line 868
    move-result v4

    .line 869
    if-nez v4, :cond_1d

    .line 870
    .line 871
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 872
    .line 873
    .line 874
    :cond_1d
    invoke-virtual {v6}, Ljava/util/ArrayList;->isEmpty()Z

    .line 875
    .line 876
    .line 877
    move-result v4

    .line 878
    if-nez v4, :cond_1e

    .line 879
    .line 880
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 881
    .line 882
    .line 883
    move-result-object v4

    .line 884
    :goto_f
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 885
    .line 886
    .line 887
    move-result v5

    .line 888
    if-eqz v5, :cond_1e

    .line 889
    .line 890
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 891
    .line 892
    .line 893
    move-result-object v5

    .line 894
    check-cast v5, Ljava/util/ArrayList;

    .line 895
    .line 896
    invoke-virtual {v1, v5}, Landroid/animation/AnimatorSet;->playSequentially(Ljava/util/List;)V

    .line 897
    .line 898
    .line 899
    goto :goto_f

    .line 900
    :cond_1e
    iget-boolean v4, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u:Z

    .line 901
    .line 902
    if-eqz v4, :cond_1f

    .line 903
    .line 904
    const-wide/16 v4, 0x0

    .line 905
    .line 906
    invoke-virtual {v1, v4, v5}, Landroid/animation/AnimatorSet;->setDuration(J)Landroid/animation/AnimatorSet;

    .line 907
    .line 908
    .line 909
    :cond_1f
    new-instance v4, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;

    .line 910
    .line 911
    invoke-direct {v4, v0, v3, v2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$b;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;ZLjava/util/ArrayList;)V

    .line 912
    .line 913
    .line 914
    invoke-virtual {v1, v4}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 915
    .line 916
    .line 917
    iput-object v1, v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->l:Landroid/animation/AnimatorSet;

    .line 918
    .line 919
    invoke-virtual {v1}, Landroid/animation/AnimatorSet;->start()V

    .line 920
    .line 921
    .line 922
    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/FrameLayout;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    iput-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 5
    .line 6
    return-void
.end method

.method protected onLayout(ZIIII)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-gtz v0, :cond_0

    .line 8
    .line 9
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    const/4 p1, 0x0

    .line 14
    move p2, p1

    .line 15
    :goto_0
    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 16
    .line 17
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    .line 18
    .line 19
    .line 20
    move-result p3

    .line 21
    if-ge p2, p3, :cond_2

    .line 22
    .line 23
    iget-object p3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->g:Landroid/view/ViewGroup;

    .line 24
    .line 25
    invoke-virtual {p3, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 26
    .line 27
    .line 28
    move-result-object p3

    .line 29
    const p4, 0x7f0b0075

    .line 30
    .line 31
    .line 32
    invoke-virtual {p3, p4}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p4

    .line 36
    instance-of p5, p4, Landroid/graphics/PointF;

    .line 37
    .line 38
    if-eqz p5, :cond_1

    .line 39
    .line 40
    check-cast p4, Landroid/graphics/PointF;

    .line 41
    .line 42
    iget p5, p4, Landroid/graphics/PointF;->x:F

    .line 43
    .line 44
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    int-to-float v0, v0

    .line 49
    mul-float/2addr p5, v0

    .line 50
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    int-to-float v0, v0

    .line 55
    const/high16 v1, 0x40000000    # 2.0f

    .line 56
    .line 57
    div-float/2addr v0, v1

    .line 58
    sub-float/2addr p5, v0

    .line 59
    float-to-int p5, p5

    .line 60
    iget p4, p4, Landroid/graphics/PointF;->y:F

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    int-to-float v0, v0

    .line 67
    mul-float/2addr p4, v0

    .line 68
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    int-to-float v0, v0

    .line 73
    div-float/2addr v0, v1

    .line 74
    sub-float/2addr p4, v0

    .line 75
    float-to-int p4, p4

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    move p4, p1

    .line 78
    move p5, p4

    .line 79
    :goto_1
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredWidth()I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr v0, p5

    .line 84
    invoke-virtual {p3}, Landroid/view/View;->getMeasuredHeight()I

    .line 85
    .line 86
    .line 87
    move-result v1

    .line 88
    add-int/2addr v1, p4

    .line 89
    invoke-virtual {p3, p5, p4, v0, v1}, Landroid/view/View;->layout(IIII)V

    .line 90
    .line 91
    .line 92
    add-int/lit8 p2, p2, 0x1

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :cond_2
    return-void
.end method

.method public onViewAdded(Landroid/view/View;)V
    .locals 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onViewAdded(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;

    .line 17
    .line 18
    move-object v1, p1

    .line 19
    check-cast v1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 20
    .line 21
    iget-object v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->v:Ljava/util/Random;

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    invoke-direct {v0, v1, v2, v3}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Ljava/util/Random;Lcom/android/launcher3/widget/custom/bubble/g;)V

    .line 25
    .line 26
    .line 27
    const v2, 0x7f0b0077

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z:Z

    .line 39
    .line 40
    const/4 v0, 0x1

    .line 41
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u(ZZ)V

    .line 42
    .line 43
    .line 44
    :cond_0
    return-void
.end method

.method public onViewRemoved(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onViewRemoved(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    instance-of v0, p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    iget-object v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->y:Ljava/util/ArrayList;

    .line 17
    .line 18
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 19
    .line 20
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    iget-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z:Z

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, p1, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u(ZZ)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method protected setAIBubbleWidgetLayout(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V
    .locals 2

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    instance-of p1, p1, Lcom/android/launcher3/C2;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/android/launcher3/C2;

    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->T2()Z

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    const/4 p1, 0x1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move p1, v0

    .line 27
    :goto_0
    iput-boolean p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z:Z

    .line 28
    .line 29
    sget-object p1, Lcom/android/launcher3/widget/custom/bubble/l;->u:Lcom/android/launcher3/util/I;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {p1, v1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    check-cast p1, Lcom/android/launcher3/widget/custom/bubble/l;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->h:Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;

    .line 46
    .line 47
    invoke-virtual {p1, v0, p0}, Lcom/android/launcher3/widget/custom/bubble/l;->t(ZLcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetLayout;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method protected w()V
    .locals 9

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0, v0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->x(ZZ)Ljava/util/ArrayList;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-direct {p0, v1}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->M(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    sget v2, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->E:I

    .line 11
    .line 12
    sget v3, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->C:I

    .line 13
    .line 14
    add-int/2addr v2, v3

    .line 15
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    const/16 v3, 0x64

    .line 24
    .line 25
    const/4 v4, 0x1

    .line 26
    invoke-direct {p0, v2, v0, v3, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->z(IIIZ)Ljava/util/ArrayList;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    new-instance v3, Ljava/lang/StringBuilder;

    .line 31
    .line 32
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    .line 34
    .line 35
    const-string v5, "doUnlockAnim timeList="

    .line 36
    .line 37
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v3

    .line 47
    const-string v5, "AIBubbleWidgetBubbleContainer"

    .line 48
    .line 49
    invoke-static {v5, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    new-instance v3, Landroid/animation/AnimatorSet;

    .line 53
    .line 54
    invoke-direct {v3}, Landroid/animation/AnimatorSet;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v5, Ljava/util/ArrayList;

    .line 58
    .line 59
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 60
    .line 61
    .line 62
    :goto_0
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 63
    .line 64
    .line 65
    move-result v6

    .line 66
    if-ge v0, v6, :cond_0

    .line 67
    .line 68
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    check-cast v6, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;

    .line 73
    .line 74
    invoke-virtual {v6}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;->getUnlockAnimator()Landroid/animation/ValueAnimator;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    check-cast v7, Ljava/lang/Integer;

    .line 83
    .line 84
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 85
    .line 86
    .line 87
    move-result v7

    .line 88
    int-to-long v7, v7

    .line 89
    invoke-virtual {v6, v7, v8}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    add-int/lit8 v0, v0, 0x1

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_0
    new-instance v0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$f;

    .line 99
    .line 100
    invoke-direct {v0, p0}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$f;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {v3, v0}, Landroid/animation/AnimatorSet;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v3, v5}, Landroid/animation/AnimatorSet;->playTogether(Ljava/util/Collection;)V

    .line 107
    .line 108
    .line 109
    iput-object v3, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->w:Landroid/animation/AnimatorSet;

    .line 110
    .line 111
    invoke-direct {p0, v4, v4}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->u(ZZ)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v3}, Landroid/animation/AnimatorSet;->start()V

    .line 115
    .line 116
    .line 117
    return-void
.end method
