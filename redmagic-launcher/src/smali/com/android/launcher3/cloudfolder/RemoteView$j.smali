.class public Lcom/android/launcher3/cloudfolder/RemoteView$j;
.super Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;
.source "RemoteView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Landroid/widget/AdapterView$OnItemClickListener;
.implements Landroid/widget/AdapterView$OnItemLongClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/cloudfolder/RemoteView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "j"
.end annotation


# instance fields
.field protected g:I

.field final synthetic h:Lcom/android/launcher3/cloudfolder/RemoteView;


# direct methods
.method protected constructor <init>(Lcom/android/launcher3/cloudfolder/RemoteView;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;-><init>()V

    .line 4
    .line 5
    .line 6
    iput p2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->g:I

    .line 7
    .line 8
    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/cloudfolder/RemoteView$j;Landroid/view/View;Landroid/view/View;IJ)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->b(Landroid/view/View;Landroid/view/View;IJ)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private b(Landroid/view/View;Landroid/view/View;IJ)V
    .locals 7

    .line 1
    const-string v6, "FirstShown"

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-wide v4, p4

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->e(Landroid/view/View;Landroid/view/View;IJLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method private c(ILjava/lang/String;IIJ)V
    .locals 6

    .line 1
    new-instance v0, Landroid/os/Bundle;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "event_type"

    .line 7
    .line 8
    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v1, "event_extra_view_id"

    .line 12
    .line 13
    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 14
    .line 15
    .line 16
    const-string p3, "event_extra_item_index"

    .line 17
    .line 18
    invoke-virtual {v0, p3, p4}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 19
    .line 20
    .line 21
    const-string p3, "event_extra_item_id"

    .line 22
    .line 23
    invoke-virtual {v0, p3, p5, p6}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 24
    .line 25
    .line 26
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 27
    .line 28
    iget-object p3, p3, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 29
    .line 30
    invoke-interface {p3}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->e()Z

    .line 31
    .line 32
    .line 33
    move-result p3

    .line 34
    if-eqz p3, :cond_0

    .line 35
    .line 36
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/android/launcher3/cloudfolder/RemoteView;->i:Lcom/android/launcher3/cloudfolder/RemoteView$c;

    .line 39
    .line 40
    invoke-interface {p0, p1, v0}, Lcom/android/launcher3/cloudfolder/RemoteView$c;->b(ILandroid/os/Bundle;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object p3, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 45
    .line 46
    iget-object p3, p3, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 47
    .line 48
    invoke-virtual {p3, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 53
    .line 54
    if-eqz p1, :cond_2

    .line 55
    .line 56
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    .line 58
    .line 59
    const-string p3, "SClicked"

    .line 60
    .line 61
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    if-nez p3, :cond_1

    .line 66
    .line 67
    const-string p3, "LClicked"

    .line 68
    .line 69
    invoke-virtual {p2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    if-nez p2, :cond_1

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_1
    iget-object p2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 77
    .line 78
    iget-object p3, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 79
    .line 80
    iget-object p4, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 81
    .line 82
    const-string p5, "BadIPC"

    .line 83
    .line 84
    invoke-virtual {p2, p3, p4, p5}, Lcom/android/launcher3/cloudfolder/RemoteView;->S(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget-object v0, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 88
    .line 89
    iget-object v1, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 90
    .line 91
    iget-object v2, p1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->d:Landroid/view/View;

    .line 92
    .line 93
    const/4 v4, 0x0

    .line 94
    const/4 v5, 0x1

    .line 95
    const-string v3, "BadIPC"

    .line 96
    .line 97
    invoke-virtual/range {v0 .. v5}, Lcom/android/launcher3/cloudfolder/RemoteView;->R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V

    .line 98
    .line 99
    .line 100
    :cond_2
    :goto_0
    return-void
.end method

.method private d(Ljava/lang/String;Landroid/view/View;)V
    .locals 12

    .line 1
    const-string v1, "sendEventForClickedView"

    .line 2
    .line 3
    const-string v7, "RemoteView"

    .line 4
    .line 5
    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    if-eqz p2, :cond_4

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/view/View;->getId()I

    .line 11
    .line 12
    .line 13
    move-result v8

    .line 14
    invoke-virtual {p2, v8}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 19
    .line 20
    if-eqz v2, :cond_2

    .line 21
    .line 22
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 23
    .line 24
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->c(Lcom/android/launcher3/cloudfolder/RemoteView$g;)I

    .line 25
    .line 26
    .line 27
    move-result v9

    .line 28
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->b(Lcom/android/launcher3/cloudfolder/RemoteView$g;)J

    .line 29
    .line 30
    .line 31
    move-result-wide v10

    .line 32
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->d(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_0

    .line 37
    .line 38
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 39
    .line 40
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->d(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    invoke-virtual {v2, v5, p2, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->S(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_0
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    if-eqz v2, :cond_1

    .line 52
    .line 53
    move-object v2, v1

    .line 54
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 55
    .line 56
    invoke-static {v2}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const/4 v5, 0x0

    .line 61
    const/4 v6, 0x1

    .line 62
    move-object v4, p1

    .line 63
    move-object v3, p2

    .line 64
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView;->R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V

    .line 65
    .line 66
    .line 67
    :cond_1
    :goto_0
    move v4, v9

    .line 68
    move-wide v5, v10

    .line 69
    goto :goto_1

    .line 70
    :cond_2
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 71
    .line 72
    iget-object v1, v1, Lcom/android/launcher3/cloudfolder/RemoteView;->h:Landroid/util/SparseArray;

    .line 73
    .line 74
    iget v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->g:I

    .line 75
    .line 76
    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$b;

    .line 81
    .line 82
    if-eqz v1, :cond_3

    .line 83
    .line 84
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 85
    .line 86
    iget-object v5, v1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->g:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 87
    .line 88
    invoke-virtual {v2, v5, p2, p1}, Lcom/android/launcher3/cloudfolder/RemoteView;->S(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 92
    .line 93
    iget-object v1, v1, Lcom/android/launcher3/cloudfolder/RemoteView$b;->f:Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 94
    .line 95
    const/4 v5, 0x0

    .line 96
    const/4 v6, 0x1

    .line 97
    move-object v3, v2

    .line 98
    move-object v2, v1

    .line 99
    move-object v1, v3

    .line 100
    move-object v4, p1

    .line 101
    move-object v3, p2

    .line 102
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView;->R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V

    .line 103
    .line 104
    .line 105
    :cond_3
    const/4 v9, -0x1

    .line 106
    const-wide/16 v10, -0x1

    .line 107
    .line 108
    goto :goto_0

    .line 109
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    const-string v2, "mClientId = "

    .line 115
    .line 116
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    iget v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->g:I

    .line 120
    .line 121
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    const-string v2, ",viewId= "

    .line 125
    .line 126
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v2, ",itemIndex="

    .line 133
    .line 134
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 138
    .line 139
    .line 140
    const-string v2, ",itemId="

    .line 141
    .line 142
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {v1, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    invoke-static {v7, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    iget v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->g:I

    .line 156
    .line 157
    move-object v0, p0

    .line 158
    move-object v2, p1

    .line 159
    move v3, v8

    .line 160
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->c(ILjava/lang/String;IIJ)V

    .line 161
    .line 162
    .line 163
    :cond_4
    return-void
.end method

.method private e(Landroid/view/View;Landroid/view/View;IJLjava/lang/String;)V
    .locals 7

    .line 1
    const-string v1, "RemoteView"

    .line 2
    .line 3
    const-string v2, "sendEventForItemView"

    .line 4
    .line 5
    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_2

    .line 9
    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    invoke-virtual {p2, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    instance-of v2, v1, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 21
    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    check-cast v1, Lcom/android/launcher3/cloudfolder/RemoteView$g;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->d(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    if-eqz v2, :cond_0

    .line 31
    .line 32
    iget-object v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 33
    .line 34
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->d(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    invoke-virtual {v2, v4, p2, p6}, Lcom/android/launcher3/cloudfolder/RemoteView;->S(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    invoke-static {v1}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    if-eqz v2, :cond_1

    .line 46
    .line 47
    move-object v2, v1

    .line 48
    iget-object v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->h:Lcom/android/launcher3/cloudfolder/RemoteView;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/android/launcher3/cloudfolder/RemoteView$g;->a(Lcom/android/launcher3/cloudfolder/RemoteView$g;)Lcom/android/launcher3/cloudfolder/RemoteView$f;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    const/4 v5, 0x0

    .line 55
    const/4 v6, 0x1

    .line 56
    move-object v3, p2

    .line 57
    move-object v4, p6

    .line 58
    invoke-virtual/range {v1 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView;->R(Lcom/android/launcher3/cloudfolder/RemoteView$f;Landroid/view/View;Ljava/lang/String;ZZ)V

    .line 59
    .line 60
    .line 61
    :cond_1
    iget v1, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->g:I

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    move-object v0, p0

    .line 68
    move v4, p3

    .line 69
    move-wide v5, p4

    .line 70
    move-object v2, p6

    .line 71
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->c(ILjava/lang/String;IIJ)V

    .line 72
    .line 73
    .line 74
    :cond_2
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "SClicked"

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->d(Ljava/lang/String;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    const-string v6, "SClicked"

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-wide v4, p4

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->e(Landroid/view/View;Landroid/view/View;IJLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onItemLongClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)Z
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)Z"
        }
    .end annotation

    .line 1
    const-string v6, "LClicked"

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v1, p1

    .line 5
    move-object v2, p2

    .line 6
    move v3, p3

    .line 7
    move-wide v4, p4

    .line 8
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->e(Landroid/view/View;Landroid/view/View;IJLjava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const-string v0, "LClicked"

    .line 4
    .line 5
    invoke-direct {p0, v0, p1}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->d(Ljava/lang/String;Landroid/view/View;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 p0, 0x1

    .line 9
    return p0
.end method

.method public onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;->onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/lang/StringBuilder;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 7
    .line 8
    .line 9
    const-string v0, "onScrollStateChanged-newState:"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    const-string v0, "RemoteView"

    .line 22
    .line 23
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 24
    .line 25
    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    iget v2, p0, Lcom/android/launcher3/cloudfolder/RemoteView$j;->g:I

    .line 29
    .line 30
    const/4 v5, 0x0

    .line 31
    const-wide/16 v6, 0x0

    .line 32
    .line 33
    const-string v3, "Scroll"

    .line 34
    .line 35
    const/4 v4, 0x0

    .line 36
    move-object v1, p0

    .line 37
    invoke-direct/range {v1 .. v7}, Lcom/android/launcher3/cloudfolder/RemoteView$j;->c(ILjava/lang/String;IIJ)V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method

.method public onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView$OnScrollListener;->onScrolled(Landroidx/recyclerview/widget/RecyclerView;II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
