.class final Landroidx/fragment/app/a;
.super Landroidx/fragment/app/N;
.source "BackStackRecord.java"

# interfaces
.implements Landroidx/fragment/app/F$j;
.implements Landroidx/fragment/app/F$n;


# instance fields
.field final t:Landroidx/fragment/app/F;

.field u:Z

.field v:I

.field w:Z


# direct methods
.method constructor <init>(Landroidx/fragment/app/F;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/F;->u0()Landroidx/fragment/app/w;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p1}, Landroidx/fragment/app/F;->w0()Landroidx/fragment/app/x;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {p1}, Landroidx/fragment/app/F;->w0()Landroidx/fragment/app/x;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {v1}, Landroidx/fragment/app/x;->h()Landroid/content/Context;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v1}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    goto :goto_0

    .line 24
    :cond_0
    const/4 v1, 0x0

    .line 25
    :goto_0
    invoke-direct {p0, v0, v1}, Landroidx/fragment/app/N;-><init>(Landroidx/fragment/app/w;Ljava/lang/ClassLoader;)V

    .line 26
    .line 27
    .line 28
    const/4 v0, -0x1

    .line 29
    iput v0, p0, Landroidx/fragment/app/a;->v:I

    .line 30
    .line 31
    const/4 v0, 0x0

    .line 32
    iput-boolean v0, p0, Landroidx/fragment/app/a;->w:Z

    .line 33
    .line 34
    iput-object p1, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method A(Ljava/util/ArrayList;Landroidx/fragment/app/n;)Landroidx/fragment/app/n;
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/n;",
            ">;",
            "Landroidx/fragment/app/n;",
            ")",
            "Landroidx/fragment/app/n;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v3, p2

    .line 6
    .line 7
    const/4 v4, 0x0

    .line 8
    :goto_0
    iget-object v5, v0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 9
    .line 10
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 11
    .line 12
    .line 13
    move-result v5

    .line 14
    if-ge v4, v5, :cond_a

    .line 15
    .line 16
    iget-object v5, v0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v5

    .line 22
    check-cast v5, Landroidx/fragment/app/N$a;

    .line 23
    .line 24
    iget v6, v5, Landroidx/fragment/app/N$a;->a:I

    .line 25
    .line 26
    const/4 v7, 0x1

    .line 27
    if-eq v6, v7, :cond_8

    .line 28
    .line 29
    const/4 v8, 0x2

    .line 30
    const/4 v9, 0x0

    .line 31
    const/4 v10, 0x3

    .line 32
    const/16 v11, 0x9

    .line 33
    .line 34
    if-eq v6, v8, :cond_2

    .line 35
    .line 36
    if-eq v6, v10, :cond_1

    .line 37
    .line 38
    const/4 v8, 0x6

    .line 39
    if-eq v6, v8, :cond_1

    .line 40
    .line 41
    const/4 v8, 0x7

    .line 42
    if-eq v6, v8, :cond_8

    .line 43
    .line 44
    const/16 v8, 0x8

    .line 45
    .line 46
    if-eq v6, v8, :cond_0

    .line 47
    .line 48
    goto/16 :goto_3

    .line 49
    .line 50
    :cond_0
    iget-object v6, v0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 51
    .line 52
    new-instance v8, Landroidx/fragment/app/N$a;

    .line 53
    .line 54
    invoke-direct {v8, v11, v3, v7}, Landroidx/fragment/app/N$a;-><init>(ILandroidx/fragment/app/n;Z)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v6, v4, v8}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 58
    .line 59
    .line 60
    iput-boolean v7, v5, Landroidx/fragment/app/N$a;->c:Z

    .line 61
    .line 62
    add-int/lit8 v4, v4, 0x1

    .line 63
    .line 64
    iget-object v3, v5, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 65
    .line 66
    goto/16 :goto_3

    .line 67
    .line 68
    :cond_1
    iget-object v6, v5, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 69
    .line 70
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 71
    .line 72
    .line 73
    iget-object v5, v5, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 74
    .line 75
    if-ne v5, v3, :cond_9

    .line 76
    .line 77
    iget-object v3, v0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 78
    .line 79
    new-instance v6, Landroidx/fragment/app/N$a;

    .line 80
    .line 81
    invoke-direct {v6, v11, v5}, Landroidx/fragment/app/N$a;-><init>(ILandroidx/fragment/app/n;)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {v3, v4, v6}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    add-int/lit8 v4, v4, 0x1

    .line 88
    .line 89
    move-object v3, v9

    .line 90
    goto :goto_3

    .line 91
    :cond_2
    iget-object v6, v5, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 92
    .line 93
    iget v8, v6, Landroidx/fragment/app/n;->mContainerId:I

    .line 94
    .line 95
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 96
    .line 97
    .line 98
    move-result v12

    .line 99
    sub-int/2addr v12, v7

    .line 100
    const/4 v13, 0x0

    .line 101
    :goto_1
    if-ltz v12, :cond_6

    .line 102
    .line 103
    invoke-virtual {v1, v12}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v14

    .line 107
    check-cast v14, Landroidx/fragment/app/n;

    .line 108
    .line 109
    iget v15, v14, Landroidx/fragment/app/n;->mContainerId:I

    .line 110
    .line 111
    if-ne v15, v8, :cond_5

    .line 112
    .line 113
    if-ne v14, v6, :cond_3

    .line 114
    .line 115
    move v13, v7

    .line 116
    goto :goto_2

    .line 117
    :cond_3
    if-ne v14, v3, :cond_4

    .line 118
    .line 119
    iget-object v3, v0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 120
    .line 121
    new-instance v15, Landroidx/fragment/app/N$a;

    .line 122
    .line 123
    invoke-direct {v15, v11, v14, v7}, Landroidx/fragment/app/N$a;-><init>(ILandroidx/fragment/app/n;Z)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {v3, v4, v15}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 127
    .line 128
    .line 129
    add-int/lit8 v4, v4, 0x1

    .line 130
    .line 131
    move-object v3, v9

    .line 132
    :cond_4
    new-instance v15, Landroidx/fragment/app/N$a;

    .line 133
    .line 134
    invoke-direct {v15, v10, v14, v7}, Landroidx/fragment/app/N$a;-><init>(ILandroidx/fragment/app/n;Z)V

    .line 135
    .line 136
    .line 137
    iget v2, v5, Landroidx/fragment/app/N$a;->d:I

    .line 138
    .line 139
    iput v2, v15, Landroidx/fragment/app/N$a;->d:I

    .line 140
    .line 141
    iget v2, v5, Landroidx/fragment/app/N$a;->f:I

    .line 142
    .line 143
    iput v2, v15, Landroidx/fragment/app/N$a;->f:I

    .line 144
    .line 145
    iget v2, v5, Landroidx/fragment/app/N$a;->e:I

    .line 146
    .line 147
    iput v2, v15, Landroidx/fragment/app/N$a;->e:I

    .line 148
    .line 149
    iget v2, v5, Landroidx/fragment/app/N$a;->g:I

    .line 150
    .line 151
    iput v2, v15, Landroidx/fragment/app/N$a;->g:I

    .line 152
    .line 153
    iget-object v2, v0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-virtual {v2, v4, v15}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    invoke-virtual {v1, v14}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    add-int/2addr v4, v7

    .line 162
    :cond_5
    :goto_2
    add-int/lit8 v12, v12, -0x1

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_6
    if-eqz v13, :cond_7

    .line 166
    .line 167
    iget-object v2, v0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    add-int/lit8 v4, v4, -0x1

    .line 173
    .line 174
    goto :goto_3

    .line 175
    :cond_7
    iput v7, v5, Landroidx/fragment/app/N$a;->a:I

    .line 176
    .line 177
    iput-boolean v7, v5, Landroidx/fragment/app/N$a;->c:Z

    .line 178
    .line 179
    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_8
    iget-object v2, v5, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 184
    .line 185
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    :cond_9
    :goto_3
    add-int/2addr v4, v7

    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :cond_a
    return-object v3
.end method

.method public B()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/fragment/app/N;->k:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public C()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/N;->s:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    iget-object v1, p0, Landroidx/fragment/app/N;->s:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Landroidx/fragment/app/N;->s:Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 23
    .line 24
    .line 25
    add-int/lit8 v0, v0, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Landroidx/fragment/app/N;->s:Ljava/util/ArrayList;

    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method D(Ljava/util/ArrayList;Landroidx/fragment/app/n;)Landroidx/fragment/app/n;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/n;",
            ">;",
            "Landroidx/fragment/app/n;",
            ")",
            "Landroidx/fragment/app/n;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    sub-int/2addr v0, v1

    .line 9
    :goto_0
    if-ltz v0, :cond_2

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroidx/fragment/app/N$a;

    .line 18
    .line 19
    iget v3, v2, Landroidx/fragment/app/N$a;->a:I

    .line 20
    .line 21
    if-eq v3, v1, :cond_1

    .line 22
    .line 23
    const/4 v4, 0x3

    .line 24
    if-eq v3, v4, :cond_0

    .line 25
    .line 26
    packed-switch v3, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    goto :goto_1

    .line 30
    :pswitch_0
    iget-object v3, v2, Landroidx/fragment/app/N$a;->h:Landroidx/lifecycle/g$b;

    .line 31
    .line 32
    iput-object v3, v2, Landroidx/fragment/app/N$a;->i:Landroidx/lifecycle/g$b;

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :pswitch_1
    iget-object p2, v2, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :pswitch_2
    const/4 p2, 0x0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :pswitch_3
    iget-object v2, v2, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 41
    .line 42
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :pswitch_4
    iget-object v2, v2, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 47
    .line 48
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    return-object p2

    .line 55
    :pswitch_data_0
    .packed-switch 0x6
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Ljava/util/ArrayList;Ljava/util/ArrayList;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroidx/fragment/app/a;",
            ">;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Boolean;",
            ">;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 11
    .line 12
    .line 13
    const-string v1, "Run: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "FragmentManager"

    .line 26
    .line 27
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    :cond_0
    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 34
    .line 35
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    iget-boolean p1, p0, Landroidx/fragment/app/N;->i:Z

    .line 39
    .line 40
    if-eqz p1, :cond_1

    .line 41
    .line 42
    iget-object p1, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 43
    .line 44
    invoke-virtual {p1, p0}, Landroidx/fragment/app/F;->g(Landroidx/fragment/app/a;)V

    .line 45
    .line 46
    .line 47
    :cond_1
    const/4 p0, 0x1

    .line 48
    return p0
.end method

.method public getId()I
    .locals 0

    .line 1
    iget p0, p0, Landroidx/fragment/app/a;->v:I

    .line 2
    .line 3
    return p0
.end method

.method public h()I
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroidx/fragment/app/a;->v(Z)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public i()I
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, v0}, Landroidx/fragment/app/a;->v(Z)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    return p0
.end method

.method public j()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/N;->l()Landroidx/fragment/app/N;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/F;->b0(Landroidx/fragment/app/F$n;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public k()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/N;->l()Landroidx/fragment/app/N;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-virtual {v0, p0, v1}, Landroidx/fragment/app/F;->b0(Landroidx/fragment/app/F$n;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method m(ILandroidx/fragment/app/n;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/fragment/app/N;->m(ILandroidx/fragment/app/n;Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 5
    .line 6
    iput-object p0, p2, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 7
    .line 8
    return-void
.end method

.method public n(Landroidx/fragment/app/n;)Landroidx/fragment/app/N;
    .locals 2

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "Cannot remove Fragment attached to a different FragmentManager. Fragment "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Landroidx/fragment/app/n;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, " is already attached to a FragmentManager."

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    throw p0

    .line 42
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroidx/fragment/app/N;->n(Landroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    return-object p0
.end method

.method public r(Landroidx/fragment/app/n;)Landroidx/fragment/app/N;
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    iget-object v0, p1, Landroidx/fragment/app/n;->mFragmentManager:Landroidx/fragment/app/F;

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    iget-object v1, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 13
    .line 14
    new-instance v0, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 17
    .line 18
    .line 19
    const-string v1, "Cannot setPrimaryNavigation for Fragment attached to a different FragmentManager. Fragment "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Landroidx/fragment/app/n;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string p1, " is already attached to a FragmentManager."

    .line 32
    .line 33
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    throw p0

    .line 44
    :cond_1
    :goto_0
    invoke-super {p0, p1}, Landroidx/fragment/app/N;->r(Landroidx/fragment/app/n;)Landroidx/fragment/app/N;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const/16 v1, 0x80

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 6
    .line 7
    .line 8
    const-string v1, "BackStackEntry{"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    iget v1, p0, Landroidx/fragment/app/a;->v:I

    .line 25
    .line 26
    if-ltz v1, :cond_0

    .line 27
    .line 28
    const-string v1, " #"

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    iget v1, p0, Landroidx/fragment/app/a;->v:I

    .line 34
    .line 35
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    :cond_0
    iget-object v1, p0, Landroidx/fragment/app/N;->k:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v1, :cond_1

    .line 41
    .line 42
    const-string v1, " "

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Landroidx/fragment/app/N;->k:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    :cond_1
    const-string p0, "}"

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    return-object p0
.end method

.method u(I)V
    .locals 7

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/N;->i:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    const/4 v0, 0x2

    .line 7
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    const-string v2, "FragmentManager"

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    new-instance v1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string v3, "Bump nesting in "

    .line 21
    .line 22
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v3, " by "

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-static {v2, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object v1, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    const/4 v3, 0x0

    .line 50
    :goto_0
    if-ge v3, v1, :cond_3

    .line 51
    .line 52
    iget-object v4, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 53
    .line 54
    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    check-cast v4, Landroidx/fragment/app/N$a;

    .line 59
    .line 60
    iget-object v5, v4, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 61
    .line 62
    if-eqz v5, :cond_2

    .line 63
    .line 64
    iget v6, v5, Landroidx/fragment/app/n;->mBackStackNesting:I

    .line 65
    .line 66
    add-int/2addr v6, p1

    .line 67
    iput v6, v5, Landroidx/fragment/app/n;->mBackStackNesting:I

    .line 68
    .line 69
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-eqz v5, :cond_2

    .line 74
    .line 75
    new-instance v5, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    const-string v6, "Bump nesting of "

    .line 81
    .line 82
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget-object v6, v4, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 86
    .line 87
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    const-string v6, " to "

    .line 91
    .line 92
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    iget-object v4, v4, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 96
    .line 97
    iget v4, v4, Landroidx/fragment/app/n;->mBackStackNesting:I

    .line 98
    .line 99
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-static {v2, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    .line 108
    .line 109
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_3
    :goto_1
    return-void
.end method

.method v(Z)I
    .locals 2

    .line 1
    iget-boolean v0, p0, Landroidx/fragment/app/a;->u:Z

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    const/4 v0, 0x2

    .line 6
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 15
    .line 16
    .line 17
    const-string v1, "Commit: "

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "FragmentManager"

    .line 30
    .line 31
    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    new-instance v0, Landroidx/fragment/app/T;

    .line 35
    .line 36
    invoke-direct {v0, v1}, Landroidx/fragment/app/T;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    new-instance v1, Ljava/io/PrintWriter;

    .line 40
    .line 41
    invoke-direct {v1, v0}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V

    .line 42
    .line 43
    .line 44
    const-string v0, "  "

    .line 45
    .line 46
    invoke-virtual {p0, v0, v1}, Landroidx/fragment/app/a;->w(Ljava/lang/String;Ljava/io/PrintWriter;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/io/PrintWriter;->close()V

    .line 50
    .line 51
    .line 52
    :cond_0
    const/4 v0, 0x1

    .line 53
    iput-boolean v0, p0, Landroidx/fragment/app/a;->u:Z

    .line 54
    .line 55
    iget-boolean v0, p0, Landroidx/fragment/app/N;->i:Z

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    iget-object v0, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 60
    .line 61
    invoke-virtual {v0}, Landroidx/fragment/app/F;->l()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    iput v0, p0, Landroidx/fragment/app/a;->v:I

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_1
    const/4 v0, -0x1

    .line 69
    iput v0, p0, Landroidx/fragment/app/a;->v:I

    .line 70
    .line 71
    :goto_0
    iget-object v0, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 72
    .line 73
    invoke-virtual {v0, p0, p1}, Landroidx/fragment/app/F;->Y(Landroidx/fragment/app/F$n;Z)V

    .line 74
    .line 75
    .line 76
    iget p0, p0, Landroidx/fragment/app/a;->v:I

    .line 77
    .line 78
    return p0

    .line 79
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 80
    .line 81
    const-string p1, "commit already called"

    .line 82
    .line 83
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    throw p0
.end method

.method public w(Ljava/lang/String;Ljava/io/PrintWriter;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, p2, v0}, Landroidx/fragment/app/a;->x(Ljava/lang/String;Ljava/io/PrintWriter;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public x(Ljava/lang/String;Ljava/io/PrintWriter;Z)V
    .locals 5

    .line 1
    if-eqz p3, :cond_8

    .line 2
    .line 3
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "mName="

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/fragment/app/N;->k:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, " mIndex="

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget v0, p0, Landroidx/fragment/app/a;->v:I

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(I)V

    .line 24
    .line 25
    .line 26
    const-string v0, " mCommitted="

    .line 27
    .line 28
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-boolean v0, p0, Landroidx/fragment/app/a;->u:Z

    .line 32
    .line 33
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Z)V

    .line 34
    .line 35
    .line 36
    iget v0, p0, Landroidx/fragment/app/N;->h:I

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const-string v0, "mTransition=#"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    iget v0, p0, Landroidx/fragment/app/N;->h:I

    .line 49
    .line 50
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_0
    iget v0, p0, Landroidx/fragment/app/N;->d:I

    .line 58
    .line 59
    if-nez v0, :cond_1

    .line 60
    .line 61
    iget v0, p0, Landroidx/fragment/app/N;->e:I

    .line 62
    .line 63
    if-eqz v0, :cond_2

    .line 64
    .line 65
    :cond_1
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    const-string v0, "mEnterAnim=#"

    .line 69
    .line 70
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget v0, p0, Landroidx/fragment/app/N;->d:I

    .line 74
    .line 75
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const-string v0, " mExitAnim=#"

    .line 83
    .line 84
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    iget v0, p0, Landroidx/fragment/app/N;->e:I

    .line 88
    .line 89
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_2
    iget v0, p0, Landroidx/fragment/app/N;->f:I

    .line 97
    .line 98
    if-nez v0, :cond_3

    .line 99
    .line 100
    iget v0, p0, Landroidx/fragment/app/N;->g:I

    .line 101
    .line 102
    if-eqz v0, :cond_4

    .line 103
    .line 104
    :cond_3
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    const-string v0, "mPopEnterAnim=#"

    .line 108
    .line 109
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    iget v0, p0, Landroidx/fragment/app/N;->f:I

    .line 113
    .line 114
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    const-string v0, " mPopExitAnim=#"

    .line 122
    .line 123
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    iget v0, p0, Landroidx/fragment/app/N;->g:I

    .line 127
    .line 128
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    :cond_4
    iget v0, p0, Landroidx/fragment/app/N;->l:I

    .line 136
    .line 137
    if-nez v0, :cond_5

    .line 138
    .line 139
    iget-object v0, p0, Landroidx/fragment/app/N;->m:Ljava/lang/CharSequence;

    .line 140
    .line 141
    if-eqz v0, :cond_6

    .line 142
    .line 143
    :cond_5
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    const-string v0, "mBreadCrumbTitleRes=#"

    .line 147
    .line 148
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget v0, p0, Landroidx/fragment/app/N;->l:I

    .line 152
    .line 153
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    const-string v0, " mBreadCrumbTitleText="

    .line 161
    .line 162
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Landroidx/fragment/app/N;->m:Ljava/lang/CharSequence;

    .line 166
    .line 167
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    :cond_6
    iget v0, p0, Landroidx/fragment/app/N;->n:I

    .line 171
    .line 172
    if-nez v0, :cond_7

    .line 173
    .line 174
    iget-object v0, p0, Landroidx/fragment/app/N;->o:Ljava/lang/CharSequence;

    .line 175
    .line 176
    if-eqz v0, :cond_8

    .line 177
    .line 178
    :cond_7
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    const-string v0, "mBreadCrumbShortTitleRes=#"

    .line 182
    .line 183
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget v0, p0, Landroidx/fragment/app/N;->n:I

    .line 187
    .line 188
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    const-string v0, " mBreadCrumbShortTitleText="

    .line 196
    .line 197
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    iget-object v0, p0, Landroidx/fragment/app/N;->o:Ljava/lang/CharSequence;

    .line 201
    .line 202
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 203
    .line 204
    .line 205
    :cond_8
    iget-object v0, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 206
    .line 207
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_d

    .line 212
    .line 213
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    const-string v0, "Operations:"

    .line 217
    .line 218
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 219
    .line 220
    .line 221
    iget-object v0, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 222
    .line 223
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    const/4 v1, 0x0

    .line 228
    :goto_0
    if-ge v1, v0, :cond_d

    .line 229
    .line 230
    iget-object v2, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 231
    .line 232
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    check-cast v2, Landroidx/fragment/app/N$a;

    .line 237
    .line 238
    iget v3, v2, Landroidx/fragment/app/N$a;->a:I

    .line 239
    .line 240
    packed-switch v3, :pswitch_data_0

    .line 241
    .line 242
    .line 243
    new-instance v3, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 246
    .line 247
    .line 248
    const-string v4, "cmd="

    .line 249
    .line 250
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    iget v4, v2, Landroidx/fragment/app/N$a;->a:I

    .line 254
    .line 255
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    goto :goto_1

    .line 263
    :pswitch_0
    const-string v3, "OP_SET_MAX_LIFECYCLE"

    .line 264
    .line 265
    goto :goto_1

    .line 266
    :pswitch_1
    const-string v3, "UNSET_PRIMARY_NAV"

    .line 267
    .line 268
    goto :goto_1

    .line 269
    :pswitch_2
    const-string v3, "SET_PRIMARY_NAV"

    .line 270
    .line 271
    goto :goto_1

    .line 272
    :pswitch_3
    const-string v3, "ATTACH"

    .line 273
    .line 274
    goto :goto_1

    .line 275
    :pswitch_4
    const-string v3, "DETACH"

    .line 276
    .line 277
    goto :goto_1

    .line 278
    :pswitch_5
    const-string v3, "SHOW"

    .line 279
    .line 280
    goto :goto_1

    .line 281
    :pswitch_6
    const-string v3, "HIDE"

    .line 282
    .line 283
    goto :goto_1

    .line 284
    :pswitch_7
    const-string v3, "REMOVE"

    .line 285
    .line 286
    goto :goto_1

    .line 287
    :pswitch_8
    const-string v3, "REPLACE"

    .line 288
    .line 289
    goto :goto_1

    .line 290
    :pswitch_9
    const-string v3, "ADD"

    .line 291
    .line 292
    goto :goto_1

    .line 293
    :pswitch_a
    const-string v3, "NULL"

    .line 294
    .line 295
    :goto_1
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 296
    .line 297
    .line 298
    const-string v4, "  Op #"

    .line 299
    .line 300
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->print(I)V

    .line 304
    .line 305
    .line 306
    const-string v4, ": "

    .line 307
    .line 308
    invoke-virtual {p2, v4}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 309
    .line 310
    .line 311
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 312
    .line 313
    .line 314
    const-string v3, " "

    .line 315
    .line 316
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    iget-object v3, v2, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 320
    .line 321
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/Object;)V

    .line 322
    .line 323
    .line 324
    if-eqz p3, :cond_c

    .line 325
    .line 326
    iget v3, v2, Landroidx/fragment/app/N$a;->d:I

    .line 327
    .line 328
    if-nez v3, :cond_9

    .line 329
    .line 330
    iget v3, v2, Landroidx/fragment/app/N$a;->e:I

    .line 331
    .line 332
    if-eqz v3, :cond_a

    .line 333
    .line 334
    :cond_9
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    const-string v3, "enterAnim=#"

    .line 338
    .line 339
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    iget v3, v2, Landroidx/fragment/app/N$a;->d:I

    .line 343
    .line 344
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 345
    .line 346
    .line 347
    move-result-object v3

    .line 348
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 349
    .line 350
    .line 351
    const-string v3, " exitAnim=#"

    .line 352
    .line 353
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    iget v3, v2, Landroidx/fragment/app/N$a;->e:I

    .line 357
    .line 358
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v3

    .line 362
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    :cond_a
    iget v3, v2, Landroidx/fragment/app/N$a;->f:I

    .line 366
    .line 367
    if-nez v3, :cond_b

    .line 368
    .line 369
    iget v3, v2, Landroidx/fragment/app/N$a;->g:I

    .line 370
    .line 371
    if-eqz v3, :cond_c

    .line 372
    .line 373
    :cond_b
    invoke-virtual {p2, p1}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 374
    .line 375
    .line 376
    const-string v3, "popEnterAnim=#"

    .line 377
    .line 378
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 379
    .line 380
    .line 381
    iget v3, v2, Landroidx/fragment/app/N$a;->f:I

    .line 382
    .line 383
    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 388
    .line 389
    .line 390
    const-string v3, " popExitAnim=#"

    .line 391
    .line 392
    invoke-virtual {p2, v3}, Ljava/io/PrintWriter;->print(Ljava/lang/String;)V

    .line 393
    .line 394
    .line 395
    iget v2, v2, Landroidx/fragment/app/N$a;->g:I

    .line 396
    .line 397
    invoke-static {v2}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v2

    .line 401
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->println(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    :cond_c
    add-int/lit8 v1, v1, 0x1

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :cond_d
    return-void

    .line 409
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method y()V
    .locals 8

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

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
    iget-object v3, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    check-cast v3, Landroidx/fragment/app/N$a;

    .line 18
    .line 19
    iget-object v4, v3, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 20
    .line 21
    if-eqz v4, :cond_0

    .line 22
    .line 23
    iget-boolean v5, p0, Landroidx/fragment/app/a;->w:Z

    .line 24
    .line 25
    iput-boolean v5, v4, Landroidx/fragment/app/n;->mBeingSaved:Z

    .line 26
    .line 27
    invoke-virtual {v4, v1}, Landroidx/fragment/app/n;->setPopDirection(Z)V

    .line 28
    .line 29
    .line 30
    iget v5, p0, Landroidx/fragment/app/N;->h:I

    .line 31
    .line 32
    invoke-virtual {v4, v5}, Landroidx/fragment/app/n;->setNextTransition(I)V

    .line 33
    .line 34
    .line 35
    iget-object v5, p0, Landroidx/fragment/app/N;->p:Ljava/util/ArrayList;

    .line 36
    .line 37
    iget-object v6, p0, Landroidx/fragment/app/N;->q:Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-virtual {v4, v5, v6}, Landroidx/fragment/app/n;->setSharedElementNames(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 40
    .line 41
    .line 42
    :cond_0
    iget v5, v3, Landroidx/fragment/app/N$a;->a:I

    .line 43
    .line 44
    packed-switch v5, :pswitch_data_0

    .line 45
    .line 46
    .line 47
    :pswitch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 48
    .line 49
    new-instance v0, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 52
    .line 53
    .line 54
    const-string v1, "Unknown cmd: "

    .line 55
    .line 56
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    iget v1, v3, Landroidx/fragment/app/N$a;->a:I

    .line 60
    .line 61
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v0

    .line 68
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    throw p0

    .line 72
    :pswitch_1
    iget-object v5, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 73
    .line 74
    iget-object v3, v3, Landroidx/fragment/app/N$a;->i:Landroidx/lifecycle/g$b;

    .line 75
    .line 76
    invoke-virtual {v5, v4, v3}, Landroidx/fragment/app/F;->n1(Landroidx/fragment/app/n;Landroidx/lifecycle/g$b;)V

    .line 77
    .line 78
    .line 79
    goto/16 :goto_1

    .line 80
    .line 81
    :pswitch_2
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 82
    .line 83
    const/4 v4, 0x0

    .line 84
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->o1(Landroidx/fragment/app/n;)V

    .line 85
    .line 86
    .line 87
    goto/16 :goto_1

    .line 88
    .line 89
    :pswitch_3
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 90
    .line 91
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->o1(Landroidx/fragment/app/n;)V

    .line 92
    .line 93
    .line 94
    goto/16 :goto_1

    .line 95
    .line 96
    :pswitch_4
    iget v5, v3, Landroidx/fragment/app/N$a;->d:I

    .line 97
    .line 98
    iget v6, v3, Landroidx/fragment/app/N$a;->e:I

    .line 99
    .line 100
    iget v7, v3, Landroidx/fragment/app/N$a;->f:I

    .line 101
    .line 102
    iget v3, v3, Landroidx/fragment/app/N$a;->g:I

    .line 103
    .line 104
    invoke-virtual {v4, v5, v6, v7, v3}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 105
    .line 106
    .line 107
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 108
    .line 109
    invoke-virtual {v3, v4, v1}, Landroidx/fragment/app/F;->m1(Landroidx/fragment/app/n;Z)V

    .line 110
    .line 111
    .line 112
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 113
    .line 114
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->n(Landroidx/fragment/app/n;)V

    .line 115
    .line 116
    .line 117
    goto :goto_1

    .line 118
    :pswitch_5
    iget v5, v3, Landroidx/fragment/app/N$a;->d:I

    .line 119
    .line 120
    iget v6, v3, Landroidx/fragment/app/N$a;->e:I

    .line 121
    .line 122
    iget v7, v3, Landroidx/fragment/app/N$a;->f:I

    .line 123
    .line 124
    iget v3, v3, Landroidx/fragment/app/N$a;->g:I

    .line 125
    .line 126
    invoke-virtual {v4, v5, v6, v7, v3}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 127
    .line 128
    .line 129
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 130
    .line 131
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->w(Landroidx/fragment/app/n;)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :pswitch_6
    iget v5, v3, Landroidx/fragment/app/N$a;->d:I

    .line 136
    .line 137
    iget v6, v3, Landroidx/fragment/app/N$a;->e:I

    .line 138
    .line 139
    iget v7, v3, Landroidx/fragment/app/N$a;->f:I

    .line 140
    .line 141
    iget v3, v3, Landroidx/fragment/app/N$a;->g:I

    .line 142
    .line 143
    invoke-virtual {v4, v5, v6, v7, v3}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 144
    .line 145
    .line 146
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 147
    .line 148
    invoke-virtual {v3, v4, v1}, Landroidx/fragment/app/F;->m1(Landroidx/fragment/app/n;Z)V

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 152
    .line 153
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->q1(Landroidx/fragment/app/n;)V

    .line 154
    .line 155
    .line 156
    goto :goto_1

    .line 157
    :pswitch_7
    iget v5, v3, Landroidx/fragment/app/N$a;->d:I

    .line 158
    .line 159
    iget v6, v3, Landroidx/fragment/app/N$a;->e:I

    .line 160
    .line 161
    iget v7, v3, Landroidx/fragment/app/N$a;->f:I

    .line 162
    .line 163
    iget v3, v3, Landroidx/fragment/app/N$a;->g:I

    .line 164
    .line 165
    invoke-virtual {v4, v5, v6, v7, v3}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 166
    .line 167
    .line 168
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 169
    .line 170
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->G0(Landroidx/fragment/app/n;)V

    .line 171
    .line 172
    .line 173
    goto :goto_1

    .line 174
    :pswitch_8
    iget v5, v3, Landroidx/fragment/app/N$a;->d:I

    .line 175
    .line 176
    iget v6, v3, Landroidx/fragment/app/N$a;->e:I

    .line 177
    .line 178
    iget v7, v3, Landroidx/fragment/app/N$a;->f:I

    .line 179
    .line 180
    iget v3, v3, Landroidx/fragment/app/N$a;->g:I

    .line 181
    .line 182
    invoke-virtual {v4, v5, v6, v7, v3}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 183
    .line 184
    .line 185
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 186
    .line 187
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->e1(Landroidx/fragment/app/n;)V

    .line 188
    .line 189
    .line 190
    goto :goto_1

    .line 191
    :pswitch_9
    iget v5, v3, Landroidx/fragment/app/N$a;->d:I

    .line 192
    .line 193
    iget v6, v3, Landroidx/fragment/app/N$a;->e:I

    .line 194
    .line 195
    iget v7, v3, Landroidx/fragment/app/N$a;->f:I

    .line 196
    .line 197
    iget v3, v3, Landroidx/fragment/app/N$a;->g:I

    .line 198
    .line 199
    invoke-virtual {v4, v5, v6, v7, v3}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 200
    .line 201
    .line 202
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 203
    .line 204
    invoke-virtual {v3, v4, v1}, Landroidx/fragment/app/F;->m1(Landroidx/fragment/app/n;Z)V

    .line 205
    .line 206
    .line 207
    iget-object v3, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 208
    .line 209
    invoke-virtual {v3, v4}, Landroidx/fragment/app/F;->h(Landroidx/fragment/app/n;)Landroidx/fragment/app/L;

    .line 210
    .line 211
    .line 212
    :goto_1
    add-int/lit8 v2, v2, 0x1

    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :cond_1
    return-void

    .line 217
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method z()V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    sub-int/2addr v0, v1

    .line 9
    :goto_0
    if-ltz v0, :cond_1

    .line 10
    .line 11
    iget-object v2, p0, Landroidx/fragment/app/N;->c:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Landroidx/fragment/app/N$a;

    .line 18
    .line 19
    iget-object v3, v2, Landroidx/fragment/app/N$a;->b:Landroidx/fragment/app/n;

    .line 20
    .line 21
    if-eqz v3, :cond_0

    .line 22
    .line 23
    iget-boolean v4, p0, Landroidx/fragment/app/a;->w:Z

    .line 24
    .line 25
    iput-boolean v4, v3, Landroidx/fragment/app/n;->mBeingSaved:Z

    .line 26
    .line 27
    invoke-virtual {v3, v1}, Landroidx/fragment/app/n;->setPopDirection(Z)V

    .line 28
    .line 29
    .line 30
    iget v4, p0, Landroidx/fragment/app/N;->h:I

    .line 31
    .line 32
    invoke-static {v4}, Landroidx/fragment/app/F;->j1(I)I

    .line 33
    .line 34
    .line 35
    move-result v4

    .line 36
    invoke-virtual {v3, v4}, Landroidx/fragment/app/n;->setNextTransition(I)V

    .line 37
    .line 38
    .line 39
    iget-object v4, p0, Landroidx/fragment/app/N;->q:Ljava/util/ArrayList;

    .line 40
    .line 41
    iget-object v5, p0, Landroidx/fragment/app/N;->p:Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-virtual {v3, v4, v5}, Landroidx/fragment/app/n;->setSharedElementNames(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 44
    .line 45
    .line 46
    :cond_0
    iget v4, v2, Landroidx/fragment/app/N$a;->a:I

    .line 47
    .line 48
    packed-switch v4, :pswitch_data_0

    .line 49
    .line 50
    .line 51
    :pswitch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 52
    .line 53
    new-instance v0, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string v1, "Unknown cmd: "

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    iget v1, v2, Landroidx/fragment/app/N$a;->a:I

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    throw p0

    .line 76
    :pswitch_1
    iget-object v4, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 77
    .line 78
    iget-object v2, v2, Landroidx/fragment/app/N$a;->h:Landroidx/lifecycle/g$b;

    .line 79
    .line 80
    invoke-virtual {v4, v3, v2}, Landroidx/fragment/app/F;->n1(Landroidx/fragment/app/n;Landroidx/lifecycle/g$b;)V

    .line 81
    .line 82
    .line 83
    goto/16 :goto_1

    .line 84
    .line 85
    :pswitch_2
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 86
    .line 87
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->o1(Landroidx/fragment/app/n;)V

    .line 88
    .line 89
    .line 90
    goto/16 :goto_1

    .line 91
    .line 92
    :pswitch_3
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 93
    .line 94
    const/4 v3, 0x0

    .line 95
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->o1(Landroidx/fragment/app/n;)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_1

    .line 99
    .line 100
    :pswitch_4
    iget v4, v2, Landroidx/fragment/app/N$a;->d:I

    .line 101
    .line 102
    iget v5, v2, Landroidx/fragment/app/N$a;->e:I

    .line 103
    .line 104
    iget v6, v2, Landroidx/fragment/app/N$a;->f:I

    .line 105
    .line 106
    iget v2, v2, Landroidx/fragment/app/N$a;->g:I

    .line 107
    .line 108
    invoke-virtual {v3, v4, v5, v6, v2}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 109
    .line 110
    .line 111
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 112
    .line 113
    invoke-virtual {v2, v3, v1}, Landroidx/fragment/app/F;->m1(Landroidx/fragment/app/n;Z)V

    .line 114
    .line 115
    .line 116
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 117
    .line 118
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->w(Landroidx/fragment/app/n;)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :pswitch_5
    iget v4, v2, Landroidx/fragment/app/N$a;->d:I

    .line 123
    .line 124
    iget v5, v2, Landroidx/fragment/app/N$a;->e:I

    .line 125
    .line 126
    iget v6, v2, Landroidx/fragment/app/N$a;->f:I

    .line 127
    .line 128
    iget v2, v2, Landroidx/fragment/app/N$a;->g:I

    .line 129
    .line 130
    invoke-virtual {v3, v4, v5, v6, v2}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 131
    .line 132
    .line 133
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 134
    .line 135
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->n(Landroidx/fragment/app/n;)V

    .line 136
    .line 137
    .line 138
    goto :goto_1

    .line 139
    :pswitch_6
    iget v4, v2, Landroidx/fragment/app/N$a;->d:I

    .line 140
    .line 141
    iget v5, v2, Landroidx/fragment/app/N$a;->e:I

    .line 142
    .line 143
    iget v6, v2, Landroidx/fragment/app/N$a;->f:I

    .line 144
    .line 145
    iget v2, v2, Landroidx/fragment/app/N$a;->g:I

    .line 146
    .line 147
    invoke-virtual {v3, v4, v5, v6, v2}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 148
    .line 149
    .line 150
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 151
    .line 152
    invoke-virtual {v2, v3, v1}, Landroidx/fragment/app/F;->m1(Landroidx/fragment/app/n;Z)V

    .line 153
    .line 154
    .line 155
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 156
    .line 157
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->G0(Landroidx/fragment/app/n;)V

    .line 158
    .line 159
    .line 160
    goto :goto_1

    .line 161
    :pswitch_7
    iget v4, v2, Landroidx/fragment/app/N$a;->d:I

    .line 162
    .line 163
    iget v5, v2, Landroidx/fragment/app/N$a;->e:I

    .line 164
    .line 165
    iget v6, v2, Landroidx/fragment/app/N$a;->f:I

    .line 166
    .line 167
    iget v2, v2, Landroidx/fragment/app/N$a;->g:I

    .line 168
    .line 169
    invoke-virtual {v3, v4, v5, v6, v2}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 170
    .line 171
    .line 172
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 173
    .line 174
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->q1(Landroidx/fragment/app/n;)V

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :pswitch_8
    iget v4, v2, Landroidx/fragment/app/N$a;->d:I

    .line 179
    .line 180
    iget v5, v2, Landroidx/fragment/app/N$a;->e:I

    .line 181
    .line 182
    iget v6, v2, Landroidx/fragment/app/N$a;->f:I

    .line 183
    .line 184
    iget v2, v2, Landroidx/fragment/app/N$a;->g:I

    .line 185
    .line 186
    invoke-virtual {v3, v4, v5, v6, v2}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 187
    .line 188
    .line 189
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 190
    .line 191
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->h(Landroidx/fragment/app/n;)Landroidx/fragment/app/L;

    .line 192
    .line 193
    .line 194
    goto :goto_1

    .line 195
    :pswitch_9
    iget v4, v2, Landroidx/fragment/app/N$a;->d:I

    .line 196
    .line 197
    iget v5, v2, Landroidx/fragment/app/N$a;->e:I

    .line 198
    .line 199
    iget v6, v2, Landroidx/fragment/app/N$a;->f:I

    .line 200
    .line 201
    iget v2, v2, Landroidx/fragment/app/N$a;->g:I

    .line 202
    .line 203
    invoke-virtual {v3, v4, v5, v6, v2}, Landroidx/fragment/app/n;->setAnimations(IIII)V

    .line 204
    .line 205
    .line 206
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 207
    .line 208
    invoke-virtual {v2, v3, v1}, Landroidx/fragment/app/F;->m1(Landroidx/fragment/app/n;Z)V

    .line 209
    .line 210
    .line 211
    iget-object v2, p0, Landroidx/fragment/app/a;->t:Landroidx/fragment/app/F;

    .line 212
    .line 213
    invoke-virtual {v2, v3}, Landroidx/fragment/app/F;->e1(Landroidx/fragment/app/n;)V

    .line 214
    .line 215
    .line 216
    :goto_1
    add-int/lit8 v0, v0, -0x1

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_1
    return-void

    .line 221
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method
