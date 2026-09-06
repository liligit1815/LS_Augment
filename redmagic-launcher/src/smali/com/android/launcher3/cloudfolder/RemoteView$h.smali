.class public Lcom/android/launcher3/cloudfolder/RemoteView$h;
.super Landroid/widget/BaseAdapter;
.source "RemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "h"
.end annotation


# instance fields
.field private g:Landroid/widget/TextView;

.field private h:Landroid/view/View;

.field private i:I

.field private j:Landroid/os/Bundle;

.field private k:[Landroid/os/Parcelable;

.field private l:[Ljava/lang/String;

.field private m:[I

.field private n:[Landroid/os/Parcelable;

.field private o:[I

.field private p:[Ljava/lang/String;

.field private q:I

.field private r:Lcom/android/launcher3/cloudfolder/RemoteView$k;

.field private s:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private t:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/cloudfolder/RemoteView$f;",
            ">;"
        }
    .end annotation
.end field

.field private u:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray<",
            "Lcom/android/launcher3/cloudfolder/RemoteView$f;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic v:Lcom/android/launcher3/cloudfolder/RemoteView;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V
    .locals 1

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, Ljava/util/HashSet;

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->s:Ljava/util/HashSet;

    .line 12
    .line 13
    new-instance v0, Landroid/util/SparseArray;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->t:Landroid/util/SparseArray;

    .line 19
    .line 20
    new-instance v0, Landroid/util/SparseArray;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->u:Landroid/util/SparseArray;

    .line 26
    .line 27
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 28
    .line 29
    if-eqz v0, :cond_0

    .line 30
    .line 31
    new-instance v0, Landroid/widget/TextView;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 34
    .line 35
    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->g:Landroid/widget/TextView;

    .line 39
    .line 40
    const-string p1, "invalid item view"

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    :cond_0
    iput-object p2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->h:Landroid/view/View;

    .line 46
    .line 47
    if-eqz p2, :cond_1

    .line 48
    .line 49
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    iput p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->i:I

    .line 54
    .line 55
    :cond_1
    iput-object p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->j:Landroid/os/Bundle;

    .line 56
    .line 57
    invoke-direct {p0, p4}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->m(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 58
    .line 59
    .line 60
    invoke-direct {p0, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->p(Landroid/os/Bundle;)Z

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/cloudfolder/RemoteView$h;)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->h:Landroid/view/View;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic b(Lcom/android/launcher3/cloudfolder/RemoteView$h;ILandroid/view/View;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->j(ILandroid/view/View;J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic c(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->k(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic d(Lcom/android/launcher3/cloudfolder/RemoteView$h;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(Lcom/android/launcher3/cloudfolder/RemoteView$h;Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->m(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic f(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/view/View;IIJ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->n(Landroid/view/View;IIJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic g(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->o(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/os/Bundle;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->p(Landroid/os/Bundle;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method static bridge synthetic i(Lcom/android/launcher3/cloudfolder/RemoteView$h;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->q(Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private j(ILandroid/view/View;J)V
    .locals 10

    .line 1
    if-eqz p2, :cond_d

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->k:[Landroid/os/Parcelable;

    .line 4
    .line 5
    if-eqz v1, :cond_d

    .line 6
    .line 7
    if-ltz p1, :cond_d

    .line 8
    .line 9
    array-length v3, v1

    .line 10
    if-ge p1, v3, :cond_d

    .line 11
    .line 12
    aget-object v1, v1, p1

    .line 13
    .line 14
    instance-of v3, v1, Landroid/os/Bundle;

    .line 15
    .line 16
    const/4 v7, 0x0

    .line 17
    if-eqz v3, :cond_0

    .line 18
    .line 19
    check-cast v1, Landroid/os/Bundle;

    .line 20
    .line 21
    move-object v8, v1

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    move-object v8, v7

    .line 24
    :goto_0
    iget v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->q:I

    .line 25
    .line 26
    add-int/2addr v1, p1

    .line 27
    invoke-virtual {p2, v1}, Landroid/view/View;->setId(I)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 31
    .line 32
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->l:[Ljava/lang/String;

    .line 33
    .line 34
    iget-object v4, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->m:[I

    .line 35
    .line 36
    invoke-static {v1, p2, v8, v3, v4}, Lcom/android/launcher3/cloudfolder/RemoteView;->d(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/view/View;Landroid/os/Bundle;[Ljava/lang/String;[I)V

    .line 37
    .line 38
    .line 39
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->u:Landroid/util/SparseArray;

    .line 40
    .line 41
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 46
    .line 47
    if-nez v1, :cond_1

    .line 48
    .line 49
    new-instance v1, Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 50
    .line 51
    invoke-direct {v1, v7}, Lcom/android/launcher3/cloudfolder/RemoteView$f;-><init>(Ld1/h;)V

    .line 52
    .line 53
    .line 54
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->u:Landroid/util/SparseArray;

    .line 55
    .line 56
    invoke-virtual {v3, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    move-object v6, v1

    .line 60
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->n:[Landroid/os/Parcelable;

    .line 61
    .line 62
    const/4 v9, 0x0

    .line 63
    if-eqz v1, :cond_3

    .line 64
    .line 65
    array-length v3, v1

    .line 66
    if-ge p1, v3, :cond_3

    .line 67
    .line 68
    aget-object v1, v1, p1

    .line 69
    .line 70
    instance-of v3, v1, Landroid/os/Bundle;

    .line 71
    .line 72
    if-eqz v3, :cond_2

    .line 73
    .line 74
    check-cast v1, Landroid/os/Bundle;

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :cond_2
    move-object v1, v7

    .line 78
    :goto_1
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 79
    .line 80
    invoke-static {v3, v6, p2, v1, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->c(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 81
    .line 82
    .line 83
    :cond_3
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->t:Landroid/util/SparseArray;

    .line 84
    .line 85
    invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 90
    .line 91
    if-nez v1, :cond_4

    .line 92
    .line 93
    new-instance v1, Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 94
    .line 95
    invoke-direct {v1, v7}, Lcom/android/launcher3/cloudfolder/RemoteView$f;-><init>(Ld1/h;)V

    .line 96
    .line 97
    .line 98
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->t:Landroid/util/SparseArray;

    .line 99
    .line 100
    invoke-virtual {v3, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    :cond_4
    move-object v5, v1

    .line 104
    iget v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->i:I

    .line 105
    .line 106
    invoke-virtual {p2, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    instance-of v3, v1, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 111
    .line 112
    if-eqz v3, :cond_5

    .line 113
    .line 114
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 115
    .line 116
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 117
    .line 118
    .line 119
    move-result-object v3

    .line 120
    if-eqz v3, :cond_6

    .line 121
    .line 122
    iget-object v3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 123
    .line 124
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 125
    .line 126
    .line 127
    move-result-object v4

    .line 128
    invoke-static {v3, v4, p2, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->e(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Z)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_5
    move-object v1, v7

    .line 133
    :cond_6
    :goto_2
    if-nez v1, :cond_7

    .line 134
    .line 135
    new-instance v1, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 136
    .line 137
    invoke-direct {v1, v7}, Lcom/android/launcher3/cloudfolder/RemoteView$g;-><init>(Ld1/h;)V

    .line 138
    .line 139
    .line 140
    :cond_7
    move v2, p1

    .line 141
    move-wide v3, p3

    .line 142
    invoke-static/range {v1 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->g(Lcom/android/launcher3/cloudfolder/RemoteView$g;IJLcom/android/launcher3/cloudfolder/RemoteView$f;Lcom/android/launcher3/cloudfolder/RemoteView$f;)V

    .line 143
    .line 144
    .line 145
    iget v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->i:I

    .line 146
    .line 147
    invoke-virtual {p2, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 151
    .line 152
    invoke-static {v2, v5, p2, v8, v9}, Lcom/android/launcher3/cloudfolder/RemoteView;->b(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Landroid/os/Bundle;Z)V

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->o:[I

    .line 156
    .line 157
    if-eqz v2, :cond_b

    .line 158
    .line 159
    array-length v2, v2

    .line 160
    if-lez v2, :cond_b

    .line 161
    .line 162
    :goto_3
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->o:[I

    .line 163
    .line 164
    array-length v3, v2

    .line 165
    if-ge v9, v3, :cond_b

    .line 166
    .line 167
    aget v2, v2, v9

    .line 168
    .line 169
    invoke-virtual {p2, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    if-eqz v3, :cond_a

    .line 174
    .line 175
    new-instance v4, Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 176
    .line 177
    invoke-direct {v4, v7}, Lcom/android/launcher3/cloudfolder/RemoteView$k;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 178
    .line 179
    .line 180
    iget-object v5, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->p:[Ljava/lang/String;

    .line 181
    .line 182
    if-eqz v5, :cond_9

    .line 183
    .line 184
    array-length v6, v5

    .line 185
    if-ge v9, v6, :cond_9

    .line 186
    .line 187
    iget-object v6, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->r:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 188
    .line 189
    if-eqz v6, :cond_9

    .line 190
    .line 191
    iget-object v8, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 192
    .line 193
    aget-object v5, v5, v9

    .line 194
    .line 195
    iget-object v6, v6, Lcom/android/launcher3/cloudfolder/RemoteView$k;->a:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 196
    .line 197
    invoke-static {v8, v4, v5, v6}, Lcom/android/launcher3/cloudfolder/RemoteView;->i(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$k;Ljava/lang/String;Lcom/android/launcher3/cloudfolder/RemoteView$j;)V

    .line 198
    .line 199
    .line 200
    iget-object v5, v4, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 201
    .line 202
    if-nez v5, :cond_8

    .line 203
    .line 204
    iget-object v5, v4, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 205
    .line 206
    if-eqz v5, :cond_9

    .line 207
    .line 208
    :cond_8
    invoke-virtual {v3, v2, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    :cond_9
    iget-object v2, v4, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 212
    .line 213
    invoke-virtual {v3, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    .line 215
    .line 216
    iget-object v2, v4, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 217
    .line 218
    invoke-virtual {v3, v2}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 219
    .line 220
    .line 221
    :cond_a
    add-int/lit8 v9, v9, 0x1

    .line 222
    .line 223
    goto :goto_3

    .line 224
    :cond_b
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->s:Ljava/util/HashSet;

    .line 225
    .line 226
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result v1

    .line 234
    if-nez v1, :cond_d

    .line 235
    .line 236
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->s:Ljava/util/HashSet;

    .line 237
    .line 238
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 239
    .line 240
    .line 241
    move-result-object v2

    .line 242
    invoke-virtual {v1, v2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->r:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 246
    .line 247
    if-eqz v1, :cond_c

    .line 248
    .line 249
    iget-object v1, v1, Lcom/android/launcher3/cloudfolder/RemoteView$k;->d:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 250
    .line 251
    if-eqz v1, :cond_c

    .line 252
    .line 253
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->h:Landroid/view/View;

    .line 254
    .line 255
    move-object v2, v1

    .line 256
    move-object v1, v0

    .line 257
    move-object v0, v2

    .line 258
    move v3, p1

    .line 259
    move-object v2, p2

    .line 260
    move-wide v4, p3

    .line 261
    invoke-static/range {v0 .. v5}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->a(Lcom/android/launcher3/cloudfolder/RemoteView$j;Landroid/view/View;Landroid/view/View;IJ)V

    .line 262
    .line 263
    .line 264
    return-void

    .line 265
    :cond_c
    const-string v0, "RemoteView"

    .line 266
    .line 267
    const-string v1, "mListeners.fshown==null"

    .line 268
    .line 269
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 270
    .line 271
    .line 272
    :cond_d
    return-void
.end method

.method private k(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string p1, "RemoteView"

    .line 4
    .line 5
    const-string v0, "obtainView, view is null"

    .line 6
    .line 7
    invoke-static {p1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 8
    .line 9
    .line 10
    iget-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 11
    .line 12
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->j:Landroid/os/Bundle;

    .line 13
    .line 14
    invoke-static {p1, v0, p2}, Lcom/android/launcher3/cloudfolder/RemoteView;->h(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/os/Bundle;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->g:Landroid/widget/TextView;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_0
    return-object p1
.end method

.method private l()V
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->s:Ljava/util/HashSet;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->h:Landroid/view/View;

    .line 7
    .line 8
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    check-cast v0, Landroid/view/ViewGroup;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    move v3, v2

    .line 20
    :goto_0
    if-ge v3, v1, :cond_1

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    if-eqz v4, :cond_0

    .line 27
    .line 28
    iget v5, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->i:I

    .line 29
    .line 30
    invoke-virtual {v4, v5}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v5

    .line 34
    instance-of v6, v5, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 35
    .line 36
    if-eqz v6, :cond_0

    .line 37
    .line 38
    check-cast v5, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 39
    .line 40
    invoke-static {v5}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    if-eqz v6, :cond_0

    .line 45
    .line 46
    iget-object v6, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->v:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 47
    .line 48
    invoke-static {v5}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-static {v6, v5, v4, v2}, Lcom/android/launcher3/cloudfolder/RemoteView;->e(Lcom/android/launcher3/cloudfolder/RemoteView;Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Z)V

    .line 53
    .line 54
    .line 55
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->t:Landroid/util/SparseArray;

    .line 59
    .line 60
    invoke-virtual {v0}, Landroid/util/SparseArray;->clear()V

    .line 61
    .line 62
    .line 63
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->u:Landroid/util/SparseArray;

    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method private m(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->r:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->r:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 4
    .line 5
    return-object v0
.end method

.method private n(Landroid/view/View;IIJ)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->q:I

    .line 4
    .line 5
    add-int/2addr p0, p3

    .line 6
    invoke-virtual {p1, p0}, Landroid/view/View;->setId(I)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p1, p2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    instance-of p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    check-cast p0, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 18
    .line 19
    invoke-static {p0, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->f(Lcom/android/launcher3/cloudfolder/RemoteView$g;I)V

    .line 20
    .line 21
    .line 22
    invoke-static {p0, p4, p5}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->e(Lcom/android/launcher3/cloudfolder/RemoteView$g;J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method private o(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->p(Landroid/os/Bundle;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private p(Landroid/os/Bundle;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "notify_ids"

    .line 4
    .line 5
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->o:[I

    .line 10
    .line 11
    const-string v0, "notify_events"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->p:[Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "item_startid"

    .line 20
    .line 21
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iput v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->q:I

    .line 26
    .line 27
    const-string v0, "keys"

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArray(Ljava/lang/String;)[Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->l:[Ljava/lang/String;

    .line 34
    .line 35
    const-string v0, "ids"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->m:[I

    .line 42
    .line 43
    const-string v0, "data"

    .line 44
    .line 45
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->k:[Landroid/os/Parcelable;

    .line 50
    .line 51
    const-string v0, "operations"

    .line 52
    .line 53
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->n:[Landroid/os/Parcelable;

    .line 58
    .line 59
    iget-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->s:Ljava/util/HashSet;

    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/util/HashSet;->clear()V

    .line 62
    .line 63
    .line 64
    iget-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->t:Landroid/util/SparseArray;

    .line 65
    .line 66
    invoke-virtual {p1}, Landroid/util/SparseArray;->clear()V

    .line 67
    .line 68
    .line 69
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->u:Landroid/util/SparseArray;

    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/util/SparseArray;->clear()V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x1

    .line 75
    return p0

    .line 76
    :cond_0
    const/4 p0, 0x0

    .line 77
    return p0
.end method

.method private q(Lcom/android/launcher3/cloudfolder/RemoteView$k;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->m(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eq v0, p1, :cond_1

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    invoke-static {v0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$k;->a(Lcom/android/launcher3/cloudfolder/RemoteView$k;Lcom/android/launcher3/cloudfolder/RemoteView$k;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 19
    .line 20
    .line 21
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->k:[Landroid/os/Parcelable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    array-length p0, p0

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public getItem(I)Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$h;->k:[Landroid/os/Parcelable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-ltz p1, :cond_0

    .line 6
    .line 7
    array-length v0, p0

    .line 8
    if-ge p1, v0, :cond_0

    .line 9
    .line 10
    aget-object p0, p0, p1

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    int-to-long p0, p1

    .line 2
    return-wide p0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 2

    .line 1
    invoke-direct {p0, p2, p3}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->k(Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->getItemId(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->j(ILandroid/view/View;J)V

    .line 10
    .line 11
    .line 12
    return-object p2
.end method
