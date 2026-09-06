.class public LO0/u;
.super LO0/d;
.source "WorkspaceAccessibilityHelper.java"


# direct methods
.method public constructor <init>(Lcom/android/launcher3/CellLayout;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LO0/d;-><init>(Lcom/android/launcher3/CellLayout;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c0(Landroid/view/View;Landroid/content/Context;)Ljava/lang/String;
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    instance-of v0, p0, Lcom/android/launcher3/model/data/I;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 12
    .line 13
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const v0, 0x7f140104

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0

    .line 25
    :cond_0
    instance-of v0, p0, Lcom/android/launcher3/model/data/p;

    .line 26
    .line 27
    if-eqz v0, :cond_5

    .line 28
    .line 29
    iget-object v0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 30
    .line 31
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_4

    .line 36
    .line 37
    move-object v0, p0

    .line 38
    check-cast v0, Lcom/android/launcher3/model/data/p;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/android/launcher3/model/data/p;->y()Ljava/util/ArrayList;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    const/4 v1, 0x0

    .line 49
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    if-eqz v2, :cond_3

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    check-cast v2, Lcom/android/launcher3/model/data/y;

    .line 60
    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    iget v3, v1, Lcom/android/launcher3/model/data/y;->rank:I

    .line 64
    .line 65
    iget v4, v2, Lcom/android/launcher3/model/data/y;->rank:I

    .line 66
    .line 67
    if-le v3, v4, :cond_1

    .line 68
    .line 69
    :cond_2
    move-object v1, v2

    .line 70
    goto :goto_0

    .line 71
    :cond_3
    if-eqz v1, :cond_4

    .line 72
    .line 73
    iget-object p0, v1, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 74
    .line 75
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    const v0, 0x7f14004e

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    return-object p0

    .line 87
    :cond_4
    iget-object p0, p0, Lcom/android/launcher3/model/data/y;->title:Ljava/lang/CharSequence;

    .line 88
    .line 89
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    const v0, 0x7f14004d

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v0, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    return-object p0

    .line 101
    :cond_5
    const-string p0, ""

    .line 102
    .line 103
    return-object p0
.end method


# virtual methods
.method protected X(I)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    rem-int v0, p1, v0

    .line 8
    .line 9
    iget-object v1, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    div-int/2addr p1, v1

    .line 16
    iget-object v1, p0, LO0/d;->B:LO0/r;

    .line 17
    .line 18
    invoke-virtual {v1}, LO0/c;->c()LO0/c$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 23
    .line 24
    invoke-virtual {v2, v0, p1}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object v0, v1, LO0/c$a;->c:Landroid/view/View;

    .line 31
    .line 32
    if-eq p1, v0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 39
    .line 40
    invoke-static {p1}, Lcom/android/launcher3/folder/Folder;->t2(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object p0, p0, LO0/d;->z:Landroid/content/Context;

    .line 47
    .line 48
    const p1, 0x7f1401a7

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0

    .line 56
    :cond_0
    instance-of p1, p1, Lcom/android/launcher3/model/data/p;

    .line 57
    .line 58
    if-eqz p1, :cond_1

    .line 59
    .line 60
    iget-object p0, p0, LO0/d;->z:Landroid/content/Context;

    .line 61
    .line 62
    const p1, 0x7f140050

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    return-object p0

    .line 70
    :cond_1
    const-string p0, ""

    .line 71
    .line 72
    return-object p0
.end method

.method protected a0(I)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    rem-int v0, p1, v0

    .line 8
    .line 9
    iget-object v1, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    div-int/2addr p1, v1

    .line 16
    iget-object v1, p0, LO0/d;->B:LO0/r;

    .line 17
    .line 18
    invoke-virtual {v1}, LO0/c;->c()LO0/c$a;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 23
    .line 24
    invoke-virtual {v2, v0, p1}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    iget-object v1, v1, LO0/c$a;->c:Landroid/view/View;

    .line 31
    .line 32
    if-ne v2, v1, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p0, p0, LO0/d;->z:Landroid/content/Context;

    .line 36
    .line 37
    invoke-static {v2, p0}, LO0/u;->c0(Landroid/view/View;Landroid/content/Context;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_1
    :goto_0
    iget-object p0, p0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 43
    .line 44
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/CellLayout;->N(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method protected b0(I)I
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 4
    .line 5
    invoke-virtual {v1}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iget-object v2, v0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    invoke-virtual {v2}, Lcom/android/launcher3/CellLayout;->getCountY()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    rem-int v3, p1, v1

    .line 16
    .line 17
    div-int v4, p1, v1

    .line 18
    .line 19
    iget-object v5, v0, LO0/d;->B:LO0/r;

    .line 20
    .line 21
    invoke-virtual {v5}, LO0/c;->c()LO0/c$a;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    iget-object v6, v5, LO0/c$a;->a:LO0/c$b;

    .line 26
    .line 27
    sget-object v7, LO0/c$b;->j:LO0/c$b;

    .line 28
    .line 29
    const/4 v8, -0x1

    .line 30
    if-ne v6, v7, :cond_0

    .line 31
    .line 32
    iget-object v6, v0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 33
    .line 34
    invoke-virtual {v6}, Lcom/android/launcher3/CellLayout;->a()Z

    .line 35
    .line 36
    .line 37
    move-result v6

    .line 38
    if-nez v6, :cond_0

    .line 39
    .line 40
    return v8

    .line 41
    :cond_0
    iget-object v6, v5, LO0/c$a;->a:LO0/c$b;

    .line 42
    .line 43
    if-ne v6, v7, :cond_a

    .line 44
    .line 45
    iget-object v5, v5, LO0/c$a;->b:Lcom/android/launcher3/model/data/y;

    .line 46
    .line 47
    iget v6, v5, Lcom/android/launcher3/model/data/y;->spanX:I

    .line 48
    .line 49
    iget v5, v5, Lcom/android/launcher3/model/data/y;->spanY:I

    .line 50
    .line 51
    const/4 v9, 0x0

    .line 52
    :goto_0
    if-ge v9, v6, :cond_9

    .line 53
    .line 54
    const/4 v10, 0x0

    .line 55
    :goto_1
    if-ge v10, v5, :cond_8

    .line 56
    .line 57
    sub-int v11, v3, v9

    .line 58
    .line 59
    sub-int v12, v4, v10

    .line 60
    .line 61
    if-ltz v11, :cond_7

    .line 62
    .line 63
    if-gez v12, :cond_1

    .line 64
    .line 65
    goto :goto_6

    .line 66
    :cond_1
    const/4 v13, 0x1

    .line 67
    move v14, v11

    .line 68
    :goto_2
    add-int v15, v11, v6

    .line 69
    .line 70
    if-ge v14, v15, :cond_6

    .line 71
    .line 72
    if-nez v13, :cond_2

    .line 73
    .line 74
    goto :goto_5

    .line 75
    :cond_2
    move v15, v12

    .line 76
    :goto_3
    add-int v7, v12, v5

    .line 77
    .line 78
    if-ge v15, v7, :cond_5

    .line 79
    .line 80
    if-ge v14, v1, :cond_4

    .line 81
    .line 82
    if-ge v15, v2, :cond_4

    .line 83
    .line 84
    iget-object v7, v0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 85
    .line 86
    invoke-virtual {v7, v14, v15}, Lcom/android/launcher3/CellLayout;->b0(II)Z

    .line 87
    .line 88
    .line 89
    move-result v7

    .line 90
    if-eqz v7, :cond_3

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_3
    add-int/lit8 v15, v15, 0x1

    .line 94
    .line 95
    goto :goto_3

    .line 96
    :cond_4
    :goto_4
    const/4 v13, 0x0

    .line 97
    :cond_5
    add-int/lit8 v14, v14, 0x1

    .line 98
    .line 99
    goto :goto_2

    .line 100
    :cond_6
    :goto_5
    if-eqz v13, :cond_7

    .line 101
    .line 102
    mul-int/2addr v1, v12

    .line 103
    add-int/2addr v11, v1

    .line 104
    return v11

    .line 105
    :cond_7
    :goto_6
    add-int/lit8 v10, v10, 0x1

    .line 106
    .line 107
    goto :goto_1

    .line 108
    :cond_8
    add-int/lit8 v9, v9, 0x1

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_9
    return v8

    .line 112
    :cond_a
    iget-object v0, v0, LO0/d;->y:Lcom/android/launcher3/CellLayout;

    .line 113
    .line 114
    invoke-virtual {v0, v3, v4}, Lcom/android/launcher3/CellLayout;->J(II)Landroid/view/View;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    if-eqz v0, :cond_d

    .line 119
    .line 120
    iget-object v1, v5, LO0/c$a;->c:Landroid/view/View;

    .line 121
    .line 122
    if-ne v0, v1, :cond_b

    .line 123
    .line 124
    goto :goto_7

    .line 125
    :cond_b
    iget-object v1, v5, LO0/c$a;->a:LO0/c$b;

    .line 126
    .line 127
    sget-object v2, LO0/c$b;->h:LO0/c$b;

    .line 128
    .line 129
    if-eq v1, v2, :cond_c

    .line 130
    .line 131
    invoke-virtual {v0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/android/launcher3/model/data/y;

    .line 136
    .line 137
    instance-of v1, v0, Lcom/android/launcher3/model/data/d;

    .line 138
    .line 139
    if-nez v1, :cond_d

    .line 140
    .line 141
    instance-of v1, v0, Lcom/android/launcher3/model/data/p;

    .line 142
    .line 143
    if-nez v1, :cond_d

    .line 144
    .line 145
    instance-of v0, v0, Lcom/android/launcher3/model/data/I;

    .line 146
    .line 147
    if-eqz v0, :cond_c

    .line 148
    .line 149
    goto :goto_7

    .line 150
    :cond_c
    return v8

    .line 151
    :cond_d
    :goto_7
    return p1
.end method
