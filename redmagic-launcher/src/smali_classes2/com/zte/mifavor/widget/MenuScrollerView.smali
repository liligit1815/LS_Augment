.class public Lcom/zte/mifavor/widget/MenuScrollerView;
.super Landroid/widget/HorizontalScrollView;
.source "MenuScrollerView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/zte/mifavor/widget/MenuScrollerView$b;
    }
.end annotation


# instance fields
.field private A:I

.field private B:I

.field private C:F

.field private D:I

.field private final E:Z

.field private F:I

.field public G:I

.field private H:Z

.field private I:Z

.field private J:I

.field private K:I

.field private L:I

.field private M:I

.field private N:Landroid/content/Context;

.field private O:Ljava/lang/String;

.field protected g:Landroid/widget/LinearLayout;

.field public h:Lcom/zte/mifavor/widget/MenuScrollerView$b;

.field private i:I

.field private j:F

.field private k:Z

.field private l:Z

.field private m:Z

.field private n:Z

.field private o:Z

.field private p:F

.field private q:F

.field private r:Z

.field private s:Z

.field private t:I

.field private u:Landroid/view/VelocityTracker;

.field private v:Z

.field private w:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private x:Lcom/zte/mifavor/widget/q;

.field private y:Landroid/view/View;

.field private z:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/zte/mifavor/widget/MenuScrollerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 2
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p2, 0x0

    .line 3
    iput p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->i:I

    .line 4
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 5
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 6
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->m:Z

    .line 7
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->n:Z

    .line 8
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->o:Z

    const/4 p3, 0x0

    .line 9
    iput-object p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 10
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->v:Z

    .line 11
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 12
    iput-object p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    const/4 p3, -0x1

    .line 13
    iput p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    const/4 p3, 0x6

    .line 14
    iput p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    const/16 p3, 0xa

    .line 15
    iput p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->G:I

    const/4 p3, 0x1

    .line 16
    iput-boolean p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->H:Z

    .line 17
    iput-boolean p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->I:Z

    const/16 p3, 0x3e8

    .line 18
    iput p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->J:I

    .line 19
    const-string p3, ""

    iput-object p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->O:Ljava/lang/String;

    .line 20
    iput-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->N:Landroid/content/Context;

    .line 21
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, LR3/e;->f0:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 22
    iput-boolean p2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->E:Z

    .line 23
    const-string p3, "window"

    invoke-virtual {p1, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Landroid/view/WindowManager;

    .line 24
    invoke-interface {p3}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p3

    invoke-virtual {p3}, Landroid/view/Display;->getWidth()I

    move-result p3

    const v0, 0x3dcccccd    # 0.1f

    int-to-float p3, p3

    mul-float/2addr p3, v0

    .line 25
    iput p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->j:F

    .line 26
    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    .line 27
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p3

    iput p3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->A:I

    .line 28
    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p1

    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->B:I

    .line 29
    invoke-virtual {p0, p2}, Landroid/widget/HorizontalScrollView;->setHorizontalFadingEdgeEnabled(Z)V

    return-void
.end method

.method static bridge synthetic a(Lcom/zte/mifavor/widget/MenuScrollerView;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->m:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic b(Lcom/zte/mifavor/widget/MenuScrollerView;)Lcom/zte/mifavor/widget/q;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic c(Lcom/zte/mifavor/widget/MenuScrollerView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic d(Lcom/zte/mifavor/widget/MenuScrollerView;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->O:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic e(Lcom/zte/mifavor/widget/MenuScrollerView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->m:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic f(Lcom/zte/mifavor/widget/MenuScrollerView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic g(Lcom/zte/mifavor/widget/MenuScrollerView;Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic h(Lcom/zte/mifavor/widget/MenuScrollerView;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->O:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method static bridge synthetic i(Lcom/zte/mifavor/widget/MenuScrollerView;Landroid/view/View;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->o(Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private k(Landroid/view/View;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    new-instance v1, Lcom/zte/mifavor/widget/MenuScrollerView$a;

    .line 6
    .line 7
    invoke-direct {v1, p0, p1}, Lcom/zte/mifavor/widget/MenuScrollerView$a;-><init>(Lcom/zte/mifavor/widget/MenuScrollerView;Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/zte/mifavor/widget/q;->e(LW2/i;)Lcom/zte/mifavor/widget/q;

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private m()V
    .locals 11

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->H:Z

    .line 2
    .line 3
    const-string v1, "Scroll#MenuScrollerView"

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    const-string p0, "do Edge Animation. do nothing."

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v2, 0x3

    .line 20
    if-gt v0, v2, :cond_1

    .line 21
    .line 22
    goto/16 :goto_4

    .line 23
    .line 24
    :cond_1
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    if-eqz v2, :cond_2

    .line 28
    .line 29
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    float-to-int v2, v2

    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    goto/16 :goto_3

    .line 37
    .line 38
    :cond_2
    move v2, v3

    .line 39
    :goto_0
    const/4 v4, 0x1

    .line 40
    iput-boolean v4, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->m:Z

    .line 41
    .line 42
    iget v5, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->C:F

    .line 43
    .line 44
    iget v6, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->A:I

    .line 45
    .line 46
    int-to-float v6, v6

    .line 47
    div-float/2addr v5, v6

    .line 48
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 49
    .line 50
    .line 51
    move-result v5

    .line 52
    iget v6, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->j:F

    .line 53
    .line 54
    mul-float/2addr v5, v6

    .line 55
    const/high16 v6, 0x3fc00000    # 1.5f

    .line 56
    .line 57
    mul-float/2addr v5, v6

    .line 58
    new-instance v6, Ljava/lang/StringBuilder;

    .line 59
    .line 60
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 61
    .line 62
    .line 63
    const-string v7, "do Edge Animation in. mFlingVelocity="

    .line 64
    .line 65
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    iget v7, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->C:F

    .line 69
    .line 70
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string v7, ", mMaxmumVelocity="

    .line 74
    .line 75
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget v7, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->A:I

    .line 79
    .line 80
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    const-string v7, ", mMaxMoveDistance="

    .line 84
    .line 85
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    iget v7, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->j:F

    .line 89
    .line 90
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    const-string v7, ", mFlingDistanceRange="

    .line 94
    .line 95
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    const-string v7, ", xVelocity="

    .line 102
    .line 103
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    iget-boolean v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    .line 118
    const-string v6, ", size = "

    .line 119
    .line 120
    if-eqz v2, :cond_3

    .line 121
    .line 122
    :try_start_1
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 123
    .line 124
    if-eqz v2, :cond_3

    .line 125
    .line 126
    iput-boolean v3, v2, Lcom/zte/mifavor/widget/q;->a:Z

    .line 127
    .line 128
    add-int/lit8 v7, v0, -0x1

    .line 129
    .line 130
    invoke-virtual {v2, v7}, Lcom/zte/mifavor/widget/q;->j(I)Lcom/zte/mifavor/widget/q;

    .line 131
    .line 132
    .line 133
    iput v7, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    .line 134
    .line 135
    iget v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    .line 136
    .line 137
    sub-int/2addr v7, v2

    .line 138
    new-instance v2, Ljava/lang/StringBuilder;

    .line 139
    .line 140
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 141
    .line 142
    .line 143
    const-string v8, "do Edge Animation left. startIdx="

    .line 144
    .line 145
    invoke-virtual {v2, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move v2, v7

    .line 165
    :goto_1
    if-ge v2, v0, :cond_3

    .line 166
    .line 167
    iget-object v8, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 168
    .line 169
    invoke-virtual {v8}, Lcom/zte/mifavor/widget/q;->g()Ljava/util/List;

    .line 170
    .line 171
    .line 172
    move-result-object v8

    .line 173
    invoke-interface {v8, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v8

    .line 177
    check-cast v8, LW2/e;

    .line 178
    .line 179
    sub-int v9, v2, v7

    .line 180
    .line 181
    add-int/2addr v9, v4

    .line 182
    int-to-double v9, v9

    .line 183
    invoke-static {v9, v10}, Ljava/lang/Math;->sqrt(D)D

    .line 184
    .line 185
    .line 186
    move-result-wide v9

    .line 187
    double-to-float v9, v9

    .line 188
    div-float v9, v5, v9

    .line 189
    .line 190
    neg-float v9, v9

    .line 191
    float-to-double v9, v9

    .line 192
    invoke-virtual {v8, v9, v10}, LW2/e;->n(D)LW2/e;

    .line 193
    .line 194
    .line 195
    add-int/lit8 v2, v2, 0x1

    .line 196
    .line 197
    goto :goto_1

    .line 198
    :cond_3
    iget-boolean v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 199
    .line 200
    if-eqz v2, :cond_4

    .line 201
    .line 202
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 203
    .line 204
    if-eqz v2, :cond_4

    .line 205
    .line 206
    invoke-virtual {v2, v3}, Lcom/zte/mifavor/widget/q;->j(I)Lcom/zte/mifavor/widget/q;

    .line 207
    .line 208
    .line 209
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 210
    .line 211
    iput-boolean v3, v2, Lcom/zte/mifavor/widget/q;->a:Z

    .line 212
    .line 213
    iput v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    .line 214
    .line 215
    iget v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    .line 216
    .line 217
    new-instance v7, Ljava/lang/StringBuilder;

    .line 218
    .line 219
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 220
    .line 221
    .line 222
    const-string v8, "do Edge Animation right. startIdx="

    .line 223
    .line 224
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 228
    .line 229
    .line 230
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    invoke-static {v1, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 241
    .line 242
    .line 243
    move v0, v2

    .line 244
    :goto_2
    if-ltz v0, :cond_4

    .line 245
    .line 246
    iget-object v6, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 247
    .line 248
    invoke-virtual {v6}, Lcom/zte/mifavor/widget/q;->g()Ljava/util/List;

    .line 249
    .line 250
    .line 251
    move-result-object v6

    .line 252
    invoke-interface {v6, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v6

    .line 256
    check-cast v6, LW2/e;

    .line 257
    .line 258
    sub-int v7, v2, v0

    .line 259
    .line 260
    add-int/2addr v7, v4

    .line 261
    int-to-double v7, v7

    .line 262
    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    .line 263
    .line 264
    .line 265
    move-result-wide v7

    .line 266
    double-to-float v7, v7

    .line 267
    div-float v7, v5, v7

    .line 268
    .line 269
    float-to-double v7, v7

    .line 270
    invoke-virtual {v6, v7, v8}, LW2/e;->n(D)LW2/e;

    .line 271
    .line 272
    .line 273
    add-int/lit8 v0, v0, -0x1

    .line 274
    .line 275
    goto :goto_2

    .line 276
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 277
    .line 278
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 279
    .line 280
    .line 281
    const-string v2, "do Edge Animation out. IsLeftFling="

    .line 282
    .line 283
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 284
    .line 285
    .line 286
    iget-boolean v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 287
    .line 288
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    const-string v2, ", IsRightFling = "

    .line 292
    .line 293
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 294
    .line 295
    .line 296
    iget-boolean v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 297
    .line 298
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 299
    .line 300
    .line 301
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 306
    .line 307
    .line 308
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 309
    .line 310
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 311
    .line 312
    return-void

    .line 313
    :goto_3
    const-string v0, "do Edge Animation error, e ="

    .line 314
    .line 315
    invoke-static {v1, v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 316
    .line 317
    .line 318
    :goto_4
    return-void
.end method

.method private n(F)I
    .locals 6

    .line 1
    const v0, 0x7fffffff

    .line 2
    .line 3
    .line 4
    const/4 v1, -0x1

    .line 5
    const/4 v2, 0x0

    .line 6
    move v3, v2

    .line 7
    :goto_0
    iget-object v4, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 8
    .line 9
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    if-ge v3, v4, :cond_1

    .line 14
    .line 15
    iget-object v4, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v4, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    check-cast v4, Landroid/view/View;

    .line 22
    .line 23
    filled-new-array {v2, v2}, [I

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    invoke-virtual {v4, v5}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 28
    .line 29
    .line 30
    aget v5, v5, v2

    .line 31
    .line 32
    invoke-virtual {v4}, Landroid/view/View;->getWidth()I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    div-int/lit8 v4, v4, 0x2

    .line 37
    .line 38
    add-int/2addr v5, v4

    .line 39
    int-to-float v4, v5

    .line 40
    sub-float v4, p1, v4

    .line 41
    .line 42
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    float-to-int v4, v4

    .line 47
    if-ge v4, v0, :cond_0

    .line 48
    .line 49
    move v1, v3

    .line 50
    move v0, v4

    .line 51
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return v1
.end method

.method private o(Landroid/view/View;)Z
    .locals 9

    .line 1
    const-string v0, "Scroll#MenuScrollerView"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 5
    .line 6
    invoke-interface {v2, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    .line 7
    .line 8
    .line 9
    move-result v2

    .line 10
    iget v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    .line 11
    .line 12
    const/4 v4, 0x0

    .line 13
    const/high16 v5, 0x43020000    # 130.0f

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    if-nez v3, :cond_0

    .line 17
    .line 18
    iget v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    .line 19
    .line 20
    if-ne v2, v3, :cond_0

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 27
    .line 28
    .line 29
    move-result v3

    .line 30
    cmpl-float v3, v3, v5

    .line 31
    .line 32
    if-lez v3, :cond_0

    .line 33
    .line 34
    iget-object v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->y:Landroid/view/View;

    .line 35
    .line 36
    if-eqz v3, :cond_0

    .line 37
    .line 38
    invoke-virtual {v3}, Landroid/view/View;->getTranslationX()F

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    cmpl-float v3, v3, v4

    .line 43
    .line 44
    if-eqz v3, :cond_0

    .line 45
    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    iget-object v7, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->O:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v7, "Left had Do Edge Animation = "

    .line 57
    .line 58
    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move v3, v6

    .line 72
    goto :goto_0

    .line 73
    :catch_0
    move-exception p0

    .line 74
    goto :goto_1

    .line 75
    :cond_0
    move v3, v1

    .line 76
    :goto_0
    iget v7, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    .line 77
    .line 78
    iget-object v8, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 79
    .line 80
    invoke-interface {v8}, Ljava/util/List;->size()I

    .line 81
    .line 82
    .line 83
    move-result v8

    .line 84
    sub-int/2addr v8, v6

    .line 85
    if-ne v7, v8, :cond_1

    .line 86
    .line 87
    iget-object v7, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 88
    .line 89
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 90
    .line 91
    .line 92
    move-result v7

    .line 93
    sub-int/2addr v7, v6

    .line 94
    iget v8, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    .line 95
    .line 96
    sub-int/2addr v7, v8

    .line 97
    if-ne v2, v7, :cond_1

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 104
    .line 105
    .line 106
    move-result p1

    .line 107
    cmpl-float p1, p1, v5

    .line 108
    .line 109
    if-lez p1, :cond_1

    .line 110
    .line 111
    iget-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->z:Landroid/view/View;

    .line 112
    .line 113
    if-eqz p1, :cond_1

    .line 114
    .line 115
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    cmpl-float p1, p1, v4

    .line 120
    .line 121
    if-eqz p1, :cond_1

    .line 122
    .line 123
    new-instance p1, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->O:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string p0, "Right had Do Edge Animation = "

    .line 134
    .line 135
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {p1, v6}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object p0

    .line 145
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 146
    .line 147
    .line 148
    return v6

    .line 149
    :cond_1
    return v3

    .line 150
    :goto_1
    const-string p1, "had Do Edge Animation, error = "

    .line 151
    .line 152
    invoke-static {v0, p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 153
    .line 154
    .line 155
    return v1
.end method

.method private q(I)Landroid/widget/LinearLayout;
    .locals 2

    .line 1
    new-instance p1, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-direct {p1, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 12
    .line 13
    .line 14
    new-instance v0, Landroid/view/ViewGroup$LayoutParams;

    .line 15
    .line 16
    const/4 v1, -0x2

    .line 17
    invoke-direct {v0, v1, v1}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1, v0}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 21
    .line 22
    .line 23
    return-object p1
.end method

.method private s()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getLeft()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->y:Landroid/view/View;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getLeft()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-ge p0, v0, :cond_1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_2
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method private t()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getRight()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->z:Landroid/view/View;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Landroid/view/View;->getRight()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :cond_0
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    add-int/2addr v1, p0

    .line 22
    if-lt v1, v0, :cond_1

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_1
    const/4 p0, 0x0

    .line 27
    return p0
.end method


# virtual methods
.method public fling(I)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 2
    .line 3
    const-string v1, ", maxId="

    .line 4
    .line 5
    const-string v2, "Scroll#MenuScrollerView"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/q;->i()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v4, 0x3

    .line 15
    if-gt v0, v4, :cond_0

    .line 16
    .line 17
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    const/16 v5, 0x1770

    .line 22
    .line 23
    if-ge v4, v5, :cond_0

    .line 24
    .line 25
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->fling(I)V

    .line 26
    .line 27
    .line 28
    new-instance p0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const-string v3, "+++ fling out. velocityX="

    .line 34
    .line 35
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    return-void

    .line 55
    :cond_0
    iget-object v4, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 56
    .line 57
    invoke-virtual {v4}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    goto :goto_0

    .line 62
    :cond_1
    const/4 v4, 0x0

    .line 63
    move v0, v3

    .line 64
    :goto_0
    if-eqz v4, :cond_2

    .line 65
    .line 66
    invoke-virtual {v4}, LW2/e;->d()D

    .line 67
    .line 68
    .line 69
    move-result-wide v4

    .line 70
    double-to-float v4, v4

    .line 71
    goto :goto_1

    .line 72
    :cond_2
    const/4 v4, 0x0

    .line 73
    :goto_1
    new-instance v5, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v6, "+++ fling. velocityX="

    .line 79
    .line 80
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v7, ", displacementFromRest="

    .line 87
    .line 88
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .line 106
    .line 107
    const/high16 v0, 0x41200000    # 10.0f

    .line 108
    .line 109
    cmpl-float v0, v4, v0

    .line 110
    .line 111
    if-lez v0, :cond_4

    .line 112
    .line 113
    if-lez p1, :cond_3

    .line 114
    .line 115
    iget p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->B:I

    .line 116
    .line 117
    goto :goto_2

    .line 118
    :cond_3
    iget p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->B:I

    .line 119
    .line 120
    neg-int p1, p1

    .line 121
    :cond_4
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v1, ", mMinnumVelocity="

    .line 133
    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->B:I

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    const-string v1, ", springControl="

    .line 149
    .line 150
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    iget v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    .line 154
    .line 155
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->fling(I)V

    .line 166
    .line 167
    .line 168
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 169
    .line 170
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 171
    .line 172
    const/4 v0, 0x1

    .line 173
    if-lez p1, :cond_5

    .line 174
    .line 175
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 176
    .line 177
    int-to-float p1, p1

    .line 178
    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->C:F

    .line 179
    .line 180
    return-void

    .line 181
    :cond_5
    if-gez p1, :cond_6

    .line 182
    .line 183
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 184
    .line 185
    int-to-float p1, p1

    .line 186
    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->C:F

    .line 187
    .line 188
    :cond_6
    return-void
.end method

.method public j(Lcom/zte/mifavor/widget/MenuScrollerView$b;)V
    .locals 6

    .line 1
    const-string v0, "Scroll#MenuScrollerView"

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const-string p0, "add Item View. item is null."

    .line 6
    .line 7
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget-object v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 12
    .line 13
    const/4 v2, -0x1

    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    invoke-direct {p0, v2}, Lcom/zte/mifavor/widget/MenuScrollerView;->q(I)Landroid/widget/LinearLayout;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    iput-object v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 21
    .line 22
    :cond_1
    invoke-interface {p1}, Lcom/zte/mifavor/widget/MenuScrollerView$b;->getIsSelected()Z

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-eqz v1, :cond_2

    .line 27
    .line 28
    iput-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->h:Lcom/zte/mifavor/widget/MenuScrollerView$b;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 31
    .line 32
    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    iput v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->i:I

    .line 37
    .line 38
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v3, "+++++++++++ add Item View. mSelectedPosition = "

    .line 44
    .line 45
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->i:I

    .line 49
    .line 50
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 58
    .line 59
    .line 60
    :cond_2
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 61
    .line 62
    invoke-direct {v1, v2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 63
    .line 64
    .line 65
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 66
    .line 67
    invoke-virtual {v2}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->I:Z

    .line 72
    .line 73
    const/4 v4, 0x0

    .line 74
    if-nez v3, :cond_5

    .line 75
    .line 76
    new-instance v3, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v5, "+++++++++++ add Item View. no Margins count = "

    .line 82
    .line 83
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    if-nez v2, :cond_3

    .line 97
    .line 98
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 99
    .line 100
    div-int/lit8 v0, v0, 0x2

    .line 101
    .line 102
    invoke-virtual {v1, v4, v4, v0, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 103
    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_3
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->J:I

    .line 107
    .line 108
    add-int/lit8 v0, v0, -0x1

    .line 109
    .line 110
    if-ne v0, v2, :cond_4

    .line 111
    .line 112
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 113
    .line 114
    div-int/lit8 v0, v0, 0x2

    .line 115
    .line 116
    invoke-virtual {v1, v0, v4, v4, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 117
    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_4
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 121
    .line 122
    div-int/lit8 v2, v0, 0x2

    .line 123
    .line 124
    div-int/lit8 v0, v0, 0x2

    .line 125
    .line 126
    invoke-virtual {v1, v2, v4, v0, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_5
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 131
    .line 132
    div-int/lit8 v2, v0, 0x2

    .line 133
    .line 134
    div-int/lit8 v0, v0, 0x2

    .line 135
    .line 136
    invoke-virtual {v1, v2, v4, v0, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 137
    .line 138
    .line 139
    :goto_0
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 140
    .line 141
    if-eqz p0, :cond_6

    .line 142
    .line 143
    check-cast p1, Landroid/view/View;

    .line 144
    .line 145
    invoke-virtual {p0, p1, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    .line 147
    .line 148
    :cond_6
    return-void
.end method

.method protected l(F)Z
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->H:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    invoke-direct {p0}, Lcom/zte/mifavor/widget/MenuScrollerView;->s()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->n:Z

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/zte/mifavor/widget/MenuScrollerView;->t()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput-boolean v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->o:Z

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    cmpg-float v3, p1, v2

    .line 23
    .line 24
    if-ltz v3, :cond_3

    .line 25
    .line 26
    :cond_1
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->n:Z

    .line 27
    .line 28
    if-eqz v3, :cond_2

    .line 29
    .line 30
    cmpl-float v4, p1, v2

    .line 31
    .line 32
    if-gtz v4, :cond_3

    .line 33
    .line 34
    :cond_2
    if-eqz v3, :cond_8

    .line 35
    .line 36
    if-eqz v0, :cond_8

    .line 37
    .line 38
    :cond_3
    iget-boolean v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->s:Z

    .line 39
    .line 40
    const/4 v3, 0x1

    .line 41
    if-nez v0, :cond_7

    .line 42
    .line 43
    cmpl-float p1, p1, v2

    .line 44
    .line 45
    if-lez p1, :cond_4

    .line 46
    .line 47
    move p1, v1

    .line 48
    goto :goto_0

    .line 49
    :cond_4
    iget-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    sub-int/2addr p1, v3

    .line 56
    :goto_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 57
    .line 58
    if-eqz v0, :cond_6

    .line 59
    .line 60
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/q;->j(I)Lcom/zte/mifavor/widget/q;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    if-eqz v2, :cond_5

    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    iget v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->q:F

    .line 77
    .line 78
    float-to-double v4, v2

    .line 79
    invoke-virtual {v0, v4, v5}, LW2/e;->l(D)LW2/e;

    .line 80
    .line 81
    .line 82
    :cond_5
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 83
    .line 84
    iput-boolean v1, v0, Lcom/zte/mifavor/widget/q;->a:Z

    .line 85
    .line 86
    :cond_6
    iput-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->s:Z

    .line 87
    .line 88
    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    .line 89
    .line 90
    :cond_7
    return v3

    .line 91
    :cond_8
    return v1
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    and-int/lit16 v0, v0, 0xff

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 11
    .line 12
    .line 13
    :goto_0
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method protected onMeasure(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->setMeasuredDimension(II)V

    .line 2
    .line 3
    .line 4
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->onMeasure(II)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method protected onScrollChanged(IIII)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/HorizontalScrollView;->onScrollChanged(IIII)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/HorizontalScrollView;->getChildAt(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getScrollX()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const-string p3, "Scroll#MenuScrollerView"

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/widget/HorizontalScrollView;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p4

    .line 21
    add-int/2addr p4, p2

    .line 22
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    if-lt p4, p1, :cond_0

    .line 27
    .line 28
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 29
    .line 30
    if-eqz p1, :cond_0

    .line 31
    .line 32
    const-string p1, "onScrollChanged left. call do Edge Animation."

    .line 33
    .line 34
    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/zte/mifavor/widget/MenuScrollerView;->m()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_0
    if-gtz p2, :cond_1

    .line 42
    .line 43
    iget-boolean p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 44
    .line 45
    if-eqz p1, :cond_1

    .line 46
    .line 47
    const-string p1, "onScrollChanged right. call do Edge Animation."

    .line 48
    .line 49
    invoke-static {p3, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 50
    .line 51
    .line 52
    invoke-direct {p0}, Lcom/zte/mifavor/widget/MenuScrollerView;->m()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p0, p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->p(Landroid/view/View;Landroid/view/MotionEvent;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/HorizontalScrollView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public p(Landroid/view/View;Landroid/view/MotionEvent;)V
    .locals 18

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getAction()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    and-int/lit16 v2, v2, 0xff

    .line 10
    .line 11
    const-string v3, "Scroll#MenuScrollerView"

    .line 12
    .line 13
    const/4 v4, 0x1

    .line 14
    const/4 v5, 0x0

    .line 15
    if-eqz v2, :cond_9

    .line 16
    .line 17
    const/4 v6, 0x0

    .line 18
    const/4 v7, 0x0

    .line 19
    if-eq v2, v4, :cond_6

    .line 20
    .line 21
    const/4 v8, 0x2

    .line 22
    if-eq v2, v8, :cond_0

    .line 23
    .line 24
    const/4 v8, 0x3

    .line 25
    if-eq v2, v8, :cond_6

    .line 26
    .line 27
    goto/16 :goto_2

    .line 28
    .line 29
    :cond_0
    iget v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->t:I

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v8, -0x1

    .line 36
    if-eq v2, v8, :cond_b

    .line 37
    .line 38
    iget-boolean v8, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->r:Z

    .line 39
    .line 40
    if-eqz v8, :cond_b

    .line 41
    .line 42
    filled-new-array {v5, v5}, [I

    .line 43
    .line 44
    .line 45
    move-result-object v8

    .line 46
    move-object/from16 v9, p1

    .line 47
    .line 48
    invoke-virtual {v9, v8}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Landroid/view/MotionEvent;->getX(I)F

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    aget v5, v8, v5

    .line 56
    .line 57
    int-to-float v5, v5

    .line 58
    add-float/2addr v2, v5

    .line 59
    iget v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->p:F

    .line 60
    .line 61
    sub-float/2addr v2, v5

    .line 62
    iget v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->q:F

    .line 63
    .line 64
    add-float/2addr v2, v5

    .line 65
    invoke-virtual {v0, v2}, Lcom/zte/mifavor/widget/MenuScrollerView;->l(F)Z

    .line 66
    .line 67
    .line 68
    move-result v5

    .line 69
    if-nez v5, :cond_1

    .line 70
    .line 71
    goto/16 :goto_2

    .line 72
    .line 73
    :cond_1
    iget-object v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 74
    .line 75
    if-eqz v5, :cond_2

    .line 76
    .line 77
    invoke-virtual {v5}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 78
    .line 79
    .line 80
    move-result-object v7

    .line 81
    :cond_2
    if-nez v7, :cond_3

    .line 82
    .line 83
    goto/16 :goto_2

    .line 84
    .line 85
    :cond_3
    invoke-static {v2}, Ljava/lang/Math;->abs(F)F

    .line 86
    .line 87
    .line 88
    move-result v5

    .line 89
    iget v8, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->j:F

    .line 90
    .line 91
    cmpl-float v5, v5, v8

    .line 92
    .line 93
    if-lez v5, :cond_5

    .line 94
    .line 95
    iget-boolean v1, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->v:Z

    .line 96
    .line 97
    if-nez v1, :cond_b

    .line 98
    .line 99
    cmpl-float v1, v2, v6

    .line 100
    .line 101
    if-lez v1, :cond_4

    .line 102
    .line 103
    float-to-double v1, v8

    .line 104
    :goto_0
    move-wide v8, v1

    .line 105
    goto :goto_1

    .line 106
    :cond_4
    neg-float v1, v8

    .line 107
    float-to-double v1, v1

    .line 108
    goto :goto_0

    .line 109
    :goto_1
    const-wide/high16 v14, 0x3ff0000000000000L    # 1.0

    .line 110
    .line 111
    const-wide v16, 0x3ff199999999999aL    # 1.1

    .line 112
    .line 113
    .line 114
    .line 115
    .line 116
    const-wide/16 v10, 0x0

    .line 117
    .line 118
    const-wide/high16 v12, 0x3ff0000000000000L    # 1.0

    .line 119
    .line 120
    invoke-static/range {v8 .. v17}, LW2/m;->a(DDDDD)D

    .line 121
    .line 122
    .line 123
    move-result-wide v1

    .line 124
    double-to-float v1, v1

    .line 125
    new-instance v2, Ljava/lang/StringBuilder;

    .line 126
    .line 127
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 128
    .line 129
    .line 130
    const-string v5, "handleRowTouch ACTION_MOVE spring = "

    .line 131
    .line 132
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v2, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    const-string v5, ", mappedValue = "

    .line 139
    .line 140
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    invoke-static {v3, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    float-to-double v1, v1

    .line 154
    invoke-virtual {v7, v1, v2}, LW2/e;->n(D)LW2/e;

    .line 155
    .line 156
    .line 157
    iput-boolean v4, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->v:Z

    .line 158
    .line 159
    return-void

    .line 160
    :cond_5
    iget v3, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->p:F

    .line 161
    .line 162
    invoke-direct {v0, v3}, Lcom/zte/mifavor/widget/MenuScrollerView;->n(F)I

    .line 163
    .line 164
    .line 165
    move-result v3

    .line 166
    iget v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->D:I

    .line 167
    .line 168
    sub-int/2addr v3, v5

    .line 169
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 170
    .line 171
    .line 172
    move-result v3

    .line 173
    add-int/2addr v3, v4

    .line 174
    int-to-float v3, v3

    .line 175
    div-float/2addr v2, v3

    .line 176
    float-to-double v2, v2

    .line 177
    invoke-virtual {v7, v2, v3}, LW2/e;->n(D)LW2/e;

    .line 178
    .line 179
    .line 180
    iput-boolean v4, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->v:Z

    .line 181
    .line 182
    iget-object v0, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 183
    .line 184
    if-eqz v0, :cond_b

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 187
    .line 188
    .line 189
    return-void

    .line 190
    :cond_6
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->n:Z

    .line 191
    .line 192
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->o:Z

    .line 193
    .line 194
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->r:Z

    .line 195
    .line 196
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->v:Z

    .line 197
    .line 198
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->s:Z

    .line 199
    .line 200
    iget-object v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 201
    .line 202
    if-eqz v2, :cond_7

    .line 203
    .line 204
    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 205
    .line 206
    .line 207
    iget-object v1, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 208
    .line 209
    const/16 v2, 0x3e8

    .line 210
    .line 211
    invoke-virtual {v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(I)V

    .line 212
    .line 213
    .line 214
    iget-object v1, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 215
    .line 216
    invoke-virtual {v1}, Landroid/view/VelocityTracker;->getXVelocity()F

    .line 217
    .line 218
    .line 219
    move-result v6

    .line 220
    :cond_7
    iget-object v1, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 221
    .line 222
    if-eqz v1, :cond_8

    .line 223
    .line 224
    invoke-virtual {v1}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 225
    .line 226
    .line 227
    move-result-object v7

    .line 228
    iget-object v0, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 229
    .line 230
    iput-boolean v4, v0, Lcom/zte/mifavor/widget/q;->a:Z

    .line 231
    .line 232
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    const-string v1, "handleRowTouch ACTION_UP isLoose is true. spring = "

    .line 238
    .line 239
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    const-string v1, ", XVelocity = "

    .line 246
    .line 247
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    .line 259
    .line 260
    if-eqz v7, :cond_b

    .line 261
    .line 262
    const-wide/16 v0, 0x0

    .line 263
    .line 264
    invoke-virtual {v7, v0, v1}, LW2/e;->n(D)LW2/e;

    .line 265
    .line 266
    .line 267
    return-void

    .line 268
    :cond_9
    move-object/from16 v9, p1

    .line 269
    .line 270
    const-string v2, "handleRowTouch ACTION_DOWN"

    .line 271
    .line 272
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 273
    .line 274
    .line 275
    invoke-virtual {v1, v5}, Landroid/view/MotionEvent;->getPointerId(I)I

    .line 276
    .line 277
    .line 278
    move-result v2

    .line 279
    iput v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->t:I

    .line 280
    .line 281
    invoke-virtual {v9}, Landroid/view/View;->getTranslationX()F

    .line 282
    .line 283
    .line 284
    move-result v2

    .line 285
    iput v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->q:F

    .line 286
    .line 287
    invoke-virtual {v1}, Landroid/view/MotionEvent;->getRawX()F

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    iput v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->p:F

    .line 292
    .line 293
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->l:Z

    .line 294
    .line 295
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->k:Z

    .line 296
    .line 297
    iput-boolean v4, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->r:Z

    .line 298
    .line 299
    iput-boolean v5, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->v:Z

    .line 300
    .line 301
    iget-object v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 302
    .line 303
    if-eqz v2, :cond_a

    .line 304
    .line 305
    invoke-virtual {v2}, Landroid/view/VelocityTracker;->clear()V

    .line 306
    .line 307
    .line 308
    :cond_a
    iget-object v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 309
    .line 310
    if-eqz v2, :cond_b

    .line 311
    .line 312
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 313
    .line 314
    .line 315
    move-result-object v2

    .line 316
    iput-object v2, v0, Lcom/zte/mifavor/widget/MenuScrollerView;->u:Landroid/view/VelocityTracker;

    .line 317
    .line 318
    invoke-virtual {v2, v1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 319
    .line 320
    .line 321
    :cond_b
    :goto_2
    return-void
.end method

.method public r()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    const-string v1, "Scroll#MenuScrollerView"

    .line 4
    .line 5
    if-eqz v0, :cond_7

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->getChildCount()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v3, "init Spring Chain in. size = "

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v3, ", mIsRtl = "

    .line 25
    .line 26
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-boolean v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->E:Z

    .line 30
    .line 31
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 42
    .line 43
    if-nez v2, :cond_0

    .line 44
    .line 45
    const/16 v2, 0x32

    .line 46
    .line 47
    const/16 v3, 0x78

    .line 48
    .line 49
    const/16 v4, 0x14

    .line 50
    .line 51
    invoke-static {v2, v4, v3, v4}, Lcom/zte/mifavor/widget/q;->f(IIII)Lcom/zte/mifavor/widget/q;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    iput-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 56
    .line 57
    :cond_0
    iget-boolean v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->E:Z

    .line 58
    .line 59
    const/4 v3, 0x0

    .line 60
    if-eqz v2, :cond_3

    .line 61
    .line 62
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 63
    .line 64
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    iput-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->z:Landroid/view/View;

    .line 69
    .line 70
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 71
    .line 72
    add-int/lit8 v3, v0, -0x1

    .line 73
    .line 74
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    iput-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->y:Landroid/view/View;

    .line 79
    .line 80
    move v2, v3

    .line 81
    :goto_0
    if-ltz v2, :cond_6

    .line 82
    .line 83
    iget v4, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->G:I

    .line 84
    .line 85
    if-le v2, v4, :cond_1

    .line 86
    .line 87
    sub-int v4, v3, v4

    .line 88
    .line 89
    if-lt v2, v4, :cond_2

    .line 90
    .line 91
    :cond_1
    iget-object v4, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 92
    .line 93
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-direct {p0, v4}, Lcom/zte/mifavor/widget/MenuScrollerView;->k(Landroid/view/View;)V

    .line 98
    .line 99
    .line 100
    :cond_2
    add-int/lit8 v2, v2, -0x1

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 104
    .line 105
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iput-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->y:Landroid/view/View;

    .line 110
    .line 111
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 112
    .line 113
    add-int/lit8 v4, v0, -0x1

    .line 114
    .line 115
    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    iput-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->z:Landroid/view/View;

    .line 120
    .line 121
    :goto_1
    if-ge v3, v0, :cond_6

    .line 122
    .line 123
    iget v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->G:I

    .line 124
    .line 125
    if-le v3, v2, :cond_4

    .line 126
    .line 127
    sub-int v2, v4, v2

    .line 128
    .line 129
    if-lt v3, v2, :cond_5

    .line 130
    .line 131
    :cond_4
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 132
    .line 133
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    invoke-direct {p0, v2}, Lcom/zte/mifavor/widget/MenuScrollerView;->k(Landroid/view/View;)V

    .line 138
    .line 139
    .line 140
    :cond_5
    add-int/lit8 v3, v3, 0x1

    .line 141
    .line 142
    goto :goto_1

    .line 143
    :cond_6
    iget-object v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->y:Landroid/view/View;

    .line 144
    .line 145
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    iget v3, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 150
    .line 151
    iput v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->L:I

    .line 152
    .line 153
    iget v2, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 154
    .line 155
    iput v2, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->M:I

    .line 156
    .line 157
    new-instance v2, Ljava/lang/StringBuilder;

    .line 158
    .line 159
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 160
    .line 161
    .line 162
    const-string v3, "init Spring Chain out. mItemWidth = "

    .line 163
    .line 164
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    iget v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->L:I

    .line 168
    .line 169
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    const-string v3, ", mItemHeight = "

    .line 173
    .line 174
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    .line 176
    .line 177
    iget v3, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->M:I

    .line 178
    .line 179
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    .line 188
    .line 189
    iget v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->i:I

    .line 190
    .line 191
    invoke-virtual {p0, v1}, Lcom/zte/mifavor/widget/MenuScrollerView;->v(I)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/widget/MenuScrollerView;->setControlSpringID(I)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :cond_7
    const-string p0, "init Spring Chain out. mChild is null."

    .line 199
    .line 200
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    return-void
.end method

.method public scrollBy(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->scrollBy(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public scrollTo(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/HorizontalScrollView;->scrollTo(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setControlSpringID(I)V
    .locals 2

    .line 1
    const/4 v0, 0x6

    .line 2
    iput v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    .line 3
    .line 4
    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->G:I

    .line 5
    .line 6
    div-int/lit8 v1, p1, 0x2

    .line 7
    .line 8
    if-ge v1, v0, :cond_0

    .line 9
    .line 10
    iput v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 13
    .line 14
    const-string v1, "Scroll#MenuScrollerView"

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/widget/q;->k(I)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_1
    const-string p1, "setControlSpringID error. mSpringChain is null."

    .line 23
    .line 24
    invoke-static {v1, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 30
    .line 31
    .line 32
    const-string v0, "set Control Spring ID,  MAX_SPRING_ID = "

    .line 33
    .line 34
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->G:I

    .line 38
    .line 39
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    const-string v0, ", mMaxControlSpringID = "

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->F:I

    .line 48
    .line 49
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    const-string v0, ", mIsEffective = "

    .line 53
    .line 54
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->H:Z

    .line 58
    .line 59
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public setHasMargin(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->I:Z

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "setHasMargin mItemHasMagin = "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->I:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "Scroll#MenuScrollerView"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setItemCount(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->J:I

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "setItemCount mItemCount = "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->J:I

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "Scroll#MenuScrollerView"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setItemGap(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "setItemGap mItemGapPx = "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "Scroll#MenuScrollerView"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setSelectItem(Lcom/zte/mifavor/widget/MenuScrollerView$b;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->h:Lcom/zte/mifavor/widget/MenuScrollerView$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-interface {v0, v1}, Lcom/zte/mifavor/widget/MenuScrollerView$b;->setIsSelected(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iput-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->h:Lcom/zte/mifavor/widget/MenuScrollerView$b;

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    invoke-interface {p1, p0}, Lcom/zte/mifavor/widget/MenuScrollerView$b;->setIsSelected(Z)V

    .line 15
    .line 16
    .line 17
    :cond_1
    return-void
.end method

.method public setSelectPosition(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->i:I

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "set Select Position and smoothScrollTo, mSelectedPosition = "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->i:I

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const-string v0, "Scroll#MenuScrollerView"

    .line 23
    .line 24
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    iget p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->i:I

    .line 28
    .line 29
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/widget/MenuScrollerView;->v(I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public setSpringToEffective(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->H:Z

    .line 2
    .line 3
    new-instance p1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v0, "set Spring To Effective  mIsEffective = "

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    iget-boolean p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->H:Z

    .line 14
    .line 15
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string p1, "Scroll#MenuScrollerView"

    .line 23
    .line 24
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public u()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/widget/LinearLayout;->removeAllViews()V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Landroid/widget/HorizontalScrollView;->removeView(Landroid/view/View;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->g:Landroid/widget/LinearLayout;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->x:Lcom/zte/mifavor/widget/q;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->y:Landroid/view/View;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->z:Landroid/view/View;

    .line 21
    .line 22
    iput-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->h:Lcom/zte/mifavor/widget/MenuScrollerView$b;

    .line 23
    .line 24
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->w:Ljava/util/List;

    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public v(I)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "set Position scroll to  position = "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v1, ", mItemWidth = "

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    iget v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->L:I

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, ", mItemHeight = "

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->M:I

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-string v1, "Scroll#MenuScrollerView"

    .line 39
    .line 40
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    iget v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->L:I

    .line 44
    .line 45
    iget v1, p0, Lcom/zte/mifavor/widget/MenuScrollerView;->K:I

    .line 46
    .line 47
    div-int/lit8 v1, v1, 0x2

    .line 48
    .line 49
    add-int/2addr v0, v1

    .line 50
    mul-int/2addr p1, v0

    .line 51
    const/4 v0, 0x0

    .line 52
    invoke-virtual {p0, p1, v0}, Landroid/widget/HorizontalScrollView;->smoothScrollTo(II)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
