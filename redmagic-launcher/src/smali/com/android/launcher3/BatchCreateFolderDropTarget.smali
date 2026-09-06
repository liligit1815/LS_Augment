.class public Lcom/android/launcher3/BatchCreateFolderDropTarget;
.super Lcom/android/launcher3/ButtonDropTarget;
.source "BatchCreateFolderDropTarget.java"


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

.field private J:Lz1/z5;

.field private K:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, p2, v0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    new-instance p2, Lz1/z5;

    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    move-result-object v0

    invoke-virtual {v0}, Lcom/android/launcher3/D3;->f0()Lz1/y0;

    move-result-object v0

    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object v1

    invoke-virtual {v1}, Lcom/android/launcher3/P2;->i()Lcom/android/launcher3/F1;

    move-result-object v1

    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    move-result-object p1

    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    move-result-object p1

    invoke-direct {p2, v0, v1, p1}, Lz1/z5;-><init>(Lz1/y0;Lcom/android/launcher3/F1;Lcom/android/launcher3/D3;)V

    iput-object p2, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->J:Lz1/z5;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 3
    invoke-direct {p0, p1, p2, p3}, Lcom/android/launcher3/ButtonDropTarget;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->G:Ljava/util/ArrayList;

    .line 5
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->H:Ljava/util/ArrayList;

    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->I:Z

    .line 7
    iput-boolean p1, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->K:Z

    return-void
.end method

.method public static synthetic E(Lcom/android/launcher3/BatchCreateFolderDropTarget;Lcom/android/launcher3/n0$a;[I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->W(Lcom/android/launcher3/n0$a;[I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic H(Lcom/android/launcher3/BatchCreateFolderDropTarget;Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct/range {p0 .. p5}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->V(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic K(Lcom/android/launcher3/BatchCreateFolderDropTarget;Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/n0$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->X(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/n0$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic L(Lcom/android/launcher3/BatchCreateFolderDropTarget;Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->U(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private M(Ljava/util/ArrayList;)V
    .locals 11
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
    invoke-direct {p0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->a0()V

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
    const-string v5, "cancelCreateFolderAndGoBack--workspaceItemInfo: "

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
    const-string v5, "BatchCreateFolder"

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
    new-instance v4, Ljava/lang/StringBuilder;

    .line 89
    .line 90
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    .line 92
    .line 93
    const-string v7, "folder--workspaceItemInfo: "

    .line 94
    .line 95
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    invoke-static {v5, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    iget-object v4, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->G:Ljava/util/ArrayList;

    .line 109
    .line 110
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 111
    .line 112
    .line 113
    move-result-object v4

    .line 114
    move v7, v6

    .line 115
    :cond_4
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 116
    .line 117
    .line 118
    move-result v8

    .line 119
    if-eqz v8, :cond_5

    .line 120
    .line 121
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v8

    .line 125
    check-cast v8, Lcom/android/launcher3/folder/Folder;

    .line 126
    .line 127
    new-instance v9, Ljava/lang/StringBuilder;

    .line 128
    .line 129
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 130
    .line 131
    .line 132
    const-string v10, "folder.mInfo.id: "

    .line 133
    .line 134
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    iget-object v10, v8, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 138
    .line 139
    iget v10, v10, Lcom/android/launcher3/model/data/y;->id:I

    .line 140
    .line 141
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v9

    .line 148
    invoke-static {v5, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 149
    .line 150
    .line 151
    iget v9, v3, Lcom/android/launcher3/model/data/y;->container:I

    .line 152
    .line 153
    iget-object v10, v8, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 154
    .line 155
    iget v10, v10, Lcom/android/launcher3/model/data/y;->id:I

    .line 156
    .line 157
    if-ne v9, v10, :cond_4

    .line 158
    .line 159
    invoke-virtual {v8, v3}, Lcom/android/launcher3/folder/Folder;->D0(Lcom/android/launcher3/model/data/y;)V

    .line 160
    .line 161
    .line 162
    move v7, v2

    .line 163
    goto :goto_2

    .line 164
    :cond_5
    move v2, v7

    .line 165
    :goto_3
    invoke-virtual {v1}, Lcom/android/launcher3/BubbleTextView;->G0()V

    .line 166
    .line 167
    .line 168
    iput-boolean v6, v3, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 169
    .line 170
    if-nez v2, :cond_1

    .line 171
    .line 172
    new-instance v1, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    const-string v2, "do not find parent: "

    .line 178
    .line 179
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-static {v5, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :cond_6
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    if-nez p1, :cond_7

    .line 202
    .line 203
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 204
    .line 205
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    new-instance p1, Lx1/O$b;

    .line 214
    .line 215
    invoke-direct {p1, v0}, Lx1/O$b;-><init>(Ljava/util/ArrayList;)V

    .line 216
    .line 217
    .line 218
    invoke-virtual {p1}, Lx1/O$b;->b()Ljava/util/ArrayList;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    invoke-virtual {p0, p1, v2}, Lcom/android/launcher3/D3;->K(Ljava/util/ArrayList;Z)V

    .line 223
    .line 224
    .line 225
    :cond_7
    :goto_4
    return-void
.end method

.method private N()V
    .locals 8

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    invoke-virtual {v3}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 6
    .line 7
    .line 8
    move-result-object v4

    .line 9
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 16
    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 18
    .line 19
    .line 20
    move-result-object v5

    .line 21
    new-instance v6, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    check-cast v1, Lcom/android/launcher3/BubbleTextView;

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    instance-of v7, v7, Lcom/android/launcher3/model/data/y;

    .line 59
    .line 60
    if-eqz v7, :cond_0

    .line 61
    .line 62
    invoke-virtual {v1}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 67
    .line 68
    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    sget-object v7, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 73
    .line 74
    new-instance v0, Lcom/android/launcher3/w;

    .line 75
    .line 76
    move-object v1, p0

    .line 77
    invoke-direct/range {v0 .. v6}, Lcom/android/launcher3/w;-><init>(Lcom/android/launcher3/BatchCreateFolderDropTarget;Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;Ljava/util/ArrayList;)V

    .line 78
    .line 79
    .line 80
    invoke-virtual {v7, v0}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method private O()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->H:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->H:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->G:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method private P(Lcom/android/launcher3/n0$a;[I)V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v5, p1

    .line 4
    .line 5
    move-object/from16 v1, p2

    .line 6
    .line 7
    const/4 v8, 0x0

    .line 8
    const/4 v9, 0x1

    .line 9
    const/4 v10, 0x2

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    array-length v2, v1

    .line 13
    const/4 v3, 0x4

    .line 14
    if-ne v2, v3, :cond_1

    .line 15
    .line 16
    const/4 v2, 0x3

    .line 17
    aget v2, v1, v2

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    iget-object v2, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 22
    .line 23
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-le v2, v9, :cond_1

    .line 36
    .line 37
    iget-boolean v2, v0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->I:Z

    .line 38
    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    iget-boolean v2, v0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->K:Z

    .line 42
    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    aget v14, v1, v8

    .line 46
    .line 47
    aget v15, v1, v10

    .line 48
    .line 49
    aget v16, v1, v9

    .line 50
    .line 51
    new-instance v4, Ljava/util/ArrayList;

    .line 52
    .line 53
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 54
    .line 55
    .line 56
    iget-object v1, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 57
    .line 58
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    invoke-virtual {v1}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    if-eqz v2, :cond_0

    .line 75
    .line 76
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    check-cast v2, Lcom/android/launcher3/BubbleTextView;

    .line 81
    .line 82
    invoke-virtual {v2}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    check-cast v3, Lcom/android/launcher3/model/data/I;

    .line 87
    .line 88
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    iget-object v6, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 92
    .line 93
    invoke-virtual {v6, v2, v3, v8}, Lcom/android/launcher3/C2;->n4(Landroid/view/View;Lcom/android/launcher3/model/data/y;Z)Z

    .line 94
    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 98
    .line 99
    .line 100
    move-result-object v1

    .line 101
    const v2, 0x7f140176

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v17

    .line 108
    iget-object v1, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 109
    .line 110
    const/16 v2, -0x64

    .line 111
    .line 112
    invoke-virtual {v1, v2, v14}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 113
    .line 114
    .line 115
    move-result-object v12

    .line 116
    iget-object v11, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 117
    .line 118
    iget-object v1, v5, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 119
    .line 120
    const/16 v13, -0x64

    .line 121
    .line 122
    move-object/from16 v18, v1

    .line 123
    .line 124
    invoke-virtual/range {v11 .. v18}, Lcom/android/launcher3/C2;->X0(Lcom/android/launcher3/CellLayout;IIIILjava/lang/String;Landroid/view/View;)Lcom/android/launcher3/folder/FolderIcon;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    new-instance v6, Landroid/graphics/Rect;

    .line 129
    .line 130
    invoke-direct {v6}, Landroid/graphics/Rect;-><init>()V

    .line 131
    .line 132
    .line 133
    iget-object v2, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 134
    .line 135
    invoke-virtual {v2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-virtual {v2}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    move-object v3, v2

    .line 148
    check-cast v3, Lcom/android/launcher3/BubbleTextView;

    .line 149
    .line 150
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 155
    .line 156
    iget-object v7, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 157
    .line 158
    invoke-virtual {v7}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 159
    .line 160
    .line 161
    move-result-object v7

    .line 162
    invoke-virtual {v7, v3, v6}, Lcom/android/launcher3/views/BaseDragLayer;->getDescendantRectRelativeToSelf(Landroid/view/View;Landroid/graphics/Rect;)F

    .line 163
    .line 164
    .line 165
    move-result v7

    .line 166
    invoke-virtual/range {v1 .. v7}, Lcom/android/launcher3/folder/FolderIcon;->d0(Lcom/android/launcher3/model/data/y;Landroid/view/View;Ljava/util/ArrayList;Lcom/android/launcher3/n0$a;Landroid/graphics/Rect;F)V

    .line 167
    .line 168
    .line 169
    new-instance v2, Landroid/animation/AnimatorSet;

    .line 170
    .line 171
    invoke-direct {v2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 172
    .line 173
    .line 174
    invoke-virtual {v3}, Landroid/widget/TextView;->getWidth()I

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    div-int/2addr v4, v10

    .line 179
    int-to-float v4, v4

    .line 180
    invoke-virtual {v1, v4}, Landroid/widget/FrameLayout;->setPivotX(F)V

    .line 181
    .line 182
    .line 183
    invoke-virtual {v3}, Landroid/widget/TextView;->getWidth()I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    div-int/2addr v3, v10

    .line 188
    int-to-float v3, v3

    .line 189
    invoke-virtual {v1, v3}, Landroid/widget/FrameLayout;->setPivotY(F)V

    .line 190
    .line 191
    .line 192
    const-string v3, "scaleX"

    .line 193
    .line 194
    new-array v4, v10, [F

    .line 195
    .line 196
    fill-array-data v4, :array_0

    .line 197
    .line 198
    .line 199
    invoke-static {v1, v3, v4}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 200
    .line 201
    .line 202
    move-result-object v3

    .line 203
    const-wide/16 v6, 0x12c

    .line 204
    .line 205
    invoke-virtual {v3, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    const-string v4, "scaleY"

    .line 210
    .line 211
    new-array v11, v10, [F

    .line 212
    .line 213
    fill-array-data v11, :array_1

    .line 214
    .line 215
    .line 216
    invoke-static {v1, v4, v11}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    invoke-virtual {v1, v6, v7}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 221
    .line 222
    .line 223
    move-result-object v1

    .line 224
    new-array v4, v10, [Landroid/animation/Animator;

    .line 225
    .line 226
    aput-object v3, v4, v8

    .line 227
    .line 228
    aput-object v1, v4, v9

    .line 229
    .line 230
    invoke-virtual {v2, v4}, Landroid/animation/AnimatorSet;->playTogether([Landroid/animation/Animator;)V

    .line 231
    .line 232
    .line 233
    invoke-virtual {v2}, Landroid/animation/AnimatorSet;->start()V

    .line 234
    .line 235
    .line 236
    goto :goto_1

    .line 237
    :cond_1
    iget-object v1, v0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->H:Ljava/util/ArrayList;

    .line 238
    .line 239
    invoke-direct {v0, v1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->M(Ljava/util/ArrayList;)V

    .line 240
    .line 241
    .line 242
    iget-object v1, v5, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 243
    .line 244
    if-eqz v1, :cond_2

    .line 245
    .line 246
    iget-object v1, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 247
    .line 248
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    iget-object v2, v5, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 253
    .line 254
    invoke-virtual {v1, v2}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 255
    .line 256
    .line 257
    :cond_2
    :goto_1
    invoke-direct {v0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->O()V

    .line 258
    .line 259
    .line 260
    iget-object v1, v0, Lcom/android/launcher3/ButtonDropTarget;->i:Lcom/android/launcher3/DropTargetBar;

    .line 261
    .line 262
    invoke-virtual {v1}, Lcom/android/launcher3/DropTargetBar;->v()V

    .line 263
    .line 264
    .line 265
    iget-object v1, v5, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 266
    .line 267
    if-eqz v1, :cond_3

    .line 268
    .line 269
    invoke-virtual {v1}, Lcom/android/launcher3/dragndrop/v;->D()V

    .line 270
    .line 271
    .line 272
    iget-object v0, v0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 273
    .line 274
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->Q1()Lcom/android/launcher3/dragndrop/DragLayer;

    .line 275
    .line 276
    .line 277
    move-result-object v0

    .line 278
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 279
    .line 280
    .line 281
    :cond_3
    return-void

    .line 282
    nop

    .line 283
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data

    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    :array_1
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method private static Q(Lcom/android/launcher3/C2;Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lz1/z5;)[I
    .locals 7

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/V4;->getNextPage()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-virtual {v0, v1}, Lcom/android/launcher3/Workspace;->j1(I)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/16 v2, -0xc9

    .line 14
    .line 15
    const/4 v3, 0x0

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v1}, Lcom/android/launcher3/Workspace;->O0()Lcom/android/launcher3/util/z0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1}, Lcom/android/launcher3/util/z0;->getArray()Lcom/android/launcher3/util/x0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1, v3}, Lcom/android/launcher3/util/x0;->v(I)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    :cond_0
    const/4 v2, -0x1

    .line 35
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v4}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    if-ge v3, v4, :cond_3

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v4}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 62
    .line 63
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 68
    .line 69
    iget v5, v4, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 70
    .line 71
    iget v6, v4, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 72
    .line 73
    mul-int/lit8 v6, v6, 0xa

    .line 74
    .line 75
    add-int/2addr v5, v6

    .line 76
    iget v6, v4, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 77
    .line 78
    if-ne v6, v1, :cond_2

    .line 79
    .line 80
    iget v4, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 81
    .line 82
    if-gtz v4, :cond_2

    .line 83
    .line 84
    if-gez v2, :cond_1

    .line 85
    .line 86
    move v2, v5

    .line 87
    :cond_1
    if-le v2, v5, :cond_2

    .line 88
    .line 89
    move v2, v5

    .line 90
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    if-ltz v2, :cond_4

    .line 94
    .line 95
    div-int/lit8 p0, v2, 0xa

    .line 96
    .line 97
    rem-int/lit8 v2, v2, 0xa

    .line 98
    .line 99
    const/4 p1, 0x1

    .line 100
    filled-new-array {v1, p0, v2, p1}, [I

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    return-object p0

    .line 105
    :cond_4
    invoke-virtual {p4, p1, p2, p3, v0}, Lz1/z5;->b(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;)[I

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    return-object p0
.end method

.method public static R(Lcom/android/launcher3/C2;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-ne v1, p0, :cond_0

    .line 11
    .line 12
    const p0, 0x7f060150

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const p0, 0x7f060153

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method public static S(Lcom/android/launcher3/C2;)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x1

    .line 6
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getForeColor()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-ne v1, p0, :cond_0

    .line 11
    .line 12
    const p0, 0x7f060154

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const p0, 0x7f060155

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {v0, p0}, Landroid/content/res/Resources;->getColor(I)I

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0
.end method

.method private T()Z
    .locals 9

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/HashMap;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    move v3, v2

    .line 13
    :goto_0
    iget-object v4, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 14
    .line 15
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v4}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-ge v3, v4, :cond_3

    .line 28
    .line 29
    iget-object v4, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 30
    .line 31
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v4}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 44
    .line 45
    invoke-virtual {v4}, Landroid/widget/TextView;->getTag()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    check-cast v4, Lcom/android/launcher3/model/data/I;

    .line 50
    .line 51
    iget v5, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 52
    .line 53
    if-lez v5, :cond_2

    .line 54
    .line 55
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 56
    .line 57
    .line 58
    move-result-object v5

    .line 59
    iget-object v5, v5, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 60
    .line 61
    iget v6, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 62
    .line 63
    invoke-virtual {v5, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    check-cast v5, Lcom/android/launcher3/model/data/p;

    .line 68
    .line 69
    iget v6, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 70
    .line 71
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v6

    .line 79
    if-nez v6, :cond_0

    .line 80
    .line 81
    iget v6, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 82
    .line 83
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v6

    .line 87
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    :cond_0
    iget v6, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 91
    .line 92
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v6

    .line 96
    invoke-interface {v1, v6}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v6

    .line 100
    const/4 v7, 0x1

    .line 101
    if-eqz v6, :cond_1

    .line 102
    .line 103
    iget v6, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 104
    .line 105
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v6

    .line 109
    iget v8, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 110
    .line 111
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v8

    .line 115
    invoke-interface {v1, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v8

    .line 119
    check-cast v8, Ljava/lang/Integer;

    .line 120
    .line 121
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    .line 122
    .line 123
    .line 124
    move-result v8

    .line 125
    add-int/2addr v8, v7

    .line 126
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 127
    .line 128
    .line 129
    move-result-object v8

    .line 130
    invoke-interface {v1, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    goto :goto_1

    .line 134
    :cond_1
    iget v6, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 135
    .line 136
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v6

    .line 140
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 141
    .line 142
    .line 143
    move-result-object v8

    .line 144
    invoke-interface {v1, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    :goto_1
    if-eqz v5, :cond_2

    .line 148
    .line 149
    iget v6, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 150
    .line 151
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 152
    .line 153
    .line 154
    move-result-object v6

    .line 155
    invoke-interface {v1, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v6

    .line 159
    check-cast v6, Ljava/lang/Integer;

    .line 160
    .line 161
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    invoke-virtual {v5}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 166
    .line 167
    .line 168
    move-result-object v5

    .line 169
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 170
    .line 171
    .line 172
    move-result v5

    .line 173
    if-ne v6, v5, :cond_2

    .line 174
    .line 175
    iget v4, v4, Lcom/android/launcher3/model/data/y;->container:I

    .line 176
    .line 177
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-interface {v1, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 182
    .line 183
    .line 184
    move-result-object v4

    .line 185
    check-cast v4, Ljava/lang/Integer;

    .line 186
    .line 187
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 188
    .line 189
    .line 190
    move-result v4

    .line 191
    iget-object v5, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 192
    .line 193
    invoke-virtual {v5}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 194
    .line 195
    .line 196
    move-result-object v5

    .line 197
    invoke-virtual {v5}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 198
    .line 199
    .line 200
    move-result-object v5

    .line 201
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 202
    .line 203
    .line 204
    move-result v5

    .line 205
    if-ne v4, v5, :cond_2

    .line 206
    .line 207
    return v7

    .line 208
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :cond_3
    return v2
.end method

.method private synthetic U(Z)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->b0(Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic V(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;Ljava/util/ArrayList;)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->J:Lz1/z5;

    .line 2
    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move-object v3, p3

    .line 6
    move-object v4, p4

    .line 7
    move-object v5, p5

    .line 8
    invoke-virtual/range {v0 .. v5}, Lz1/z5;->d(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/Workspace;Ljava/util/ArrayList;)Z

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 13
    .line 14
    new-instance p3, Lcom/android/launcher3/y;

    .line 15
    .line 16
    invoke-direct {p3, p0, p1}, Lcom/android/launcher3/y;-><init>(Lcom/android/launcher3/BatchCreateFolderDropTarget;Z)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method private synthetic W(Lcom/android/launcher3/n0$a;[I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->P(Lcom/android/launcher3/n0$a;[I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic X(Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/n0$a;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->J:Lz1/z5;

    .line 4
    .line 5
    invoke-static {v0, p1, p2, p3, v1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->Q(Lcom/android/launcher3/C2;Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lz1/z5;)[I

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    sget-object p2, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 10
    .line 11
    new-instance p3, Lcom/android/launcher3/z;

    .line 12
    .line 13
    invoke-direct {p3, p0, p4, p1}, Lcom/android/launcher3/z;-><init>(Lcom/android/launcher3/BatchCreateFolderDropTarget;Lcom/android/launcher3/n0$a;[I)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2, p3}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private a0()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->G:Ljava/util/ArrayList;

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
    iget-object v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->G:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->G:Ljava/util/ArrayList;

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

.method private b0(Z)V
    .locals 1

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->K:Z

    .line 2
    .line 3
    iget-boolean v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->I:Z

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p1, 0x0

    .line 11
    goto :goto_1

    .line 12
    :cond_1
    :goto_0
    const/4 p1, 0x1

    .line 13
    :goto_1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 14
    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Lcom/android/launcher3/ButtonDropTarget;->F(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 5
    .line 6
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Lcom/android/launcher3/G4;->q()Z

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p1, "BatchCreateFolder"

    .line 18
    .line 19
    const-string p2, "onDragStart"

    .line 20
    .line 21
    invoke-static {p1, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    invoke-direct {p0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->O()V

    .line 25
    .line 26
    .line 27
    invoke-direct {p0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->T()Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    iput-boolean p1, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->I:Z

    .line 32
    .line 33
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 34
    .line 35
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/android/launcher3/G4;->i()Ljava/util/ArrayList;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result p2

    .line 51
    if-eqz p2, :cond_1

    .line 52
    .line 53
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p2

    .line 57
    check-cast p2, Lcom/android/launcher3/BubbleTextView;

    .line 58
    .line 59
    iget-object v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->H:Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    invoke-virtual {p0}, Landroid/widget/TextView;->getResources()Landroid/content/res/Resources;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const p2, 0x7f140103

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 77
    .line 78
    const p1, 0x7f080da4

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0, p1}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->setDrawable(I)V

    .line 82
    .line 83
    .line 84
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->p:Ljava/lang/CharSequence;

    .line 85
    .line 86
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    const/4 p1, 0x0

    .line 90
    invoke-virtual {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 91
    .line 92
    .line 93
    invoke-direct {p0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->N()V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method public Y()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->N()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method protected Z()V
    .locals 1

    .line 1
    const v0, 0x7f080da4

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, v0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->setDrawable(I)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->S(Lcom/android/launcher3/C2;)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    iput v0, p0, Lcom/android/launcher3/ButtonDropTarget;->B:I

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/ButtonDropTarget;->m()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    invoke-virtual {p0, v0}, Lcom/android/launcher3/ButtonDropTarget;->C(Z)V

    .line 20
    .line 21
    .line 22
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
    .locals 0

    .line 1
    return-void
.end method

.method protected onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/android/launcher3/ButtonDropTarget;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->Z()V

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

.method protected setDrawable(I)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Lcom/android/launcher3/ButtonDropTarget;->setDrawable(I)V

    .line 2
    .line 3
    .line 4
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
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/android/launcher3/C2;->f2()Lcom/android/launcher3/menu/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget-object v0, Lcom/android/launcher3/q4$a;->h:Lcom/android/launcher3/q4$a;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Lcom/android/launcher3/menu/c;->q(Lcom/android/launcher3/q4$a;)Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    return p0

    .line 17
    :cond_0
    iget-object p0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Lcom/android/launcher3/G4;->r()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0
.end method

.method public z(Lcom/android/launcher3/n0$a;Lcom/android/launcher3/dragndrop/p;)V
    .locals 7

    .line 1
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 2
    .line 3
    invoke-virtual {p2}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    invoke-virtual {p2}, Lcom/android/launcher3/G4;->q()Z

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    if-nez p2, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v0, "onDrop mIsAllFromFolder="

    .line 20
    .line 21
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget-boolean v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->I:Z

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string v0, " mIsNoSpaceScreen= "

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    iget-boolean v0, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->K:Z

    .line 35
    .line 36
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    const-string v0, "BatchCreateFolder"

    .line 44
    .line 45
    invoke-static {v0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    iget-boolean p2, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->I:Z

    .line 49
    .line 50
    if-nez p2, :cond_1

    .line 51
    .line 52
    iget-boolean p2, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->K:Z

    .line 53
    .line 54
    if-eqz p2, :cond_2

    .line 55
    .line 56
    :cond_1
    move-object v2, p0

    .line 57
    move-object v6, p1

    .line 58
    goto :goto_0

    .line 59
    :cond_2
    iget-object p2, p0, Lcom/android/launcher3/BatchCreateFolderDropTarget;->G:Ljava/util/ArrayList;

    .line 60
    .line 61
    iget-object v0, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {v0}, Lcom/android/launcher3/G4;->j()Ljava/util/ArrayList;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {p2, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 72
    .line 73
    .line 74
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    invoke-virtual {v4}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    iget-object p2, p0, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 83
    .line 84
    invoke-static {p2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    sget-object p2, Lcom/android/launcher3/util/m0;->h:Lcom/android/launcher3/util/p1;

    .line 89
    .line 90
    new-instance v1, Lcom/android/launcher3/x;

    .line 91
    .line 92
    move-object v2, p0

    .line 93
    move-object v6, p1

    .line 94
    invoke-direct/range {v1 .. v6}, Lcom/android/launcher3/x;-><init>(Lcom/android/launcher3/BatchCreateFolderDropTarget;Lcom/android/launcher3/P2;Lz1/y0;Lcom/android/launcher3/util/x0;Lcom/android/launcher3/n0$a;)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {p2, v1}, Lcom/android/launcher3/util/p1;->execute(Ljava/lang/Runnable;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :goto_0
    iget-object p0, v2, Lcom/android/launcher3/BatchCreateFolderDropTarget;->H:Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-direct {v2, p0}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->M(Ljava/util/ArrayList;)V

    .line 104
    .line 105
    .line 106
    iget-object p0, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 107
    .line 108
    if-eqz p0, :cond_3

    .line 109
    .line 110
    iget-object p0, v2, Lcom/android/launcher3/ButtonDropTarget;->x:Lcom/android/launcher3/C2;

    .line 111
    .line 112
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->getDragController()Lcom/android/launcher3/dragndrop/j;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    iget-object p1, v6, Lcom/android/launcher3/n0$a;->f:Lcom/android/launcher3/dragndrop/v;

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Lcom/android/launcher3/dragndrop/j;->L(Lcom/android/launcher3/dragndrop/v;)V

    .line 119
    .line 120
    .line 121
    :cond_3
    invoke-direct {v2}, Lcom/android/launcher3/BatchCreateFolderDropTarget;->O()V

    .line 122
    .line 123
    .line 124
    return-void
.end method
