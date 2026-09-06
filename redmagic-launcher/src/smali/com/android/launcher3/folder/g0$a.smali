.class Lcom/android/launcher3/folder/g0$a;
.super Ljava/lang/Object;
.source "LauncherDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/folder/g0;->j(Lcom/android/launcher3/folder/Folder;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/folder/Folder;

.field final synthetic h:Lcom/android/launcher3/folder/g0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/folder/g0;Lcom/android/launcher3/folder/Folder;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/folder/g0$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/folder/g0$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/folder/Folder;->getItemCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 8
    .line 9
    iget-object v2, v1, Lcom/android/launcher3/folder/Folder;->q:Lcom/android/launcher3/model/data/p;

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-gt v0, v3, :cond_4

    .line 13
    .line 14
    iget-object v1, v1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 15
    .line 16
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    const v5, 0x7f0b00f1

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v5, v4}, Landroid/widget/FrameLayout;->setTag(ILjava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    if-ne v0, v3, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iget v1, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 35
    .line 36
    iget-object v4, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 37
    .line 38
    invoke-static {v4}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->getCellPosMapper()Lc1/c;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v4, v2}, Lc1/c;->a(Lcom/android/launcher3/model/data/y;)Lc1/c$a;

    .line 47
    .line 48
    .line 49
    move-result-object v4

    .line 50
    iget v4, v4, Lc1/c$a;->c:I

    .line 51
    .line 52
    invoke-virtual {v0, v1, v4}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v2}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v4, 0x0

    .line 61
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    move-object v5, v1

    .line 66
    check-cast v5, Lcom/android/launcher3/model/data/y;

    .line 67
    .line 68
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 69
    .line 70
    invoke-static {v1}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->b()Lcom/android/launcher3/util/B0;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    iget-object v4, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 79
    .line 80
    invoke-static {v4}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v4}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v1, v5, v4, v0}, Lcom/android/launcher3/util/B0;->d(Lcom/android/launcher3/model/data/y;Lz1/J3;Landroid/view/ViewGroup;)Landroid/view/View;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 93
    .line 94
    invoke-static {v1}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->i2()Lz1/J3;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    iget v6, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 103
    .line 104
    iget v7, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 105
    .line 106
    iget v8, v2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 107
    .line 108
    iget v9, v2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 109
    .line 110
    invoke-virtual/range {v4 .. v9}, Lz1/J3;->x(Lcom/android/launcher3/model/data/y;IIII)V

    .line 111
    .line 112
    .line 113
    iget-boolean v1, v5, Lcom/android/launcher3/model/data/y;->isChecked:Z

    .line 114
    .line 115
    if-eqz v1, :cond_1

    .line 116
    .line 117
    instance-of v1, v0, Lcom/android/launcher3/BubbleTextView;

    .line 118
    .line 119
    if-eqz v1, :cond_1

    .line 120
    .line 121
    const-string v1, "LauncherDelegate"

    .line 122
    .line 123
    const-string v4, "replaceFolderWithFinalItem onCompleteRunnable refreshDraggingViewIfNecessary"

    .line 124
    .line 125
    invoke-static {v1, v4}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 129
    .line 130
    invoke-static {v1}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->j2()Lcom/android/launcher3/G4;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    move-object v4, v0

    .line 139
    check-cast v4, Lcom/android/launcher3/BubbleTextView;

    .line 140
    .line 141
    invoke-virtual {v1, v4}, Lcom/android/launcher3/G4;->y(Lcom/android/launcher3/BubbleTextView;)V

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_0
    const/4 v5, 0x0

    .line 146
    move-object v0, v5

    .line 147
    :cond_1
    :goto_0
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 148
    .line 149
    invoke-static {v1}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    iget-object v4, p0, Lcom/android/launcher3/folder/g0$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 154
    .line 155
    iget-object v4, v4, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 156
    .line 157
    const-string v6, "folder removed because there\'s only 1 item in it"

    .line 158
    .line 159
    invoke-virtual {v1, v4, v2, v3, v6}, Lcom/android/launcher3/C2;->o4(Landroid/view/View;Lcom/android/launcher3/model/data/y;ZLjava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 163
    .line 164
    iget-object v3, v1, Lcom/android/launcher3/folder/Folder;->t:Lcom/android/launcher3/folder/FolderIcon;

    .line 165
    .line 166
    instance-of v4, v3, Lcom/android/launcher3/n0;

    .line 167
    .line 168
    if-eqz v4, :cond_2

    .line 169
    .line 170
    iget-object v1, v1, Lcom/android/launcher3/folder/Folder;->p:Lcom/android/launcher3/dragndrop/j;

    .line 171
    .line 172
    check-cast v3, Lcom/android/launcher3/n0;

    .line 173
    .line 174
    invoke-virtual {v1, v3}, Lcom/android/launcher3/dragndrop/j;->O(Lcom/android/launcher3/n0;)V

    .line 175
    .line 176
    .line 177
    :cond_2
    if-eqz v0, :cond_3

    .line 178
    .line 179
    iget-object v1, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 180
    .line 181
    invoke-static {v1}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 186
    .line 187
    .line 188
    move-result-object v1

    .line 189
    invoke-interface {v1, v0, v2}, Lcom/android/launcher3/M6;->i(Landroid/view/View;Lcom/android/launcher3/model/data/y;)V

    .line 190
    .line 191
    .line 192
    invoke-virtual {v0}, Landroid/view/View;->requestFocus()Z

    .line 193
    .line 194
    .line 195
    :cond_3
    if-eqz v5, :cond_4

    .line 196
    .line 197
    iget-object v0, p0, Lcom/android/launcher3/folder/g0$a;->h:Lcom/android/launcher3/folder/g0;

    .line 198
    .line 199
    invoke-static {v0}, Lcom/android/launcher3/folder/g0;->a(Lcom/android/launcher3/folder/g0;)Lcom/android/launcher3/C2;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    invoke-virtual {v0}, Lcom/android/launcher3/C2;->getStatsLogManager()Lcom/android/launcher3/logging/StatsLogManager;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    invoke-virtual {v0}, Lcom/android/launcher3/logging/StatsLogManager;->logger()Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-interface {v0, v5}, Lcom/android/launcher3/logging/StatsLogManager$i;->withItemInfo(Lcom/android/launcher3/model/data/y;)Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iget-object p0, p0, Lcom/android/launcher3/folder/g0$a;->g:Lcom/android/launcher3/folder/Folder;

    .line 216
    .line 217
    iget-object p0, p0, Lcom/android/launcher3/folder/Folder;->p:Lcom/android/launcher3/dragndrop/j;

    .line 218
    .line 219
    invoke-virtual {p0}, Lcom/android/launcher3/dragndrop/j;->B()Ljava/util/Optional;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    new-instance v1, Lcom/android/launcher3/folder/f0;

    .line 227
    .line 228
    invoke-direct {v1, v0}, Lcom/android/launcher3/folder/f0;-><init>(Lcom/android/launcher3/logging/StatsLogManager$i;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {p0, v1}, Ljava/util/Optional;->map(Ljava/util/function/Function;)Ljava/util/Optional;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-virtual {p0, v0}, Ljava/util/Optional;->orElse(Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    check-cast p0, Lcom/android/launcher3/logging/StatsLogManager$i;

    .line 240
    .line 241
    sget-object v0, Lcom/android/launcher3/logging/StatsLogManager$e;->Z0:Lcom/android/launcher3/logging/StatsLogManager$e;

    .line 242
    .line 243
    invoke-interface {p0, v0}, Lcom/android/launcher3/logging/StatsLogManager$i;->log(Lcom/android/launcher3/logging/StatsLogManager$d;)V

    .line 244
    .line 245
    .line 246
    :cond_4
    return-void
.end method
