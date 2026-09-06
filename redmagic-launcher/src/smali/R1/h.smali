.class public LR1/h;
.super Ljava/lang/Object;
.source "AddIconAfterInsertingSimCard.java"


# instance fields
.field private a:Landroid/content/Context;

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "LR1/i;",
            ">;"
        }
    .end annotation
.end field

.field private c:LR1/i;

.field private d:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, LR1/h;->c:LR1/i;

    .line 6
    .line 7
    new-instance v0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, LR1/h;->d:Ljava/util/HashMap;

    .line 13
    .line 14
    new-instance v0, Ljava/util/HashMap;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 20
    .line 21
    iput-object p1, p0, LR1/h;->a:Landroid/content/Context;

    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, LR1/h;->H(Z)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method private A()V
    .locals 2

    .line 1
    const-string v0, "AddIconAfterInsertingSimCard"

    .line 2
    .line 3
    const-string v1, "resetFolderInfo: "

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, LR1/h;->d:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, LR1/h;->c:LR1/i;

    .line 20
    .line 21
    return-void
.end method

.method private B(Lz1/o3;LR1/i;)V
    .locals 4

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v1, p2, LR1/i;->d:Ljava/lang/String;

    .line 9
    .line 10
    const-string v2, "desktop"

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    :goto_0
    return-void

    .line 19
    :cond_1
    invoke-direct {p0, p2}, LR1/h;->s(LR1/i;)Lcom/android/launcher3/model/data/I;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    iget v2, p2, LR1/i;->g:I

    .line 24
    .line 25
    const/16 v3, -0x64

    .line 26
    .line 27
    invoke-virtual {v0, v3, v2}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    new-instance v2, LR1/e;

    .line 32
    .line 33
    invoke-direct {v2, p0, v0, p2, v1}, LR1/e;-><init>(LR1/h;Lcom/android/launcher3/CellLayout;LR1/i;Lcom/android/launcher3/model/data/I;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v2}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method private C(Lz1/o3;LR1/i;)V
    .locals 6

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->E()Lcom/android/launcher3/H5$d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5$d;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "doubleFavorites"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto/16 :goto_0

    .line 18
    .line 19
    :cond_0
    iget-object v0, p2, LR1/i;->o:Ljava/lang/String;

    .line 20
    .line 21
    iget-object v1, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/util/HashMap;->isEmpty()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const-string v2, ",folderName = "

    .line 28
    .line 29
    const-string v3, "AddIconAfterInsertingSimCard"

    .line 30
    .line 31
    const/4 v4, 0x1

    .line 32
    if-nez v1, :cond_4

    .line 33
    .line 34
    iget-object v1, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_1

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_1
    iget-object v1, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 44
    .line 45
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_3

    .line 50
    .line 51
    iget-object v1, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 52
    .line 53
    invoke-virtual {v1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Ljava/lang/Integer;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    if-ne v1, v4, :cond_2

    .line 64
    .line 65
    new-instance v1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 68
    .line 69
    .line 70
    const-string v5, "create folder to Desktop : "

    .line 71
    .line 72
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    iget-object v5, p2, LR1/i;->a:Ljava/lang/String;

    .line 76
    .line 77
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    invoke-direct {p0, p1, p2}, LR1/h;->n(Lz1/o3;LR1/i;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 97
    .line 98
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, Ljava/lang/Integer;

    .line 103
    .line 104
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    add-int/2addr p1, v4

    .line 109
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string v4, "send app to folder "

    .line 123
    .line 124
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    iget-object v4, p2, LR1/i;->a:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-static {v3, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 143
    .line 144
    .line 145
    invoke-direct {p0, p1, p2}, LR1/h;->B(Lz1/o3;LR1/i;)V

    .line 146
    .line 147
    .line 148
    :cond_3
    :goto_0
    return-void

    .line 149
    :cond_4
    :goto_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 150
    .line 151
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .line 153
    .line 154
    const-string v5, "send first app to Desktop : "

    .line 155
    .line 156
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    iget-object v5, p2, LR1/i;->a:Ljava/lang/String;

    .line 160
    .line 161
    invoke-virtual {v1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 165
    .line 166
    .line 167
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    .line 169
    .line 170
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 175
    .line 176
    .line 177
    invoke-virtual {p0, p1, p2}, LR1/h;->E(Lz1/o3;LR1/i;)V

    .line 178
    .line 179
    .line 180
    iget-object p0, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 181
    .line 182
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p0, v0, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    return-void
.end method

.method public static synthetic a(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/x0;Lz1/y0$b;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    invoke-interface {p2, p1, v1, v0}, Lz1/y0$b;->n(Lcom/android/launcher3/util/x0;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public static synthetic b(LR1/h;Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, LR1/h;->w(Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Ljava/lang/String;LR1/i;)Z
    .locals 0

    .line 1
    iget-object p1, p1, LR1/i;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static synthetic d(Lcom/android/launcher3/CellLayout;Landroid/view/View;Lcom/android/launcher3/C2;ILR1/i;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/I;Lz1/y0$b;)V
    .locals 8

    .line 1
    invoke-virtual {p0, p1}, Lcom/android/launcher3/CellLayout;->removeView(Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    iget v3, p4, LR1/i;->g:I

    .line 5
    .line 6
    iget v4, p4, LR1/i;->e:I

    .line 7
    .line 8
    iget v5, p4, LR1/i;->f:I

    .line 9
    .line 10
    iget-object v6, p4, LR1/i;->o:Ljava/lang/String;

    .line 11
    .line 12
    const/4 v7, 0x0

    .line 13
    move-object v1, p0

    .line 14
    move-object v0, p2

    .line 15
    move v2, p3

    .line 16
    invoke-virtual/range {v0 .. v7}, Lcom/android/launcher3/C2;->X0(Lcom/android/launcher3/CellLayout;IIIILjava/lang/String;Landroid/view/View;)Lcom/android/launcher3/folder/FolderIcon;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0, p5}, Lcom/android/launcher3/folder/FolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p6}, Lcom/android/launcher3/folder/FolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 24
    .line 25
    .line 26
    const-string p0, "AddIconAfterInsertingSimCard"

    .line 27
    .line 28
    const-string p1, "create folder and add app success! "

    .line 29
    .line 30
    invoke-static {p0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static synthetic e(LR1/h;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, LR1/h;->v(LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(LR1/h;Lcom/android/launcher3/CellLayout;LR1/i;Lcom/android/launcher3/model/data/I;Lz1/y0$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, LR1/h;->u(Lcom/android/launcher3/CellLayout;LR1/i;Lcom/android/launcher3/model/data/I;Lz1/y0$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private g(LR1/i;Lcom/android/launcher3/model/data/I;)V
    .locals 7

    .line 1
    iget-object v0, p0, LR1/h;->d:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/HashMap;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, LR1/h;->d:Ljava/util/HashMap;

    .line 10
    .line 11
    iget-object v1, p1, LR1/i;->o:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :cond_0
    iget-object v0, p0, LR1/h;->d:Ljava/util/HashMap;

    .line 22
    .line 23
    iget-object v1, p1, LR1/i;->o:Ljava/lang/String;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    check-cast v0, Ljava/lang/Integer;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    new-instance v2, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string v3, "addAppToFolderLayout: app = "

    .line 41
    .line 42
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object v3, p1, LR1/i;->a:Ljava/lang/String;

    .line 46
    .line 47
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string v3, ",folderName = "

    .line 51
    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    iget-object v3, p1, LR1/i;->o:Ljava/lang/String;

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    const-string v3, "AddIconAfterInsertingSimCard"

    .line 65
    .line 66
    invoke-static {v3, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    :try_start_0
    new-instance v2, Landroid/content/ContentValues;

    .line 70
    .line 71
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v4, "itemType"

    .line 75
    .line 76
    const/4 v5, 0x0

    .line 77
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v6

    .line 81
    invoke-virtual {v2, v4, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 82
    .line 83
    .line 84
    const-string v4, "container"

    .line 85
    .line 86
    invoke-virtual {v2, v4, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 87
    .line 88
    .line 89
    const-string v0, "screen"

    .line 90
    .line 91
    iget v4, p1, LR1/i;->g:I

    .line 92
    .line 93
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-virtual {v2, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 98
    .line 99
    .line 100
    const-string v0, "cellX"

    .line 101
    .line 102
    iget v4, p1, LR1/i;->p:I

    .line 103
    .line 104
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 105
    .line 106
    .line 107
    move-result-object v4

    .line 108
    invoke-virtual {v2, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 109
    .line 110
    .line 111
    const-string v0, "cellY"

    .line 112
    .line 113
    iget v4, p1, LR1/i;->q:I

    .line 114
    .line 115
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 116
    .line 117
    .line 118
    move-result-object v4

    .line 119
    invoke-virtual {v2, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 120
    .line 121
    .line 122
    const-string v0, "spanX"

    .line 123
    .line 124
    const/4 v4, 0x1

    .line 125
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v6

    .line 129
    invoke-virtual {v2, v0, v6}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 130
    .line 131
    .line 132
    const-string v0, "spanY"

    .line 133
    .line 134
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    invoke-virtual {v2, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 139
    .line 140
    .line 141
    new-instance v0, Landroid/content/Intent;

    .line 142
    .line 143
    const-string v4, "android.intent.action.MAIN"

    .line 144
    .line 145
    const/4 v6, 0x0

    .line 146
    invoke-direct {v0, v4, v6}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 147
    .line 148
    .line 149
    const-string v4, "android.intent.category.LAUNCHER"

    .line 150
    .line 151
    invoke-virtual {v0, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    const/high16 v4, 0x10200000

    .line 156
    .line 157
    invoke-virtual {v0, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    new-instance v4, Landroid/content/ComponentName;

    .line 162
    .line 163
    iget-object v6, p1, LR1/i;->a:Ljava/lang/String;

    .line 164
    .line 165
    iget-object p1, p1, LR1/i;->b:Ljava/lang/String;

    .line 166
    .line 167
    invoke-direct {v4, v6, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v0, v4}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    const-string v0, "intent"

    .line 175
    .line 176
    invoke-virtual {p1, v5}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object p1

    .line 180
    invoke-virtual {v2, v0, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 181
    .line 182
    .line 183
    iget-object p1, p0, LR1/h;->a:Landroid/content/Context;

    .line 184
    .line 185
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-virtual {p1}, Lz1/k2;->y()I

    .line 198
    .line 199
    .line 200
    move-result p1

    .line 201
    const-string v0, "_id"

    .line 202
    .line 203
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    invoke-virtual {v2, v0, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 208
    .line 209
    .line 210
    const-string v0, "title"

    .line 211
    .line 212
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 213
    .line 214
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    invoke-virtual {v2, v0, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 222
    .line 223
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 232
    .line 233
    .line 234
    move-result-object p0

    .line 235
    invoke-virtual {p0, v2}, Lz1/k2;->J(Landroid/content/ContentValues;)I

    .line 236
    .line 237
    .line 238
    new-instance p0, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 241
    .line 242
    .line 243
    const-string p2, "addAppToFolderLayout: app id = "

    .line 244
    .line 245
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    const-string p1, ",container = "

    .line 252
    .line 253
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 254
    .line 255
    .line 256
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 257
    .line 258
    .line 259
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-static {v3, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :catch_0
    move-exception p0

    .line 268
    new-instance p1, Ljava/lang/StringBuilder;

    .line 269
    .line 270
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 271
    .line 272
    .line 273
    const-string p2, "addAppToFolderLayout: add fail. "

    .line 274
    .line 275
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-static {v3, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 286
    .line 287
    .line 288
    :cond_1
    :goto_0
    return-void
.end method

.method private j(LR1/i;)V
    .locals 7

    .line 1
    invoke-static {}, Lcom/android/launcher3/H5;->E()Lcom/android/launcher3/H5$d;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/H5$d;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, "doubleFavorites"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    iget-object v0, p1, LR1/i;->o:Ljava/lang/String;

    .line 19
    .line 20
    invoke-direct {p0, p1}, LR1/h;->s(LR1/i;)Lcom/android/launcher3/model/data/I;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iget-object v2, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/util/HashMap;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const-string v3, ",folderName = "

    .line 31
    .line 32
    const/4 v4, 0x1

    .line 33
    const-string v5, "AddIconAfterInsertingSimCard"

    .line 34
    .line 35
    if-nez v2, :cond_3

    .line 36
    .line 37
    iget-object v2, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    iget-object v2, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 47
    .line 48
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v2

    .line 52
    if-eqz v2, :cond_4

    .line 53
    .line 54
    iget-object v2, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 55
    .line 56
    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Ljava/lang/Integer;

    .line 61
    .line 62
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 63
    .line 64
    .line 65
    move-result v2

    .line 66
    if-ne v2, v4, :cond_2

    .line 67
    .line 68
    new-instance v2, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 71
    .line 72
    .line 73
    const-string v6, "create folder To Desktop :"

    .line 74
    .line 75
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    iget-object v6, p1, LR1/i;->a:Ljava/lang/String;

    .line 79
    .line 80
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v2

    .line 93
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    .line 95
    .line 96
    invoke-direct {p0, p1}, LR1/h;->y(LR1/i;)V

    .line 97
    .line 98
    .line 99
    invoke-direct {p0, p1}, LR1/h;->o(LR1/i;)V

    .line 100
    .line 101
    .line 102
    iget-object v2, p0, LR1/h;->c:LR1/i;

    .line 103
    .line 104
    invoke-direct {p0, v2, v1}, LR1/h;->g(LR1/i;Lcom/android/launcher3/model/data/I;)V

    .line 105
    .line 106
    .line 107
    invoke-direct {p0, p1, v1}, LR1/h;->g(LR1/i;Lcom/android/launcher3/model/data/I;)V

    .line 108
    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_2
    new-instance v2, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 114
    .line 115
    .line 116
    const-string v6, "send app To folder :"

    .line 117
    .line 118
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget-object v6, p1, LR1/i;->a:Ljava/lang/String;

    .line 122
    .line 123
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 137
    .line 138
    .line 139
    invoke-direct {p0, p1, v1}, LR1/h;->g(LR1/i;Lcom/android/launcher3/model/data/I;)V

    .line 140
    .line 141
    .line 142
    :goto_0
    iget-object p1, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 143
    .line 144
    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    check-cast v1, Ljava/lang/Integer;

    .line 149
    .line 150
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    add-int/2addr v1, v4

    .line 155
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_3
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 164
    .line 165
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 166
    .line 167
    .line 168
    const-string v6, "add first app To Desktop :"

    .line 169
    .line 170
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    iget-object v6, p1, LR1/i;->a:Ljava/lang/String;

    .line 174
    .line 175
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-static {v5, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    invoke-direct {p0, p1}, LR1/h;->y(LR1/i;)V

    .line 192
    .line 193
    .line 194
    invoke-virtual {p0, p1, v1}, LR1/h;->h(LR1/i;Lcom/android/launcher3/model/data/I;)V

    .line 195
    .line 196
    .line 197
    iput-object p1, p0, LR1/h;->c:LR1/i;

    .line 198
    .line 199
    iget-object p1, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 200
    .line 201
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 202
    .line 203
    .line 204
    move-result-object v1

    .line 205
    invoke-virtual {p1, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    :cond_4
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 209
    .line 210
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 211
    .line 212
    .line 213
    const-string v1, "addFolderToLayout: current folder app Count :"

    .line 214
    .line 215
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget-object p0, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 219
    .line 220
    invoke-virtual {p0, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    move-result-object p0

    .line 224
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 225
    .line 226
    .line 227
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 228
    .line 229
    .line 230
    move-result-object p0

    .line 231
    invoke-static {v5, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 232
    .line 233
    .line 234
    return-void
.end method

.method private k(LR1/i;Lcom/android/launcher3/model/data/I;Landroid/net/Uri;)V
    .locals 14

    .line 1
    const-string v1, "_id"

    .line 2
    .line 3
    const-string v2, "AddIconAfterInsertingSimCard"

    .line 4
    .line 5
    :try_start_0
    iget-object v3, p0, LR1/h;->a:Landroid/content/Context;

    .line 6
    .line 7
    invoke-virtual {v3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    new-instance v4, Landroid/content/ContentValues;

    .line 12
    .line 13
    invoke-direct {v4}, Landroid/content/ContentValues;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v5, "itemType"

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object v7

    .line 23
    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 24
    .line 25
    .line 26
    const-string v5, "container"

    .line 27
    .line 28
    const/16 v7, -0x64

    .line 29
    .line 30
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 35
    .line 36
    .line 37
    const-string v5, "screen"

    .line 38
    .line 39
    iget v7, p1, LR1/i;->g:I

    .line 40
    .line 41
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 46
    .line 47
    .line 48
    const-string v5, "cellX"

    .line 49
    .line 50
    iget v7, p1, LR1/i;->e:I

    .line 51
    .line 52
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v7

    .line 56
    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 57
    .line 58
    .line 59
    const-string v5, "cellY"

    .line 60
    .line 61
    iget v7, p1, LR1/i;->f:I

    .line 62
    .line 63
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-virtual {v4, v5, v7}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 68
    .line 69
    .line 70
    const-string v5, "spanX"

    .line 71
    .line 72
    const/4 v7, 0x1

    .line 73
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    invoke-virtual {v4, v5, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    .line 79
    .line 80
    const-string v5, "spanY"

    .line 81
    .line 82
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    invoke-virtual {v4, v5, v8}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 87
    .line 88
    .line 89
    new-instance v5, Landroid/content/Intent;

    .line 90
    .line 91
    const-string v8, "android.intent.action.MAIN"

    .line 92
    .line 93
    const/4 v9, 0x0

    .line 94
    invoke-direct {v5, v8, v9}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 95
    .line 96
    .line 97
    const-string v8, "android.intent.category.LAUNCHER"

    .line 98
    .line 99
    invoke-virtual {v5, v8}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    const/high16 v8, 0x10200000

    .line 104
    .line 105
    invoke-virtual {v5, v8}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 106
    .line 107
    .line 108
    move-result-object v5

    .line 109
    new-instance v8, Landroid/content/ComponentName;

    .line 110
    .line 111
    iget-object v9, p1, LR1/i;->a:Ljava/lang/String;

    .line 112
    .line 113
    iget-object v0, p1, LR1/i;->b:Ljava/lang/String;

    .line 114
    .line 115
    invoke-direct {v8, v9, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {v5, v8}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    const-string v5, "intent"

    .line 123
    .line 124
    invoke-virtual {v0, v6}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-virtual {v4, v5, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    .line 130
    .line 131
    iget-object v0, p0, LR1/h;->a:Landroid/content/Context;

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->M0()Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_0

    .line 150
    .line 151
    const-string v0, "doubleFavorites"

    .line 152
    .line 153
    :goto_0
    move-object v9, v0

    .line 154
    goto :goto_1

    .line 155
    :catch_0
    move-exception v0

    .line 156
    move-object p0, v0

    .line 157
    goto/16 :goto_6

    .line 158
    .line 159
    :cond_0
    const-string v0, "favorites"

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :goto_1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 163
    .line 164
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 165
    .line 166
    .line 167
    const-string v5, "_id = (SELECT MAX(_id) FROM "

    .line 168
    .line 169
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v5, ")"

    .line 176
    .line 177
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v11
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 184
    const/4 v5, -0x1

    .line 185
    :try_start_1
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 186
    .line 187
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 196
    .line 197
    .line 198
    move-result-object v8

    .line 199
    const/4 v12, 0x0

    .line 200
    const/4 v13, 0x0

    .line 201
    const/4 v10, 0x0

    .line 202
    invoke-virtual/range {v8 .. v13}, Lz1/k2;->Y(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 203
    .line 204
    .line 205
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 206
    move v6, v5

    .line 207
    if-eqz p0, :cond_1

    .line 208
    .line 209
    :goto_2
    :try_start_2
    invoke-interface {p0}, Landroid/database/Cursor;->moveToNext()Z

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    if-eqz v0, :cond_1

    .line 214
    .line 215
    invoke-interface {p0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    invoke-interface {p0, v0}, Landroid/database/Cursor;->getInt(I)I

    .line 220
    .line 221
    .line 222
    move-result v6
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 223
    goto :goto_2

    .line 224
    :catchall_0
    move-exception v0

    .line 225
    move-object v8, v0

    .line 226
    :try_start_3
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 227
    .line 228
    .line 229
    goto :goto_3

    .line 230
    :catchall_1
    move-exception v0

    .line 231
    move-object p0, v0

    .line 232
    :try_start_4
    invoke-virtual {v8, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 233
    .line 234
    .line 235
    :goto_3
    throw v8

    .line 236
    :catch_1
    move-exception v0

    .line 237
    move-object p0, v0

    .line 238
    goto :goto_4

    .line 239
    :cond_1
    if-eqz p0, :cond_2

    .line 240
    .line 241
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 242
    .line 243
    .line 244
    goto :goto_5

    .line 245
    :catch_2
    move-exception v0

    .line 246
    move-object p0, v0

    .line 247
    move v6, v5

    .line 248
    :goto_4
    :try_start_5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 249
    .line 250
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 251
    .line 252
    .line 253
    const-string v8, "addIconToDb get max id error. "

    .line 254
    .line 255
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 266
    .line 267
    .line 268
    :cond_2
    :goto_5
    if-eq v6, v5, :cond_3

    .line 269
    .line 270
    add-int/2addr v6, v7

    .line 271
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    invoke-virtual {v4, v1, p0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 276
    .line 277
    .line 278
    const-string p0, "title"

    .line 279
    .line 280
    move-object/from16 v1, p2

    .line 281
    .line 282
    iget-object v0, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 283
    .line 284
    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    invoke-virtual {v4, p0, v0}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    .line 290
    .line 291
    move-object/from16 p0, p3

    .line 292
    .line 293
    invoke-virtual {v3, p0, v4}, Landroid/content/ContentResolver;->insert(Landroid/net/Uri;Landroid/content/ContentValues;)Landroid/net/Uri;

    .line 294
    .line 295
    .line 296
    new-instance p0, Ljava/lang/StringBuilder;

    .line 297
    .line 298
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 299
    .line 300
    .line 301
    const-string v0, "addIconToDb: info: "

    .line 302
    .line 303
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {p0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 307
    .line 308
    .line 309
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 310
    .line 311
    .line 312
    move-result-object p0

    .line 313
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 314
    .line 315
    .line 316
    goto :goto_7

    .line 317
    :goto_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 320
    .line 321
    .line 322
    const-string v1, "addIconToDb got Exception!! "

    .line 323
    .line 324
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 328
    .line 329
    .line 330
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 335
    .line 336
    .line 337
    :cond_3
    :goto_7
    return-void
.end method

.method private l(Lz1/o3;Lcom/android/launcher3/model/data/y;)V
    .locals 10

    .line 1
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 12
    .line 13
    const/16 v1, -0x64

    .line 14
    .line 15
    const-string v2, "AddIconAfterInsertingSimCard"

    .line 16
    .line 17
    if-ne v0, v1, :cond_2

    .line 18
    .line 19
    const-string v0, "addIconToDesktop icon container is desktop"

    .line 20
    .line 21
    invoke-static {v2, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    if-nez v0, :cond_0

    .line 29
    .line 30
    const-string p0, "addIconToDesktop--bgDataModel is null"

    .line 31
    .line 32
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    invoke-virtual {v0}, Lz1/y0;->m()Lcom/android/launcher3/util/x0;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Lcom/android/launcher3/util/x0;

    .line 41
    .line 42
    invoke-direct {v1}, Lcom/android/launcher3/util/x0;-><init>()V

    .line 43
    .line 44
    .line 45
    iget v3, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 46
    .line 47
    invoke-virtual {v0, v3}, Lcom/android/launcher3/util/x0;->r(I)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-nez v0, :cond_1

    .line 52
    .line 53
    const-string v0, "addIconToDesktop screenid is not invalid!!"

    .line 54
    .line 55
    invoke-static {v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    iget v0, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 59
    .line 60
    invoke-virtual {v1, v0}, Lcom/android/launcher3/util/x0;->m(I)V

    .line 61
    .line 62
    .line 63
    :cond_1
    sget-object v0, Lc1/c;->c:Lc1/c;

    .line 64
    .line 65
    const/4 v2, 0x0

    .line 66
    const/4 v3, 0x1

    .line 67
    invoke-virtual {p0, v3, v0, v2}, Lcom/android/launcher3/D3;->o0(ZLc1/c;Lz1/y0$b;)Lz1/J3;

    .line 68
    .line 69
    .line 70
    move-result-object v4

    .line 71
    iget v6, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 72
    .line 73
    iget v7, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 74
    .line 75
    iget v8, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 76
    .line 77
    iget v9, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 78
    .line 79
    move-object v5, p2

    .line 80
    invoke-virtual/range {v4 .. v9}, Lz1/J3;->w(Lcom/android/launcher3/model/data/y;IIII)V

    .line 81
    .line 82
    .line 83
    new-instance p0, LR1/f;

    .line 84
    .line 85
    invoke-direct {p0, v5, v1}, LR1/f;-><init>(Lcom/android/launcher3/model/data/y;Lcom/android/launcher3/util/x0;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, p0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_2
    const-string p0, "addIconToDesktop icon container is not desktop"

    .line 93
    .line 94
    invoke-static {v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method private m(LR1/i;Lcom/android/launcher3/model/data/I;)V
    .locals 26

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    const-string v3, "AddIconAfterInsertingSimCard"

    .line 8
    .line 9
    iget-object v4, v0, LR1/h;->a:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 20
    .line 21
    .line 22
    move-result-object v4

    .line 23
    invoke-virtual {v4}, Lcom/android/launcher3/H5;->M0()Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const-string v5, "com.zte.mifavor.launcher.settings"

    .line 28
    .line 29
    const-string v6, "content://"

    .line 30
    .line 31
    if-eqz v4, :cond_0

    .line 32
    .line 33
    new-instance v7, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string v5, "/doubleFavorites"

    .line 49
    .line 50
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v5

    .line 57
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    goto :goto_0

    .line 62
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/String;->intern()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object v5

    .line 74
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v5, "/favorites"

    .line 78
    .line 79
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v5

    .line 86
    invoke-static {v5}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    :goto_0
    if-eqz v4, :cond_1

    .line 91
    .line 92
    const-string v4, "doubleFavorites"

    .line 93
    .line 94
    :goto_1
    move-object v7, v4

    .line 95
    goto :goto_2

    .line 96
    :cond_1
    const-string v4, "favorites"

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :goto_2
    const-string v4, "_id"

    .line 100
    .line 101
    const-string v12, "cellX"

    .line 102
    .line 103
    const-string v13, "cellY"

    .line 104
    .line 105
    const-string v14, "spanX"

    .line 106
    .line 107
    const-string v15, "spanY"

    .line 108
    .line 109
    filled-new-array {v4, v12, v13, v14, v15}, [Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v8

    .line 113
    const-string v9, "container=? and screen=?"

    .line 114
    .line 115
    const/16 v6, -0x64

    .line 116
    .line 117
    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    iget v10, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 122
    .line 123
    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v10

    .line 127
    filled-new-array {v6, v10}, [Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v10

    .line 131
    :try_start_0
    iget-object v6, v0, LR1/h;->a:Landroid/content/Context;

    .line 132
    .line 133
    invoke-static {v6}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 134
    .line 135
    .line 136
    move-result-object v6

    .line 137
    invoke-virtual {v6}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 138
    .line 139
    .line 140
    move-result-object v6

    .line 141
    invoke-virtual {v6}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 142
    .line 143
    .line 144
    move-result-object v6

    .line 145
    const/4 v11, 0x0

    .line 146
    invoke-virtual/range {v6 .. v11}, Lz1/k2;->Y(Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 147
    .line 148
    .line 149
    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 150
    if-eqz v6, :cond_7

    .line 151
    .line 152
    :try_start_1
    invoke-interface {v6, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    move-result v4

    .line 156
    invoke-interface {v6, v12}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v7

    .line 160
    invoke-interface {v6, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    move-result v8

    .line 164
    invoke-interface {v6, v14}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 165
    .line 166
    .line 167
    move-result v9

    .line 168
    invoke-interface {v6, v15}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 169
    .line 170
    .line 171
    move-result v10

    .line 172
    new-instance v11, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    :goto_3
    invoke-interface {v6}, Landroid/database/Cursor;->moveToNext()Z

    .line 178
    .line 179
    .line 180
    move-result v12
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 181
    if-eqz v12, :cond_5

    .line 182
    .line 183
    :try_start_2
    invoke-interface {v6, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 184
    .line 185
    .line 186
    move-result v12

    .line 187
    invoke-interface {v6, v8}, Landroid/database/Cursor;->getInt(I)I

    .line 188
    .line 189
    .line 190
    move-result v15

    .line 191
    const-wide/16 v16, -0x1

    .line 192
    .line 193
    invoke-interface {v6, v9}, Landroid/database/Cursor;->getInt(I)I

    .line 194
    .line 195
    .line 196
    move-result v13

    .line 197
    invoke-interface {v6, v10}, Landroid/database/Cursor;->getInt(I)I

    .line 198
    .line 199
    .line 200
    move-result v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 201
    move/from16 v18, v7

    .line 202
    .line 203
    const-string v7, ", spanY: "

    .line 204
    .line 205
    move/from16 v19, v8

    .line 206
    .line 207
    const-string v8, ", spanX: "

    .line 208
    .line 209
    move/from16 v20, v9

    .line 210
    .line 211
    const-string v9, ", cellY: "

    .line 212
    .line 213
    move/from16 v21, v10

    .line 214
    .line 215
    const-string v10, ", cellX: "

    .line 216
    .line 217
    move-object/from16 v22, v5

    .line 218
    .line 219
    const-string v5, "id: "

    .line 220
    .line 221
    move-object/from16 v23, v3

    .line 222
    .line 223
    const/4 v3, 0x1

    .line 224
    if-ne v13, v3, :cond_2

    .line 225
    .line 226
    if-ne v14, v3, :cond_2

    .line 227
    .line 228
    move/from16 v24, v3

    .line 229
    .line 230
    :try_start_3
    iget v3, v1, LR1/i;->e:I

    .line 231
    .line 232
    if-ne v12, v3, :cond_3

    .line 233
    .line 234
    iget v3, v1, LR1/i;->f:I

    .line 235
    .line 236
    if-ne v15, v3, :cond_3

    .line 237
    .line 238
    invoke-interface {v6, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 239
    .line 240
    .line 241
    move-result-wide v18

    .line 242
    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 255
    .line 256
    .line 257
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 258
    .line 259
    .line 260
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 264
    .line 265
    .line 266
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    .line 268
    .line 269
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    goto/16 :goto_5

    .line 273
    .line 274
    :catchall_0
    move-exception v0

    .line 275
    move-object v1, v0

    .line 276
    move-object/from16 v3, v23

    .line 277
    .line 278
    goto/16 :goto_8

    .line 279
    .line 280
    :cond_2
    move/from16 v24, v3

    .line 281
    .line 282
    :cond_3
    new-instance v3, Landroid/graphics/Rect;

    .line 283
    .line 284
    add-int v25, v12, v13

    .line 285
    .line 286
    add-int/lit8 v1, v25, -0x1

    .line 287
    .line 288
    add-int v25, v15, v14

    .line 289
    .line 290
    add-int/lit8 v0, v25, -0x1

    .line 291
    .line 292
    invoke-direct {v3, v12, v15, v1, v0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 293
    .line 294
    .line 295
    iget v0, v3, Landroid/graphics/Rect;->left:I

    .line 296
    .line 297
    iget v1, v2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 298
    .line 299
    if-gt v0, v1, :cond_4

    .line 300
    .line 301
    iget v0, v3, Landroid/graphics/Rect;->right:I

    .line 302
    .line 303
    if-gt v1, v0, :cond_4

    .line 304
    .line 305
    iget v0, v3, Landroid/graphics/Rect;->top:I

    .line 306
    .line 307
    iget v1, v2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 308
    .line 309
    if-gt v0, v1, :cond_4

    .line 310
    .line 311
    iget v0, v3, Landroid/graphics/Rect;->bottom:I

    .line 312
    .line 313
    if-gt v1, v0, :cond_4

    .line 314
    .line 315
    invoke-interface {v6, v4}, Landroid/database/Cursor;->getLong(I)J

    .line 316
    .line 317
    .line 318
    move-result-wide v18

    .line 319
    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 323
    .line 324
    .line 325
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 326
    .line 327
    .line 328
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    invoke-virtual {v11, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v11, v14}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 347
    .line 348
    .line 349
    goto :goto_5

    .line 350
    :cond_4
    move-object/from16 v0, p0

    .line 351
    .line 352
    move-object/from16 v1, p1

    .line 353
    .line 354
    move/from16 v7, v18

    .line 355
    .line 356
    move/from16 v8, v19

    .line 357
    .line 358
    move/from16 v9, v20

    .line 359
    .line 360
    move/from16 v10, v21

    .line 361
    .line 362
    move-object/from16 v5, v22

    .line 363
    .line 364
    move-object/from16 v3, v23

    .line 365
    .line 366
    goto/16 :goto_3

    .line 367
    .line 368
    :catchall_1
    move-exception v0

    .line 369
    move-object/from16 v23, v3

    .line 370
    .line 371
    :goto_4
    move-object v1, v0

    .line 372
    goto :goto_8

    .line 373
    :cond_5
    move-object/from16 v23, v3

    .line 374
    .line 375
    move-object/from16 v22, v5

    .line 376
    .line 377
    const-wide/16 v16, -0x1

    .line 378
    .line 379
    move-wide/from16 v18, v16

    .line 380
    .line 381
    :goto_5
    cmp-long v0, v18, v16

    .line 382
    .line 383
    if-eqz v0, :cond_6

    .line 384
    .line 385
    move-object/from16 v0, p0

    .line 386
    .line 387
    :try_start_4
    iget-object v1, v0, LR1/h;->a:Landroid/content/Context;

    .line 388
    .line 389
    invoke-static {v1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    invoke-virtual {v1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    invoke-virtual {v1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    const-string v3, "_id=?"

    .line 402
    .line 403
    invoke-static/range {v18 .. v19}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v4

    .line 407
    filled-new-array {v4}, [Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object v4

    .line 411
    invoke-virtual {v1, v3, v4}, Lz1/k2;->m(Ljava/lang/String;[Ljava/lang/String;)I

    .line 412
    .line 413
    .line 414
    new-instance v1, Ljava/lang/StringBuilder;

    .line 415
    .line 416
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 417
    .line 418
    .line 419
    const-string v3, "addIconToOtherMode: delete item info: "

    .line 420
    .line 421
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 428
    .line 429
    .line 430
    move-result-object v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 431
    move-object/from16 v3, v23

    .line 432
    .line 433
    :try_start_5
    invoke-static {v3, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 434
    .line 435
    .line 436
    :goto_6
    move-object/from16 v1, p1

    .line 437
    .line 438
    move-object/from16 v5, v22

    .line 439
    .line 440
    goto :goto_7

    .line 441
    :catchall_2
    move-exception v0

    .line 442
    goto :goto_4

    .line 443
    :catchall_3
    move-exception v0

    .line 444
    move-object/from16 v3, v23

    .line 445
    .line 446
    goto :goto_4

    .line 447
    :cond_6
    move-object/from16 v0, p0

    .line 448
    .line 449
    move-object/from16 v3, v23

    .line 450
    .line 451
    goto :goto_6

    .line 452
    :goto_7
    invoke-direct {v0, v1, v2, v5}, LR1/h;->k(LR1/i;Lcom/android/launcher3/model/data/I;Landroid/net/Uri;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 453
    .line 454
    .line 455
    goto :goto_a

    .line 456
    :goto_8
    :try_start_6
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 457
    .line 458
    .line 459
    goto :goto_9

    .line 460
    :catchall_4
    move-exception v0

    .line 461
    :try_start_7
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 462
    .line 463
    .line 464
    :goto_9
    throw v1

    .line 465
    :catch_0
    move-exception v0

    .line 466
    goto :goto_b

    .line 467
    :cond_7
    :goto_a
    if-eqz v6, :cond_8

    .line 468
    .line 469
    invoke-interface {v6}, Landroid/database/Cursor;->close()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    .line 470
    .line 471
    .line 472
    return-void

    .line 473
    :goto_b
    new-instance v1, Ljava/lang/StringBuilder;

    .line 474
    .line 475
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 476
    .line 477
    .line 478
    const-string v2, "addIconToOtherMode Exception!! "

    .line 479
    .line 480
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-static {v3, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 491
    .line 492
    .line 493
    :cond_8
    return-void
.end method

.method private n(Lz1/o3;LR1/i;)V
    .locals 8

    .line 1
    invoke-static {}, Lcom/android/launcher3/q4;->Q()Lcom/android/launcher3/C2;

    .line 2
    .line 3
    .line 4
    move-result-object v3

    .line 5
    if-nez v3, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p2, LR1/i;->d:Ljava/lang/String;

    .line 9
    .line 10
    const-string v1, "desktop"

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    iget v0, p2, LR1/i;->g:I

    .line 20
    .line 21
    const/16 v4, -0x64

    .line 22
    .line 23
    invoke-virtual {v3, v4, v0}, Lcom/android/launcher3/C2;->L1(II)Lcom/android/launcher3/CellLayout;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    iget v0, p2, LR1/i;->e:I

    .line 28
    .line 29
    iget v2, p2, LR1/i;->f:I

    .line 30
    .line 31
    invoke-virtual {v1, v0, v2}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    move-object v6, v0

    .line 40
    check-cast v6, Lcom/android/launcher3/model/data/I;

    .line 41
    .line 42
    invoke-direct {p0, p2}, LR1/h;->s(LR1/i;)Lcom/android/launcher3/model/data/I;

    .line 43
    .line 44
    .line 45
    move-result-object v7

    .line 46
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v7}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    :goto_0
    return-void

    .line 61
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 64
    .line 65
    .line 66
    const-string v0, "createFolder: oldInfo = "

    .line 67
    .line 68
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v6}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    const-string v0, "AddIconAfterInsertingSimCard"

    .line 83
    .line 84
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    .line 86
    .line 87
    new-instance v0, LR1/g;

    .line 88
    .line 89
    move-object v5, p2

    .line 90
    invoke-direct/range {v0 .. v7}, LR1/g;-><init>(Lcom/android/launcher3/CellLayout;Landroid/view/View;Lcom/android/launcher3/C2;ILR1/i;Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/I;)V

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, v0}, Lz1/o3;->Z(Lcom/android/launcher3/D3$a;)V

    .line 94
    .line 95
    .line 96
    return-void
.end method

.method private o(LR1/i;)V
    .locals 5

    .line 1
    const-string v0, "AddIconAfterInsertingSimCard"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Landroid/content/ContentValues;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/content/ContentValues;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "title"

    .line 9
    .line 10
    iget-object v3, p1, LR1/i;->o:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-string v2, "itemType"

    .line 16
    .line 17
    const/4 v3, 0x2

    .line 18
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 23
    .line 24
    .line 25
    const-string v2, "spanX"

    .line 26
    .line 27
    iget v3, p1, LR1/i;->j:I

    .line 28
    .line 29
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 34
    .line 35
    .line 36
    const-string v2, "spanY"

    .line 37
    .line 38
    iget v3, p1, LR1/i;->k:I

    .line 39
    .line 40
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 45
    .line 46
    .line 47
    const-string v2, "screen"

    .line 48
    .line 49
    iget v3, p1, LR1/i;->g:I

    .line 50
    .line 51
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 56
    .line 57
    .line 58
    const-string v2, "cellX"

    .line 59
    .line 60
    iget v3, p1, LR1/i;->e:I

    .line 61
    .line 62
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 67
    .line 68
    .line 69
    const-string v2, "cellY"

    .line 70
    .line 71
    iget v3, p1, LR1/i;->f:I

    .line 72
    .line 73
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 78
    .line 79
    .line 80
    const-string v2, "container"

    .line 81
    .line 82
    const/16 v3, -0x64

    .line 83
    .line 84
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v1, v2, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 89
    .line 90
    .line 91
    iget-object v2, p0, LR1/h;->a:Landroid/content/Context;

    .line 92
    .line 93
    invoke-static {v2}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 94
    .line 95
    .line 96
    move-result-object v2

    .line 97
    invoke-virtual {v2}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 98
    .line 99
    .line 100
    move-result-object v2

    .line 101
    invoke-virtual {v2}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    invoke-virtual {v2}, Lz1/k2;->y()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    const-string v3, "_id"

    .line 110
    .line 111
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    invoke-virtual {v1, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 116
    .line 117
    .line 118
    iget-object v3, p0, LR1/h;->a:Landroid/content/Context;

    .line 119
    .line 120
    invoke-static {v3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 121
    .line 122
    .line 123
    move-result-object v3

    .line 124
    invoke-virtual {v3}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v3}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    invoke-virtual {v3, v1}, Lz1/k2;->J(Landroid/content/ContentValues;)I

    .line 133
    .line 134
    .line 135
    iget-object p0, p0, LR1/h;->d:Ljava/util/HashMap;

    .line 136
    .line 137
    iget-object p1, p1, LR1/i;->o:Ljava/lang/String;

    .line 138
    .line 139
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    invoke-virtual {p0, p1, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    new-instance p0, Ljava/lang/StringBuilder;

    .line 147
    .line 148
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    .line 150
    .line 151
    const-string p1, "createFolderLayout: insert folder id: "

    .line 152
    .line 153
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object p0

    .line 163
    invoke-static {v0, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :catch_0
    move-exception p0

    .line 168
    new-instance p1, Ljava/lang/StringBuilder;

    .line 169
    .line 170
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 171
    .line 172
    .line 173
    const-string v1, "createFolderLayout: insert folder fail."

    .line 174
    .line 175
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 186
    .line 187
    .line 188
    return-void
.end method

.method private s(LR1/i;)Lcom/android/launcher3/model/data/I;
    .locals 5

    .line 1
    new-instance v0, Landroid/content/Intent;

    .line 2
    .line 3
    const-string v1, "android.intent.action.MAIN"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 7
    .line 8
    .line 9
    const-string v1, "android.intent.category.LAUNCHER"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 12
    .line 13
    .line 14
    new-instance v1, Landroid/content/ComponentName;

    .line 15
    .line 16
    iget-object v3, p1, LR1/i;->a:Ljava/lang/String;

    .line 17
    .line 18
    iget-object v4, p1, LR1/i;->b:Ljava/lang/String;

    .line 19
    .line 20
    invoke-direct {v1, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, LR1/h;->a:Landroid/content/Context;

    .line 27
    .line 28
    const-class v3, Landroid/content/pm/LauncherApps;

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    check-cast v1, Landroid/content/pm/LauncherApps;

    .line 35
    .line 36
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 37
    .line 38
    .line 39
    move-result-object v4

    .line 40
    invoke-virtual {v1, v0, v4}, Landroid/content/pm/LauncherApps;->resolveActivity(Landroid/content/Intent;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfo;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    const/4 v1, 0x0

    .line 45
    if-nez v0, :cond_2

    .line 46
    .line 47
    iget-object v0, p0, LR1/h;->a:Landroid/content/Context;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    check-cast v0, Landroid/content/pm/LauncherApps;

    .line 54
    .line 55
    iget-object v3, p1, LR1/i;->a:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 58
    .line 59
    .line 60
    move-result-object v4

    .line 61
    invoke-virtual {v0, v3, v4}, Landroid/content/pm/LauncherApps;->getActivityList(Ljava/lang/String;Landroid/os/UserHandle;)Ljava/util/List;

    .line 62
    .line 63
    .line 64
    move-result-object v0

    .line 65
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 66
    .line 67
    .line 68
    move-result v3

    .line 69
    if-eqz v3, :cond_0

    .line 70
    .line 71
    move-object v0, v2

    .line 72
    goto :goto_0

    .line 73
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Landroid/content/pm/LauncherActivityInfo;

    .line 78
    .line 79
    :goto_0
    const-string v1, "AddIconAfterInsertingSimCard"

    .line 80
    .line 81
    if-nez v0, :cond_1

    .line 82
    .line 83
    const-string p0, "getShortcutInfo LauncherActivityInfo is invalid. "

    .line 84
    .line 85
    invoke-static {v1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 86
    .line 87
    .line 88
    return-object v2

    .line 89
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 92
    .line 93
    .line 94
    const-string v3, "getShortcutInfo icon is not valid, packageName = "

    .line 95
    .line 96
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    iget-object v3, p1, LR1/i;->a:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    const-string v3, ", class name: "

    .line 105
    .line 106
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    iget-object v3, p1, LR1/i;->b:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v3, ", new component name: "

    .line 115
    .line 116
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 120
    .line 121
    .line 122
    move-result-object v3

    .line 123
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 131
    .line 132
    .line 133
    const/4 v1, 0x1

    .line 134
    :cond_2
    invoke-direct {p0, p1, v0, v1}, LR1/h;->x(LR1/i;Landroid/content/pm/LauncherActivityInfo;Z)Lcom/android/launcher3/model/data/I;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    return-object p0
.end method

.method private t(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/p;)Z
    .locals 1

    .line 1
    if-eqz p2, :cond_1

    .line 2
    .line 3
    iget-object p0, p2, Lcom/android/launcher3/model/data/p;->i:Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-eqz p2, :cond_1

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    check-cast p2, Lcom/android/launcher3/model/data/y;

    .line 20
    .line 21
    invoke-virtual {p2}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p2

    .line 25
    invoke-virtual {p1}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    if-eqz p2, :cond_0

    .line 34
    .line 35
    new-instance p0, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string p2, "isAlreadyInFolder: app = "

    .line 41
    .line 42
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    const-string p1, "AddIconAfterInsertingSimCard"

    .line 55
    .line 56
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x1

    .line 60
    return p0

    .line 61
    :cond_1
    const/4 p0, 0x0

    .line 62
    return p0
.end method

.method private synthetic u(Lcom/android/launcher3/CellLayout;LR1/i;Lcom/android/launcher3/model/data/I;Lz1/y0$b;)V
    .locals 1

    .line 1
    iget p4, p2, LR1/i;->e:I

    .line 2
    .line 3
    iget v0, p2, LR1/i;->f:I

    .line 4
    .line 5
    invoke-virtual {p1, p4, v0}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/android/launcher3/folder/FolderIcon;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    iget-object p4, p1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 14
    .line 15
    invoke-direct {p0, p3, p4}, LR1/h;->t(Lcom/android/launcher3/model/data/I;Lcom/android/launcher3/model/data/p;)Z

    .line 16
    .line 17
    .line 18
    move-result p4

    .line 19
    if-nez p4, :cond_0

    .line 20
    .line 21
    invoke-virtual {p1, p3}, Lcom/android/launcher3/folder/FolderIcon;->p(Lcom/android/launcher3/model/data/y;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, LR1/h;->e:Ljava/util/HashMap;

    .line 25
    .line 26
    iget-object p2, p2, LR1/i;->o:Ljava/lang/String;

    .line 27
    .line 28
    iget-object p3, p1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 29
    .line 30
    iget-object p3, p3, Lcom/android/launcher3/model/data/p;->i:Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    invoke-virtual {p0, p2, p3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    new-instance p0, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    const-string p2, "send app to folder success! folder size is "

    .line 49
    .line 50
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget-object p1, p1, Lcom/android/launcher3/folder/FolderIcon;->j:Lcom/android/launcher3/model/data/p;

    .line 54
    .line 55
    iget-object p1, p1, Lcom/android/launcher3/model/data/p;->i:Ljava/util/ArrayList;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    const-string p1, "AddIconAfterInsertingSimCard"

    .line 69
    .line 70
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 71
    .line 72
    .line 73
    :cond_0
    return-void
.end method

.method private synthetic v(LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, LR1/h;->i(LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic w(Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, LR1/h;->F(Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    invoke-virtual {p0, p2, p1}, LR1/h;->G(LR1/i;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method private x(LR1/i;Landroid/content/pm/LauncherActivityInfo;Z)Lcom/android/launcher3/model/data/I;
    .locals 6

    .line 1
    const-string v0, "AddIconAfterInsertingSimCard"

    .line 2
    .line 3
    new-instance v1, Lcom/android/launcher3/model/data/I;

    .line 4
    .line 5
    invoke-direct {v1}, Lcom/android/launcher3/model/data/I;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    iput v2, v1, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 10
    .line 11
    iget v3, p1, LR1/i;->e:I

    .line 12
    .line 13
    iput v3, v1, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 14
    .line 15
    iget v3, p1, LR1/i;->f:I

    .line 16
    .line 17
    iput v3, v1, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 18
    .line 19
    const/4 v3, 0x1

    .line 20
    iput v3, v1, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 21
    .line 22
    iput v3, v1, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 23
    .line 24
    iget v3, p1, LR1/i;->g:I

    .line 25
    .line 26
    iput v3, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 27
    .line 28
    if-eqz p3, :cond_0

    .line 29
    .line 30
    invoke-virtual {p2}, Landroid/content/pm/LauncherActivityInfo;->getComponentName()Landroid/content/ComponentName;

    .line 31
    .line 32
    .line 33
    move-result-object p3

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    new-instance p3, Landroid/content/ComponentName;

    .line 36
    .line 37
    iget-object v3, p1, LR1/i;->a:Ljava/lang/String;

    .line 38
    .line 39
    iget-object v4, p1, LR1/i;->b:Ljava/lang/String;

    .line 40
    .line 41
    invoke-direct {p3, v3, v4}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :goto_0
    new-instance v3, Landroid/content/Intent;

    .line 45
    .line 46
    const-string v4, "android.intent.action.MAIN"

    .line 47
    .line 48
    const/4 v5, 0x0

    .line 49
    invoke-direct {v3, v4, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 50
    .line 51
    .line 52
    const-string v4, "android.intent.category.LAUNCHER"

    .line 53
    .line 54
    invoke-virtual {v3, v4}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 55
    .line 56
    .line 57
    move-result-object v3

    .line 58
    const/high16 v4, 0x10200000

    .line 59
    .line 60
    invoke-virtual {v3, v4}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    invoke-virtual {v3, p3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 65
    .line 66
    .line 67
    move-result-object p3

    .line 68
    iput-object p3, v1, Lcom/android/launcher3/model/data/I;->k:Landroid/content/Intent;

    .line 69
    .line 70
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 71
    .line 72
    .line 73
    move-result-object p3

    .line 74
    iput-object p3, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 75
    .line 76
    iget-object p3, p0, LR1/h;->a:Landroid/content/Context;

    .line 77
    .line 78
    invoke-static {p3}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 79
    .line 80
    .line 81
    move-result-object p3

    .line 82
    invoke-virtual {p3}, Lcom/android/launcher3/P2;->f()Ls1/P;

    .line 83
    .line 84
    .line 85
    move-result-object p3

    .line 86
    sget-object v3, Lt1/g;->d:Lt1/g;

    .line 87
    .line 88
    invoke-virtual {p3, v1, p2, v3}, Ls1/P;->F0(Lcom/android/launcher3/model/data/z;Landroid/content/pm/LauncherActivityInfo;Lt1/g;)V

    .line 89
    .line 90
    .line 91
    iget-object p2, p0, LR1/h;->a:Landroid/content/Context;

    .line 92
    .line 93
    invoke-virtual {p2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 98
    .line 99
    .line 100
    move-result-object p3

    .line 101
    if-eqz p3, :cond_2

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 104
    .line 105
    .line 106
    move-result-object p3

    .line 107
    invoke-virtual {p3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p3

    .line 111
    if-eqz p3, :cond_2

    .line 112
    .line 113
    :try_start_0
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 114
    .line 115
    const-class p3, Landroid/content/pm/LauncherApps;

    .line 116
    .line 117
    invoke-virtual {p0, p3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    check-cast p0, Landroid/content/pm/LauncherApps;

    .line 122
    .line 123
    invoke-virtual {v1}, Lcom/android/launcher3/model/data/I;->getTargetComponent()Landroid/content/ComponentName;

    .line 124
    .line 125
    .line 126
    move-result-object p3

    .line 127
    invoke-virtual {p3}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object p3

    .line 131
    iget-object v3, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 132
    .line 133
    invoke-virtual {p0, p3, v2, v3}, Landroid/content/pm/LauncherApps;->getApplicationInfo(Ljava/lang/String;ILandroid/os/UserHandle;)Landroid/content/pm/ApplicationInfo;

    .line 134
    .line 135
    .line 136
    move-result-object v5
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 137
    goto :goto_1

    .line 138
    :catch_0
    move-exception p0

    .line 139
    new-instance p3, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    const-string v2, "makeShortcutInfo: "

    .line 145
    .line 146
    invoke-virtual {p3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Landroid/content/pm/PackageManager$NameNotFoundException;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object p0

    .line 160
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 161
    .line 162
    .line 163
    :goto_1
    if-eqz v5, :cond_1

    .line 164
    .line 165
    invoke-virtual {v5, p2}, Landroid/content/pm/ApplicationInfo;->loadLabel(Landroid/content/pm/PackageManager;)Ljava/lang/CharSequence;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    iget-object p3, v1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 170
    .line 171
    invoke-virtual {p2, p0, p3}, Landroid/content/pm/PackageManager;->getUserBadgedLabel(Ljava/lang/CharSequence;Landroid/os/UserHandle;)Ljava/lang/CharSequence;

    .line 172
    .line 173
    .line 174
    move-result-object p0

    .line 175
    iput-object p0, v1, Lcom/android/launcher3/model/data/y;->contentDescription:Ljava/lang/CharSequence;

    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_1
    const-string p0, "Failed to get title "

    .line 179
    .line 180
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    :cond_2
    :goto_2
    iget-object p0, p1, LR1/i;->d:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz p0, :cond_4

    .line 186
    .line 187
    const-string p1, "desktop"

    .line 188
    .line 189
    invoke-virtual {p1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    move-result p0

    .line 193
    if-eqz p0, :cond_3

    .line 194
    .line 195
    const/16 p0, -0x64

    .line 196
    .line 197
    iput p0, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 198
    .line 199
    goto :goto_3

    .line 200
    :cond_3
    const/4 p0, -0x1

    .line 201
    iput p0, v1, Lcom/android/launcher3/model/data/y;->container:I

    .line 202
    .line 203
    :cond_4
    :goto_3
    return-object v1
.end method

.method private y(LR1/i;)V
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    const-string v2, "AddIconAfterInsertingSimCard"

    .line 6
    .line 7
    const-string v3, "spanY"

    .line 8
    .line 9
    const-string v4, "spanX"

    .line 10
    .line 11
    const-string v5, "cellY"

    .line 12
    .line 13
    const-string v6, "cellX"

    .line 14
    .line 15
    const-string v7, "_id"

    .line 16
    .line 17
    new-instance v8, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    const/4 v9, 0x0

    .line 23
    :try_start_0
    iget-object v10, v1, LR1/h;->a:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {v10}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 26
    .line 27
    .line 28
    move-result-object v10

    .line 29
    invoke-virtual {v10}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 30
    .line 31
    .line 32
    move-result-object v10

    .line 33
    invoke-virtual {v10}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 34
    .line 35
    .line 36
    move-result-object v10

    .line 37
    filled-new-array {v7, v6, v5, v4, v3}, [Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v11

    .line 41
    const-string v12, "container=? and screen=?"

    .line 42
    .line 43
    const/16 v13, -0x64

    .line 44
    .line 45
    invoke-static {v13}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v13

    .line 49
    iget v14, v0, LR1/i;->g:I

    .line 50
    .line 51
    invoke-static {v14}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v14

    .line 55
    filled-new-array {v13, v14}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v13

    .line 59
    invoke-virtual {v10, v11, v12, v13, v9}, Lz1/k2;->Z([Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 60
    .line 61
    .line 62
    move-result-object v9

    .line 63
    invoke-interface {v9, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v7

    .line 67
    invoke-interface {v9, v6}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v6

    .line 71
    invoke-interface {v9, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v5

    .line 75
    invoke-interface {v9, v4}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    invoke-interface {v9, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v3

    .line 83
    :goto_0
    invoke-interface {v9}, Landroid/database/Cursor;->moveToNext()Z

    .line 84
    .line 85
    .line 86
    move-result v10

    .line 87
    if-eqz v10, :cond_2

    .line 88
    .line 89
    invoke-interface {v9, v7}, Landroid/database/Cursor;->getLong(I)J

    .line 90
    .line 91
    .line 92
    move-result-wide v10

    .line 93
    invoke-interface {v9, v6}, Landroid/database/Cursor;->getInt(I)I

    .line 94
    .line 95
    .line 96
    move-result v12

    .line 97
    invoke-interface {v9, v5}, Landroid/database/Cursor;->getInt(I)I

    .line 98
    .line 99
    .line 100
    move-result v13

    .line 101
    invoke-interface {v9, v4}, Landroid/database/Cursor;->getInt(I)I

    .line 102
    .line 103
    .line 104
    move-result v14

    .line 105
    invoke-interface {v9, v3}, Landroid/database/Cursor;->getInt(I)I

    .line 106
    .line 107
    .line 108
    move-result v15

    .line 109
    move/from16 v16, v3

    .line 110
    .line 111
    const/4 v3, 0x1

    .line 112
    if-ne v14, v3, :cond_0

    .line 113
    .line 114
    if-ne v15, v3, :cond_0

    .line 115
    .line 116
    iget v3, v0, LR1/i;->e:I

    .line 117
    .line 118
    if-ne v3, v12, :cond_1

    .line 119
    .line 120
    iget v3, v0, LR1/i;->f:I

    .line 121
    .line 122
    if-ne v3, v13, :cond_1

    .line 123
    .line 124
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    goto :goto_1

    .line 132
    :catchall_0
    move-exception v0

    .line 133
    goto/16 :goto_6

    .line 134
    .line 135
    :catch_0
    move-exception v0

    .line 136
    goto :goto_3

    .line 137
    :cond_0
    move/from16 v17, v3

    .line 138
    .line 139
    iget v3, v0, LR1/i;->e:I

    .line 140
    .line 141
    if-gt v12, v3, :cond_1

    .line 142
    .line 143
    add-int/2addr v12, v14

    .line 144
    add-int/lit8 v12, v12, -0x1

    .line 145
    .line 146
    if-gt v3, v12, :cond_1

    .line 147
    .line 148
    iget v3, v0, LR1/i;->f:I

    .line 149
    .line 150
    if-gt v13, v3, :cond_1

    .line 151
    .line 152
    add-int/2addr v13, v15

    .line 153
    add-int/lit8 v13, v13, -0x1

    .line 154
    .line 155
    if-gt v3, v13, :cond_1

    .line 156
    .line 157
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 158
    .line 159
    .line 160
    move-result-object v3

    .line 161
    invoke-virtual {v8, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 162
    .line 163
    .line 164
    :cond_1
    :goto_1
    move/from16 v3, v16

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_2
    :goto_2
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 168
    .line 169
    .line 170
    goto :goto_4

    .line 171
    :goto_3
    :try_start_1
    new-instance v3, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v4, "removeItemsInArea Exception!! "

    .line 177
    .line 178
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 189
    .line 190
    .line 191
    if-eqz v9, :cond_3

    .line 192
    .line 193
    goto :goto_2

    .line 194
    :cond_3
    :goto_4
    :try_start_2
    invoke-virtual {v8}, Ljava/util/ArrayList;->isEmpty()Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_4

    .line 199
    .line 200
    invoke-virtual {v8}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 205
    .line 206
    .line 207
    move-result v3

    .line 208
    if-eqz v3, :cond_4

    .line 209
    .line 210
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v3

    .line 214
    check-cast v3, Ljava/lang/Long;

    .line 215
    .line 216
    iget-object v4, v1, LR1/h;->a:Landroid/content/Context;

    .line 217
    .line 218
    invoke-static {v4}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 219
    .line 220
    .line 221
    move-result-object v4

    .line 222
    invoke-virtual {v4}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 223
    .line 224
    .line 225
    move-result-object v4

    .line 226
    invoke-virtual {v4}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 227
    .line 228
    .line 229
    move-result-object v4

    .line 230
    const-string v5, "_id=?"

    .line 231
    .line 232
    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v3

    .line 236
    filled-new-array {v3}, [Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-virtual {v4, v5, v3}, Lz1/k2;->m(Ljava/lang/String;[Ljava/lang/String;)I
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 241
    .line 242
    .line 243
    goto :goto_5

    .line 244
    :catch_1
    move-exception v0

    .line 245
    new-instance v1, Ljava/lang/StringBuilder;

    .line 246
    .line 247
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 248
    .line 249
    .line 250
    const-string v3, "removeItemsInArea delete Exception!! "

    .line 251
    .line 252
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 263
    .line 264
    .line 265
    :cond_4
    return-void

    .line 266
    :goto_6
    if-eqz v9, :cond_5

    .line 267
    .line 268
    invoke-interface {v9}, Landroid/database/Cursor;->close()V

    .line 269
    .line 270
    .line 271
    :cond_5
    throw v0
.end method

.method private z(Lz1/o3;Lcom/android/launcher3/model/data/y;)V
    .locals 8

    .line 1
    const-string p0, "AddIconAfterInsertingSimCard"

    .line 2
    .line 3
    if-eqz p2, :cond_5

    .line 4
    .line 5
    iget v0, p2, Lcom/android/launcher3/model/data/y;->container:I

    .line 6
    .line 7
    const/16 v1, -0x64

    .line 8
    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_0

    .line 12
    .line 13
    :cond_0
    invoke-static {}, Lcom/android/launcher3/q4;->U()Lz1/y0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    const-string p1, "removeOccupiedIconInWorkspace--bgDataModel is null"

    .line 20
    .line 21
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object v0, v0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 26
    .line 27
    invoke-virtual {v0}, Lcom/android/launcher3/util/A0;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-eqz v2, :cond_4

    .line 36
    .line 37
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 42
    .line 43
    iget v3, v2, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 44
    .line 45
    const-string v4, "remove occcupied icon in workspace"

    .line 46
    .line 47
    const/4 v5, 0x1

    .line 48
    if-ne v3, v5, :cond_3

    .line 49
    .line 50
    iget v6, v2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 51
    .line 52
    if-ne v6, v5, :cond_3

    .line 53
    .line 54
    iget v3, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 55
    .line 56
    if-ne v3, v1, :cond_2

    .line 57
    .line 58
    iget v3, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 59
    .line 60
    iget v5, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 61
    .line 62
    if-ne v3, v5, :cond_2

    .line 63
    .line 64
    iget v3, v2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 65
    .line 66
    iget v5, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 67
    .line 68
    if-ne v3, v5, :cond_2

    .line 69
    .line 70
    iget v3, v2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 71
    .line 72
    iget v5, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 73
    .line 74
    if-ne v3, v5, :cond_2

    .line 75
    .line 76
    new-instance p2, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 79
    .line 80
    .line 81
    const-string v0, "removeOccupiedIconInWorkspace find occupied app "

    .line 82
    .line 83
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    iget-object v0, v2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    invoke-static {p0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    .line 97
    .line 98
    new-instance p0, Lcom/android/launcher3/util/z0;

    .line 99
    .line 100
    invoke-direct {p0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 101
    .line 102
    .line 103
    iget p2, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 104
    .line 105
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 106
    .line 107
    .line 108
    invoke-static {p0}, Lcom/android/launcher3/util/P0;->q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    invoke-virtual {p1, p0, v4}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :cond_3
    iget v6, v2, Lcom/android/launcher3/model/data/y;->container:I

    .line 117
    .line 118
    if-ne v6, v1, :cond_2

    .line 119
    .line 120
    iget v6, v2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 121
    .line 122
    iget v7, p2, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 123
    .line 124
    if-ne v6, v7, :cond_2

    .line 125
    .line 126
    iget v6, v2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 127
    .line 128
    iget v7, p2, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 129
    .line 130
    if-gt v6, v7, :cond_2

    .line 131
    .line 132
    add-int/2addr v6, v3

    .line 133
    sub-int/2addr v6, v5

    .line 134
    if-gt v7, v6, :cond_2

    .line 135
    .line 136
    iget v3, v2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 137
    .line 138
    iget v6, p2, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 139
    .line 140
    if-gt v3, v6, :cond_2

    .line 141
    .line 142
    iget v7, v2, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 143
    .line 144
    add-int/2addr v3, v7

    .line 145
    sub-int/2addr v3, v5

    .line 146
    if-gt v6, v3, :cond_2

    .line 147
    .line 148
    new-instance p2, Ljava/lang/StringBuilder;

    .line 149
    .line 150
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 151
    .line 152
    .line 153
    const-string v0, "removeOccupiedIconInWorkspace find occupied item, item info: "

    .line 154
    .line 155
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p2

    .line 165
    invoke-static {p0, p2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 166
    .line 167
    .line 168
    new-instance p0, Lcom/android/launcher3/util/z0;

    .line 169
    .line 170
    invoke-direct {p0}, Lcom/android/launcher3/util/z0;-><init>()V

    .line 171
    .line 172
    .line 173
    iget p2, v2, Lcom/android/launcher3/model/data/y;->id:I

    .line 174
    .line 175
    invoke-virtual {p0, p2}, Lcom/android/launcher3/util/z0;->add(I)V

    .line 176
    .line 177
    .line 178
    invoke-static {p0}, Lcom/android/launcher3/util/P0;->q(Lcom/android/launcher3/util/z0;)Ljava/util/function/Predicate;

    .line 179
    .line 180
    .line 181
    move-result-object p0

    .line 182
    invoke-virtual {p1, p0, v4}, Lz1/o3;->P(Ljava/util/function/Predicate;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_4
    return-void

    .line 186
    :cond_5
    :goto_0
    const-string p1, "removeOccupiedIconInWorkspace--appToAdd is null"

    .line 187
    .line 188
    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    .line 190
    .line 191
    return-void
.end method


# virtual methods
.method public D(Lz1/o3;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v6, p2

    .line 4
    .line 5
    iget-object v0, v1, LR1/h;->b:Ljava/util/ArrayList;

    .line 6
    .line 7
    const-string v7, "AddIconAfterInsertingSimCard"

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v1, LR1/h;->a:Landroid/content/Context;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->l0()Ljava/util/ArrayList;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, v1, LR1/h;->b:Ljava/util/ArrayList;

    .line 26
    .line 27
    if-nez v0, :cond_0

    .line 28
    .line 29
    const-string v0, "sendSimCardToDesktopIfNeed: mIcons is null!"

    .line 30
    .line 31
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_0
    if-eqz p1, :cond_1

    .line 36
    .line 37
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    if-nez v0, :cond_1

    .line 42
    .line 43
    iget-object v0, v1, LR1/h;->b:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/ArrayList;->stream()Ljava/util/stream/Stream;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    new-instance v2, LR1/a;

    .line 50
    .line 51
    invoke-direct {v2, v6}, LR1/a;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-interface {v0, v2}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    new-instance v0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    const-string v1, "sendSimCardToDesktopIfNeed: mIcons not contains packageName: "

    .line 66
    .line 67
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_1
    const-string v0, "ril.radio.sim.operator"

    .line 82
    .line 83
    const-string v2, ""

    .line 84
    .line 85
    invoke-static {v0, v2}, Lcom/android/launcher3/N5;->t(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    iget-object v0, v1, LR1/h;->a:Landroid/content/Context;

    .line 90
    .line 91
    invoke-static {v0}, LR1/n;->a(Landroid/content/Context;)[Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    new-instance v0, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 98
    .line 99
    .line 100
    const-string v2, "sendSimCardToDesktopIfNeed packageName= "

    .line 101
    .line 102
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 106
    .line 107
    .line 108
    const-string v2, " className= "

    .line 109
    .line 110
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    move-object/from16 v2, p3

    .line 114
    .line 115
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    const-string v2, " currentSimCardName= "

    .line 119
    .line 120
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    const-string v2, " networkOperator= "

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const/4 v10, 0x0

    .line 132
    aget-object v2, v9, v10

    .line 133
    .line 134
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v2, ", "

    .line 138
    .line 139
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const/4 v11, 0x1

    .line 143
    aget-object v2, v9, v11

    .line 144
    .line 145
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 146
    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 153
    .line 154
    .line 155
    if-eqz v8, :cond_2

    .line 156
    .line 157
    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-eqz v0, :cond_3

    .line 162
    .line 163
    :cond_2
    aget-object v0, v9, v10

    .line 164
    .line 165
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-eqz v0, :cond_3

    .line 170
    .line 171
    aget-object v0, v9, v11

    .line 172
    .line 173
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 174
    .line 175
    .line 176
    move-result v0

    .line 177
    if-eqz v0, :cond_3

    .line 178
    .line 179
    invoke-direct {v1}, LR1/h;->A()V

    .line 180
    .line 181
    .line 182
    return-void

    .line 183
    :cond_3
    iget-object v0, v1, LR1/h;->a:Landroid/content/Context;

    .line 184
    .line 185
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 186
    .line 187
    .line 188
    move-result-object v0

    .line 189
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 190
    .line 191
    .line 192
    move-result-object v0

    .line 193
    invoke-virtual {v0}, Lcom/android/launcher3/H5;->O()Ljava/util/HashMap;

    .line 194
    .line 195
    .line 196
    move-result-object v12

    .line 197
    iget-object v0, v1, LR1/h;->a:Landroid/content/Context;

    .line 198
    .line 199
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    .line 200
    .line 201
    .line 202
    move-result-object v4

    .line 203
    iget-object v0, v1, LR1/h;->a:Landroid/content/Context;

    .line 204
    .line 205
    invoke-static {v0}, Lcom/android/launcher3/widget/l0;->L(Landroid/content/Context;)Lcom/android/launcher3/widget/l0;

    .line 206
    .line 207
    .line 208
    move-result-object v5

    .line 209
    iget-object v0, v1, LR1/h;->b:Ljava/util/ArrayList;

    .line 210
    .line 211
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 212
    .line 213
    .line 214
    move-result-object v13

    .line 215
    :goto_0
    invoke-interface {v13}, Ljava/util/Iterator;->hasNext()Z

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    if-eqz v0, :cond_14

    .line 220
    .line 221
    invoke-interface {v13}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    move-object v3, v0

    .line 226
    check-cast v3, LR1/i;

    .line 227
    .line 228
    iget-object v0, v3, LR1/i;->h:[Ljava/lang/String;

    .line 229
    .line 230
    if-eqz v0, :cond_6

    .line 231
    .line 232
    array-length v0, v0

    .line 233
    if-lez v0, :cond_6

    .line 234
    .line 235
    array-length v0, v9

    .line 236
    move v2, v10

    .line 237
    move v14, v2

    .line 238
    :goto_1
    if-ge v2, v0, :cond_7

    .line 239
    .line 240
    aget-object v15, v9, v2

    .line 241
    .line 242
    invoke-static {v15}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 243
    .line 244
    .line 245
    move-result v16

    .line 246
    if-eqz v16, :cond_4

    .line 247
    .line 248
    goto :goto_2

    .line 249
    :cond_4
    iget-object v14, v3, LR1/i;->h:[Ljava/lang/String;

    .line 250
    .line 251
    invoke-static {v14}, Ljava/util/Arrays;->stream([Ljava/lang/Object;)Ljava/util/stream/Stream;

    .line 252
    .line 253
    .line 254
    move-result-object v14

    .line 255
    invoke-static {v15}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    new-instance v10, LR1/b;

    .line 259
    .line 260
    invoke-direct {v10, v15}, LR1/b;-><init>(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    invoke-interface {v14, v10}, Ljava/util/stream/Stream;->anyMatch(Ljava/util/function/Predicate;)Z

    .line 264
    .line 265
    .line 266
    move-result v14

    .line 267
    if-eqz v14, :cond_5

    .line 268
    .line 269
    goto :goto_3

    .line 270
    :cond_5
    :goto_2
    add-int/lit8 v2, v2, 0x1

    .line 271
    .line 272
    const/4 v10, 0x0

    .line 273
    goto :goto_1

    .line 274
    :cond_6
    const/4 v14, 0x0

    .line 275
    :cond_7
    :goto_3
    if-eqz v8, :cond_8

    .line 276
    .line 277
    iget-object v0, v3, LR1/i;->c:Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    if-nez v0, :cond_b

    .line 284
    .line 285
    :cond_8
    if-eqz v14, :cond_9

    .line 286
    .line 287
    iget-object v0, v3, LR1/i;->m:[Ljava/lang/String;

    .line 288
    .line 289
    if-eqz v0, :cond_b

    .line 290
    .line 291
    if-eqz v8, :cond_b

    .line 292
    .line 293
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    invoke-interface {v0, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-nez v0, :cond_9

    .line 302
    .line 303
    goto :goto_6

    .line 304
    :cond_9
    :goto_4
    move-object/from16 v2, p1

    .line 305
    .line 306
    :cond_a
    :goto_5
    const/4 v0, 0x0

    .line 307
    goto/16 :goto_7

    .line 308
    .line 309
    :cond_b
    :goto_6
    iget-object v0, v1, LR1/h;->a:Landroid/content/Context;

    .line 310
    .line 311
    invoke-static {v0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    invoke-virtual {v0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 316
    .line 317
    .line 318
    move-result-object v10

    .line 319
    const/4 v0, 0x4

    .line 320
    if-nez p1, :cond_e

    .line 321
    .line 322
    const-string v2, "sendSimCardToDesktopIfNeed: task == null"

    .line 323
    .line 324
    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 325
    .line 326
    .line 327
    iget v2, v3, LR1/i;->i:I

    .line 328
    .line 329
    if-ne v2, v0, :cond_c

    .line 330
    .line 331
    invoke-direct {v1, v3}, LR1/h;->y(LR1/i;)V

    .line 332
    .line 333
    .line 334
    new-instance v0, Lx1/x;

    .line 335
    .line 336
    new-instance v2, LR1/c;

    .line 337
    .line 338
    invoke-direct {v2, v1, v3, v4, v5}, LR1/c;-><init>(LR1/h;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V

    .line 339
    .line 340
    .line 341
    invoke-direct {v0, v2, v11}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v10, v0}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 345
    .line 346
    .line 347
    goto :goto_4

    .line 348
    :cond_c
    invoke-virtual {v12}, Ljava/util/HashMap;->isEmpty()Z

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    if-nez v0, :cond_d

    .line 353
    .line 354
    iget-boolean v0, v3, LR1/i;->n:Z

    .line 355
    .line 356
    if-eqz v0, :cond_d

    .line 357
    .line 358
    invoke-direct {v1, v3}, LR1/h;->j(LR1/i;)V

    .line 359
    .line 360
    .line 361
    goto :goto_4

    .line 362
    :cond_d
    invoke-direct {v1, v3}, LR1/h;->y(LR1/i;)V

    .line 363
    .line 364
    .line 365
    invoke-direct {v1, v3}, LR1/h;->s(LR1/i;)Lcom/android/launcher3/model/data/I;

    .line 366
    .line 367
    .line 368
    move-result-object v0

    .line 369
    if-eqz v0, :cond_9

    .line 370
    .line 371
    new-instance v2, Ljava/lang/StringBuilder;

    .line 372
    .line 373
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 374
    .line 375
    .line 376
    const-string v10, "add App To Layout "

    .line 377
    .line 378
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 379
    .line 380
    .line 381
    iget-object v10, v3, LR1/i;->a:Ljava/lang/String;

    .line 382
    .line 383
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v2

    .line 390
    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 391
    .line 392
    .line 393
    invoke-virtual {v1, v3, v0}, LR1/h;->h(LR1/i;Lcom/android/launcher3/model/data/I;)V

    .line 394
    .line 395
    .line 396
    goto :goto_4

    .line 397
    :cond_e
    iget-object v2, v3, LR1/i;->a:Ljava/lang/String;

    .line 398
    .line 399
    invoke-virtual {v2, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 400
    .line 401
    .line 402
    move-result v2

    .line 403
    if-eqz v2, :cond_9

    .line 404
    .line 405
    iget v2, v3, LR1/i;->i:I

    .line 406
    .line 407
    if-ne v2, v0, :cond_10

    .line 408
    .line 409
    iget-boolean v0, v3, LR1/i;->l:Z

    .line 410
    .line 411
    if-eqz v0, :cond_f

    .line 412
    .line 413
    invoke-virtual {v1, v3}, LR1/h;->q(LR1/i;)Z

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-eqz v0, :cond_9

    .line 418
    .line 419
    :cond_f
    new-instance v0, Ljava/lang/StringBuilder;

    .line 420
    .line 421
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 422
    .line 423
    .line 424
    const-string v2, "send widget To Desktop "

    .line 425
    .line 426
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 427
    .line 428
    .line 429
    iget-object v2, v3, LR1/i;->a:Ljava/lang/String;

    .line 430
    .line 431
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 432
    .line 433
    .line 434
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 439
    .line 440
    .line 441
    new-instance v14, Lx1/x;

    .line 442
    .line 443
    new-instance v0, LR1/d;

    .line 444
    .line 445
    move-object/from16 v2, p1

    .line 446
    .line 447
    invoke-direct/range {v0 .. v5}, LR1/d;-><init>(LR1/h;Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V

    .line 448
    .line 449
    .line 450
    invoke-direct {v14, v0, v11}, Lx1/x;-><init>(Ljava/lang/Runnable;Z)V

    .line 451
    .line 452
    .line 453
    invoke-virtual {v10, v14}, Lcom/android/launcher3/D3;->U0(Lx1/x;)V

    .line 454
    .line 455
    .line 456
    goto/16 :goto_5

    .line 457
    .line 458
    :cond_10
    move-object/from16 v2, p1

    .line 459
    .line 460
    invoke-virtual {v12}, Ljava/util/HashMap;->isEmpty()Z

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    if-nez v0, :cond_12

    .line 465
    .line 466
    iget-boolean v0, v3, LR1/i;->n:Z

    .line 467
    .line 468
    if-eqz v0, :cond_12

    .line 469
    .line 470
    new-instance v0, Ljava/lang/StringBuilder;

    .line 471
    .line 472
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 473
    .line 474
    .line 475
    const-string v10, "send folder To Desktop "

    .line 476
    .line 477
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 478
    .line 479
    .line 480
    iget-object v10, v3, LR1/i;->a:Ljava/lang/String;

    .line 481
    .line 482
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 483
    .line 484
    .line 485
    const-string v10, ","

    .line 486
    .line 487
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 488
    .line 489
    .line 490
    invoke-virtual {v1, v3}, LR1/h;->q(LR1/i;)Z

    .line 491
    .line 492
    .line 493
    move-result v10

    .line 494
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 495
    .line 496
    .line 497
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 498
    .line 499
    .line 500
    move-result-object v0

    .line 501
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 502
    .line 503
    .line 504
    iget-boolean v0, v3, LR1/i;->l:Z

    .line 505
    .line 506
    if-eqz v0, :cond_11

    .line 507
    .line 508
    invoke-virtual {v1, v3}, LR1/h;->q(LR1/i;)Z

    .line 509
    .line 510
    .line 511
    move-result v0

    .line 512
    if-eqz v0, :cond_a

    .line 513
    .line 514
    :cond_11
    invoke-direct {v1, v2, v3}, LR1/h;->C(Lz1/o3;LR1/i;)V

    .line 515
    .line 516
    .line 517
    const/4 v0, 0x0

    .line 518
    invoke-virtual {v1, v3, v0}, LR1/h;->G(LR1/i;Z)V

    .line 519
    .line 520
    .line 521
    goto :goto_7

    .line 522
    :cond_12
    iget-boolean v0, v3, LR1/i;->l:Z

    .line 523
    .line 524
    if-eqz v0, :cond_13

    .line 525
    .line 526
    invoke-virtual {v1, v3}, LR1/h;->q(LR1/i;)Z

    .line 527
    .line 528
    .line 529
    move-result v0

    .line 530
    if-eqz v0, :cond_a

    .line 531
    .line 532
    :cond_13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 533
    .line 534
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 535
    .line 536
    .line 537
    const-string v10, "send icon To Desktop "

    .line 538
    .line 539
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 540
    .line 541
    .line 542
    iget-object v10, v3, LR1/i;->a:Ljava/lang/String;

    .line 543
    .line 544
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 548
    .line 549
    .line 550
    move-result-object v0

    .line 551
    invoke-static {v7, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 552
    .line 553
    .line 554
    invoke-virtual {v1, v2, v3}, LR1/h;->E(Lz1/o3;LR1/i;)V

    .line 555
    .line 556
    .line 557
    const/4 v0, 0x0

    .line 558
    invoke-virtual {v1, v3, v0}, LR1/h;->G(LR1/i;Z)V

    .line 559
    .line 560
    .line 561
    :goto_7
    move v10, v0

    .line 562
    goto/16 :goto_0

    .line 563
    .line 564
    :cond_14
    move-object/from16 v2, p1

    .line 565
    .line 566
    move v0, v10

    .line 567
    if-nez v2, :cond_15

    .line 568
    .line 569
    const-string v2, "set AddIconAfterInsertingSimCardFlag false"

    .line 570
    .line 571
    invoke-static {v7, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 572
    .line 573
    .line 574
    invoke-virtual {v1, v0}, LR1/h;->H(Z)V

    .line 575
    .line 576
    .line 577
    :cond_15
    return-void
.end method

.method public E(Lz1/o3;LR1/i;)V
    .locals 1

    .line 1
    invoke-direct {p0, p2}, LR1/h;->s(LR1/i;)Lcom/android/launcher3/model/data/I;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-direct {p0, p1, v0}, LR1/h;->z(Lz1/o3;Lcom/android/launcher3/model/data/y;)V

    .line 8
    .line 9
    .line 10
    invoke-direct {p0, p1, v0}, LR1/h;->l(Lz1/o3;Lcom/android/launcher3/model/data/y;)V

    .line 11
    .line 12
    .line 13
    invoke-direct {p0, p2, v0}, LR1/h;->m(LR1/i;Lcom/android/launcher3/model/data/I;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public F(Lz1/o3;LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p2}, LR1/h;->r(LR1/i;)Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AddIconAfterInsertingSimCard"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "sendWidgetToDesktop cn == null "

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const/4 v2, 0x0

    .line 16
    :try_start_0
    invoke-virtual {p3, v0, v2}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catch_0
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    filled-new-array {v3}, [Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    invoke-virtual {p3, v3}, Landroid/content/pm/PackageManager;->currentToCanonicalPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    new-instance v4, Landroid/content/ComponentName;

    .line 33
    .line 34
    aget-object v3, v3, v2

    .line 35
    .line 36
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-direct {v4, v3, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :try_start_1
    invoke-virtual {p3, v4, v2}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 44
    .line 45
    .line 46
    move-object v0, v4

    .line 47
    :goto_0
    iget-object p3, p0, LR1/h;->a:Landroid/content/Context;

    .line 48
    .line 49
    invoke-static {p3}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-virtual {p4}, Lcom/android/launcher3/widget/l0;->r()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {p3, v2, v0}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    if-nez p3, :cond_1

    .line 62
    .line 63
    new-instance p0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string p1, "Unable to bind app widget id "

    .line 69
    .line 70
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 81
    .line 82
    .line 83
    invoke-virtual {p4, v2}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    new-instance p3, Lcom/android/launcher3/model/data/A;

    .line 88
    .line 89
    invoke-direct {p3, v2, v0}, Lcom/android/launcher3/model/data/A;-><init>(ILandroid/content/ComponentName;)V

    .line 90
    .line 91
    .line 92
    iget p4, p2, LR1/i;->e:I

    .line 93
    .line 94
    iput p4, p3, Lcom/android/launcher3/model/data/y;->cellX:I

    .line 95
    .line 96
    iget p4, p2, LR1/i;->f:I

    .line 97
    .line 98
    iput p4, p3, Lcom/android/launcher3/model/data/y;->cellY:I

    .line 99
    .line 100
    iget p4, p2, LR1/i;->j:I

    .line 101
    .line 102
    iput p4, p3, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 103
    .line 104
    iget p4, p2, LR1/i;->k:I

    .line 105
    .line 106
    iput p4, p3, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 107
    .line 108
    iget p4, p2, LR1/i;->g:I

    .line 109
    .line 110
    iput p4, p3, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 111
    .line 112
    iget-object p2, p2, LR1/i;->d:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz p2, :cond_3

    .line 115
    .line 116
    const-string p4, "desktop"

    .line 117
    .line 118
    invoke-virtual {p4, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result p2

    .line 122
    if-eqz p2, :cond_2

    .line 123
    .line 124
    const/16 p2, -0x64

    .line 125
    .line 126
    iput p2, p3, Lcom/android/launcher3/model/data/y;->container:I

    .line 127
    .line 128
    goto :goto_1

    .line 129
    :cond_2
    const/4 p2, -0x1

    .line 130
    iput p2, p3, Lcom/android/launcher3/model/data/y;->container:I

    .line 131
    .line 132
    :cond_3
    :goto_1
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 133
    .line 134
    .line 135
    move-result-object p2

    .line 136
    iput-object p2, p3, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    .line 137
    .line 138
    invoke-direct {p0, p1, p3}, LR1/h;->z(Lz1/o3;Lcom/android/launcher3/model/data/y;)V

    .line 139
    .line 140
    .line 141
    invoke-direct {p0, p1, p3}, LR1/h;->l(Lz1/o3;Lcom/android/launcher3/model/data/y;)V

    .line 142
    .line 143
    .line 144
    return-void

    .line 145
    :catch_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 146
    .line 147
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 148
    .line 149
    .line 150
    const-string p1, "Can\'t find widget provider: "

    .line 151
    .line 152
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 167
    .line 168
    .line 169
    return-void
.end method

.method public G(LR1/i;Z)V
    .locals 3

    .line 1
    iget-object v0, p0, LR1/h;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    new-instance v1, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v2, "ENABLE_ADD_ICON_TO_DESKTOP_"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, p1}, LR1/h;->r(LR1/i;)Landroid/content/ComponentName;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Landroid/content/ComponentName;->getShortClassName()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-interface {v0, p0, p2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public H(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "ENABLE_ADD_ICON_TO_DESKTOP"

    .line 12
    .line 13
    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public h(LR1/i;Lcom/android/launcher3/model/data/I;)V
    .locals 5

    .line 1
    :try_start_0
    new-instance v0, Landroid/content/ContentValues;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/content/ContentValues;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "itemType"

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 14
    .line 15
    .line 16
    const-string v1, "container"

    .line 17
    .line 18
    const/16 v3, -0x64

    .line 19
    .line 20
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 25
    .line 26
    .line 27
    const-string v1, "screen"

    .line 28
    .line 29
    iget v3, p1, LR1/i;->g:I

    .line 30
    .line 31
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 36
    .line 37
    .line 38
    const-string v1, "cellX"

    .line 39
    .line 40
    iget v3, p1, LR1/i;->e:I

    .line 41
    .line 42
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 47
    .line 48
    .line 49
    const-string v1, "cellY"

    .line 50
    .line 51
    iget v3, p1, LR1/i;->f:I

    .line 52
    .line 53
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v3

    .line 57
    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 58
    .line 59
    .line 60
    const-string v1, "spanX"

    .line 61
    .line 62
    const/4 v3, 0x1

    .line 63
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-virtual {v0, v1, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 68
    .line 69
    .line 70
    const-string v1, "spanY"

    .line 71
    .line 72
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v0, v1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 77
    .line 78
    .line 79
    new-instance v1, Landroid/content/Intent;

    .line 80
    .line 81
    const-string v3, "android.intent.action.MAIN"

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 85
    .line 86
    .line 87
    const-string v3, "android.intent.category.LAUNCHER"

    .line 88
    .line 89
    invoke-virtual {v1, v3}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    .line 91
    .line 92
    move-result-object v1

    .line 93
    const/high16 v3, 0x10200000

    .line 94
    .line 95
    invoke-virtual {v1, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 96
    .line 97
    .line 98
    move-result-object v1

    .line 99
    new-instance v3, Landroid/content/ComponentName;

    .line 100
    .line 101
    iget-object v4, p1, LR1/i;->a:Ljava/lang/String;

    .line 102
    .line 103
    iget-object p1, p1, LR1/i;->b:Ljava/lang/String;

    .line 104
    .line 105
    invoke-direct {v3, v4, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    const-string v1, "intent"

    .line 113
    .line 114
    invoke-virtual {p1, v2}, Landroid/content/Intent;->toUri(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object p1, p0, LR1/h;->a:Landroid/content/Context;

    .line 122
    .line 123
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    invoke-virtual {p1}, Lz1/k2;->y()I

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    const-string v1, "_id"

    .line 140
    .line 141
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object p1

    .line 145
    invoke-virtual {v0, v1, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 146
    .line 147
    .line 148
    const-string p1, "title"

    .line 149
    .line 150
    iget-object p2, p2, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 151
    .line 152
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object p2

    .line 156
    invoke-virtual {v0, p1, p2}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 160
    .line 161
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    invoke-virtual {p0, v0}, Lz1/k2;->J(Landroid/content/ContentValues;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 174
    .line 175
    .line 176
    return-void

    .line 177
    :catch_0
    move-exception p0

    .line 178
    new-instance p1, Ljava/lang/StringBuilder;

    .line 179
    .line 180
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 181
    .line 182
    .line 183
    const-string p2, "addAppToLayout got Exception!! "

    .line 184
    .line 185
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 189
    .line 190
    .line 191
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    const-string p1, "AddIconAfterInsertingSimCard"

    .line 196
    .line 197
    invoke-static {p1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    return-void
.end method

.method public i(LR1/i;Landroid/content/pm/PackageManager;Lcom/android/launcher3/widget/l0;)V
    .locals 5

    .line 1
    invoke-virtual {p0, p1}, LR1/h;->r(LR1/i;)Landroid/content/ComponentName;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "AddIconAfterInsertingSimCard"

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string p0, "addAppWidgetToLayout cn == null "

    .line 10
    .line 11
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_0
    iget-object v2, p0, LR1/h;->a:Landroid/content/Context;

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 18
    .line 19
    .line 20
    new-instance v2, Landroid/content/ContentValues;

    .line 21
    .line 22
    invoke-direct {v2}, Landroid/content/ContentValues;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v3, "itemType"

    .line 26
    .line 27
    const/4 v4, 0x4

    .line 28
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 33
    .line 34
    .line 35
    const-string v3, "container"

    .line 36
    .line 37
    const/16 v4, -0x64

    .line 38
    .line 39
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 44
    .line 45
    .line 46
    const-string v3, "screen"

    .line 47
    .line 48
    iget v4, p1, LR1/i;->g:I

    .line 49
    .line 50
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 55
    .line 56
    .line 57
    const-string v3, "cellX"

    .line 58
    .line 59
    iget v4, p1, LR1/i;->e:I

    .line 60
    .line 61
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v4

    .line 65
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 66
    .line 67
    .line 68
    const-string v3, "cellY"

    .line 69
    .line 70
    iget v4, p1, LR1/i;->f:I

    .line 71
    .line 72
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 77
    .line 78
    .line 79
    const-string v3, "spanX"

    .line 80
    .line 81
    iget v4, p1, LR1/i;->j:I

    .line 82
    .line 83
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 84
    .line 85
    .line 86
    move-result-object v4

    .line 87
    invoke-virtual {v2, v3, v4}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 88
    .line 89
    .line 90
    const-string v3, "spanY"

    .line 91
    .line 92
    iget p1, p1, LR1/i;->k:I

    .line 93
    .line 94
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 99
    .line 100
    .line 101
    iget-object p1, p0, LR1/h;->a:Landroid/content/Context;

    .line 102
    .line 103
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Lz1/k2;->y()I

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    const-string v3, "_id"

    .line 120
    .line 121
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-virtual {v2, v3, p1}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 126
    .line 127
    .line 128
    const/4 p1, 0x0

    .line 129
    :try_start_1
    invoke-virtual {p2, v0, p1}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 130
    .line 131
    .line 132
    goto :goto_0

    .line 133
    :catch_0
    :try_start_2
    invoke-virtual {v0}, Landroid/content/ComponentName;->getPackageName()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    filled-new-array {v3}, [Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    invoke-virtual {p2, v3}, Landroid/content/pm/PackageManager;->currentToCanonicalPackageNames([Ljava/lang/String;)[Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v3

    .line 145
    new-instance v4, Landroid/content/ComponentName;

    .line 146
    .line 147
    aget-object v3, v3, p1

    .line 148
    .line 149
    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    invoke-direct {v4, v3, v0}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 154
    .line 155
    .line 156
    :try_start_3
    invoke-virtual {p2, v4, p1}, Landroid/content/pm/PackageManager;->getReceiverInfo(Landroid/content/ComponentName;I)Landroid/content/pm/ActivityInfo;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 157
    .line 158
    .line 159
    move-object v0, v4

    .line 160
    :goto_0
    :try_start_4
    iget-object p1, p0, LR1/h;->a:Landroid/content/Context;

    .line 161
    .line 162
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p3}, Lcom/android/launcher3/widget/l0;->r()I

    .line 167
    .line 168
    .line 169
    move-result p2

    .line 170
    invoke-virtual {p1, p2, v0}, Landroid/appwidget/AppWidgetManager;->bindAppWidgetIdIfAllowed(ILandroid/content/ComponentName;)Z

    .line 171
    .line 172
    .line 173
    move-result p1

    .line 174
    if-nez p1, :cond_1

    .line 175
    .line 176
    new-instance p0, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 179
    .line 180
    .line 181
    const-string p1, "Unable to bind app widget id "

    .line 182
    .line 183
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 194
    .line 195
    .line 196
    invoke-virtual {p3, p2}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 197
    .line 198
    .line 199
    goto :goto_2

    .line 200
    :catch_1
    move-exception p0

    .line 201
    goto :goto_1

    .line 202
    :cond_1
    const-string p1, "appWidgetId"

    .line 203
    .line 204
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 205
    .line 206
    .line 207
    move-result-object v3

    .line 208
    invoke-virtual {v2, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/Integer;)V

    .line 209
    .line 210
    .line 211
    const-string p1, "appWidgetProvider"

    .line 212
    .line 213
    invoke-virtual {v0}, Landroid/content/ComponentName;->flattenToString()Ljava/lang/String;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    invoke-virtual {v2, p1, v3}, Landroid/content/ContentValues;->put(Ljava/lang/String;Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 221
    .line 222
    invoke-static {p0}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 223
    .line 224
    .line 225
    move-result-object p0

    .line 226
    invoke-virtual {p0}, Lcom/android/launcher3/P2;->j()Lcom/android/launcher3/D3;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    invoke-virtual {p0}, Lcom/android/launcher3/D3;->m0()Lz1/k2;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {p0, v2}, Lz1/k2;->J(Landroid/content/ContentValues;)I

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    if-gez p0, :cond_2

    .line 239
    .line 240
    new-instance p0, Ljava/lang/StringBuilder;

    .line 241
    .line 242
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 243
    .line 244
    .line 245
    const-string p1, "Insert error "

    .line 246
    .line 247
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 248
    .line 249
    .line 250
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 258
    .line 259
    .line 260
    invoke-virtual {p3, p2}, Lcom/android/launcher3/widget/l0;->x(I)V

    .line 261
    .line 262
    .line 263
    goto :goto_2

    .line 264
    :catch_2
    new-instance p0, Ljava/lang/StringBuilder;

    .line 265
    .line 266
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 267
    .line 268
    .line 269
    const-string p1, "Can\'t find widget provider: "

    .line 270
    .line 271
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 272
    .line 273
    .line 274
    invoke-virtual {v4}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 279
    .line 280
    .line 281
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-static {v1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 286
    .line 287
    .line 288
    goto :goto_2

    .line 289
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 292
    .line 293
    .line 294
    const-string p2, "addAppToLayout got Exception!! "

    .line 295
    .line 296
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 297
    .line 298
    .line 299
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 307
    .line 308
    .line 309
    :cond_2
    :goto_2
    return-void
.end method

.method public p()Z
    .locals 2

    .line 1
    iget-object p0, p0, LR1/h;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "ENABLE_ADD_ICON_TO_DESKTOP"

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-interface {p0, v0, v1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    return p0
.end method

.method public q(LR1/i;)Z
    .locals 3

    .line 1
    iget-object v0, p0, LR1/h;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/J3;->m(Landroid/content/Context;)Landroid/content/SharedPreferences;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v2, "ENABLE_ADD_ICON_TO_DESKTOP_"

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0, p1}, LR1/h;->r(LR1/i;)Landroid/content/ComponentName;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Landroid/content/ComponentName;->getShortClassName()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    const/4 p1, 0x1

    .line 33
    invoke-interface {v0, p0, p1}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    .line 34
    .line 35
    .line 36
    move-result p0

    .line 37
    return p0
.end method

.method public r(LR1/i;)Landroid/content/ComponentName;
    .locals 1

    .line 1
    iget-object p0, p1, LR1/i;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p1, p1, LR1/i;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    new-instance v0, Landroid/content/ComponentName;

    .line 19
    .line 20
    invoke-direct {v0, p0, p1}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-object v0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method
