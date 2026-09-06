.class public final Landroidx/fragment/app/k;
.super Landroidx/fragment/app/W;
.source "DefaultSpecialEffectsController.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/fragment/app/k$a;,
        Landroidx/fragment/app/k$b;,
        Landroidx/fragment/app/k$c;
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1

    .line 1
    const-string v0, "container"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, p1}, Landroidx/fragment/app/W;-><init>(Landroid/view/ViewGroup;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic A(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-static {p0}, Landroidx/fragment/app/k;->N(Ljava/util/ArrayList;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic B(Landroidx/fragment/app/k$c;Landroidx/fragment/app/W$c;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/fragment/app/k;->O(Landroidx/fragment/app/k$c;Landroidx/fragment/app/W$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic C(Landroidx/fragment/app/Q;Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Landroidx/fragment/app/k;->M(Landroidx/fragment/app/Q;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final D(Landroidx/fragment/app/W$c;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "view"

    .line 12
    .line 13
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1, p0}, Landroidx/fragment/app/W$c$b;->c(Landroid/view/View;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method private final E(Ljava/util/ArrayList;Landroid/view/View;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    move-object v0, p2

    .line 6
    check-cast v0, Landroid/view/ViewGroup;

    .line 7
    .line 8
    invoke-static {v0}, LJ/M;->a(Landroid/view/ViewGroup;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-nez p0, :cond_3

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    const/4 v1, 0x0

    .line 29
    :goto_0
    if-ge v1, p2, :cond_3

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    if-nez v3, :cond_1

    .line 40
    .line 41
    const-string v3, "child"

    .line 42
    .line 43
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-direct {p0, p1, v2}, Landroidx/fragment/app/k;->E(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 47
    .line 48
    .line 49
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    if-nez p0, :cond_3

    .line 57
    .line 58
    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    :cond_3
    return-void
.end method

.method private static final F(Ljava/util/List;Landroidx/fragment/app/W$c;Landroidx/fragment/app/k;)V
    .locals 1

    .line 1
    const-string v0, "$awaitingContainerChanges"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$operation"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "this$0"

    .line 12
    .line 13
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-interface {p0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    invoke-interface {p0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    invoke-direct {p2, p1}, Landroidx/fragment/app/k;->D(Landroidx/fragment/app/W$c;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method private final G(Ljava/util/Map;Landroid/view/View;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Landroid/view/View;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {p2}, LJ/I;->E(Landroid/view/View;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {p1, v0, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    :cond_0
    instance-of v0, p2, Landroid/view/ViewGroup;

    .line 11
    .line 12
    if-eqz v0, :cond_2

    .line 13
    .line 14
    check-cast p2, Landroid/view/ViewGroup;

    .line 15
    .line 16
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    if-ge v1, v0, :cond_2

    .line 22
    .line 23
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_1

    .line 32
    .line 33
    const-string v3, "child"

    .line 34
    .line 35
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-direct {p0, p1, v2}, Landroidx/fragment/app/k;->G(Ljava/util/Map;Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_2
    return-void
.end method

.method private final H(Lo/a;Ljava/util/Collection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lo/a<",
            "Ljava/lang/String;",
            "Landroid/view/View;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lo/a;->entrySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const-string p1, "entries"

    .line 6
    .line 7
    invoke-static {p0, p1}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    new-instance p1, Landroidx/fragment/app/k$d;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Landroidx/fragment/app/k$d;-><init>(Ljava/util/Collection;)V

    .line 13
    .line 14
    .line 15
    invoke-static {p0, p1}, Li4/m;->F(Ljava/lang/Iterable;Lu4/l;)Z

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private final I(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/k$a;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/fragment/app/W$c;",
            ">;Z",
            "Ljava/util/Map<",
            "Landroidx/fragment/app/W$c;",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 6
    .line 7
    .line 8
    move-result-object v6

    .line 9
    new-instance v7, Ljava/util/ArrayList;

    .line 10
    .line 11
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 12
    .line 13
    .line 14
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object v8

    .line 18
    const/4 v9, 0x0

    .line 19
    move v0, v9

    .line 20
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const-string v10, " has started."

    .line 25
    .line 26
    const-string v2, "context"

    .line 27
    .line 28
    const-string v11, "FragmentManager"

    .line 29
    .line 30
    const/4 v12, 0x2

    .line 31
    if-eqz v1, :cond_8

    .line 32
    .line 33
    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    move-object v5, v1

    .line 38
    check-cast v5, Landroidx/fragment/app/k$a;

    .line 39
    .line 40
    invoke-virtual {v5}, Landroidx/fragment/app/k$b;->d()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_0

    .line 45
    .line 46
    invoke-virtual {v5}, Landroidx/fragment/app/k$b;->a()V

    .line 47
    .line 48
    .line 49
    :goto_1
    move-object/from16 v14, p4

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_0
    invoke-static {v6, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v5, v6}, Landroidx/fragment/app/k$a;->e(Landroid/content/Context;)Landroidx/fragment/app/t$a;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    if-nez v1, :cond_1

    .line 60
    .line 61
    invoke-virtual {v5}, Landroidx/fragment/app/k$b;->a()V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_1
    iget-object v13, v1, Landroidx/fragment/app/t$a;->b:Landroid/animation/Animator;

    .line 66
    .line 67
    if-nez v13, :cond_2

    .line 68
    .line 69
    invoke-interface {v7, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_2
    invoke-virtual {v5}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 74
    .line 75
    .line 76
    move-result-object v4

    .line 77
    invoke-virtual {v4}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    move-object/from16 v14, p4

    .line 82
    .line 83
    invoke-interface {v14, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v2

    .line 87
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 88
    .line 89
    invoke-static {v2, v3}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    if-eqz v2, :cond_4

    .line 94
    .line 95
    invoke-static {v12}, Landroidx/fragment/app/F;->J0(I)Z

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    if-eqz v2, :cond_3

    .line 100
    .line 101
    new-instance v2, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 104
    .line 105
    .line 106
    const-string v3, "Ignoring Animator set on "

    .line 107
    .line 108
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    const-string v1, " as this Fragment was involved in a Transition."

    .line 115
    .line 116
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-static {v11, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 124
    .line 125
    .line 126
    :cond_3
    invoke-virtual {v5}, Landroidx/fragment/app/k$b;->a()V

    .line 127
    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_4
    invoke-virtual {v4}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    sget-object v2, Landroidx/fragment/app/W$c$b;->j:Landroidx/fragment/app/W$c$b;

    .line 135
    .line 136
    const/4 v15, 0x1

    .line 137
    if-ne v0, v2, :cond_5

    .line 138
    .line 139
    move v3, v15

    .line 140
    goto :goto_2

    .line 141
    :cond_5
    move v3, v9

    .line 142
    :goto_2
    move-object/from16 v0, p2

    .line 143
    .line 144
    if-eqz v3, :cond_6

    .line 145
    .line 146
    invoke-interface {v0, v4}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    :cond_6
    iget-object v2, v1, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 150
    .line 151
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 156
    .line 157
    .line 158
    new-instance v0, Landroidx/fragment/app/k$e;

    .line 159
    .line 160
    move-object/from16 v1, p0

    .line 161
    .line 162
    invoke-direct/range {v0 .. v5}, Landroidx/fragment/app/k$e;-><init>(Landroidx/fragment/app/k;Landroid/view/View;ZLandroidx/fragment/app/W$c;Landroidx/fragment/app/k$a;)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v13, v0}, Landroid/animation/Animator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 166
    .line 167
    .line 168
    invoke-virtual {v13, v2}, Landroid/animation/Animator;->setTarget(Ljava/lang/Object;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v13}, Landroid/animation/Animator;->start()V

    .line 172
    .line 173
    .line 174
    invoke-static {v12}, Landroidx/fragment/app/F;->J0(I)Z

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    if-eqz v0, :cond_7

    .line 179
    .line 180
    new-instance v0, Ljava/lang/StringBuilder;

    .line 181
    .line 182
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 183
    .line 184
    .line 185
    const-string v2, "Animator from operation "

    .line 186
    .line 187
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-static {v11, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 201
    .line 202
    .line 203
    :cond_7
    invoke-virtual {v5}, Landroidx/fragment/app/k$b;->c()LF/d;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    new-instance v2, Landroidx/fragment/app/e;

    .line 208
    .line 209
    invoke-direct {v2, v13, v4}, Landroidx/fragment/app/e;-><init>(Landroid/animation/Animator;Landroidx/fragment/app/W$c;)V

    .line 210
    .line 211
    .line 212
    invoke-virtual {v0, v2}, LF/d;->b(LF/d$a;)V

    .line 213
    .line 214
    .line 215
    move v0, v15

    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :cond_8
    move-object/from16 v1, p0

    .line 219
    .line 220
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 221
    .line 222
    .line 223
    move-result-object v3

    .line 224
    :goto_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 225
    .line 226
    .line 227
    move-result v4

    .line 228
    if-eqz v4, :cond_11

    .line 229
    .line 230
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v4

    .line 234
    check-cast v4, Landroidx/fragment/app/k$a;

    .line 235
    .line 236
    invoke-virtual {v4}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 237
    .line 238
    .line 239
    move-result-object v5

    .line 240
    invoke-virtual {v5}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 241
    .line 242
    .line 243
    move-result-object v7

    .line 244
    const-string v8, "Ignoring Animation set on "

    .line 245
    .line 246
    if-eqz p3, :cond_a

    .line 247
    .line 248
    invoke-static {v12}, Landroidx/fragment/app/F;->J0(I)Z

    .line 249
    .line 250
    .line 251
    move-result v5

    .line 252
    if-eqz v5, :cond_9

    .line 253
    .line 254
    new-instance v5, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 263
    .line 264
    .line 265
    const-string v7, " as Animations cannot run alongside Transitions."

    .line 266
    .line 267
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    invoke-static {v11, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 275
    .line 276
    .line 277
    :cond_9
    invoke-virtual {v4}, Landroidx/fragment/app/k$b;->a()V

    .line 278
    .line 279
    .line 280
    goto :goto_3

    .line 281
    :cond_a
    if-eqz v0, :cond_c

    .line 282
    .line 283
    invoke-static {v12}, Landroidx/fragment/app/F;->J0(I)Z

    .line 284
    .line 285
    .line 286
    move-result v5

    .line 287
    if-eqz v5, :cond_b

    .line 288
    .line 289
    new-instance v5, Ljava/lang/StringBuilder;

    .line 290
    .line 291
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 292
    .line 293
    .line 294
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    .line 296
    .line 297
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 298
    .line 299
    .line 300
    const-string v7, " as Animations cannot run alongside Animators."

    .line 301
    .line 302
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 303
    .line 304
    .line 305
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 306
    .line 307
    .line 308
    move-result-object v5

    .line 309
    invoke-static {v11, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 310
    .line 311
    .line 312
    :cond_b
    invoke-virtual {v4}, Landroidx/fragment/app/k$b;->a()V

    .line 313
    .line 314
    .line 315
    goto :goto_3

    .line 316
    :cond_c
    iget-object v7, v7, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 317
    .line 318
    invoke-static {v6, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v4, v6}, Landroidx/fragment/app/k$a;->e(Landroid/content/Context;)Landroidx/fragment/app/t$a;

    .line 322
    .line 323
    .line 324
    move-result-object v8

    .line 325
    const-string v9, "Required value was null."

    .line 326
    .line 327
    if-eqz v8, :cond_10

    .line 328
    .line 329
    iget-object v8, v8, Landroidx/fragment/app/t$a;->a:Landroid/view/animation/Animation;

    .line 330
    .line 331
    if-eqz v8, :cond_f

    .line 332
    .line 333
    invoke-virtual {v5}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 334
    .line 335
    .line 336
    move-result-object v9

    .line 337
    sget-object v13, Landroidx/fragment/app/W$c$b;->h:Landroidx/fragment/app/W$c$b;

    .line 338
    .line 339
    if-eq v9, v13, :cond_d

    .line 340
    .line 341
    invoke-virtual {v7, v8}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 342
    .line 343
    .line 344
    invoke-virtual {v4}, Landroidx/fragment/app/k$b;->a()V

    .line 345
    .line 346
    .line 347
    goto :goto_4

    .line 348
    :cond_d
    invoke-virtual {v1}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 349
    .line 350
    .line 351
    move-result-object v9

    .line 352
    invoke-virtual {v9, v7}, Landroid/view/ViewGroup;->startViewTransition(Landroid/view/View;)V

    .line 353
    .line 354
    .line 355
    new-instance v9, Landroidx/fragment/app/t$b;

    .line 356
    .line 357
    invoke-virtual {v1}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 358
    .line 359
    .line 360
    move-result-object v13

    .line 361
    invoke-direct {v9, v8, v13, v7}, Landroidx/fragment/app/t$b;-><init>(Landroid/view/animation/Animation;Landroid/view/ViewGroup;Landroid/view/View;)V

    .line 362
    .line 363
    .line 364
    new-instance v8, Landroidx/fragment/app/k$f;

    .line 365
    .line 366
    invoke-direct {v8, v5, v1, v7, v4}, Landroidx/fragment/app/k$f;-><init>(Landroidx/fragment/app/W$c;Landroidx/fragment/app/k;Landroid/view/View;Landroidx/fragment/app/k$a;)V

    .line 367
    .line 368
    .line 369
    invoke-virtual {v9, v8}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 370
    .line 371
    .line 372
    invoke-virtual {v7, v9}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 373
    .line 374
    .line 375
    invoke-static {v12}, Landroidx/fragment/app/F;->J0(I)Z

    .line 376
    .line 377
    .line 378
    move-result v8

    .line 379
    if-eqz v8, :cond_e

    .line 380
    .line 381
    new-instance v8, Ljava/lang/StringBuilder;

    .line 382
    .line 383
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 384
    .line 385
    .line 386
    const-string v9, "Animation from operation "

    .line 387
    .line 388
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    .line 390
    .line 391
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 398
    .line 399
    .line 400
    move-result-object v8

    .line 401
    invoke-static {v11, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 402
    .line 403
    .line 404
    :cond_e
    :goto_4
    invoke-virtual {v4}, Landroidx/fragment/app/k$b;->c()LF/d;

    .line 405
    .line 406
    .line 407
    move-result-object v8

    .line 408
    new-instance v9, Landroidx/fragment/app/f;

    .line 409
    .line 410
    invoke-direct {v9, v7, v1, v4, v5}, Landroidx/fragment/app/f;-><init>(Landroid/view/View;Landroidx/fragment/app/k;Landroidx/fragment/app/k$a;Landroidx/fragment/app/W$c;)V

    .line 411
    .line 412
    .line 413
    invoke-virtual {v8, v9}, LF/d;->b(LF/d$a;)V

    .line 414
    .line 415
    .line 416
    goto/16 :goto_3

    .line 417
    .line 418
    :cond_f
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 419
    .line 420
    invoke-direct {v0, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    throw v0

    .line 424
    :cond_10
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 425
    .line 426
    invoke-direct {v0, v9}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    throw v0

    .line 430
    :cond_11
    return-void
.end method

.method private static final J(Landroid/animation/Animator;Landroidx/fragment/app/W$c;)V
    .locals 1

    .line 1
    const-string v0, "$operation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/animation/Animator;->end()V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x2

    .line 10
    invoke-static {p0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    new-instance p0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 19
    .line 20
    .line 21
    const-string v0, "Animator from operation "

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, " has been canceled."

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const-string p1, "FragmentManager"

    .line 39
    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method private static final K(Landroid/view/View;Landroidx/fragment/app/k;Landroidx/fragment/app/k$a;Landroidx/fragment/app/W$c;)V
    .locals 1

    .line 1
    const-string v0, "this$0"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$animationInfo"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "$operation"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Landroid/view/View;->clearAnimation()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-virtual {p1, p0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p2}, Landroidx/fragment/app/k$b;->a()V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x2

    .line 30
    invoke-static {p0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-eqz p0, :cond_0

    .line 35
    .line 36
    new-instance p0, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    const-string p1, "Animation from operation "

    .line 42
    .line 43
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string p1, " has been cancelled."

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p1, "FragmentManager"

    .line 59
    .line 60
    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    .line 62
    .line 63
    :cond_0
    return-void
.end method

.method private final L(Ljava/util/List;Ljava/util/List;ZLandroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;)Ljava/util/Map;
    .locals 31
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroidx/fragment/app/k$c;",
            ">;",
            "Ljava/util/List<",
            "Landroidx/fragment/app/W$c;",
            ">;Z",
            "Landroidx/fragment/app/W$c;",
            "Landroidx/fragment/app/W$c;",
            ")",
            "Ljava/util/Map<",
            "Landroidx/fragment/app/W$c;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    move-object/from16 v3, p5

    .line 8
    .line 9
    new-instance v4, Ljava/util/LinkedHashMap;

    .line 10
    .line 11
    invoke-direct {v4}, Ljava/util/LinkedHashMap;-><init>()V

    .line 12
    .line 13
    .line 14
    new-instance v5, Ljava/util/ArrayList;

    .line 15
    .line 16
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 17
    .line 18
    .line 19
    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v7

    .line 27
    if-eqz v7, :cond_1

    .line 28
    .line 29
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v7

    .line 33
    move-object v8, v7

    .line 34
    check-cast v8, Landroidx/fragment/app/k$c;

    .line 35
    .line 36
    invoke-virtual {v8}, Landroidx/fragment/app/k$b;->d()Z

    .line 37
    .line 38
    .line 39
    move-result v8

    .line 40
    if-nez v8, :cond_0

    .line 41
    .line 42
    invoke-interface {v5, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    new-instance v6, Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 52
    .line 53
    .line 54
    move-result-object v5

    .line 55
    :cond_2
    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    if-eqz v7, :cond_3

    .line 60
    .line 61
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object v7

    .line 65
    move-object v8, v7

    .line 66
    check-cast v8, Landroidx/fragment/app/k$c;

    .line 67
    .line 68
    invoke-virtual {v8}, Landroidx/fragment/app/k$c;->e()Landroidx/fragment/app/Q;

    .line 69
    .line 70
    .line 71
    move-result-object v8

    .line 72
    if-eqz v8, :cond_2

    .line 73
    .line 74
    invoke-interface {v6, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_3
    invoke-interface {v6}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    const/4 v7, 0x0

    .line 83
    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 84
    .line 85
    .line 86
    move-result v8

    .line 87
    if-eqz v8, :cond_6

    .line 88
    .line 89
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    check-cast v8, Landroidx/fragment/app/k$c;

    .line 94
    .line 95
    invoke-virtual {v8}, Landroidx/fragment/app/k$c;->e()Landroidx/fragment/app/Q;

    .line 96
    .line 97
    .line 98
    move-result-object v9

    .line 99
    if-eqz v7, :cond_5

    .line 100
    .line 101
    if-ne v9, v7, :cond_4

    .line 102
    .line 103
    goto :goto_3

    .line 104
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v1, "Mixing framework transitions and AndroidX transitions is not allowed. Fragment "

    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {v8}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 115
    .line 116
    .line 117
    move-result-object v1

    .line 118
    invoke-virtual {v1}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    const-string v1, " returned Transition "

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v8}, Landroidx/fragment/app/k$c;->h()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    const-string v1, " which uses a different Transition type than other Fragments."

    .line 138
    .line 139
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    new-instance v1, Ljava/lang/IllegalArgumentException;

    .line 147
    .line 148
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    throw v1

    .line 156
    :cond_5
    :goto_3
    move-object v7, v9

    .line 157
    goto :goto_2

    .line 158
    :cond_6
    if-nez v7, :cond_8

    .line 159
    .line 160
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    if-eqz v1, :cond_7

    .line 169
    .line 170
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v1

    .line 174
    check-cast v1, Landroidx/fragment/app/k$c;

    .line 175
    .line 176
    invoke-virtual {v1}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 181
    .line 182
    invoke-interface {v4, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v1}, Landroidx/fragment/app/k$b;->a()V

    .line 186
    .line 187
    .line 188
    goto :goto_4

    .line 189
    :cond_7
    move-object v0, v4

    .line 190
    goto/16 :goto_20

    .line 191
    .line 192
    :cond_8
    new-instance v5, Landroid/view/View;

    .line 193
    .line 194
    invoke-virtual {v0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 195
    .line 196
    .line 197
    move-result-object v8

    .line 198
    invoke-virtual {v8}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 199
    .line 200
    .line 201
    move-result-object v8

    .line 202
    invoke-direct {v5, v8}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 203
    .line 204
    .line 205
    new-instance v15, Landroid/graphics/Rect;

    .line 206
    .line 207
    invoke-direct {v15}, Landroid/graphics/Rect;-><init>()V

    .line 208
    .line 209
    .line 210
    new-instance v8, Ljava/util/ArrayList;

    .line 211
    .line 212
    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    .line 213
    .line 214
    .line 215
    new-instance v14, Ljava/util/ArrayList;

    .line 216
    .line 217
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 218
    .line 219
    .line 220
    new-instance v9, Lo/a;

    .line 221
    .line 222
    invoke-direct {v9}, Lo/a;-><init>()V

    .line 223
    .line 224
    .line 225
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 226
    .line 227
    .line 228
    move-result-object v16

    .line 229
    const/4 v11, 0x0

    .line 230
    const/4 v12, 0x0

    .line 231
    const/16 v17, 0x0

    .line 232
    .line 233
    :goto_5
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    .line 234
    .line 235
    .line 236
    move-result v13

    .line 237
    const/16 v18, 0x2

    .line 238
    .line 239
    move-object/from16 v19, v11

    .line 240
    .line 241
    const-string v11, "FragmentManager"

    .line 242
    .line 243
    if-eqz v13, :cond_22

    .line 244
    .line 245
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v13

    .line 249
    check-cast v13, Landroidx/fragment/app/k$c;

    .line 250
    .line 251
    invoke-virtual {v13}, Landroidx/fragment/app/k$c;->i()Z

    .line 252
    .line 253
    .line 254
    move-result v20

    .line 255
    if-eqz v20, :cond_21

    .line 256
    .line 257
    if-eqz v2, :cond_21

    .line 258
    .line 259
    if-eqz v3, :cond_21

    .line 260
    .line 261
    invoke-virtual {v13}, Landroidx/fragment/app/k$c;->g()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v13

    .line 265
    invoke-virtual {v7, v13}, Landroidx/fragment/app/Q;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v13

    .line 269
    invoke-virtual {v7, v13}, Landroidx/fragment/app/Q;->u(Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v13

    .line 273
    invoke-virtual {v3}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 274
    .line 275
    .line 276
    move-result-object v19

    .line 277
    invoke-virtual/range {v19 .. v19}, Landroidx/fragment/app/n;->getSharedElementSourceNames()Ljava/util/ArrayList;

    .line 278
    .line 279
    .line 280
    move-result-object v10

    .line 281
    const-string v6, "lastIn.fragment.sharedElementSourceNames"

    .line 282
    .line 283
    invoke-static {v10, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 284
    .line 285
    .line 286
    invoke-virtual {v2}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 287
    .line 288
    .line 289
    move-result-object v6

    .line 290
    invoke-virtual {v6}, Landroidx/fragment/app/n;->getSharedElementSourceNames()Ljava/util/ArrayList;

    .line 291
    .line 292
    .line 293
    move-result-object v6

    .line 294
    move-object/from16 v22, v12

    .line 295
    .line 296
    const-string v12, "firstOut.fragment.sharedElementSourceNames"

    .line 297
    .line 298
    invoke-static {v6, v12}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 299
    .line 300
    .line 301
    invoke-virtual {v2}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 302
    .line 303
    .line 304
    move-result-object v12

    .line 305
    invoke-virtual {v12}, Landroidx/fragment/app/n;->getSharedElementTargetNames()Ljava/util/ArrayList;

    .line 306
    .line 307
    .line 308
    move-result-object v12

    .line 309
    move-object/from16 v23, v4

    .line 310
    .line 311
    const-string v4, "firstOut.fragment.sharedElementTargetNames"

    .line 312
    .line 313
    invoke-static {v12, v4}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    invoke-virtual {v12}, Ljava/util/ArrayList;->size()I

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    move-object/from16 v24, v5

    .line 321
    .line 322
    move-object/from16 v25, v15

    .line 323
    .line 324
    const/4 v5, 0x0

    .line 325
    :goto_6
    const/4 v15, -0x1

    .line 326
    if-ge v5, v4, :cond_a

    .line 327
    .line 328
    move/from16 v19, v4

    .line 329
    .line 330
    invoke-virtual {v12, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v4

    .line 334
    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    .line 335
    .line 336
    .line 337
    move-result v4

    .line 338
    if-eq v4, v15, :cond_9

    .line 339
    .line 340
    invoke-virtual {v6, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v15

    .line 344
    invoke-virtual {v10, v4, v15}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    :cond_9
    add-int/lit8 v5, v5, 0x1

    .line 348
    .line 349
    move/from16 v4, v19

    .line 350
    .line 351
    goto :goto_6

    .line 352
    :cond_a
    invoke-virtual {v3}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 353
    .line 354
    .line 355
    move-result-object v4

    .line 356
    invoke-virtual {v4}, Landroidx/fragment/app/n;->getSharedElementTargetNames()Ljava/util/ArrayList;

    .line 357
    .line 358
    .line 359
    move-result-object v4

    .line 360
    const-string v5, "lastIn.fragment.sharedElementTargetNames"

    .line 361
    .line 362
    invoke-static {v4, v5}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    if-nez v1, :cond_b

    .line 366
    .line 367
    invoke-virtual {v2}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 368
    .line 369
    .line 370
    move-result-object v5

    .line 371
    invoke-virtual {v5}, Landroidx/fragment/app/n;->getExitTransitionCallback()Landroidx/core/app/r;

    .line 372
    .line 373
    .line 374
    move-result-object v5

    .line 375
    invoke-virtual {v3}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 376
    .line 377
    .line 378
    move-result-object v6

    .line 379
    invoke-virtual {v6}, Landroidx/fragment/app/n;->getEnterTransitionCallback()Landroidx/core/app/r;

    .line 380
    .line 381
    .line 382
    move-result-object v6

    .line 383
    invoke-static {v5, v6}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 384
    .line 385
    .line 386
    move-result-object v5

    .line 387
    goto :goto_7

    .line 388
    :cond_b
    invoke-virtual {v2}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 389
    .line 390
    .line 391
    move-result-object v5

    .line 392
    invoke-virtual {v5}, Landroidx/fragment/app/n;->getEnterTransitionCallback()Landroidx/core/app/r;

    .line 393
    .line 394
    .line 395
    move-result-object v5

    .line 396
    invoke-virtual {v3}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 397
    .line 398
    .line 399
    move-result-object v6

    .line 400
    invoke-virtual {v6}, Landroidx/fragment/app/n;->getExitTransitionCallback()Landroidx/core/app/r;

    .line 401
    .line 402
    .line 403
    move-result-object v6

    .line 404
    invoke-static {v5, v6}, Lh4/q;->a(Ljava/lang/Object;Ljava/lang/Object;)Lh4/l;

    .line 405
    .line 406
    .line 407
    move-result-object v5

    .line 408
    :goto_7
    invoke-virtual {v5}, Lh4/l;->a()Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    move-result-object v6

    .line 412
    check-cast v6, Landroidx/core/app/r;

    .line 413
    .line 414
    invoke-virtual {v5}, Lh4/l;->b()Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    move-result-object v5

    .line 418
    check-cast v5, Landroidx/core/app/r;

    .line 419
    .line 420
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 421
    .line 422
    .line 423
    move-result v12

    .line 424
    move/from16 v19, v15

    .line 425
    .line 426
    const/4 v15, 0x0

    .line 427
    :goto_8
    if-ge v15, v12, :cond_c

    .line 428
    .line 429
    invoke-virtual {v10, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    move-result-object v26

    .line 433
    move/from16 v27, v12

    .line 434
    .line 435
    move-object/from16 v12, v26

    .line 436
    .line 437
    check-cast v12, Ljava/lang/String;

    .line 438
    .line 439
    invoke-virtual {v4, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 440
    .line 441
    .line 442
    move-result-object v26

    .line 443
    move/from16 v28, v15

    .line 444
    .line 445
    move-object/from16 v15, v26

    .line 446
    .line 447
    check-cast v15, Ljava/lang/String;

    .line 448
    .line 449
    invoke-interface {v9, v12, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    add-int/lit8 v15, v28, 0x1

    .line 453
    .line 454
    move/from16 v12, v27

    .line 455
    .line 456
    goto :goto_8

    .line 457
    :cond_c
    invoke-static/range {v18 .. v18}, Landroidx/fragment/app/F;->J0(I)Z

    .line 458
    .line 459
    .line 460
    move-result v12

    .line 461
    if-eqz v12, :cond_e

    .line 462
    .line 463
    const-string v12, ">>> entering view names <<<"

    .line 464
    .line 465
    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 466
    .line 467
    .line 468
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 469
    .line 470
    .line 471
    move-result-object v12

    .line 472
    :goto_9
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    .line 473
    .line 474
    .line 475
    move-result v15

    .line 476
    move-object/from16 v26, v12

    .line 477
    .line 478
    const-string v12, "Name: "

    .line 479
    .line 480
    if-eqz v15, :cond_d

    .line 481
    .line 482
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    move-result-object v15

    .line 486
    check-cast v15, Ljava/lang/String;

    .line 487
    .line 488
    move-object/from16 v27, v14

    .line 489
    .line 490
    new-instance v14, Ljava/lang/StringBuilder;

    .line 491
    .line 492
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 493
    .line 494
    .line 495
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 496
    .line 497
    .line 498
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 499
    .line 500
    .line 501
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 502
    .line 503
    .line 504
    move-result-object v12

    .line 505
    invoke-static {v11, v12}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 506
    .line 507
    .line 508
    move-object/from16 v12, v26

    .line 509
    .line 510
    move-object/from16 v14, v27

    .line 511
    .line 512
    goto :goto_9

    .line 513
    :cond_d
    move-object/from16 v27, v14

    .line 514
    .line 515
    const-string v14, ">>> exiting view names <<<"

    .line 516
    .line 517
    invoke-static {v11, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 518
    .line 519
    .line 520
    invoke-virtual {v10}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 521
    .line 522
    .line 523
    move-result-object v14

    .line 524
    :goto_a
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 525
    .line 526
    .line 527
    move-result v15

    .line 528
    if-eqz v15, :cond_f

    .line 529
    .line 530
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 531
    .line 532
    .line 533
    move-result-object v15

    .line 534
    check-cast v15, Ljava/lang/String;

    .line 535
    .line 536
    move-object/from16 v26, v14

    .line 537
    .line 538
    new-instance v14, Ljava/lang/StringBuilder;

    .line 539
    .line 540
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 541
    .line 542
    .line 543
    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 544
    .line 545
    .line 546
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 547
    .line 548
    .line 549
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v14

    .line 553
    invoke-static {v11, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 554
    .line 555
    .line 556
    move-object/from16 v14, v26

    .line 557
    .line 558
    goto :goto_a

    .line 559
    :cond_e
    move-object/from16 v27, v14

    .line 560
    .line 561
    :cond_f
    new-instance v12, Lo/a;

    .line 562
    .line 563
    invoke-direct {v12}, Lo/a;-><init>()V

    .line 564
    .line 565
    .line 566
    invoke-virtual {v2}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 567
    .line 568
    .line 569
    move-result-object v14

    .line 570
    iget-object v14, v14, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 571
    .line 572
    const-string v15, "firstOut.fragment.mView"

    .line 573
    .line 574
    invoke-static {v14, v15}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 575
    .line 576
    .line 577
    invoke-direct {v0, v12, v14}, Landroidx/fragment/app/k;->G(Ljava/util/Map;Landroid/view/View;)V

    .line 578
    .line 579
    .line 580
    invoke-virtual {v12, v10}, Lo/a;->n(Ljava/util/Collection;)Z

    .line 581
    .line 582
    .line 583
    if-eqz v6, :cond_14

    .line 584
    .line 585
    invoke-static/range {v18 .. v18}, Landroidx/fragment/app/F;->J0(I)Z

    .line 586
    .line 587
    .line 588
    move-result v14

    .line 589
    if-eqz v14, :cond_10

    .line 590
    .line 591
    new-instance v14, Ljava/lang/StringBuilder;

    .line 592
    .line 593
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 594
    .line 595
    .line 596
    const-string v15, "Executing exit callback for operation "

    .line 597
    .line 598
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 599
    .line 600
    .line 601
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 602
    .line 603
    .line 604
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object v14

    .line 608
    invoke-static {v11, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 609
    .line 610
    .line 611
    :cond_10
    invoke-virtual {v6, v10, v12}, Landroidx/core/app/r;->d(Ljava/util/List;Ljava/util/Map;)V

    .line 612
    .line 613
    .line 614
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 615
    .line 616
    .line 617
    move-result v6

    .line 618
    add-int/lit8 v6, v6, -0x1

    .line 619
    .line 620
    if-ltz v6, :cond_15

    .line 621
    .line 622
    :goto_b
    add-int/lit8 v14, v6, -0x1

    .line 623
    .line 624
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 625
    .line 626
    .line 627
    move-result-object v6

    .line 628
    check-cast v6, Ljava/lang/String;

    .line 629
    .line 630
    invoke-virtual {v12, v6}, Lo/a;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    .line 632
    .line 633
    move-result-object v15

    .line 634
    check-cast v15, Landroid/view/View;

    .line 635
    .line 636
    if-nez v15, :cond_11

    .line 637
    .line 638
    invoke-virtual {v9, v6}, Lo/a;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 639
    .line 640
    .line 641
    move/from16 v26, v14

    .line 642
    .line 643
    goto :goto_c

    .line 644
    :cond_11
    move/from16 v26, v14

    .line 645
    .line 646
    invoke-static {v15}, LJ/I;->E(Landroid/view/View;)Ljava/lang/String;

    .line 647
    .line 648
    .line 649
    move-result-object v14

    .line 650
    invoke-static {v6, v14}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 651
    .line 652
    .line 653
    move-result v14

    .line 654
    if-nez v14, :cond_12

    .line 655
    .line 656
    invoke-virtual {v9, v6}, Lo/a;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 657
    .line 658
    .line 659
    move-result-object v6

    .line 660
    check-cast v6, Ljava/lang/String;

    .line 661
    .line 662
    invoke-static {v15}, LJ/I;->E(Landroid/view/View;)Ljava/lang/String;

    .line 663
    .line 664
    .line 665
    move-result-object v14

    .line 666
    invoke-interface {v9, v14, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 667
    .line 668
    .line 669
    :cond_12
    :goto_c
    if-gez v26, :cond_13

    .line 670
    .line 671
    goto :goto_d

    .line 672
    :cond_13
    move/from16 v6, v26

    .line 673
    .line 674
    goto :goto_b

    .line 675
    :cond_14
    invoke-virtual {v12}, Lo/a;->keySet()Ljava/util/Set;

    .line 676
    .line 677
    .line 678
    move-result-object v6

    .line 679
    invoke-virtual {v9, v6}, Lo/a;->n(Ljava/util/Collection;)Z

    .line 680
    .line 681
    .line 682
    :cond_15
    :goto_d
    new-instance v6, Lo/a;

    .line 683
    .line 684
    invoke-direct {v6}, Lo/a;-><init>()V

    .line 685
    .line 686
    .line 687
    invoke-virtual {v3}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 688
    .line 689
    .line 690
    move-result-object v14

    .line 691
    iget-object v14, v14, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 692
    .line 693
    const-string v15, "lastIn.fragment.mView"

    .line 694
    .line 695
    invoke-static {v14, v15}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 696
    .line 697
    .line 698
    invoke-direct {v0, v6, v14}, Landroidx/fragment/app/k;->G(Ljava/util/Map;Landroid/view/View;)V

    .line 699
    .line 700
    .line 701
    invoke-virtual {v6, v4}, Lo/a;->n(Ljava/util/Collection;)Z

    .line 702
    .line 703
    .line 704
    invoke-virtual {v9}, Lo/a;->values()Ljava/util/Collection;

    .line 705
    .line 706
    .line 707
    move-result-object v14

    .line 708
    invoke-virtual {v6, v14}, Lo/a;->n(Ljava/util/Collection;)Z

    .line 709
    .line 710
    .line 711
    if-eqz v5, :cond_1b

    .line 712
    .line 713
    invoke-static/range {v18 .. v18}, Landroidx/fragment/app/F;->J0(I)Z

    .line 714
    .line 715
    .line 716
    move-result v14

    .line 717
    if-eqz v14, :cond_16

    .line 718
    .line 719
    new-instance v14, Ljava/lang/StringBuilder;

    .line 720
    .line 721
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 722
    .line 723
    .line 724
    const-string v15, "Executing enter callback for operation "

    .line 725
    .line 726
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 727
    .line 728
    .line 729
    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 730
    .line 731
    .line 732
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 733
    .line 734
    .line 735
    move-result-object v14

    .line 736
    invoke-static {v11, v14}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 737
    .line 738
    .line 739
    :cond_16
    invoke-virtual {v5, v4, v6}, Landroidx/core/app/r;->d(Ljava/util/List;Ljava/util/Map;)V

    .line 740
    .line 741
    .line 742
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 743
    .line 744
    .line 745
    move-result v5

    .line 746
    add-int/lit8 v5, v5, -0x1

    .line 747
    .line 748
    if-ltz v5, :cond_1c

    .line 749
    .line 750
    :goto_e
    add-int/lit8 v11, v5, -0x1

    .line 751
    .line 752
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 753
    .line 754
    .line 755
    move-result-object v5

    .line 756
    check-cast v5, Ljava/lang/String;

    .line 757
    .line 758
    invoke-virtual {v6, v5}, Lo/a;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 759
    .line 760
    .line 761
    move-result-object v14

    .line 762
    check-cast v14, Landroid/view/View;

    .line 763
    .line 764
    const-string v15, "name"

    .line 765
    .line 766
    if-nez v14, :cond_18

    .line 767
    .line 768
    invoke-static {v5, v15}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 769
    .line 770
    .line 771
    invoke-static {v9, v5}, Landroidx/fragment/app/O;->b(Lo/a;Ljava/lang/String;)Ljava/lang/String;

    .line 772
    .line 773
    .line 774
    move-result-object v5

    .line 775
    if-eqz v5, :cond_17

    .line 776
    .line 777
    invoke-virtual {v9, v5}, Lo/a;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 778
    .line 779
    .line 780
    :cond_17
    move/from16 v18, v11

    .line 781
    .line 782
    goto :goto_f

    .line 783
    :cond_18
    move/from16 v18, v11

    .line 784
    .line 785
    invoke-static {v14}, LJ/I;->E(Landroid/view/View;)Ljava/lang/String;

    .line 786
    .line 787
    .line 788
    move-result-object v11

    .line 789
    invoke-static {v5, v11}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 790
    .line 791
    .line 792
    move-result v11

    .line 793
    if-nez v11, :cond_19

    .line 794
    .line 795
    invoke-static {v5, v15}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 796
    .line 797
    .line 798
    invoke-static {v9, v5}, Landroidx/fragment/app/O;->b(Lo/a;Ljava/lang/String;)Ljava/lang/String;

    .line 799
    .line 800
    .line 801
    move-result-object v5

    .line 802
    if-eqz v5, :cond_19

    .line 803
    .line 804
    invoke-static {v14}, LJ/I;->E(Landroid/view/View;)Ljava/lang/String;

    .line 805
    .line 806
    .line 807
    move-result-object v11

    .line 808
    invoke-interface {v9, v5, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 809
    .line 810
    .line 811
    :cond_19
    :goto_f
    if-gez v18, :cond_1a

    .line 812
    .line 813
    goto :goto_10

    .line 814
    :cond_1a
    move/from16 v5, v18

    .line 815
    .line 816
    goto :goto_e

    .line 817
    :cond_1b
    invoke-static {v9, v6}, Landroidx/fragment/app/O;->d(Lo/a;Lo/a;)V

    .line 818
    .line 819
    .line 820
    :cond_1c
    :goto_10
    invoke-virtual {v9}, Lo/a;->keySet()Ljava/util/Set;

    .line 821
    .line 822
    .line 823
    move-result-object v5

    .line 824
    const-string v11, "sharedElementNameMapping.keys"

    .line 825
    .line 826
    invoke-static {v5, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 827
    .line 828
    .line 829
    invoke-direct {v0, v12, v5}, Landroidx/fragment/app/k;->H(Lo/a;Ljava/util/Collection;)V

    .line 830
    .line 831
    .line 832
    invoke-virtual {v9}, Lo/a;->values()Ljava/util/Collection;

    .line 833
    .line 834
    .line 835
    move-result-object v5

    .line 836
    const-string v11, "sharedElementNameMapping.values"

    .line 837
    .line 838
    invoke-static {v5, v11}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 839
    .line 840
    .line 841
    invoke-direct {v0, v6, v5}, Landroidx/fragment/app/k;->H(Lo/a;Ljava/util/Collection;)V

    .line 842
    .line 843
    .line 844
    invoke-virtual {v9}, Lo/r;->isEmpty()Z

    .line 845
    .line 846
    .line 847
    move-result v5

    .line 848
    if-eqz v5, :cond_1d

    .line 849
    .line 850
    invoke-virtual {v8}, Ljava/util/ArrayList;->clear()V

    .line 851
    .line 852
    .line 853
    invoke-virtual/range {v27 .. v27}, Ljava/util/ArrayList;->clear()V

    .line 854
    .line 855
    .line 856
    move-object/from16 v12, v22

    .line 857
    .line 858
    move-object/from16 v4, v23

    .line 859
    .line 860
    move-object/from16 v5, v24

    .line 861
    .line 862
    move-object/from16 v15, v25

    .line 863
    .line 864
    move-object/from16 v14, v27

    .line 865
    .line 866
    const/4 v11, 0x0

    .line 867
    goto/16 :goto_5

    .line 868
    .line 869
    :cond_1d
    invoke-virtual {v3}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 870
    .line 871
    .line 872
    move-result-object v5

    .line 873
    invoke-virtual {v2}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 874
    .line 875
    .line 876
    move-result-object v11

    .line 877
    const/4 v15, 0x1

    .line 878
    invoke-static {v5, v11, v1, v12, v15}, Landroidx/fragment/app/O;->a(Landroidx/fragment/app/n;Landroidx/fragment/app/n;ZLo/a;Z)V

    .line 879
    .line 880
    .line 881
    invoke-virtual {v0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 882
    .line 883
    .line 884
    move-result-object v5

    .line 885
    new-instance v11, Landroidx/fragment/app/g;

    .line 886
    .line 887
    invoke-direct {v11, v3, v2, v1, v6}, Landroidx/fragment/app/g;-><init>(Landroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;ZLo/a;)V

    .line 888
    .line 889
    .line 890
    invoke-static {v5, v11}, LJ/z;->a(Landroid/view/View;Ljava/lang/Runnable;)LJ/z;

    .line 891
    .line 892
    .line 893
    invoke-virtual {v12}, Lo/a;->values()Ljava/util/Collection;

    .line 894
    .line 895
    .line 896
    move-result-object v5

    .line 897
    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 898
    .line 899
    .line 900
    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    .line 901
    .line 902
    .line 903
    move-result v5

    .line 904
    if-nez v5, :cond_1e

    .line 905
    .line 906
    const/4 v5, 0x0

    .line 907
    invoke-virtual {v10, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 908
    .line 909
    .line 910
    move-result-object v10

    .line 911
    check-cast v10, Ljava/lang/String;

    .line 912
    .line 913
    invoke-virtual {v12, v10}, Lo/a;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 914
    .line 915
    .line 916
    move-result-object v5

    .line 917
    check-cast v5, Landroid/view/View;

    .line 918
    .line 919
    invoke-virtual {v7, v13, v5}, Landroidx/fragment/app/Q;->p(Ljava/lang/Object;Landroid/view/View;)V

    .line 920
    .line 921
    .line 922
    goto :goto_11

    .line 923
    :cond_1e
    move-object/from16 v5, v22

    .line 924
    .line 925
    :goto_11
    invoke-virtual {v6}, Lo/a;->values()Ljava/util/Collection;

    .line 926
    .line 927
    .line 928
    move-result-object v10

    .line 929
    move-object/from16 v14, v27

    .line 930
    .line 931
    invoke-virtual {v14, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 932
    .line 933
    .line 934
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 935
    .line 936
    .line 937
    move-result v10

    .line 938
    if-nez v10, :cond_20

    .line 939
    .line 940
    const/4 v10, 0x0

    .line 941
    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 942
    .line 943
    .line 944
    move-result-object v4

    .line 945
    check-cast v4, Ljava/lang/String;

    .line 946
    .line 947
    invoke-virtual {v6, v4}, Lo/a;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 948
    .line 949
    .line 950
    move-result-object v4

    .line 951
    check-cast v4, Landroid/view/View;

    .line 952
    .line 953
    if-eqz v4, :cond_1f

    .line 954
    .line 955
    invoke-virtual {v0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 956
    .line 957
    .line 958
    move-result-object v6

    .line 959
    new-instance v11, Landroidx/fragment/app/h;

    .line 960
    .line 961
    move-object/from16 v12, v25

    .line 962
    .line 963
    invoke-direct {v11, v7, v4, v12}, Landroidx/fragment/app/h;-><init>(Landroidx/fragment/app/Q;Landroid/view/View;Landroid/graphics/Rect;)V

    .line 964
    .line 965
    .line 966
    invoke-static {v6, v11}, LJ/z;->a(Landroid/view/View;Ljava/lang/Runnable;)LJ/z;

    .line 967
    .line 968
    .line 969
    move/from16 v17, v15

    .line 970
    .line 971
    :goto_12
    move-object/from16 v4, v24

    .line 972
    .line 973
    goto :goto_14

    .line 974
    :cond_1f
    :goto_13
    move-object/from16 v12, v25

    .line 975
    .line 976
    goto :goto_12

    .line 977
    :cond_20
    const/4 v10, 0x0

    .line 978
    goto :goto_13

    .line 979
    :goto_14
    invoke-virtual {v7, v13, v4, v8}, Landroidx/fragment/app/Q;->s(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 980
    .line 981
    .line 982
    const/4 v11, 0x0

    .line 983
    move-object/from16 v25, v12

    .line 984
    .line 985
    const/4 v12, 0x0

    .line 986
    move-object v6, v9

    .line 987
    const/4 v9, 0x0

    .line 988
    move/from16 v20, v10

    .line 989
    .line 990
    const/4 v10, 0x0

    .line 991
    move-object v15, v8

    .line 992
    move-object v8, v13

    .line 993
    move-object/from16 v21, v6

    .line 994
    .line 995
    move/from16 v6, v20

    .line 996
    .line 997
    move-object/from16 v20, v15

    .line 998
    .line 999
    invoke-virtual/range {v7 .. v14}, Landroidx/fragment/app/Q;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 1000
    .line 1001
    .line 1002
    sget-object v9, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1003
    .line 1004
    move-object/from16 v10, v23

    .line 1005
    .line 1006
    invoke-interface {v10, v2, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1007
    .line 1008
    .line 1009
    invoke-interface {v10, v3, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1010
    .line 1011
    .line 1012
    move-object v12, v5

    .line 1013
    move-object v11, v8

    .line 1014
    move-object/from16 v8, v20

    .line 1015
    .line 1016
    move-object/from16 v9, v21

    .line 1017
    .line 1018
    move-object/from16 v15, v25

    .line 1019
    .line 1020
    move-object v5, v4

    .line 1021
    move-object v4, v10

    .line 1022
    goto/16 :goto_5

    .line 1023
    .line 1024
    :cond_21
    move-object v10, v4

    .line 1025
    move-object v4, v5

    .line 1026
    move-object/from16 v20, v8

    .line 1027
    .line 1028
    move-object/from16 v21, v9

    .line 1029
    .line 1030
    move-object/from16 v22, v12

    .line 1031
    .line 1032
    move-object/from16 v25, v15

    .line 1033
    .line 1034
    const/4 v6, 0x0

    .line 1035
    move-object v5, v4

    .line 1036
    move-object v4, v10

    .line 1037
    move-object/from16 v11, v19

    .line 1038
    .line 1039
    move-object/from16 v8, v20

    .line 1040
    .line 1041
    move-object/from16 v9, v21

    .line 1042
    .line 1043
    move-object/from16 v12, v22

    .line 1044
    .line 1045
    move-object/from16 v15, v25

    .line 1046
    .line 1047
    goto/16 :goto_5

    .line 1048
    .line 1049
    :cond_22
    move-object v10, v4

    .line 1050
    move-object v4, v5

    .line 1051
    move-object/from16 v20, v8

    .line 1052
    .line 1053
    move-object/from16 v21, v9

    .line 1054
    .line 1055
    move-object/from16 v22, v12

    .line 1056
    .line 1057
    move-object v5, v15

    .line 1058
    const/4 v6, 0x0

    .line 1059
    const/4 v15, 0x1

    .line 1060
    new-instance v1, Ljava/util/ArrayList;

    .line 1061
    .line 1062
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1063
    .line 1064
    .line 1065
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1066
    .line 1067
    .line 1068
    move-result-object v16

    .line 1069
    const/4 v8, 0x0

    .line 1070
    const/4 v9, 0x0

    .line 1071
    :cond_23
    :goto_15
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    .line 1072
    .line 1073
    .line 1074
    move-result v12

    .line 1075
    if-eqz v12, :cond_2f

    .line 1076
    .line 1077
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1078
    .line 1079
    .line 1080
    move-result-object v12

    .line 1081
    move-object/from16 v23, v12

    .line 1082
    .line 1083
    check-cast v23, Landroidx/fragment/app/k$c;

    .line 1084
    .line 1085
    invoke-virtual/range {v23 .. v23}, Landroidx/fragment/app/k$b;->d()Z

    .line 1086
    .line 1087
    .line 1088
    move-result v12

    .line 1089
    if-eqz v12, :cond_24

    .line 1090
    .line 1091
    invoke-virtual/range {v23 .. v23}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 1092
    .line 1093
    .line 1094
    move-result-object v12

    .line 1095
    sget-object v13, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 1096
    .line 1097
    invoke-interface {v10, v12, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1098
    .line 1099
    .line 1100
    invoke-virtual/range {v23 .. v23}, Landroidx/fragment/app/k$b;->a()V

    .line 1101
    .line 1102
    .line 1103
    goto :goto_15

    .line 1104
    :cond_24
    invoke-virtual/range {v23 .. v23}, Landroidx/fragment/app/k$c;->h()Ljava/lang/Object;

    .line 1105
    .line 1106
    .line 1107
    move-result-object v12

    .line 1108
    invoke-virtual {v7, v12}, Landroidx/fragment/app/Q;->f(Ljava/lang/Object;)Ljava/lang/Object;

    .line 1109
    .line 1110
    .line 1111
    move-result-object v12

    .line 1112
    invoke-virtual/range {v23 .. v23}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 1113
    .line 1114
    .line 1115
    move-result-object v13

    .line 1116
    if-eqz v19, :cond_26

    .line 1117
    .line 1118
    if-eq v13, v2, :cond_25

    .line 1119
    .line 1120
    if-ne v13, v3, :cond_26

    .line 1121
    .line 1122
    :cond_25
    move/from16 v24, v15

    .line 1123
    .line 1124
    goto :goto_16

    .line 1125
    :cond_26
    move/from16 v24, v6

    .line 1126
    .line 1127
    :goto_16
    if-nez v12, :cond_27

    .line 1128
    .line 1129
    if-nez v24, :cond_23

    .line 1130
    .line 1131
    sget-object v12, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 1132
    .line 1133
    invoke-interface {v10, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1134
    .line 1135
    .line 1136
    invoke-virtual/range {v23 .. v23}, Landroidx/fragment/app/k$b;->a()V

    .line 1137
    .line 1138
    .line 1139
    goto :goto_15

    .line 1140
    :cond_27
    move-object/from16 v25, v10

    .line 1141
    .line 1142
    new-instance v10, Ljava/util/ArrayList;

    .line 1143
    .line 1144
    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 1145
    .line 1146
    .line 1147
    invoke-virtual {v13}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 1148
    .line 1149
    .line 1150
    move-result-object v15

    .line 1151
    iget-object v15, v15, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 1152
    .line 1153
    const-string v6, "operation.fragment.mView"

    .line 1154
    .line 1155
    invoke-static {v15, v6}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1156
    .line 1157
    .line 1158
    invoke-direct {v0, v10, v15}, Landroidx/fragment/app/k;->E(Ljava/util/ArrayList;Landroid/view/View;)V

    .line 1159
    .line 1160
    .line 1161
    if-eqz v24, :cond_29

    .line 1162
    .line 1163
    if-ne v13, v2, :cond_28

    .line 1164
    .line 1165
    invoke-static/range {v20 .. v20}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 1166
    .line 1167
    .line 1168
    move-result-object v6

    .line 1169
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 1170
    .line 1171
    .line 1172
    goto :goto_17

    .line 1173
    :cond_28
    invoke-static {v14}, Li4/m;->I0(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 1174
    .line 1175
    .line 1176
    move-result-object v6

    .line 1177
    invoke-virtual {v10, v6}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 1178
    .line 1179
    .line 1180
    :cond_29
    :goto_17
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    .line 1181
    .line 1182
    .line 1183
    move-result v6

    .line 1184
    if-eqz v6, :cond_2a

    .line 1185
    .line 1186
    invoke-virtual {v7, v12, v4}, Landroidx/fragment/app/Q;->a(Ljava/lang/Object;Landroid/view/View;)V

    .line 1187
    .line 1188
    .line 1189
    move-object/from16 v24, v4

    .line 1190
    .line 1191
    move-object v6, v8

    .line 1192
    move-object v15, v9

    .line 1193
    move-object/from16 v30, v11

    .line 1194
    .line 1195
    move-object v8, v12

    .line 1196
    move-object v11, v13

    .line 1197
    move-object/from16 p3, v14

    .line 1198
    .line 1199
    move-object/from16 v4, v19

    .line 1200
    .line 1201
    move-object/from16 v3, v22

    .line 1202
    .line 1203
    move-object/from16 v0, v25

    .line 1204
    .line 1205
    move-object/from16 v9, p2

    .line 1206
    .line 1207
    goto :goto_18

    .line 1208
    :cond_2a
    invoke-virtual {v7, v12, v10}, Landroidx/fragment/app/Q;->b(Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 1209
    .line 1210
    .line 1211
    move-object v6, v13

    .line 1212
    const/4 v13, 0x0

    .line 1213
    move-object v15, v14

    .line 1214
    const/4 v14, 0x0

    .line 1215
    move-object/from16 v24, v11

    .line 1216
    .line 1217
    const/4 v11, 0x0

    .line 1218
    move-object/from16 v28, v8

    .line 1219
    .line 1220
    move-object v8, v12

    .line 1221
    const/4 v12, 0x0

    .line 1222
    move-object/from16 v29, v9

    .line 1223
    .line 1224
    move-object v9, v8

    .line 1225
    move-object/from16 p3, v15

    .line 1226
    .line 1227
    move-object/from16 v3, v22

    .line 1228
    .line 1229
    move-object/from16 v30, v24

    .line 1230
    .line 1231
    move-object/from16 v0, v25

    .line 1232
    .line 1233
    move-object/from16 v15, v29

    .line 1234
    .line 1235
    move-object/from16 v24, v4

    .line 1236
    .line 1237
    move-object/from16 v4, v19

    .line 1238
    .line 1239
    move-object/from16 v19, v6

    .line 1240
    .line 1241
    move-object/from16 v6, v28

    .line 1242
    .line 1243
    invoke-virtual/range {v7 .. v14}, Landroidx/fragment/app/Q;->n(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;Ljava/lang/Object;Ljava/util/ArrayList;)V

    .line 1244
    .line 1245
    .line 1246
    invoke-virtual/range {v19 .. v19}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 1247
    .line 1248
    .line 1249
    move-result-object v9

    .line 1250
    sget-object v11, Landroidx/fragment/app/W$c$b;->j:Landroidx/fragment/app/W$c$b;

    .line 1251
    .line 1252
    if-ne v9, v11, :cond_2b

    .line 1253
    .line 1254
    move-object/from16 v9, p2

    .line 1255
    .line 1256
    move-object/from16 v11, v19

    .line 1257
    .line 1258
    invoke-interface {v9, v11}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 1259
    .line 1260
    .line 1261
    new-instance v12, Ljava/util/ArrayList;

    .line 1262
    .line 1263
    invoke-direct {v12, v10}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 1264
    .line 1265
    .line 1266
    invoke-virtual {v11}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 1267
    .line 1268
    .line 1269
    move-result-object v13

    .line 1270
    iget-object v13, v13, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 1271
    .line 1272
    invoke-virtual {v12, v13}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 1273
    .line 1274
    .line 1275
    invoke-virtual {v11}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 1276
    .line 1277
    .line 1278
    move-result-object v13

    .line 1279
    iget-object v13, v13, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 1280
    .line 1281
    invoke-virtual {v7, v8, v13, v12}, Landroidx/fragment/app/Q;->m(Ljava/lang/Object;Landroid/view/View;Ljava/util/ArrayList;)V

    .line 1282
    .line 1283
    .line 1284
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 1285
    .line 1286
    .line 1287
    move-result-object v12

    .line 1288
    new-instance v13, Landroidx/fragment/app/i;

    .line 1289
    .line 1290
    invoke-direct {v13, v10}, Landroidx/fragment/app/i;-><init>(Ljava/util/ArrayList;)V

    .line 1291
    .line 1292
    .line 1293
    invoke-static {v12, v13}, LJ/z;->a(Landroid/view/View;Ljava/lang/Runnable;)LJ/z;

    .line 1294
    .line 1295
    .line 1296
    goto :goto_18

    .line 1297
    :cond_2b
    move-object/from16 v9, p2

    .line 1298
    .line 1299
    move-object/from16 v11, v19

    .line 1300
    .line 1301
    :goto_18
    invoke-virtual {v11}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 1302
    .line 1303
    .line 1304
    move-result-object v12

    .line 1305
    sget-object v13, Landroidx/fragment/app/W$c$b;->i:Landroidx/fragment/app/W$c$b;

    .line 1306
    .line 1307
    if-ne v12, v13, :cond_2c

    .line 1308
    .line 1309
    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1310
    .line 1311
    .line 1312
    if-eqz v17, :cond_2d

    .line 1313
    .line 1314
    invoke-virtual {v7, v8, v5}, Landroidx/fragment/app/Q;->o(Ljava/lang/Object;Landroid/graphics/Rect;)V

    .line 1315
    .line 1316
    .line 1317
    goto :goto_19

    .line 1318
    :cond_2c
    invoke-virtual {v7, v8, v3}, Landroidx/fragment/app/Q;->p(Ljava/lang/Object;Landroid/view/View;)V

    .line 1319
    .line 1320
    .line 1321
    :cond_2d
    :goto_19
    sget-object v10, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 1322
    .line 1323
    invoke-interface {v0, v11, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1324
    .line 1325
    .line 1326
    invoke-virtual/range {v23 .. v23}, Landroidx/fragment/app/k$c;->j()Z

    .line 1327
    .line 1328
    .line 1329
    move-result v10

    .line 1330
    if-eqz v10, :cond_2e

    .line 1331
    .line 1332
    const/4 v10, 0x0

    .line 1333
    invoke-virtual {v7, v6, v8, v10}, Landroidx/fragment/app/Q;->k(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1334
    .line 1335
    .line 1336
    move-result-object v8

    .line 1337
    move-object/from16 v14, p3

    .line 1338
    .line 1339
    move-object v10, v0

    .line 1340
    move-object/from16 v22, v3

    .line 1341
    .line 1342
    move-object/from16 v19, v4

    .line 1343
    .line 1344
    move-object v9, v15

    .line 1345
    move-object/from16 v4, v24

    .line 1346
    .line 1347
    move-object/from16 v11, v30

    .line 1348
    .line 1349
    const/4 v6, 0x0

    .line 1350
    const/4 v15, 0x1

    .line 1351
    move-object/from16 v0, p0

    .line 1352
    .line 1353
    move-object/from16 v3, p5

    .line 1354
    .line 1355
    goto/16 :goto_15

    .line 1356
    .line 1357
    :cond_2e
    const/4 v10, 0x0

    .line 1358
    invoke-virtual {v7, v15, v8, v10}, Landroidx/fragment/app/Q;->k(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1359
    .line 1360
    .line 1361
    move-result-object v8

    .line 1362
    move-object/from16 v14, p3

    .line 1363
    .line 1364
    move-object v10, v0

    .line 1365
    move-object/from16 v22, v3

    .line 1366
    .line 1367
    move-object/from16 v19, v4

    .line 1368
    .line 1369
    move-object v9, v8

    .line 1370
    move-object/from16 v4, v24

    .line 1371
    .line 1372
    move-object/from16 v11, v30

    .line 1373
    .line 1374
    const/4 v15, 0x1

    .line 1375
    move-object/from16 v0, p0

    .line 1376
    .line 1377
    move-object/from16 v3, p5

    .line 1378
    .line 1379
    move-object v8, v6

    .line 1380
    const/4 v6, 0x0

    .line 1381
    goto/16 :goto_15

    .line 1382
    .line 1383
    :cond_2f
    move-object v6, v8

    .line 1384
    move-object v15, v9

    .line 1385
    move-object v0, v10

    .line 1386
    move-object/from16 v30, v11

    .line 1387
    .line 1388
    move-object/from16 p3, v14

    .line 1389
    .line 1390
    move-object/from16 v4, v19

    .line 1391
    .line 1392
    invoke-virtual {v7, v6, v15, v4}, Landroidx/fragment/app/Q;->j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1393
    .line 1394
    .line 1395
    move-result-object v3

    .line 1396
    if-nez v3, :cond_30

    .line 1397
    .line 1398
    goto/16 :goto_20

    .line 1399
    .line 1400
    :cond_30
    new-instance v5, Ljava/util/ArrayList;

    .line 1401
    .line 1402
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 1403
    .line 1404
    .line 1405
    invoke-interface/range {p1 .. p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 1406
    .line 1407
    .line 1408
    move-result-object v6

    .line 1409
    :cond_31
    :goto_1a
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 1410
    .line 1411
    .line 1412
    move-result v8

    .line 1413
    if-eqz v8, :cond_32

    .line 1414
    .line 1415
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1416
    .line 1417
    .line 1418
    move-result-object v8

    .line 1419
    move-object v9, v8

    .line 1420
    check-cast v9, Landroidx/fragment/app/k$c;

    .line 1421
    .line 1422
    invoke-virtual {v9}, Landroidx/fragment/app/k$b;->d()Z

    .line 1423
    .line 1424
    .line 1425
    move-result v9

    .line 1426
    if-nez v9, :cond_31

    .line 1427
    .line 1428
    invoke-interface {v5, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 1429
    .line 1430
    .line 1431
    goto :goto_1a

    .line 1432
    :cond_32
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 1433
    .line 1434
    .line 1435
    move-result-object v5

    .line 1436
    :goto_1b
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 1437
    .line 1438
    .line 1439
    move-result v6

    .line 1440
    if-eqz v6, :cond_39

    .line 1441
    .line 1442
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1443
    .line 1444
    .line 1445
    move-result-object v6

    .line 1446
    check-cast v6, Landroidx/fragment/app/k$c;

    .line 1447
    .line 1448
    invoke-virtual {v6}, Landroidx/fragment/app/k$c;->h()Ljava/lang/Object;

    .line 1449
    .line 1450
    .line 1451
    move-result-object v8

    .line 1452
    invoke-virtual {v6}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 1453
    .line 1454
    .line 1455
    move-result-object v9

    .line 1456
    move-object/from16 v10, p5

    .line 1457
    .line 1458
    if-eqz v4, :cond_34

    .line 1459
    .line 1460
    if-eq v9, v2, :cond_33

    .line 1461
    .line 1462
    if-ne v9, v10, :cond_34

    .line 1463
    .line 1464
    :cond_33
    const/4 v11, 0x1

    .line 1465
    goto :goto_1c

    .line 1466
    :cond_34
    const/4 v11, 0x0

    .line 1467
    :goto_1c
    if-nez v8, :cond_36

    .line 1468
    .line 1469
    if-eqz v11, :cond_35

    .line 1470
    .line 1471
    goto :goto_1d

    .line 1472
    :cond_35
    move-object/from16 v11, v30

    .line 1473
    .line 1474
    goto :goto_1f

    .line 1475
    :cond_36
    :goto_1d
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 1476
    .line 1477
    .line 1478
    move-result-object v8

    .line 1479
    invoke-static {v8}, LJ/I;->O(Landroid/view/View;)Z

    .line 1480
    .line 1481
    .line 1482
    move-result v8

    .line 1483
    if-nez v8, :cond_38

    .line 1484
    .line 1485
    invoke-static/range {v18 .. v18}, Landroidx/fragment/app/F;->J0(I)Z

    .line 1486
    .line 1487
    .line 1488
    move-result v8

    .line 1489
    if-eqz v8, :cond_37

    .line 1490
    .line 1491
    new-instance v8, Ljava/lang/StringBuilder;

    .line 1492
    .line 1493
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 1494
    .line 1495
    .line 1496
    const-string v11, "SpecialEffectsController: Container "

    .line 1497
    .line 1498
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1499
    .line 1500
    .line 1501
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 1502
    .line 1503
    .line 1504
    move-result-object v11

    .line 1505
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1506
    .line 1507
    .line 1508
    const-string v11, " has not been laid out. Completing operation "

    .line 1509
    .line 1510
    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1511
    .line 1512
    .line 1513
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1514
    .line 1515
    .line 1516
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1517
    .line 1518
    .line 1519
    move-result-object v8

    .line 1520
    move-object/from16 v11, v30

    .line 1521
    .line 1522
    invoke-static {v11, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1523
    .line 1524
    .line 1525
    goto :goto_1e

    .line 1526
    :cond_37
    move-object/from16 v11, v30

    .line 1527
    .line 1528
    :goto_1e
    invoke-virtual {v6}, Landroidx/fragment/app/k$b;->a()V

    .line 1529
    .line 1530
    .line 1531
    goto :goto_1f

    .line 1532
    :cond_38
    move-object/from16 v11, v30

    .line 1533
    .line 1534
    invoke-virtual {v6}, Landroidx/fragment/app/k$b;->b()Landroidx/fragment/app/W$c;

    .line 1535
    .line 1536
    .line 1537
    move-result-object v8

    .line 1538
    invoke-virtual {v8}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 1539
    .line 1540
    .line 1541
    move-result-object v8

    .line 1542
    invoke-virtual {v6}, Landroidx/fragment/app/k$b;->c()LF/d;

    .line 1543
    .line 1544
    .line 1545
    move-result-object v12

    .line 1546
    new-instance v13, Landroidx/fragment/app/j;

    .line 1547
    .line 1548
    invoke-direct {v13, v6, v9}, Landroidx/fragment/app/j;-><init>(Landroidx/fragment/app/k$c;Landroidx/fragment/app/W$c;)V

    .line 1549
    .line 1550
    .line 1551
    invoke-virtual {v7, v8, v3, v12, v13}, Landroidx/fragment/app/Q;->q(Landroidx/fragment/app/n;Ljava/lang/Object;LF/d;Ljava/lang/Runnable;)V

    .line 1552
    .line 1553
    .line 1554
    :goto_1f
    move-object/from16 v30, v11

    .line 1555
    .line 1556
    goto :goto_1b

    .line 1557
    :cond_39
    move-object/from16 v11, v30

    .line 1558
    .line 1559
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 1560
    .line 1561
    .line 1562
    move-result-object v2

    .line 1563
    invoke-static {v2}, LJ/I;->O(Landroid/view/View;)Z

    .line 1564
    .line 1565
    .line 1566
    move-result v2

    .line 1567
    if-nez v2, :cond_3a

    .line 1568
    .line 1569
    :goto_20
    return-object v0

    .line 1570
    :cond_3a
    const/4 v2, 0x4

    .line 1571
    invoke-static {v1, v2}, Landroidx/fragment/app/O;->e(Ljava/util/List;I)V

    .line 1572
    .line 1573
    .line 1574
    move-object/from16 v14, p3

    .line 1575
    .line 1576
    invoke-virtual {v7, v14}, Landroidx/fragment/app/Q;->l(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 1577
    .line 1578
    .line 1579
    move-result-object v2

    .line 1580
    invoke-static/range {v18 .. v18}, Landroidx/fragment/app/F;->J0(I)Z

    .line 1581
    .line 1582
    .line 1583
    move-result v5

    .line 1584
    if-eqz v5, :cond_3c

    .line 1585
    .line 1586
    const-string v5, ">>>>> Beginning transition <<<<<"

    .line 1587
    .line 1588
    invoke-static {v11, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1589
    .line 1590
    .line 1591
    const-string v5, ">>>>> SharedElementFirstOutViews <<<<<"

    .line 1592
    .line 1593
    invoke-static {v11, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1594
    .line 1595
    .line 1596
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1597
    .line 1598
    .line 1599
    move-result-object v5

    .line 1600
    :goto_21
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 1601
    .line 1602
    .line 1603
    move-result v6

    .line 1604
    const-string v8, " Name: "

    .line 1605
    .line 1606
    const-string v9, "View: "

    .line 1607
    .line 1608
    if-eqz v6, :cond_3b

    .line 1609
    .line 1610
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1611
    .line 1612
    .line 1613
    move-result-object v6

    .line 1614
    const-string v10, "sharedElementFirstOutViews"

    .line 1615
    .line 1616
    invoke-static {v6, v10}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1617
    .line 1618
    .line 1619
    check-cast v6, Landroid/view/View;

    .line 1620
    .line 1621
    new-instance v10, Ljava/lang/StringBuilder;

    .line 1622
    .line 1623
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 1624
    .line 1625
    .line 1626
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1627
    .line 1628
    .line 1629
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1630
    .line 1631
    .line 1632
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1633
    .line 1634
    .line 1635
    invoke-static {v6}, LJ/I;->E(Landroid/view/View;)Ljava/lang/String;

    .line 1636
    .line 1637
    .line 1638
    move-result-object v6

    .line 1639
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1640
    .line 1641
    .line 1642
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1643
    .line 1644
    .line 1645
    move-result-object v6

    .line 1646
    invoke-static {v11, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1647
    .line 1648
    .line 1649
    goto :goto_21

    .line 1650
    :cond_3b
    const-string v5, ">>>>> SharedElementLastInViews <<<<<"

    .line 1651
    .line 1652
    invoke-static {v11, v5}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1653
    .line 1654
    .line 1655
    invoke-virtual {v14}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 1656
    .line 1657
    .line 1658
    move-result-object v5

    .line 1659
    :goto_22
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 1660
    .line 1661
    .line 1662
    move-result v6

    .line 1663
    if-eqz v6, :cond_3c

    .line 1664
    .line 1665
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1666
    .line 1667
    .line 1668
    move-result-object v6

    .line 1669
    const-string v10, "sharedElementLastInViews"

    .line 1670
    .line 1671
    invoke-static {v6, v10}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1672
    .line 1673
    .line 1674
    check-cast v6, Landroid/view/View;

    .line 1675
    .line 1676
    new-instance v10, Ljava/lang/StringBuilder;

    .line 1677
    .line 1678
    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 1679
    .line 1680
    .line 1681
    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1682
    .line 1683
    .line 1684
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 1685
    .line 1686
    .line 1687
    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1688
    .line 1689
    .line 1690
    invoke-static {v6}, LJ/I;->E(Landroid/view/View;)Ljava/lang/String;

    .line 1691
    .line 1692
    .line 1693
    move-result-object v6

    .line 1694
    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1695
    .line 1696
    .line 1697
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1698
    .line 1699
    .line 1700
    move-result-object v6

    .line 1701
    invoke-static {v11, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 1702
    .line 1703
    .line 1704
    goto :goto_22

    .line 1705
    :cond_3c
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 1706
    .line 1707
    .line 1708
    move-result-object v5

    .line 1709
    invoke-virtual {v7, v5, v3}, Landroidx/fragment/app/Q;->c(Landroid/view/ViewGroup;Ljava/lang/Object;)V

    .line 1710
    .line 1711
    .line 1712
    invoke-virtual/range {p0 .. p0}, Landroidx/fragment/app/W;->q()Landroid/view/ViewGroup;

    .line 1713
    .line 1714
    .line 1715
    move-result-object v3

    .line 1716
    move-object/from16 p4, v2

    .line 1717
    .line 1718
    move-object/from16 p1, v3

    .line 1719
    .line 1720
    move-object/from16 p0, v7

    .line 1721
    .line 1722
    move-object/from16 p3, v14

    .line 1723
    .line 1724
    move-object/from16 p2, v20

    .line 1725
    .line 1726
    move-object/from16 p5, v21

    .line 1727
    .line 1728
    invoke-virtual/range {p0 .. p5}, Landroidx/fragment/app/Q;->r(Landroid/view/View;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/ArrayList;Ljava/util/Map;)V

    .line 1729
    .line 1730
    .line 1731
    move-object/from16 v15, p2

    .line 1732
    .line 1733
    const/4 v10, 0x0

    .line 1734
    invoke-static {v1, v10}, Landroidx/fragment/app/O;->e(Ljava/util/List;I)V

    .line 1735
    .line 1736
    .line 1737
    invoke-virtual {v7, v4, v15, v14}, Landroidx/fragment/app/Q;->t(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 1738
    .line 1739
    .line 1740
    return-object v0
.end method

.method private static final M(Landroidx/fragment/app/Q;Landroid/view/View;Landroid/graphics/Rect;)V
    .locals 1

    .line 1
    const-string v0, "$impl"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$lastInEpicenterRect"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, p1, p2}, Landroidx/fragment/app/Q;->h(Landroid/view/View;Landroid/graphics/Rect;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method private static final N(Ljava/util/ArrayList;)V
    .locals 1

    .line 1
    const-string v0, "$transitioningViews"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x4

    .line 7
    invoke-static {p0, v0}, Landroidx/fragment/app/O;->e(Ljava/util/List;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private static final O(Landroidx/fragment/app/k$c;Landroidx/fragment/app/W$c;)V
    .locals 1

    .line 1
    const-string v0, "$transitionInfo"

    .line 2
    .line 3
    invoke-static {p0, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "$operation"

    .line 7
    .line 8
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Landroidx/fragment/app/k$b;->a()V

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x2

    .line 15
    invoke-static {p0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    new-instance p0, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 24
    .line 25
    .line 26
    const-string v0, "Transition for operation "

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    const-string p1, " has completed"

    .line 35
    .line 36
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    const-string p1, "FragmentManager"

    .line 44
    .line 45
    invoke-static {p1, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method private static final P(Landroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;ZLo/a;)V
    .locals 1

    .line 1
    const-string v0, "$lastInViews"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-virtual {p1}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    const/4 v0, 0x0

    .line 15
    invoke-static {p0, p1, p2, p3, v0}, Landroidx/fragment/app/O;->a(Landroidx/fragment/app/n;Landroidx/fragment/app/n;ZLo/a;Z)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private final Q(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/fragment/app/W$c;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Li4/m;->m0(Ljava/util/List;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Landroidx/fragment/app/W$c;

    .line 6
    .line 7
    invoke-virtual {p0}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Landroidx/fragment/app/W$c;

    .line 26
    .line 27
    invoke-virtual {v0}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v1, v1, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 32
    .line 33
    iget-object v2, p0, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 34
    .line 35
    iget v2, v2, Landroidx/fragment/app/n$k;->c:I

    .line 36
    .line 37
    iput v2, v1, Landroidx/fragment/app/n$k;->c:I

    .line 38
    .line 39
    invoke-virtual {v0}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    iget-object v1, v1, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 44
    .line 45
    iget-object v2, p0, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 46
    .line 47
    iget v2, v2, Landroidx/fragment/app/n$k;->d:I

    .line 48
    .line 49
    iput v2, v1, Landroidx/fragment/app/n$k;->d:I

    .line 50
    .line 51
    invoke-virtual {v0}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    iget-object v1, v1, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 56
    .line 57
    iget-object v2, p0, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 58
    .line 59
    iget v2, v2, Landroidx/fragment/app/n$k;->e:I

    .line 60
    .line 61
    iput v2, v1, Landroidx/fragment/app/n$k;->e:I

    .line 62
    .line 63
    invoke-virtual {v0}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 68
    .line 69
    iget-object v1, p0, Landroidx/fragment/app/n;->mAnimationInfo:Landroidx/fragment/app/n$k;

    .line 70
    .line 71
    iget v1, v1, Landroidx/fragment/app/n$k;->f:I

    .line 72
    .line 73
    iput v1, v0, Landroidx/fragment/app/n$k;->f:I

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    return-void
.end method

.method public static synthetic w(Ljava/util/List;Landroidx/fragment/app/W$c;Landroidx/fragment/app/k;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Landroidx/fragment/app/k;->F(Ljava/util/List;Landroidx/fragment/app/W$c;Landroidx/fragment/app/k;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x(Landroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;ZLo/a;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Landroidx/fragment/app/k;->P(Landroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;ZLo/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic y(Landroid/animation/Animator;Landroidx/fragment/app/W$c;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Landroidx/fragment/app/k;->J(Landroid/animation/Animator;Landroidx/fragment/app/W$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic z(Landroid/view/View;Landroidx/fragment/app/k;Landroidx/fragment/app/k$a;Landroidx/fragment/app/W$c;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Landroidx/fragment/app/k;->K(Landroid/view/View;Landroidx/fragment/app/k;Landroidx/fragment/app/k$a;Landroidx/fragment/app/W$c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public j(Ljava/util/List;Z)V
    .locals 13
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Landroidx/fragment/app/W$c;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    const-string v0, "operations"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    const-string v3, "operation.fragment.mView"

    .line 16
    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    move-object v4, v1

    .line 24
    check-cast v4, Landroidx/fragment/app/W$c;

    .line 25
    .line 26
    sget-object v5, Landroidx/fragment/app/W$c$b;->g:Landroidx/fragment/app/W$c$b$a;

    .line 27
    .line 28
    invoke-virtual {v4}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 29
    .line 30
    .line 31
    move-result-object v6

    .line 32
    iget-object v6, v6, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 33
    .line 34
    invoke-static {v6, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v5, v6}, Landroidx/fragment/app/W$c$b$a;->a(Landroid/view/View;)Landroidx/fragment/app/W$c$b;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    sget-object v6, Landroidx/fragment/app/W$c$b;->i:Landroidx/fragment/app/W$c$b;

    .line 42
    .line 43
    if-ne v5, v6, :cond_0

    .line 44
    .line 45
    invoke-virtual {v4}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 46
    .line 47
    .line 48
    move-result-object v4

    .line 49
    if-eq v4, v6, :cond_0

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move-object v1, v2

    .line 53
    :goto_0
    move-object v8, v1

    .line 54
    check-cast v8, Landroidx/fragment/app/W$c;

    .line 55
    .line 56
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-interface {p1, v0}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    :cond_2
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    .line 65
    .line 66
    .line 67
    move-result v1

    .line 68
    if-eqz v1, :cond_3

    .line 69
    .line 70
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    move-object v4, v1

    .line 75
    check-cast v4, Landroidx/fragment/app/W$c;

    .line 76
    .line 77
    sget-object v5, Landroidx/fragment/app/W$c$b;->g:Landroidx/fragment/app/W$c$b$a;

    .line 78
    .line 79
    invoke-virtual {v4}, Landroidx/fragment/app/W$c;->h()Landroidx/fragment/app/n;

    .line 80
    .line 81
    .line 82
    move-result-object v6

    .line 83
    iget-object v6, v6, Landroidx/fragment/app/n;->mView:Landroid/view/View;

    .line 84
    .line 85
    invoke-static {v6, v3}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v5, v6}, Landroidx/fragment/app/W$c$b$a;->a(Landroid/view/View;)Landroidx/fragment/app/W$c$b;

    .line 89
    .line 90
    .line 91
    move-result-object v5

    .line 92
    sget-object v6, Landroidx/fragment/app/W$c$b;->i:Landroidx/fragment/app/W$c$b;

    .line 93
    .line 94
    if-eq v5, v6, :cond_2

    .line 95
    .line 96
    invoke-virtual {v4}, Landroidx/fragment/app/W$c;->g()Landroidx/fragment/app/W$c$b;

    .line 97
    .line 98
    .line 99
    move-result-object v4

    .line 100
    if-ne v4, v6, :cond_2

    .line 101
    .line 102
    move-object v2, v1

    .line 103
    :cond_3
    move-object v9, v2

    .line 104
    check-cast v9, Landroidx/fragment/app/W$c;

    .line 105
    .line 106
    const/4 v0, 0x2

    .line 107
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    const-string v2, " to "

    .line 112
    .line 113
    const-string v3, "FragmentManager"

    .line 114
    .line 115
    if-eqz v1, :cond_4

    .line 116
    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 120
    .line 121
    .line 122
    const-string v4, "Executing operations from "

    .line 123
    .line 124
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    invoke-static {v3, v1}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    :cond_4
    new-instance v1, Ljava/util/ArrayList;

    .line 144
    .line 145
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 146
    .line 147
    .line 148
    new-instance v5, Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .line 152
    .line 153
    invoke-static {p1}, Li4/m;->G0(Ljava/util/Collection;)Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object v6

    .line 157
    invoke-direct {p0, p1}, Landroidx/fragment/app/k;->Q(Ljava/util/List;)V

    .line 158
    .line 159
    .line 160
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    if-eqz v4, :cond_7

    .line 169
    .line 170
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    check-cast v4, Landroidx/fragment/app/W$c;

    .line 175
    .line 176
    new-instance v7, LF/d;

    .line 177
    .line 178
    invoke-direct {v7}, LF/d;-><init>()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v4, v7}, Landroidx/fragment/app/W$c;->l(LF/d;)V

    .line 182
    .line 183
    .line 184
    new-instance v10, Landroidx/fragment/app/k$a;

    .line 185
    .line 186
    invoke-direct {v10, v4, v7, p2}, Landroidx/fragment/app/k$a;-><init>(Landroidx/fragment/app/W$c;LF/d;Z)V

    .line 187
    .line 188
    .line 189
    invoke-interface {v1, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 190
    .line 191
    .line 192
    new-instance v7, LF/d;

    .line 193
    .line 194
    invoke-direct {v7}, LF/d;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v4, v7}, Landroidx/fragment/app/W$c;->l(LF/d;)V

    .line 198
    .line 199
    .line 200
    new-instance v10, Landroidx/fragment/app/k$c;

    .line 201
    .line 202
    const/4 v11, 0x0

    .line 203
    const/4 v12, 0x1

    .line 204
    if-eqz p2, :cond_5

    .line 205
    .line 206
    if-ne v4, v8, :cond_6

    .line 207
    .line 208
    :goto_2
    move v11, v12

    .line 209
    goto :goto_3

    .line 210
    :cond_5
    if-ne v4, v9, :cond_6

    .line 211
    .line 212
    goto :goto_2

    .line 213
    :cond_6
    :goto_3
    invoke-direct {v10, v4, v7, p2, v11}, Landroidx/fragment/app/k$c;-><init>(Landroidx/fragment/app/W$c;LF/d;ZZ)V

    .line 214
    .line 215
    .line 216
    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    new-instance v7, Landroidx/fragment/app/d;

    .line 220
    .line 221
    invoke-direct {v7, v6, v4, p0}, Landroidx/fragment/app/d;-><init>(Ljava/util/List;Landroidx/fragment/app/W$c;Landroidx/fragment/app/k;)V

    .line 222
    .line 223
    .line 224
    invoke-virtual {v4, v7}, Landroidx/fragment/app/W$c;->c(Ljava/lang/Runnable;)V

    .line 225
    .line 226
    .line 227
    goto :goto_1

    .line 228
    :cond_7
    move-object v4, p0

    .line 229
    move v7, p2

    .line 230
    invoke-direct/range {v4 .. v9}, Landroidx/fragment/app/k;->L(Ljava/util/List;Ljava/util/List;ZLandroidx/fragment/app/W$c;Landroidx/fragment/app/W$c;)Ljava/util/Map;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 235
    .line 236
    invoke-interface {p0, p1}, Ljava/util/Map;->containsValue(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    move-result p1

    .line 240
    invoke-direct {v4, v1, v6, p1, p0}, Landroidx/fragment/app/k;->I(Ljava/util/List;Ljava/util/List;ZLjava/util/Map;)V

    .line 241
    .line 242
    .line 243
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    :goto_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 248
    .line 249
    .line 250
    move-result p1

    .line 251
    if-eqz p1, :cond_8

    .line 252
    .line 253
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object p1

    .line 257
    check-cast p1, Landroidx/fragment/app/W$c;

    .line 258
    .line 259
    invoke-direct {v4, p1}, Landroidx/fragment/app/k;->D(Landroidx/fragment/app/W$c;)V

    .line 260
    .line 261
    .line 262
    goto :goto_4

    .line 263
    :cond_8
    invoke-interface {v6}, Ljava/util/List;->clear()V

    .line 264
    .line 265
    .line 266
    invoke-static {v0}, Landroidx/fragment/app/F;->J0(I)Z

    .line 267
    .line 268
    .line 269
    move-result p0

    .line 270
    if-eqz p0, :cond_9

    .line 271
    .line 272
    new-instance p0, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 275
    .line 276
    .line 277
    const-string p1, "Completed executing operations from "

    .line 278
    .line 279
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 280
    .line 281
    .line 282
    invoke-virtual {p0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 283
    .line 284
    .line 285
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {p0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 289
    .line 290
    .line 291
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    invoke-static {v3, p0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 296
    .line 297
    .line 298
    :cond_9
    return-void
.end method
