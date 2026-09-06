.class public Lcom/android/launcher3/cloudfolder/RemoteView$i;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "RemoteView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "i"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/android/launcher3/cloudfolder/RemoteView$i$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/android/launcher3/cloudfolder/RemoteView$i$c;",
        ">;"
    }
.end annotation


# instance fields
.field private a:Landroid/widget/ListView;

.field private b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

.field private c:Lcom/android/launcher3/cloudfolder/RemoteView$k;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    new-instance v0, Landroid/widget/ListView;

    .line 11
    .line 12
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView;->c:Landroid/content/Context;

    .line 13
    .line 14
    invoke-direct {v0, v1}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->a:Landroid/widget/ListView;

    .line 18
    .line 19
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setId(I)V

    .line 24
    .line 25
    .line 26
    :cond_0
    invoke-direct {p0, p4}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->m(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 27
    .line 28
    .line 29
    new-instance v0, Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 30
    .line 31
    invoke-direct {v0, p1, p2, p3, p4}, Lcom/android/launcher3/cloudfolder/RemoteView$h;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView;Landroid/view/View;Landroid/os/Bundle;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 35
    .line 36
    return-void
.end method

.method static bridge synthetic f(Lcom/android/launcher3/cloudfolder/RemoteView$i;)Landroid/widget/ListView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->a:Landroid/widget/ListView;

    .line 2
    .line 3
    return-object p0
.end method

.method static bridge synthetic g(Lcom/android/launcher3/cloudfolder/RemoteView$i;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->l()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic h(Lcom/android/launcher3/cloudfolder/RemoteView$i;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->o(Landroid/os/Bundle;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic i(Lcom/android/launcher3/cloudfolder/RemoteView$i;Lcom/android/launcher3/cloudfolder/RemoteView$k;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->p(Lcom/android/launcher3/cloudfolder/RemoteView$k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private l()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-static {p0}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->d(Lcom/android/launcher3/cloudfolder/RemoteView$h;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method private m(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->c:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 2
    .line 3
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->c:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 4
    .line 5
    return-object v0
.end method

.method private n(Landroid/view/View;I)V
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->c:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->b:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    new-instance v1, Lcom/android/launcher3/cloudfolder/RemoteView$i$a;

    .line 12
    .line 13
    invoke-direct {v1, p0, v0, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$i$a;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView$i;Lcom/android/launcher3/cloudfolder/RemoteView$j;I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->c:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 20
    .line 21
    iget-object v0, v0, Lcom/android/launcher3/cloudfolder/RemoteView$k;->c:Lcom/android/launcher3/cloudfolder/RemoteView$j;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    new-instance v1, Lcom/android/launcher3/cloudfolder/RemoteView$i$b;

    .line 26
    .line 27
    invoke-direct {v1, p0, v0, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$i$b;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView$i;Lcom/android/launcher3/cloudfolder/RemoteView$j;I)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method private o(Landroid/os/Bundle;)V
    .locals 12

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 4
    .line 5
    invoke-static {v0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->h(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/os/Bundle;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_6

    .line 10
    .line 11
    const-string v0, "items_added"

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "items_removed"

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    const-string v2, "items_updated"

    .line 24
    .line 25
    invoke-virtual {p1, v2}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    const-string v3, "items_moved"

    .line 30
    .line 31
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->getIntArray(Ljava/lang/String;)[I

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->getItemCount()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    const/4 v4, 0x2

    .line 40
    const/4 v5, 0x0

    .line 41
    const/4 v6, 0x1

    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    array-length v7, v0

    .line 45
    if-ne v7, v4, :cond_0

    .line 46
    .line 47
    aget v7, v0, v5

    .line 48
    .line 49
    aget v0, v0, v6

    .line 50
    .line 51
    if-ltz v7, :cond_0

    .line 52
    .line 53
    if-ge v7, v3, :cond_0

    .line 54
    .line 55
    if-lez v0, :cond_0

    .line 56
    .line 57
    if-gt v0, v3, :cond_0

    .line 58
    .line 59
    invoke-virtual {p0, v7, v0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeInserted(II)V

    .line 60
    .line 61
    .line 62
    move v0, v6

    .line 63
    goto :goto_0

    .line 64
    :cond_0
    move v0, v5

    .line 65
    :goto_0
    if-eqz v1, :cond_1

    .line 66
    .line 67
    array-length v7, v1

    .line 68
    if-ne v7, v4, :cond_1

    .line 69
    .line 70
    aget v7, v1, v5

    .line 71
    .line 72
    aget v1, v1, v6

    .line 73
    .line 74
    if-ltz v7, :cond_1

    .line 75
    .line 76
    if-ge v7, v3, :cond_1

    .line 77
    .line 78
    if-lez v1, :cond_1

    .line 79
    .line 80
    if-gt v1, v3, :cond_1

    .line 81
    .line 82
    invoke-virtual {p0, v7, v1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeRemoved(II)V

    .line 83
    .line 84
    .line 85
    move v0, v6

    .line 86
    :cond_1
    if-eqz v2, :cond_2

    .line 87
    .line 88
    array-length v1, v2

    .line 89
    if-ne v1, v4, :cond_2

    .line 90
    .line 91
    aget v1, v2, v5

    .line 92
    .line 93
    aget v2, v2, v6

    .line 94
    .line 95
    if-ltz v1, :cond_2

    .line 96
    .line 97
    if-ge v1, v3, :cond_2

    .line 98
    .line 99
    if-lez v2, :cond_2

    .line 100
    .line 101
    if-gt v2, v3, :cond_2

    .line 102
    .line 103
    invoke-virtual {p0, v1, v2}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemRangeChanged(II)V

    .line 104
    .line 105
    .line 106
    move v0, v6

    .line 107
    :cond_2
    if-eqz p1, :cond_3

    .line 108
    .line 109
    array-length v1, p1

    .line 110
    if-ne v1, v4, :cond_3

    .line 111
    .line 112
    aget v1, p1, v5

    .line 113
    .line 114
    aget p1, p1, v6

    .line 115
    .line 116
    if-ltz v1, :cond_3

    .line 117
    .line 118
    if-ge v1, v3, :cond_3

    .line 119
    .line 120
    if-ltz p1, :cond_3

    .line 121
    .line 122
    if-ge p1, v3, :cond_3

    .line 123
    .line 124
    invoke-virtual {p0, v1, p1}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyItemMoved(II)V

    .line 125
    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_3
    move v6, v0

    .line 129
    :goto_1
    if-eqz v6, :cond_5

    .line 130
    .line 131
    iget-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 132
    .line 133
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->a(Lcom/android/launcher3/cloudfolder/RemoteView$h;)Landroid/view/View;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    instance-of p1, p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 138
    .line 139
    if-eqz p1, :cond_6

    .line 140
    .line 141
    iget-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 142
    .line 143
    invoke-static {p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->a(Lcom/android/launcher3/cloudfolder/RemoteView$h;)Landroid/view/View;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    .line 148
    .line 149
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    :goto_2
    if-ge v5, v0, :cond_6

    .line 154
    .line 155
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    if-eqz v7, :cond_4

    .line 160
    .line 161
    invoke-virtual {p1, v7}, Landroidx/recyclerview/widget/RecyclerView;->getChildViewHolder(Landroid/view/View;)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/RemoteView$i$c;

    .line 166
    .line 167
    if-eqz v2, :cond_4

    .line 168
    .line 169
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->getAdapterPosition()I

    .line 170
    .line 171
    .line 172
    move-result v9

    .line 173
    invoke-direct {p0, v7, v9}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->n(Landroid/view/View;I)V

    .line 174
    .line 175
    .line 176
    iget-object v6, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 177
    .line 178
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getId()I

    .line 179
    .line 180
    .line 181
    move-result v8

    .line 182
    invoke-virtual {p0, v9}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->getItemId(I)J

    .line 183
    .line 184
    .line 185
    move-result-wide v10

    .line 186
    invoke-static/range {v6 .. v11}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->f(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/view/View;IIJ)V

    .line 187
    .line 188
    .line 189
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 190
    .line 191
    goto :goto_2

    .line 192
    :cond_5
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 193
    .line 194
    .line 195
    :cond_6
    return-void
.end method

.method private p(Lcom/android/launcher3/cloudfolder/RemoteView$k;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->e(Lcom/android/launcher3/cloudfolder/RemoteView$h;Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->m(Lcom/android/launcher3/cloudfolder/RemoteView$k;)Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-eq v0, p1, :cond_1

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-static {v0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$k;->a(Lcom/android/launcher3/cloudfolder/RemoteView$k;Lcom/android/launcher3/cloudfolder/RemoteView$k;)Z

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    if-eqz p1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 24
    .line 25
    .line 26
    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->getCount()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public getItemId(I)J
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->getItemId(I)J

    .line 6
    .line 7
    .line 8
    move-result-wide p0

    .line 9
    return-wide p0

    .line 10
    :cond_0
    const-wide/16 p0, -0x1

    .line 11
    .line 12
    return-wide p0
.end method

.method public j(Lcom/android/launcher3/cloudfolder/RemoteView$i$c;I)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->c:Lcom/android/launcher3/cloudfolder/RemoteView$k;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 12
    .line 13
    invoke-virtual {p0, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->getItemId(I)J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    invoke-static {v1, p2, v0, v2, v3}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->b(Lcom/android/launcher3/cloudfolder/RemoteView$h;ILandroid/view/View;J)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 21
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->n(Landroid/view/View;I)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public k(Landroid/view/ViewGroup;I)Lcom/android/launcher3/cloudfolder/RemoteView$i$c;
    .locals 2

    .line 1
    new-instance p2, Lcom/android/launcher3/cloudfolder/RemoteView$i$c;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$i;->b:Lcom/android/launcher3/cloudfolder/RemoteView$h;

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {v0, v1, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$h;->c(Lcom/android/launcher3/cloudfolder/RemoteView$h;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-direct {p2, p0, p1, v1}, Lcom/android/launcher3/cloudfolder/RemoteView$i$c;-><init>(Lcom/android/launcher3/cloudfolder/RemoteView$i;Landroid/view/View;Ld1/h;)V

    .line 11
    .line 12
    .line 13
    return-object p2
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 1
    check-cast p1, Lcom/android/launcher3/cloudfolder/RemoteView$i$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->j(Lcom/android/launcher3/cloudfolder/RemoteView$i$c;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/android/launcher3/cloudfolder/RemoteView$i;->k(Landroid/view/ViewGroup;I)Lcom/android/launcher3/cloudfolder/RemoteView$i$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
