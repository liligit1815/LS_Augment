.class public Lcom/android/launcher3/BatchUninstallDropTarget;
.super Lcom/android/launcher3/ButtonDropTarget;
.source "BatchUninstallDropTarget.java"


# instance fields
.field private G:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/folder/Folder;",
            ">;"
        }
    .end annotation
.end field

.field H:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;"
        }
    .end annotation
.end field

.field private I:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 3
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->G:Ljava/util/ArrayList;

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 5
    iput-boolean p1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    return-void
.end method

.method public static synthetic E(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/model/data/d;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    const/16 p1, 0x3e7

    .line 26
    .line 27
    if-ne p0, p1, :cond_0

    .line 28
    .line 29
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_0
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public static synthetic H(Lcom/android/launcher3/BatchUninstallDropTarget;Lcom/android/launcher3/model/data/y;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/BatchUninstallDropTarget;->W(Lcom/android/launcher3/model/data/y;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic K(Lcom/android/launcher3/BubbleTextView;)Lcom/android/launcher3/model/data/y;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    return-object p0
.end method

.method public static synthetic L(Ljava/util/List;)Lcom/android/launcher3/model/data/y;
    .locals 2

    .line 1
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Lcom/android/launcher3/J;

    .line 6
    .line 7
    invoke-direct {v1}, Lcom/android/launcher3/J;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {v0, v1}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    return-object v1

    .line 18
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-interface {p0}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-virtual {p0, v1}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 31
    .line 32
    return-object p0
.end method

.method public static synthetic M(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/16 v0, 0x3e7

    .line 12
    .line 13
    if-ne p0, v0, :cond_0

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

.method public static synthetic N(Lcom/android/launcher3/BatchUninstallDropTarget;Lcom/android/launcher3/BubbleTextView;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/BatchUninstallDropTarget;->T(Lcom/android/launcher3/BubbleTextView;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic O(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    instance-of v0, p0, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    iget v0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static synthetic P(Lcom/zte/mifavor/launcher/adapter/compat/c;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget-object v0, p2, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/16 v0, 0x3e7

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

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

.method private Q(Ljava/util/ArrayList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_7

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
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    invoke-direct {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Z()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v2, 0x1

    .line 28
    if-eqz v1, :cond_6

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 35
    .line 36
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 41
    .line 42
    new-instance v4, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const-string v5, "cancelUninstallAndGoBack--workspaceItemInfo: "

    .line 48
    .line 49
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    const-string v5, "BatchUninstall"

    .line 60
    .line 61
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    iget v4, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 65
    .line 66
    const/4 v6, 0x0

    .line 67
    if-gez v4, :cond_3

    .line 68
    .line 69
    iget-object v7, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 70
    .line 71
    iget v8, v3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 72
    .line 73
    invoke-virtual {v7, v4, v8}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    if-eqz v4, :cond_2

    .line 78
    .line 79
    invoke-virtual {v4, v1}, Lcom/android/launcher3/CellLayout;->l0(Landroid/view/View;)V

    .line 80
    .line 81
    .line 82
    goto :goto_1

    .line 83
    :cond_2
    move v2, v6

    .line 84
    :goto_1
    invoke-virtual {v1, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 85
    .line 86
    .line 87
    goto :goto_3

    .line 88
    :cond_3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v4, "folder--workspaceItemInfo: "

    .line 94
    .line 95
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    iget-object v1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->G:Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    :cond_4
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-eqz v4, :cond_5

    .line 119
    .line 120
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v4

    .line 124
    check-cast v4, Lcom/android/launcher3/folder/Folder;

    .line 125
    .line 126
    new-instance v7, Ljava/lang/StringBuilder;

    .line 127
    .line 128
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 129
    .line 130
    .line 131
    const-string v8, "folder.mInfo.id: "

    .line 132
    .line 133
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-object v8, v4, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 137
    .line 138
    iget v8, v8, Lcom/android/launcher3/model/data/y;->id:I

    .line 139
    .line 140
    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v7

    .line 147
    invoke-static {v5, v7}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    .line 149
    .line 150
    iget v7, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 151
    .line 152
    iget-object v8, v4, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 153
    .line 154
    iget v8, v8, Lcom/android/launcher3/model/data/y;->id:I

    .line 155
    .line 156
    if-ne v7, v8, :cond_4

    .line 157
    .line 158
    invoke-virtual {v4, v3}, Lcom/android/launcher3/folder/Folder;->D0(Lcom/android/launcher3/model/data/y;)V

    .line 159
    .line 160
    .line 161
    move v6, v2

    .line 162
    goto :goto_2

    .line 163
    :cond_5
    move v2, v6

    .line 164
    :goto_3
    if-nez v2, :cond_1

    .line 165
    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    .line 167
    .line 168
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 169
    .line 170
    .line 171
    const-string v2, "do not find parent: "

    .line 172
    .line 173
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v1

    .line 183
    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 184
    .line 185
    .line 186
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_6
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-nez p1, :cond_7

    .line 196
    .line 197
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 198
    .line 199
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    new-instance p1, Lx1/O$b;

    .line 208
    .line 209
    invoke-direct {p1, v0}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 213
    .line 214
    .line 215
    move-result-object p1

    .line 216
    invoke-virtual {p0, p1, v2}, Lcom/android/launcher3/D3;->K(Ljava/util/ArrayList;Z)V

    .line 217
    .line 218
    .line 219
    :cond_7
    :goto_4
    return-void
.end method

.method private R()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->G:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private S(Lcom/android/launcher3/BubbleTextView;)Z
    .locals 3

    .line 1
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 17
    .line 18
    iget v0, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 19
    .line 20
    if-nez v0, :cond_0

    .line 21
    .line 22
    invoke-static {}, Lcom/zte/mifavor/launcher/adapter/compat/c;->c()Lcom/zte/mifavor/launcher/adapter/compat/c;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v2, Lcom/android/launcher3/A;

    .line 27
    .line 28
    invoke-direct {v2, v0, p1}, Lcom/android/launcher3/A;-><init>(Lcom/zte/mifavor/launcher/adapter/compat/c;Lcom/android/launcher3/model/data/I;)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Lcom/zte/mifavor/launcher/adapter/compat/c;->f(Landroid/os/UserHandle;)I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    const/16 v0, 0x3e7

    .line 38
    .line 39
    if-eq p1, v0, :cond_0

    .line 40
    .line 41
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-static {p0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    invoke-interface {p0, v2}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-eqz p0, :cond_0

    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_0
    return v1
.end method

.method private T(Lcom/android/launcher3/BubbleTextView;)Z
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    instance-of v0, p1, Lcom/android/launcher3/model/data/I;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    check-cast p1, Lcom/android/launcher3/model/data/I;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/I;->getIntent()Landroid/content/Intent;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-static {p0, p1}, Lcom/android/launcher3/util/J1;->o(Landroid/content/Context;Landroid/content/Intent;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    return p0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0
.end method

.method private V(Ljava/util/ArrayList;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/launcher3/B;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lcom/android/launcher3/B;-><init>(Lcom/android/launcher3/BatchUninstallDropTarget;)V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method private synthetic W(Lcom/android/launcher3/model/data/y;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getAppsView()Lcom/android/launcher3/allapps/r;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/r;->getAppsStore()Lcom/android/launcher3/allapps/D;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/android/launcher3/allapps/D;->o()[Lcom/android/launcher3/model/data/d;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {p0}, Ljava/util/stream/Stream;->of([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance v0, Lcom/android/launcher3/I;

    .line 20
    .line 21
    invoke-direct {v0, p1}, Lcom/android/launcher3/I;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 22
    .line 23
    .line 24
    invoke-interface {p0, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    return p0
.end method

.method private Z()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->G:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eq v0, v1, :cond_0

    .line 22
    .line 23
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->G:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->G:Ljava/util/ArrayList;

    .line 29
    .line 30
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 31
    .line 32
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

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
    const-string p2, "onDragStart: "

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p2}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string p2, "BatchUninstall"

    .line 30
    .line 31
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    invoke-direct {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->R()V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 38
    .line 39
    invoke-static {p1}, Lx1/O;->Q3(Landroid/content/Context;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 46
    .line 47
    invoke-static {p1}, Lh2/c;->c(Landroid/content/Context;)Lh2/c;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-virtual {p1}, Lh2/c;->k()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const/4 p1, 0x0

    .line 56
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    const/4 v2, 0x0

    .line 75
    const/4 v3, 0x1

    .line 76
    if-eqz v1, :cond_7

    .line 77
    .line 78
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v1

    .line 82
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 83
    .line 84
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 89
    .line 90
    invoke-virtual {v4}, Lcom/android/launcher3/model/data/I;->b0()Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-eqz v5, :cond_1

    .line 95
    .line 96
    const-string v2, "onDragStart: 1"

    .line 97
    .line 98
    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 104
    .line 105
    .line 106
    goto :goto_1

    .line 107
    :cond_1
    iget v5, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 108
    .line 109
    if-nez v5, :cond_6

    .line 110
    .line 111
    if-eqz p1, :cond_3

    .line 112
    .line 113
    invoke-virtual {p1, v4}, Lh2/c;->h(Lcom/android/launcher3/model/data/y;)Z

    .line 114
    .line 115
    .line 116
    move-result v5

    .line 117
    if-eqz v5, :cond_2

    .line 118
    .line 119
    invoke-virtual {p1, v4}, Lh2/c;->f(Lcom/android/launcher3/model/data/y;)Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-eqz v5, :cond_3

    .line 124
    .line 125
    :cond_2
    move v2, v3

    .line 126
    :cond_3
    invoke-virtual {p0, v4}, Lcom/android/launcher3/ButtonDropTarget;->k(Lcom/android/launcher3/model/data/y;)Z

    .line 127
    .line 128
    .line 129
    move-result v3

    .line 130
    if-eqz v3, :cond_5

    .line 131
    .line 132
    iget-object v3, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 133
    .line 134
    invoke-static {v3}, Lx1/O;->Q3(Landroid/content/Context;)Z

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    if-eqz v3, :cond_4

    .line 139
    .line 140
    if-nez v2, :cond_5

    .line 141
    .line 142
    :cond_4
    const-string v2, "onDragStart: 2"

    .line 143
    .line 144
    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 145
    .line 146
    .line 147
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 148
    .line 149
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_5
    const-string v2, "onDragStart: 3"

    .line 154
    .line 155
    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 156
    .line 157
    .line 158
    iget-object v2, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 159
    .line 160
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_6
    const-string v2, "onDragStart: 4"

    .line 165
    .line 166
    invoke-static {p2, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 170
    .line 171
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    goto :goto_1

    .line 175
    :cond_7
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 176
    .line 177
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 178
    .line 179
    .line 180
    move-result p1

    .line 181
    const v0, 0x7f080d8c

    .line 182
    .line 183
    .line 184
    const v1, 0x7f1400a0

    .line 185
    .line 186
    .line 187
    if-eqz p1, :cond_8

    .line 188
    .line 189
    iget-object p1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 192
    .line 193
    .line 194
    move-result p1

    .line 195
    if-nez p1, :cond_8

    .line 196
    .line 197
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 206
    .line 207
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 208
    .line 209
    .line 210
    :goto_2
    move v2, v3

    .line 211
    goto/16 :goto_4

    .line 212
    .line 213
    :cond_8
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 214
    .line 215
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 220
    .line 221
    .line 222
    move-result v4

    .line 223
    if-eqz v4, :cond_a

    .line 224
    .line 225
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 230
    .line 231
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 236
    .line 237
    new-instance v5, Ljava/lang/StringBuilder;

    .line 238
    .line 239
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    .line 241
    .line 242
    const-string v6, "workspaceItemInfo type : "

    .line 243
    .line 244
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    iget v6, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 248
    .line 249
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    invoke-static {p2, v5}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 257
    .line 258
    .line 259
    iget v4, v4, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 260
    .line 261
    const/4 v5, 0x6

    .line 262
    if-ne v4, v5, :cond_9

    .line 263
    .line 264
    iput-boolean v3, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    .line 265
    .line 266
    goto :goto_3

    .line 267
    :cond_9
    iput-boolean v2, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    .line 268
    .line 269
    :cond_a
    new-instance p1, Ljava/lang/StringBuilder;

    .line 270
    .line 271
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 272
    .line 273
    .line 274
    const-string v4, "onlyShortCut: "

    .line 275
    .line 276
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    .line 278
    .line 279
    iget-boolean v4, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    .line 280
    .line 281
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    invoke-static {p2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 289
    .line 290
    .line 291
    iget-boolean p1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    .line 292
    .line 293
    if-eqz p1, :cond_b

    .line 294
    .line 295
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 296
    .line 297
    .line 298
    move-result-object p1

    .line 299
    invoke-virtual {p1}, Lcom/android/launcher3/resource/B;->x()Z

    .line 300
    .line 301
    .line 302
    move-result p1

    .line 303
    if-eqz p1, :cond_b

    .line 304
    .line 305
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    const p2, 0x7f14008f

    .line 310
    .line 311
    .line 312
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object p1

    .line 316
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 317
    .line 318
    const p1, 0x7f080afc

    .line 319
    .line 320
    .line 321
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 322
    .line 323
    .line 324
    goto :goto_4

    .line 325
    :cond_b
    iget-boolean p1, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    .line 326
    .line 327
    if-eqz p1, :cond_c

    .line 328
    .line 329
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 330
    .line 331
    .line 332
    move-result-object p1

    .line 333
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object p1

    .line 337
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 338
    .line 339
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 340
    .line 341
    .line 342
    goto/16 :goto_2

    .line 343
    .line 344
    :cond_c
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 345
    .line 346
    .line 347
    move-result-object p1

    .line 348
    invoke-virtual {p1, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 353
    .line 354
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 355
    .line 356
    .line 357
    :goto_4
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 358
    .line 359
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {p0, v2}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 363
    .line 364
    .line 365
    return-void
.end method

.method public U(Ljava/util/ArrayList;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Lcom/android/launcher3/C;

    .line 6
    .line 7
    invoke-direct {v0}, Lcom/android/launcher3/C;-><init>()V

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->map(Ljava/util/function/Function;)Ljava/util/stream/Stream;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    new-instance v0, Lcom/android/launcher3/D;

    .line 15
    .line 16
    invoke-direct {v0}, Lcom/android/launcher3/D;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    new-instance v0, Lcom/android/launcher3/E;

    .line 24
    .line 25
    invoke-direct {v0}, Lcom/android/launcher3/E;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Ljava/util/stream/Collectors;->toList()Ljava/util/stream/Collector;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Lcom/android/launcher3/F;

    .line 33
    .line 34
    invoke-direct {v2}, Lcom/android/launcher3/F;-><init>()V

    .line 35
    .line 36
    .line 37
    invoke-static {v1, v2}, Ljava/util/stream/Collectors;->collectingAndThen(Ljava/util/stream/Collector;Ljava/util/function/Function;)Ljava/util/stream/Collector;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v0, v1}, Ljava/util/stream/Collectors;->groupingBy(Ljava/util/function/Function;Ljava/util/stream/Collector;)Ljava/util/stream/Collector;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->collect(Ljava/util/stream/Collector;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/util/Map;

    .line 50
    .line 51
    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {p1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    new-instance v0, Lcom/android/launcher3/G;

    .line 60
    .line 61
    invoke-direct {v0}, Lcom/android/launcher3/G;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-interface {p1}, Ljava/util/stream/Stream;->toList()Ljava/util/List;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-interface {p1}, Ljava/util/List;->stream()Ljava/util/stream/Stream;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    new-instance v0, Lcom/android/launcher3/H;

    .line 77
    .line 78
    invoke-direct {v0, p0}, Lcom/android/launcher3/H;-><init>(Lcom/android/launcher3/BatchUninstallDropTarget;)V

    .line 79
    .line 80
    .line 81
    invoke-interface {p1, v0}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0
.end method

.method public X(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList<",
            "Lcom/android/launcher3/BubbleTextView;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p2, :cond_4

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    if-eqz p2, :cond_3

    .line 19
    .line 20
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 25
    .line 26
    invoke-virtual {p2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Lcom/android/launcher3/model/data/I;

    .line 31
    .line 32
    iget v1, v0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 33
    .line 34
    const/4 v2, 0x1

    .line 35
    const/4 v3, 0x6

    .line 36
    if-eq v3, v1, :cond_2

    .line 37
    .line 38
    if-ne v2, v1, :cond_1

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    invoke-virtual {v0, p2}, Lcom/android/launcher3/Workspace;->K2(Landroid/view/View;)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    :goto_1
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 52
    .line 53
    invoke-virtual {v1, p2, v0, v2}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_3
    const-string p0, "BatchUninstall"

    .line 58
    .line 59
    const-string p1, "removeFolderAppInCenter inter!"

    .line 60
    .line 61
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 62
    .line 63
    .line 64
    :cond_4
    :goto_2
    return-void
.end method

.method protected Y()V
    .locals 1

    .line 1
    const v0, 0x7f080d8c

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->m()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public getAccessibilityAction()I
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public bridge synthetic getDropView()Landroid/view/View;
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/n0;->getDropView()Landroid/view/View;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h(Lcom/android/launcher3/n0$a;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_c

    .line 12
    .line 13
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-nez v0, :cond_a

    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-static {}, Lcom/android/launcher3/H5;->W()Lcom/android/launcher3/resource/B;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {v0}, Lcom/android/launcher3/resource/B;->x()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    iget-object v1, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/BatchUninstallDropTarget;->X(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 42
    .line 43
    .line 44
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 45
    .line 46
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 50
    .line 51
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_0

    .line 62
    .line 63
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 64
    .line 65
    invoke-static {v0}, Lx1/O;->o5(Lcom/android/launcher3/C2;)V

    .line 66
    .line 67
    .line 68
    :cond_0
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 69
    .line 70
    if-eqz v0, :cond_1

    .line 71
    .line 72
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 79
    .line 80
    invoke-virtual {v0, p1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->R()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_2
    iget-boolean v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->I:Z

    .line 88
    .line 89
    if-eqz v0, :cond_4

    .line 90
    .line 91
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 94
    .line 95
    .line 96
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 112
    .line 113
    invoke-virtual {v0, p1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 114
    .line 115
    .line 116
    :cond_3
    invoke-direct {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->R()V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :cond_4
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    const v1, 0x7f1400a8

    .line 127
    .line 128
    .line 129
    const v2, 0x7f1400aa

    .line 130
    .line 131
    .line 132
    const-string v3, ""

    .line 133
    .line 134
    const/4 v4, 0x1

    .line 135
    if-ne v4, v0, :cond_7

    .line 136
    .line 137
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 138
    .line 139
    invoke-virtual {v0}, Ljava/util/ArrayList;->getFirst()Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 144
    .line 145
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 146
    .line 147
    .line 148
    move-result-object v4

    .line 149
    const v5, 0x7f1402d3

    .line 150
    .line 151
    .line 152
    invoke-virtual {v4, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->T(Lcom/android/launcher3/BubbleTextView;)Z

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    if-eqz v5, :cond_5

    .line 161
    .line 162
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    const v1, 0x7f1403da

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    const v2, 0x7f1400a6

    .line 178
    .line 179
    .line 180
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    goto :goto_0

    .line 185
    :cond_5
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->S(Lcom/android/launcher3/BubbleTextView;)Z

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    if-eqz v0, :cond_6

    .line 194
    .line 195
    move v1, v2

    .line 196
    :cond_6
    invoke-virtual {v5, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    :goto_0
    invoke-virtual {p0, v4, v0, v3, p1}, Lcom/android/launcher3/ButtonDropTarget;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/n0$a;)V

    .line 201
    .line 202
    .line 203
    return-void

    .line 204
    :cond_7
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    const v4, 0x7f1400ab

    .line 209
    .line 210
    .line 211
    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iget-object v4, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 216
    .line 217
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 218
    .line 219
    .line 220
    move-result v4

    .line 221
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 222
    .line 223
    .line 224
    move-result-object v4

    .line 225
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v0

    .line 233
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 234
    .line 235
    .line 236
    move-result-object v4

    .line 237
    iget-object v5, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 238
    .line 239
    invoke-virtual {p0, v5}, Lcom/android/launcher3/BatchUninstallDropTarget;->U(Ljava/util/ArrayList;)Z

    .line 240
    .line 241
    .line 242
    move-result v5

    .line 243
    if-eqz v5, :cond_8

    .line 244
    .line 245
    move v1, v2

    .line 246
    :cond_8
    invoke-virtual {v4, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v1

    .line 250
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 251
    .line 252
    invoke-direct {p0, v2}, Lcom/android/launcher3/BatchUninstallDropTarget;->V(Ljava/util/ArrayList;)Z

    .line 253
    .line 254
    .line 255
    move-result v2

    .line 256
    if-eqz v2, :cond_9

    .line 257
    .line 258
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    const v3, 0x7f1400a9

    .line 263
    .line 264
    .line 265
    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object v3

    .line 269
    :cond_9
    invoke-virtual {p0, v0, v1, v3, p1}, Lcom/android/launcher3/ButtonDropTarget;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/android/launcher3/n0$a;)V

    .line 270
    .line 271
    .line 272
    return-void

    .line 273
    :cond_a
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 274
    .line 275
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 276
    .line 277
    .line 278
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 279
    .line 280
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 281
    .line 282
    .line 283
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 284
    .line 285
    if-eqz v0, :cond_b

    .line 286
    .line 287
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 288
    .line 289
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 294
    .line 295
    invoke-virtual {v0, p1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 296
    .line 297
    .line 298
    :cond_b
    invoke-direct {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->R()V

    .line 299
    .line 300
    .line 301
    :cond_c
    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/ButtonDropTarget;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Y()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public q(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    return-void
.end method

.method protected r(Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-static {v0}, Lx1/O;->o5(Lcom/android/launcher3/C2;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 31
    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-direct {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->R()V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method protected s(Lcom/android/launcher3/n0$a;)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-direct {p0, v0}, Lcom/android/launcher3/BatchUninstallDropTarget;->Q(Ljava/util/ArrayList;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const v2, 0x7f1400c7

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 27
    .line 28
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    iget-object v3, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->H:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    filled-new-array {v2, v3}, [Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    new-array v2, v1, [Ljava/lang/Object;

    .line 55
    .line 56
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 61
    .line 62
    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 67
    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    const v2, 0x7f1400c6

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 82
    .line 83
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    new-array v2, v1, [Ljava/lang/Object;

    .line 100
    .line 101
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 106
    .line 107
    invoke-static {v2, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 112
    .line 113
    .line 114
    :goto_0
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-virtual {p0}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    iget-object v2, p0, Lcom/android/launcher3/ButtonDropTarget;->z:Ljava/util/ArrayList;

    .line 125
    .line 126
    invoke-virtual {v0, v1, v2}, Lcom/android/launcher3/Workspace;->E2(Landroid/content/Context;Ljava/util/ArrayList;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->e2()Lcom/android/launcher3/q4;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    sget-object v1, Lcom/android/launcher3/q4$a;->k:Lcom/android/launcher3/q4$a;

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Lcom/android/launcher3/q4;->Z(Lcom/android/launcher3/q4$a;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-eqz v0, :cond_1

    .line 142
    .line 143
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 144
    .line 145
    invoke-static {v0}, Lx1/O;->o5(Lcom/android/launcher3/C2;)V

    .line 146
    .line 147
    .line 148
    :cond_1
    iget-object v0, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 149
    .line 150
    if-eqz v0, :cond_2

    .line 151
    .line 152
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 159
    .line 160
    invoke-virtual {v0, p1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 161
    .line 162
    .line 163
    :cond_2
    invoke-direct {p0}, Lcom/android/launcher3/BatchUninstallDropTarget;->R()V

    .line 164
    .line 165
    .line 166
    return-void
.end method

.method protected setupItemInfo(Lcom/android/launcher3/model/data/y;)V
    .locals 0

    .line 1
    return-void
.end method

.method public x(Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method protected y(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    return v1

    .line 17
    :cond_0
    iget p1, p1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 18
    .line 19
    const/4 v0, 0x1

    .line 20
    if-eq p1, v0, :cond_1

    .line 21
    .line 22
    const/4 v0, 0x6

    .line 23
    if-ne p1, v0, :cond_2

    .line 24
    .line 25
    :cond_1
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 26
    .line 27
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    invoke-virtual {p1}, Lcom/android/launcher3/G4;->s()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_2

    .line 36
    .line 37
    return v1

    .line 38
    :cond_2
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->q()Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/BatchUninstallDropTarget;->G:Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 4
    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BatchUninstallDropTarget;->h(Lcom/android/launcher3/n0$a;)V

    .line 17
    .line 18
    .line 19
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->i:Lcom/android/launcher3/DropTargetBar;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/android/launcher3/DropTargetBar;->v()V

    .line 22
    .line 23
    .line 24
    iget-object p1, p1, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 25
    .line 26
    if-eqz p1, :cond_0

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 38
    .line 39
    .line 40
    :cond_0
    return-void
.end method
