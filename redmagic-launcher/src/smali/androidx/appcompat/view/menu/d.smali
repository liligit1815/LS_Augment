.class final Landroidx/appcompat/view/menu/d;
.super Landroidx/appcompat/view/menu/k;
.source "CascadingMenuPopup.java"

# interfaces
.implements Landroidx/appcompat/view/menu/m;
.implements Landroid/view/View$OnKeyListener;
.implements Landroid/widget/PopupWindow$OnDismissListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/appcompat/view/menu/d$d;
    }
.end annotation


# static fields
.field private static final H:I


# instance fields
.field private A:I

.field private B:Z

.field private C:Z

.field private D:Landroidx/appcompat/view/menu/m$a;

.field E:Landroid/view/ViewTreeObserver;

.field private F:Landroid/widget/PopupWindow$OnDismissListener;

.field G:Z

.field private final h:Landroid/content/Context;

.field private final i:I

.field private final j:I

.field private final k:I

.field private final l:Z

.field final m:Landroid/os/Handler;

.field private final n:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/appcompat/view/menu/g;",
            ">;"
        }
    .end annotation
.end field

.field final o:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/appcompat/view/menu/d$d;",
            ">;"
        }
    .end annotation
.end field

.field final p:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

.field private final q:Landroid/view/View$OnAttachStateChangeListener;

.field private final r:Landroidx/appcompat/widget/N;

.field private s:I

.field private t:I

.field private u:Landroid/view/View;

.field v:Landroid/view/View;

.field private w:I

.field private x:Z

.field private y:Z

.field private z:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Lf/g;->e:I

    .line 2
    .line 3
    sput v0, Landroidx/appcompat/view/menu/d;->H:I

    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/View;IIZ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroidx/appcompat/view/menu/k;-><init>()V

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
    iput-object v0, p0, Landroidx/appcompat/view/menu/d;->n:Ljava/util/List;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 17
    .line 18
    new-instance v0, Landroidx/appcompat/view/menu/d$a;

    .line 19
    .line 20
    invoke-direct {v0, p0}, Landroidx/appcompat/view/menu/d$a;-><init>(Landroidx/appcompat/view/menu/d;)V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Landroidx/appcompat/view/menu/d;->p:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 24
    .line 25
    new-instance v0, Landroidx/appcompat/view/menu/d$b;

    .line 26
    .line 27
    invoke-direct {v0, p0}, Landroidx/appcompat/view/menu/d$b;-><init>(Landroidx/appcompat/view/menu/d;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Landroidx/appcompat/view/menu/d;->q:Landroid/view/View$OnAttachStateChangeListener;

    .line 31
    .line 32
    new-instance v0, Landroidx/appcompat/view/menu/d$c;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Landroidx/appcompat/view/menu/d$c;-><init>(Landroidx/appcompat/view/menu/d;)V

    .line 35
    .line 36
    .line 37
    iput-object v0, p0, Landroidx/appcompat/view/menu/d;->r:Landroidx/appcompat/widget/N;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    iput v0, p0, Landroidx/appcompat/view/menu/d;->s:I

    .line 41
    .line 42
    iput v0, p0, Landroidx/appcompat/view/menu/d;->t:I

    .line 43
    .line 44
    iput-object p1, p0, Landroidx/appcompat/view/menu/d;->h:Landroid/content/Context;

    .line 45
    .line 46
    iput-object p2, p0, Landroidx/appcompat/view/menu/d;->u:Landroid/view/View;

    .line 47
    .line 48
    iput p3, p0, Landroidx/appcompat/view/menu/d;->j:I

    .line 49
    .line 50
    iput p4, p0, Landroidx/appcompat/view/menu/d;->k:I

    .line 51
    .line 52
    iput-boolean p5, p0, Landroidx/appcompat/view/menu/d;->l:Z

    .line 53
    .line 54
    iput-boolean v0, p0, Landroidx/appcompat/view/menu/d;->B:Z

    .line 55
    .line 56
    invoke-direct {p0}, Landroidx/appcompat/view/menu/d;->y()I

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    iput p2, p0, Landroidx/appcompat/view/menu/d;->w:I

    .line 61
    .line 62
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 67
    .line 68
    .line 69
    move-result-object p2

    .line 70
    iget p2, p2, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 71
    .line 72
    div-int/lit8 p2, p2, 0x2

    .line 73
    .line 74
    sget p3, Lf/d;->d:I

    .line 75
    .line 76
    invoke-virtual {p1, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iput p1, p0, Landroidx/appcompat/view/menu/d;->i:I

    .line 85
    .line 86
    new-instance p1, Landroid/os/Handler;

    .line 87
    .line 88
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Landroidx/appcompat/view/menu/d;->m:Landroid/os/Handler;

    .line 92
    .line 93
    return-void
.end method

.method private A(Landroidx/appcompat/view/menu/g;)V
    .locals 11

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->h:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Landroidx/appcompat/view/menu/f;

    .line 8
    .line 9
    iget-boolean v2, p0, Landroidx/appcompat/view/menu/d;->l:Z

    .line 10
    .line 11
    sget v3, Landroidx/appcompat/view/menu/d;->H:I

    .line 12
    .line 13
    invoke-direct {v1, p1, v0, v2, v3}, Landroidx/appcompat/view/menu/f;-><init>(Landroidx/appcompat/view/menu/g;Landroid/view/LayoutInflater;ZI)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/d;->isShowing()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x1

    .line 21
    if-nez v2, :cond_0

    .line 22
    .line 23
    iget-boolean v2, p0, Landroidx/appcompat/view/menu/d;->B:Z

    .line 24
    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    invoke-virtual {v1, v3}, Landroidx/appcompat/view/menu/f;->d(Z)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/d;->isShowing()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_1

    .line 36
    .line 37
    invoke-static {p1}, Landroidx/appcompat/view/menu/k;->s(Landroidx/appcompat/view/menu/g;)Z

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    invoke-virtual {v1, v2}, Landroidx/appcompat/view/menu/f;->d(Z)V

    .line 42
    .line 43
    .line 44
    :cond_1
    :goto_0
    iget-object v2, p0, Landroidx/appcompat/view/menu/d;->h:Landroid/content/Context;

    .line 45
    .line 46
    iget v4, p0, Landroidx/appcompat/view/menu/d;->i:I

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-static {v1, v5, v2, v4}, Landroidx/appcompat/view/menu/k;->j(Landroid/widget/ListAdapter;Landroid/view/ViewGroup;Landroid/content/Context;I)I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    invoke-direct {p0}, Landroidx/appcompat/view/menu/d;->u()Landroidx/appcompat/widget/O;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v4, v1}, Landroidx/appcompat/widget/M;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/M;->s(I)V

    .line 61
    .line 62
    .line 63
    iget v1, p0, Landroidx/appcompat/view/menu/d;->t:I

    .line 64
    .line 65
    invoke-virtual {v4, v1}, Landroidx/appcompat/widget/M;->t(I)V

    .line 66
    .line 67
    .line 68
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 69
    .line 70
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    if-lez v1, :cond_2

    .line 75
    .line 76
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 77
    .line 78
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 79
    .line 80
    .line 81
    move-result v6

    .line 82
    sub-int/2addr v6, v3

    .line 83
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    check-cast v1, Landroidx/appcompat/view/menu/d$d;

    .line 88
    .line 89
    invoke-direct {p0, v1, p1}, Landroidx/appcompat/view/menu/d;->x(Landroidx/appcompat/view/menu/d$d;Landroidx/appcompat/view/menu/g;)Landroid/view/View;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    goto :goto_1

    .line 94
    :cond_2
    move-object v1, v5

    .line 95
    move-object v6, v1

    .line 96
    :goto_1
    const/4 v7, 0x0

    .line 97
    if-eqz v6, :cond_7

    .line 98
    .line 99
    invoke-virtual {v4, v7}, Landroidx/appcompat/widget/O;->I(Z)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {v4, v5}, Landroidx/appcompat/widget/O;->F(Ljava/lang/Object;)V

    .line 103
    .line 104
    .line 105
    invoke-direct {p0, v2}, Landroidx/appcompat/view/menu/d;->z(I)I

    .line 106
    .line 107
    .line 108
    move-result v8

    .line 109
    if-ne v8, v3, :cond_3

    .line 110
    .line 111
    move v9, v3

    .line 112
    goto :goto_2

    .line 113
    :cond_3
    move v9, v7

    .line 114
    :goto_2
    iput v8, p0, Landroidx/appcompat/view/menu/d;->w:I

    .line 115
    .line 116
    invoke-virtual {v4, v6}, Landroidx/appcompat/widget/M;->q(Landroid/view/View;)V

    .line 117
    .line 118
    .line 119
    iget v8, p0, Landroidx/appcompat/view/menu/d;->t:I

    .line 120
    .line 121
    const/4 v10, 0x5

    .line 122
    and-int/2addr v8, v10

    .line 123
    if-ne v8, v10, :cond_5

    .line 124
    .line 125
    if-eqz v9, :cond_4

    .line 126
    .line 127
    goto :goto_3

    .line 128
    :cond_4
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 129
    .line 130
    .line 131
    move-result v2

    .line 132
    rsub-int/lit8 v2, v2, 0x0

    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_5
    if-eqz v9, :cond_6

    .line 136
    .line 137
    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    .line 138
    .line 139
    .line 140
    move-result v2

    .line 141
    goto :goto_3

    .line 142
    :cond_6
    rsub-int/lit8 v2, v2, 0x0

    .line 143
    .line 144
    :goto_3
    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/M;->setHorizontalOffset(I)V

    .line 145
    .line 146
    .line 147
    invoke-virtual {v4, v3}, Landroidx/appcompat/widget/M;->A(Z)V

    .line 148
    .line 149
    .line 150
    invoke-virtual {v4, v7}, Landroidx/appcompat/widget/M;->setVerticalOffset(I)V

    .line 151
    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_7
    iget-boolean v2, p0, Landroidx/appcompat/view/menu/d;->x:Z

    .line 155
    .line 156
    if-eqz v2, :cond_8

    .line 157
    .line 158
    iget v2, p0, Landroidx/appcompat/view/menu/d;->z:I

    .line 159
    .line 160
    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/M;->setHorizontalOffset(I)V

    .line 161
    .line 162
    .line 163
    :cond_8
    iget-boolean v2, p0, Landroidx/appcompat/view/menu/d;->y:Z

    .line 164
    .line 165
    if-eqz v2, :cond_9

    .line 166
    .line 167
    iget v2, p0, Landroidx/appcompat/view/menu/d;->A:I

    .line 168
    .line 169
    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/M;->setVerticalOffset(I)V

    .line 170
    .line 171
    .line 172
    :cond_9
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/k;->i()Landroid/graphics/Rect;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    invoke-virtual {v4, v2}, Landroidx/appcompat/widget/M;->u(Landroid/graphics/Rect;)V

    .line 177
    .line 178
    .line 179
    :goto_4
    new-instance v2, Landroidx/appcompat/view/menu/d$d;

    .line 180
    .line 181
    iget v3, p0, Landroidx/appcompat/view/menu/d;->w:I

    .line 182
    .line 183
    invoke-direct {v2, v4, p1, v3}, Landroidx/appcompat/view/menu/d$d;-><init>(Landroidx/appcompat/widget/O;Landroidx/appcompat/view/menu/g;I)V

    .line 184
    .line 185
    .line 186
    iget-object v3, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 187
    .line 188
    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    invoke-virtual {v4}, Landroidx/appcompat/widget/M;->show()V

    .line 192
    .line 193
    .line 194
    invoke-virtual {v4}, Landroidx/appcompat/widget/M;->getListView()Landroid/widget/ListView;

    .line 195
    .line 196
    .line 197
    move-result-object v2

    .line 198
    invoke-virtual {v2, p0}, Landroid/widget/ListView;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    .line 199
    .line 200
    .line 201
    if-nez v1, :cond_a

    .line 202
    .line 203
    iget-boolean p0, p0, Landroidx/appcompat/view/menu/d;->C:Z

    .line 204
    .line 205
    if-eqz p0, :cond_a

    .line 206
    .line 207
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/g;->x()Ljava/lang/CharSequence;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    if-eqz p0, :cond_a

    .line 212
    .line 213
    sget p0, Lf/g;->l:I

    .line 214
    .line 215
    invoke-virtual {v0, p0, v2, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    check-cast p0, Landroid/widget/FrameLayout;

    .line 220
    .line 221
    const v0, 0x1020016

    .line 222
    .line 223
    .line 224
    invoke-virtual {p0, v0}, Landroid/widget/FrameLayout;->findViewById(I)Landroid/view/View;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    check-cast v0, Landroid/widget/TextView;

    .line 229
    .line 230
    invoke-virtual {p0, v7}, Landroid/widget/FrameLayout;->setEnabled(Z)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/g;->x()Ljava/lang/CharSequence;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 238
    .line 239
    .line 240
    invoke-virtual {v2, p0, v5, v7}, Landroid/widget/ListView;->addHeaderView(Landroid/view/View;Ljava/lang/Object;Z)V

    .line 241
    .line 242
    .line 243
    invoke-virtual {v4}, Landroidx/appcompat/widget/M;->show()V

    .line 244
    .line 245
    .line 246
    :cond_a
    return-void
.end method

.method private u()Landroidx/appcompat/widget/O;
    .locals 5

    .line 1
    new-instance v0, Landroidx/appcompat/widget/O;

    .line 2
    .line 3
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->h:Landroid/content/Context;

    .line 4
    .line 5
    iget v2, p0, Landroidx/appcompat/view/menu/d;->j:I

    .line 6
    .line 7
    iget v3, p0, Landroidx/appcompat/view/menu/d;->k:I

    .line 8
    .line 9
    const/4 v4, 0x0

    .line 10
    invoke-direct {v0, v1, v4, v2, v3}, Landroidx/appcompat/widget/O;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->r:Landroidx/appcompat/widget/N;

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/O;->H(Landroidx/appcompat/widget/N;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/M;->y(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/M;->x(Landroid/widget/PopupWindow$OnDismissListener;)V

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->u:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/M;->q(Landroid/view/View;)V

    .line 27
    .line 28
    .line 29
    iget p0, p0, Landroidx/appcompat/view/menu/d;->t:I

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/M;->t(I)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/M;->w(Z)V

    .line 36
    .line 37
    .line 38
    const/4 p0, 0x2

    .line 39
    invoke-virtual {v0, p0}, Landroidx/appcompat/widget/M;->v(I)V

    .line 40
    .line 41
    .line 42
    return-object v0
.end method

.method private v(Landroidx/appcompat/view/menu/g;)I
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Landroidx/appcompat/view/menu/d$d;

    .line 17
    .line 18
    iget-object v2, v2, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 19
    .line 20
    if-ne p1, v2, :cond_0

    .line 21
    .line 22
    return v1

    .line 23
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const/4 p0, -0x1

    .line 27
    return p0
.end method

.method private w(Landroidx/appcompat/view/menu/g;Landroidx/appcompat/view/menu/g;)Landroid/view/MenuItem;
    .locals 3

    .line 1
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/g;->size()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    if-ge v0, p0, :cond_1

    .line 7
    .line 8
    invoke-virtual {p1, v0}, Landroidx/appcompat/view/menu/g;->getItem(I)Landroid/view/MenuItem;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-interface {v1}, Landroid/view/MenuItem;->hasSubMenu()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    invoke-interface {v1}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    if-ne p2, v2, :cond_0

    .line 23
    .line 24
    return-object v1

    .line 25
    :cond_0
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method private x(Landroidx/appcompat/view/menu/d$d;Landroidx/appcompat/view/menu/g;)Landroid/view/View;
    .locals 6

    .line 1
    iget-object v0, p1, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 2
    .line 3
    invoke-direct {p0, v0, p2}, Landroidx/appcompat/view/menu/d;->w(Landroidx/appcompat/view/menu/g;Landroidx/appcompat/view/menu/g;)Landroid/view/MenuItem;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 p2, 0x0

    .line 8
    if-nez p0, :cond_0

    .line 9
    .line 10
    return-object p2

    .line 11
    :cond_0
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/d$d;->a()Landroid/widget/ListView;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    instance-of v1, v0, Landroid/widget/HeaderViewListAdapter;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    check-cast v0, Landroid/widget/HeaderViewListAdapter;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/widget/HeaderViewListAdapter;->getHeadersCount()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {v0}, Landroid/widget/HeaderViewListAdapter;->getWrappedAdapter()Landroid/widget/ListAdapter;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Landroidx/appcompat/view/menu/f;

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    check-cast v0, Landroidx/appcompat/view/menu/f;

    .line 38
    .line 39
    move v1, v2

    .line 40
    :goto_0
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/f;->getCount()I

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    :goto_1
    const/4 v4, -0x1

    .line 45
    if-ge v2, v3, :cond_3

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Landroidx/appcompat/view/menu/f;->c(I)Landroidx/appcompat/view/menu/i;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    if-ne p0, v5, :cond_2

    .line 52
    .line 53
    goto :goto_2

    .line 54
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_3
    move v2, v4

    .line 58
    :goto_2
    if-ne v2, v4, :cond_4

    .line 59
    .line 60
    return-object p2

    .line 61
    :cond_4
    add-int/2addr v2, v1

    .line 62
    invoke-virtual {p1}, Landroid/widget/ListView;->getFirstVisiblePosition()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    sub-int/2addr v2, p0

    .line 67
    if-ltz v2, :cond_6

    .line 68
    .line 69
    invoke-virtual {p1}, Landroid/widget/ListView;->getChildCount()I

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-lt v2, p0, :cond_5

    .line 74
    .line 75
    goto :goto_3

    .line 76
    :cond_5
    invoke-virtual {p1, v2}, Landroid/widget/ListView;->getChildAt(I)Landroid/view/View;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0

    .line 81
    :cond_6
    :goto_3
    return-object p2
.end method

.method private y()I
    .locals 1

    .line 1
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->u:Landroid/view/View;

    .line 2
    .line 3
    invoke-static {p0}, LJ/I;->v(Landroid/view/View;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x1

    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_0
    return v0
.end method

.method private z(I)I
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x1

    .line 8
    sub-int/2addr v1, v2

    .line 9
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroidx/appcompat/view/menu/d$d;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroidx/appcompat/view/menu/d$d;->a()Landroid/widget/ListView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const/4 v1, 0x2

    .line 20
    new-array v1, v1, [I

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->getLocationOnScreen([I)V

    .line 23
    .line 24
    .line 25
    new-instance v3, Landroid/graphics/Rect;

    .line 26
    .line 27
    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 28
    .line 29
    .line 30
    iget-object v4, p0, Landroidx/appcompat/view/menu/d;->v:Landroid/view/View;

    .line 31
    .line 32
    invoke-virtual {v4, v3}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 33
    .line 34
    .line 35
    iget p0, p0, Landroidx/appcompat/view/menu/d;->w:I

    .line 36
    .line 37
    const/4 v4, 0x0

    .line 38
    if-ne p0, v2, :cond_1

    .line 39
    .line 40
    aget p0, v1, v4

    .line 41
    .line 42
    invoke-virtual {v0}, Landroid/widget/ListView;->getWidth()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    add-int/2addr p0, v0

    .line 47
    add-int/2addr p0, p1

    .line 48
    iget p1, v3, Landroid/graphics/Rect;->right:I

    .line 49
    .line 50
    if-le p0, p1, :cond_0

    .line 51
    .line 52
    return v4

    .line 53
    :cond_0
    return v2

    .line 54
    :cond_1
    aget p0, v1, v4

    .line 55
    .line 56
    sub-int/2addr p0, p1

    .line 57
    if-gez p0, :cond_2

    .line 58
    .line 59
    return v2

    .line 60
    :cond_2
    return v4
.end method


# virtual methods
.method public a(Landroidx/appcompat/view/menu/g;Z)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/view/menu/d;->v(Landroidx/appcompat/view/menu/g;)I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-gez v0, :cond_0

    .line 6
    .line 7
    goto/16 :goto_1

    .line 8
    .line 9
    :cond_0
    add-int/lit8 v1, v0, 0x1

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    const/4 v3, 0x0

    .line 18
    if-ge v1, v2, :cond_1

    .line 19
    .line 20
    iget-object v2, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Landroidx/appcompat/view/menu/d$d;

    .line 27
    .line 28
    iget-object v1, v1, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Landroidx/appcompat/view/menu/g;->e(Z)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v1, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Landroidx/appcompat/view/menu/d$d;

    .line 40
    .line 41
    iget-object v1, v0, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 42
    .line 43
    invoke-virtual {v1, p0}, Landroidx/appcompat/view/menu/g;->O(Landroidx/appcompat/view/menu/m;)V

    .line 44
    .line 45
    .line 46
    iget-boolean v1, p0, Landroidx/appcompat/view/menu/d;->G:Z

    .line 47
    .line 48
    const/4 v2, 0x0

    .line 49
    if-eqz v1, :cond_2

    .line 50
    .line 51
    iget-object v1, v0, Landroidx/appcompat/view/menu/d$d;->a:Landroidx/appcompat/widget/O;

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/O;->G(Ljava/lang/Object;)V

    .line 54
    .line 55
    .line 56
    iget-object v1, v0, Landroidx/appcompat/view/menu/d$d;->a:Landroidx/appcompat/widget/O;

    .line 57
    .line 58
    invoke-virtual {v1, v3}, Landroidx/appcompat/widget/M;->r(I)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object v0, v0, Landroidx/appcompat/view/menu/d$d;->a:Landroidx/appcompat/widget/O;

    .line 62
    .line 63
    invoke-virtual {v0}, Landroidx/appcompat/widget/M;->dismiss()V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 67
    .line 68
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-lez v0, :cond_3

    .line 73
    .line 74
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 75
    .line 76
    add-int/lit8 v4, v0, -0x1

    .line 77
    .line 78
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Landroidx/appcompat/view/menu/d$d;

    .line 83
    .line 84
    iget v1, v1, Landroidx/appcompat/view/menu/d$d;->c:I

    .line 85
    .line 86
    iput v1, p0, Landroidx/appcompat/view/menu/d;->w:I

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    invoke-direct {p0}, Landroidx/appcompat/view/menu/d;->y()I

    .line 90
    .line 91
    .line 92
    move-result v1

    .line 93
    iput v1, p0, Landroidx/appcompat/view/menu/d;->w:I

    .line 94
    .line 95
    :goto_0
    if-nez v0, :cond_7

    .line 96
    .line 97
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/d;->dismiss()V

    .line 98
    .line 99
    .line 100
    iget-object p2, p0, Landroidx/appcompat/view/menu/d;->D:Landroidx/appcompat/view/menu/m$a;

    .line 101
    .line 102
    if-eqz p2, :cond_4

    .line 103
    .line 104
    const/4 v0, 0x1

    .line 105
    invoke-interface {p2, p1, v0}, Landroidx/appcompat/view/menu/m$a;->a(Landroidx/appcompat/view/menu/g;Z)V

    .line 106
    .line 107
    .line 108
    :cond_4
    iget-object p1, p0, Landroidx/appcompat/view/menu/d;->E:Landroid/view/ViewTreeObserver;

    .line 109
    .line 110
    if-eqz p1, :cond_6

    .line 111
    .line 112
    invoke-virtual {p1}, Landroid/view/ViewTreeObserver;->isAlive()Z

    .line 113
    .line 114
    .line 115
    move-result p1

    .line 116
    if-eqz p1, :cond_5

    .line 117
    .line 118
    iget-object p1, p0, Landroidx/appcompat/view/menu/d;->E:Landroid/view/ViewTreeObserver;

    .line 119
    .line 120
    iget-object p2, p0, Landroidx/appcompat/view/menu/d;->p:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 121
    .line 122
    invoke-virtual {p1, p2}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 123
    .line 124
    .line 125
    :cond_5
    iput-object v2, p0, Landroidx/appcompat/view/menu/d;->E:Landroid/view/ViewTreeObserver;

    .line 126
    .line 127
    :cond_6
    iget-object p1, p0, Landroidx/appcompat/view/menu/d;->v:Landroid/view/View;

    .line 128
    .line 129
    iget-object p2, p0, Landroidx/appcompat/view/menu/d;->q:Landroid/view/View$OnAttachStateChangeListener;

    .line 130
    .line 131
    invoke-virtual {p1, p2}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->F:Landroid/widget/PopupWindow$OnDismissListener;

    .line 135
    .line 136
    invoke-interface {p0}, Landroid/widget/PopupWindow$OnDismissListener;->onDismiss()V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :cond_7
    if-eqz p2, :cond_8

    .line 141
    .line 142
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 143
    .line 144
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    check-cast p0, Landroidx/appcompat/view/menu/d$d;

    .line 149
    .line 150
    iget-object p0, p0, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 151
    .line 152
    invoke-virtual {p0, v3}, Landroidx/appcompat/view/menu/g;->e(Z)V

    .line 153
    .line 154
    .line 155
    :cond_8
    :goto_1
    return-void
.end method

.method public c(Landroidx/appcompat/view/menu/m$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/view/menu/d;->D:Landroidx/appcompat/view/menu/m$a;

    .line 2
    .line 3
    return-void
.end method

.method public d(Landroidx/appcompat/view/menu/r;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const/4 v2, 0x1

    .line 12
    if-eqz v1, :cond_1

    .line 13
    .line 14
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    check-cast v1, Landroidx/appcompat/view/menu/d$d;

    .line 19
    .line 20
    iget-object v3, v1, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 21
    .line 22
    if-ne p1, v3, :cond_0

    .line 23
    .line 24
    invoke-virtual {v1}, Landroidx/appcompat/view/menu/d$d;->a()Landroid/widget/ListView;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Landroid/widget/ListView;->requestFocus()Z

    .line 29
    .line 30
    .line 31
    return v2

    .line 32
    :cond_1
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/g;->hasVisibleItems()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0, p1}, Landroidx/appcompat/view/menu/d;->g(Landroidx/appcompat/view/menu/g;)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->D:Landroidx/appcompat/view/menu/m$a;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    invoke-interface {p0, p1}, Landroidx/appcompat/view/menu/m$a;->b(Landroidx/appcompat/view/menu/g;)Z

    .line 46
    .line 47
    .line 48
    :cond_2
    return v2

    .line 49
    :cond_3
    const/4 p0, 0x0

    .line 50
    return p0
.end method

.method public dismiss()V
    .locals 3

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 10
    .line 11
    new-array v1, v0, [Landroidx/appcompat/view/menu/d$d;

    .line 12
    .line 13
    invoke-interface {p0, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, [Landroidx/appcompat/view/menu/d$d;

    .line 18
    .line 19
    add-int/lit8 v0, v0, -0x1

    .line 20
    .line 21
    :goto_0
    if-ltz v0, :cond_1

    .line 22
    .line 23
    aget-object v1, p0, v0

    .line 24
    .line 25
    iget-object v2, v1, Landroidx/appcompat/view/menu/d$d;->a:Landroidx/appcompat/widget/O;

    .line 26
    .line 27
    invoke-virtual {v2}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_0

    .line 32
    .line 33
    iget-object v1, v1, Landroidx/appcompat/view/menu/d$d;->a:Landroidx/appcompat/widget/O;

    .line 34
    .line 35
    invoke-virtual {v1}, Landroidx/appcompat/widget/M;->dismiss()V

    .line 36
    .line 37
    .line 38
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public flagActionItems()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public g(Landroidx/appcompat/view/menu/g;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->h:Landroid/content/Context;

    .line 2
    .line 3
    invoke-virtual {p1, p0, v0}, Landroidx/appcompat/view/menu/g;->c(Landroidx/appcompat/view/menu/m;Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/d;->isShowing()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0, p1}, Landroidx/appcompat/view/menu/d;->A(Landroidx/appcompat/view/menu/g;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->n:Ljava/util/List;

    .line 17
    .line 18
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public getListView()Landroid/widget/ListView;
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/lit8 v0, v0, -0x1

    .line 18
    .line 19
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroidx/appcompat/view/menu/d$d;

    .line 24
    .line 25
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/d$d;->a()Landroid/widget/ListView;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method protected h()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public isShowing()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-lez v0, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 11
    .line 12
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroidx/appcompat/view/menu/d$d;

    .line 17
    .line 18
    iget-object p0, p0, Landroidx/appcompat/view/menu/d$d;->a:Landroidx/appcompat/widget/O;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x1

    .line 27
    return p0

    .line 28
    :cond_0
    return v1
.end method

.method public k(Landroid/view/View;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->u:Landroid/view/View;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Landroidx/appcompat/view/menu/d;->u:Landroid/view/View;

    .line 6
    .line 7
    iget v0, p0, Landroidx/appcompat/view/menu/d;->s:I

    .line 8
    .line 9
    invoke-static {p1}, LJ/I;->v(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0, p1}, LJ/h;->b(II)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Landroidx/appcompat/view/menu/d;->t:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/view/menu/d;->B:Z

    .line 2
    .line 3
    return-void
.end method

.method public n(I)V
    .locals 1

    .line 1
    iget v0, p0, Landroidx/appcompat/view/menu/d;->s:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Landroidx/appcompat/view/menu/d;->s:I

    .line 6
    .line 7
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->u:Landroid/view/View;

    .line 8
    .line 9
    invoke-static {v0}, LJ/I;->v(Landroid/view/View;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    invoke-static {p1, v0}, LJ/h;->b(II)I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iput p1, p0, Landroidx/appcompat/view/menu/d;->t:I

    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public o(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/appcompat/view/menu/d;->x:Z

    .line 3
    .line 4
    iput p1, p0, Landroidx/appcompat/view/menu/d;->z:I

    .line 5
    .line 6
    return-void
.end method

.method public onDismiss()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    move v2, v1

    .line 9
    :goto_0
    if-ge v2, v0, :cond_1

    .line 10
    .line 11
    iget-object v3, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 12
    .line 13
    invoke-interface {v3, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Landroidx/appcompat/view/menu/d$d;

    .line 18
    .line 19
    iget-object v4, v3, Landroidx/appcompat/view/menu/d$d;->a:Landroidx/appcompat/widget/O;

    .line 20
    .line 21
    invoke-virtual {v4}, Landroidx/appcompat/widget/M;->isShowing()Z

    .line 22
    .line 23
    .line 24
    move-result v4

    .line 25
    if-nez v4, :cond_0

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    const/4 v3, 0x0

    .line 32
    :goto_1
    if-eqz v3, :cond_2

    .line 33
    .line 34
    iget-object p0, v3, Landroidx/appcompat/view/menu/d$d;->b:Landroidx/appcompat/view/menu/g;

    .line 35
    .line 36
    invoke-virtual {p0, v1}, Landroidx/appcompat/view/menu/g;->e(Z)V

    .line 37
    .line 38
    .line 39
    :cond_2
    return-void
.end method

.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    const/4 p3, 0x1

    .line 6
    if-ne p1, p3, :cond_0

    .line 7
    .line 8
    const/16 p1, 0x52

    .line 9
    .line 10
    if-ne p2, p1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/d;->dismiss()V

    .line 13
    .line 14
    .line 15
    return p3

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public p(Landroid/widget/PopupWindow$OnDismissListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/appcompat/view/menu/d;->F:Landroid/widget/PopupWindow$OnDismissListener;

    .line 2
    .line 3
    return-void
.end method

.method public q(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/appcompat/view/menu/d;->C:Z

    .line 2
    .line 3
    return-void
.end method

.method public r(I)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Landroidx/appcompat/view/menu/d;->y:Z

    .line 3
    .line 4
    iput p1, p0, Landroidx/appcompat/view/menu/d;->A:I

    .line 5
    .line 6
    return-void
.end method

.method public show()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/appcompat/view/menu/d;->isShowing()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_2

    .line 8
    :cond_0
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->n:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Landroidx/appcompat/view/menu/g;

    .line 25
    .line 26
    invoke-direct {p0, v1}, Landroidx/appcompat/view/menu/d;->A(Landroidx/appcompat/view/menu/g;)V

    .line 27
    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->n:Ljava/util/List;

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 33
    .line 34
    .line 35
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->u:Landroid/view/View;

    .line 36
    .line 37
    iput-object v0, p0, Landroidx/appcompat/view/menu/d;->v:Landroid/view/View;

    .line 38
    .line 39
    if-eqz v0, :cond_4

    .line 40
    .line 41
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->E:Landroid/view/ViewTreeObserver;

    .line 42
    .line 43
    if-nez v1, :cond_2

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    goto :goto_1

    .line 47
    :cond_2
    const/4 v1, 0x0

    .line 48
    :goto_1
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    iput-object v0, p0, Landroidx/appcompat/view/menu/d;->E:Landroid/view/ViewTreeObserver;

    .line 53
    .line 54
    if-eqz v1, :cond_3

    .line 55
    .line 56
    iget-object v1, p0, Landroidx/appcompat/view/menu/d;->p:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 57
    .line 58
    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 59
    .line 60
    .line 61
    :cond_3
    iget-object v0, p0, Landroidx/appcompat/view/menu/d;->v:Landroid/view/View;

    .line 62
    .line 63
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->q:Landroid/view/View$OnAttachStateChangeListener;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    :goto_2
    return-void
.end method

.method public updateMenuView(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/appcompat/view/menu/d;->o:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    check-cast p1, Landroidx/appcompat/view/menu/d$d;

    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/d$d;->a()Landroid/widget/ListView;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {p1}, Landroidx/appcompat/view/menu/k;->t(Landroid/widget/ListAdapter;)Landroidx/appcompat/view/menu/f;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Landroidx/appcompat/view/menu/f;->notifyDataSetChanged()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void
.end method
