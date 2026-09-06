.class Lcom/android/launcher3/nubia/c$b;
.super Ljava/lang/Object;
.source "NubiaPushBadgeHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/nubia/c;->t(Landroid/content/Context;Lcom/android/launcher3/nubia/NubiaPushConfig;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/nubia/NubiaPushConfig;

.field final synthetic h:Landroid/content/Context;

.field final synthetic i:Lcom/android/launcher3/C2;


# direct methods
.method constructor <init>(Lcom/android/launcher3/nubia/NubiaPushConfig;Landroid/content/Context;Lcom/android/launcher3/C2;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/nubia/c$b;->h:Landroid/content/Context;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/nubia/c$b;->i:Lcom/android/launcher3/C2;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static synthetic a(Landroid/content/Context;[ZLcom/android/launcher3/C2;Lcom/android/launcher3/nubia/NubiaPushConfig;Lcom/android/launcher3/model/data/y;Landroid/view/View;)Z
    .locals 5

    .line 1
    instance-of v0, p4, Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    instance-of v0, p5, Lcom/android/launcher3/BubbleTextView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0, p4}, Lcom/android/launcher3/nubia/c;->h(Landroid/content/Context;Ljava/lang/Object;)Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    move-object v0, p5

    .line 18
    check-cast v0, Lcom/android/launcher3/BubbleTextView;

    .line 19
    .line 20
    invoke-virtual {v0, p4, v2}, Lcom/android/launcher3/BubbleTextView;->u(Lcom/android/launcher3/model/data/y;Z)V

    .line 21
    .line 22
    .line 23
    aput-boolean v2, p1, v1

    .line 24
    .line 25
    :cond_0
    instance-of v0, p4, Lcom/android/launcher3/model/data/p;

    .line 26
    .line 27
    if-eqz v0, :cond_5

    .line 28
    .line 29
    instance-of v0, p5, Lcom/android/launcher3/folder/FolderIcon;

    .line 30
    .line 31
    if-eqz v0, :cond_5

    .line 32
    .line 33
    new-instance v0, Lk1/b;

    .line 34
    .line 35
    invoke-direct {v0}, Lk1/b;-><init>()V

    .line 36
    .line 37
    .line 38
    check-cast p4, Lcom/android/launcher3/model/data/p;

    .line 39
    .line 40
    invoke-virtual {p4}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object p4

    .line 44
    invoke-virtual {p4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object p4

    .line 48
    :cond_1
    :goto_0
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_4

    .line 53
    .line 54
    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 59
    .line 60
    instance-of v4, p5, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 61
    .line 62
    if-eqz v4, :cond_2

    .line 63
    .line 64
    move-object v4, p5

    .line 65
    check-cast v4, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;

    .line 66
    .line 67
    invoke-virtual {v4, v3}, Lcom/android/launcher3/streamer/transformfolder/TransformFolderIcon;->i1(Lcom/android/launcher3/model/data/y;)Z

    .line 68
    .line 69
    .line 70
    move-result v4

    .line 71
    if-eqz v4, :cond_3

    .line 72
    .line 73
    invoke-virtual {p2, v3}, Lcom/android/launcher3/C2;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v0, p0, v4}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 78
    .line 79
    .line 80
    goto :goto_1

    .line 81
    :cond_2
    invoke-virtual {p2, v3}, Lcom/android/launcher3/C2;->getDotInfoForItem(Lcom/android/launcher3/model/data/y;)Lk1/a;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    invoke-virtual {v0, p0, v4}, Lk1/b;->i(Landroid/content/Context;Lk1/a;)V

    .line 86
    .line 87
    .line 88
    :cond_3
    :goto_1
    if-eqz v3, :cond_1

    .line 89
    .line 90
    invoke-virtual {p3}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getComponentName()Landroid/content/ComponentName;

    .line 91
    .line 92
    .line 93
    move-result-object v4

    .line 94
    invoke-virtual {v3}, Lcom/android/launcher3/model/data/y;->getTargetComponent()Landroid/content/ComponentName;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    invoke-virtual {v4, v3}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-eqz v3, :cond_1

    .line 103
    .line 104
    aput-boolean v2, p1, v1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_4
    check-cast p5, Lcom/android/launcher3/folder/FolderIcon;

    .line 108
    .line 109
    invoke-virtual {p5, v0}, Lcom/android/launcher3/folder/FolderIcon;->setDotInfo(Lk1/b;)V

    .line 110
    .line 111
    .line 112
    :cond_5
    return v1
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/nubia/c;->b()Ljava/util/ArrayList;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v1, 0x1

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    invoke-static {}, Lcom/android/launcher3/nubia/c;->b()Ljava/util/ArrayList;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    sub-int/2addr v0, v1

    .line 21
    :goto_0
    if-ltz v0, :cond_1

    .line 22
    .line 23
    invoke-static {}, Lcom/android/launcher3/nubia/c;->b()Ljava/util/ArrayList;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    check-cast v2, Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 32
    .line 33
    iget-object v3, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 34
    .line 35
    invoke-virtual {v3}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getComponentName()Landroid/content/ComponentName;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-virtual {v2}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getComponentName()Landroid/content/ComponentName;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v3, v4}, Landroid/content/ComponentName;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    if-eqz v3, :cond_0

    .line 48
    .line 49
    invoke-static {}, Lcom/android/launcher3/nubia/c;->b()Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object v3

    .line 53
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-static {}, Lcom/android/launcher3/nubia/c;->b()Ljava/util/ArrayList;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    iget-object v2, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 64
    .line 65
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/android/launcher3/nubia/c$b;->h:Landroid/content/Context;

    .line 69
    .line 70
    invoke-static {v0}, Lcom/android/launcher3/nubia/c;->c(Landroid/content/Context;)V

    .line 71
    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    const-string v2, "updateConfig add componentName= "

    .line 79
    .line 80
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    iget-object v2, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 84
    .line 85
    invoke-virtual {v2}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getComponentName()Landroid/content/ComponentName;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    const-string v2, "NubiaPushBadgeHelper"

    .line 97
    .line 98
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 99
    .line 100
    .line 101
    new-array v0, v1, [Z

    .line 102
    .line 103
    invoke-static {}, Lcom/android/launcher3/nubia/c;->b()Ljava/util/ArrayList;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    if-nez v1, :cond_2

    .line 112
    .line 113
    iget-object v1, p0, Lcom/android/launcher3/nubia/c$b;->i:Lcom/android/launcher3/C2;

    .line 114
    .line 115
    invoke-virtual {v1}, Lcom/android/launcher3/C2;->B2()Lcom/android/launcher3/Workspace;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    iget-object v3, p0, Lcom/android/launcher3/nubia/c$b;->h:Landroid/content/Context;

    .line 120
    .line 121
    iget-object v4, p0, Lcom/android/launcher3/nubia/c$b;->i:Lcom/android/launcher3/C2;

    .line 122
    .line 123
    iget-object v5, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 124
    .line 125
    new-instance v6, Lcom/android/launcher3/nubia/d;

    .line 126
    .line 127
    invoke-direct {v6, v3, v0, v4, v5}, Lcom/android/launcher3/nubia/d;-><init>(Landroid/content/Context;[ZLcom/android/launcher3/C2;Lcom/android/launcher3/nubia/NubiaPushConfig;)V

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, v6}, Lcom/android/launcher3/Workspace;->e(Lcom/android/launcher3/util/Y0$a;)Landroid/view/View;

    .line 131
    .line 132
    .line 133
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 134
    .line 135
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 136
    .line 137
    .line 138
    const-string v3, "updateConfig sendRecv isZte="

    .line 139
    .line 140
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    .line 142
    .line 143
    iget-object v3, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 144
    .line 145
    invoke-virtual {v3}, Lcom/android/launcher3/nubia/NubiaPushConfig;->isZte()Z

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    invoke-static {v2, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 160
    .line 161
    invoke-virtual {v1}, Lcom/android/launcher3/nubia/NubiaPushConfig;->isZte()Z

    .line 162
    .line 163
    .line 164
    move-result v1

    .line 165
    if-nez v1, :cond_4

    .line 166
    .line 167
    iget-object v1, p0, Lcom/android/launcher3/nubia/c$b;->h:Landroid/content/Context;

    .line 168
    .line 169
    iget-object v2, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 170
    .line 171
    invoke-virtual {v2}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getPushId()J

    .line 172
    .line 173
    .line 174
    move-result-wide v2

    .line 175
    invoke-static {v1, v2, v3}, Lcom/android/launcher3/nubia/f;->d(Landroid/content/Context;J)V

    .line 176
    .line 177
    .line 178
    const/4 v1, 0x0

    .line 179
    aget-boolean v0, v0, v1

    .line 180
    .line 181
    if-eqz v0, :cond_3

    .line 182
    .line 183
    iget-object v0, p0, Lcom/android/launcher3/nubia/c$b;->h:Landroid/content/Context;

    .line 184
    .line 185
    iget-object p0, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 186
    .line 187
    invoke-virtual {p0}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getPushId()J

    .line 188
    .line 189
    .line 190
    move-result-wide v1

    .line 191
    invoke-static {v0, v1, v2}, Lcom/android/launcher3/nubia/f;->e(Landroid/content/Context;J)V

    .line 192
    .line 193
    .line 194
    :cond_3
    return-void

    .line 195
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 196
    .line 197
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 198
    .line 199
    .line 200
    iget-object p0, p0, Lcom/android/launcher3/nubia/c$b;->g:Lcom/android/launcher3/nubia/NubiaPushConfig;

    .line 201
    .line 202
    invoke-virtual {p0}, Lcom/android/launcher3/nubia/NubiaPushConfig;->getPushId()J

    .line 203
    .line 204
    .line 205
    move-result-wide v1

    .line 206
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    const-string p0, ""

    .line 210
    .line 211
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    invoke-static {p0}, Lh1/a;->F(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    return-void
.end method
