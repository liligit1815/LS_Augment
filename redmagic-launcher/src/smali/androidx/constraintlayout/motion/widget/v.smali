.class public Landroidx/constraintlayout/motion/widget/v;
.super Ljava/lang/Object;
.source "ViewTransitionController.java"


# instance fields
.field private final a:Landroidx/constraintlayout/motion/widget/p;

.field private b:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/u;",
            ">;"
        }
    .end annotation
.end field

.field private c:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private d:Ljava/lang/String;

.field e:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/u$b;",
            ">;"
        }
    .end annotation
.end field

.field f:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroidx/constraintlayout/motion/widget/u$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroidx/constraintlayout/motion/widget/p;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->b:Ljava/util/ArrayList;

    .line 10
    .line 11
    const-string v0, "ViewTransitionController"

    .line 12
    .line 13
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->d:Ljava/lang/String;

    .line 14
    .line 15
    new-instance v0, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->f:Ljava/util/ArrayList;

    .line 21
    .line 22
    iput-object p1, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 23
    .line 24
    return-void
.end method

.method private e(Landroidx/constraintlayout/motion/widget/u;Z)V
    .locals 8

    .line 1
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/u;->h()I

    .line 2
    .line 3
    .line 4
    move-result v3

    .line 5
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/u;->g()I

    .line 6
    .line 7
    .line 8
    move-result v5

    .line 9
    invoke-static {}, Landroidx/constraintlayout/widget/ConstraintLayout;->getSharedValues()Landroidx/constraintlayout/widget/j;

    .line 10
    .line 11
    .line 12
    move-result-object v6

    .line 13
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/u;->h()I

    .line 14
    .line 15
    .line 16
    move-result v7

    .line 17
    new-instance v0, Landroidx/constraintlayout/motion/widget/v$a;

    .line 18
    .line 19
    move-object v1, p0

    .line 20
    move-object v2, p1

    .line 21
    move v4, p2

    .line 22
    invoke-direct/range {v0 .. v5}, Landroidx/constraintlayout/motion/widget/v$a;-><init>(Landroidx/constraintlayout/motion/widget/v;Landroidx/constraintlayout/motion/widget/u;IZI)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v6, v7, v0}, Landroidx/constraintlayout/widget/j;->a(ILandroidx/constraintlayout/widget/j$a;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method private varargs i(Landroidx/constraintlayout/motion/widget/u;[Landroid/view/View;)V
    .locals 7

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->getCurrentState()I

    .line 4
    .line 5
    .line 6
    move-result v4

    .line 7
    iget v0, p1, Landroidx/constraintlayout/motion/widget/u;->e:I

    .line 8
    .line 9
    const/4 v1, 0x2

    .line 10
    if-eq v0, v1, :cond_2

    .line 11
    .line 12
    const/4 v0, -0x1

    .line 13
    if-ne v4, v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Landroidx/constraintlayout/motion/widget/v;->d:Ljava/lang/String;

    .line 16
    .line 17
    new-instance p2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 20
    .line 21
    .line 22
    const-string v0, "No support for ViewTransition within transition yet. Currently: "

    .line 23
    .line 24
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroidx/constraintlayout/motion/widget/p;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 45
    .line 46
    invoke-virtual {v0, v4}, Landroidx/constraintlayout/motion/widget/p;->u(I)Landroidx/constraintlayout/widget/d;

    .line 47
    .line 48
    .line 49
    move-result-object v5

    .line 50
    if-nez v5, :cond_1

    .line 51
    .line 52
    return-void

    .line 53
    :cond_1
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 54
    .line 55
    move-object v2, p0

    .line 56
    move-object v1, p1

    .line 57
    move-object v6, p2

    .line 58
    invoke-virtual/range {v1 .. v6}, Landroidx/constraintlayout/motion/widget/u;->c(Landroidx/constraintlayout/motion/widget/v;Landroidx/constraintlayout/motion/widget/p;ILandroidx/constraintlayout/widget/d;[Landroid/view/View;)V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_2
    move-object v2, p0

    .line 63
    move-object v1, p1

    .line 64
    move-object v6, p2

    .line 65
    iget-object v3, v2, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 66
    .line 67
    const/4 v5, 0x0

    .line 68
    invoke-virtual/range {v1 .. v6}, Landroidx/constraintlayout/motion/widget/u;->c(Landroidx/constraintlayout/motion/widget/v;Landroidx/constraintlayout/motion/widget/p;ILandroidx/constraintlayout/widget/d;[Landroid/view/View;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method


# virtual methods
.method public a(Landroidx/constraintlayout/motion/widget/u;)V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->b:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->c:Ljava/util/HashSet;

    .line 8
    .line 9
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/u;->i()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/4 v1, 0x4

    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x1

    .line 17
    invoke-direct {p0, p1, v0}, Landroidx/constraintlayout/motion/widget/v;->e(Landroidx/constraintlayout/motion/widget/u;Z)V

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    invoke-virtual {p1}, Landroidx/constraintlayout/motion/widget/u;->i()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const/4 v1, 0x5

    .line 26
    if-ne v0, v1, :cond_1

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, p1, v0}, Landroidx/constraintlayout/motion/widget/v;->e(Landroidx/constraintlayout/motion/widget/u;Z)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method b(Landroidx/constraintlayout/motion/widget/u$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method c()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    check-cast v1, Landroidx/constraintlayout/motion/widget/u$b;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroidx/constraintlayout/motion/widget/u$b;->a()V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 27
    .line 28
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/v;->f:Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->f:Ljava/util/ArrayList;

    .line 34
    .line 35
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 39
    .line 40
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    const/4 v0, 0x0

    .line 47
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 48
    .line 49
    :cond_2
    :goto_1
    return-void
.end method

.method d()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/ViewGroup;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method f(Landroidx/constraintlayout/motion/widget/u$b;)V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/v;->f:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method g(Landroid/view/MotionEvent;)V
    .locals 11

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/constraintlayout/motion/widget/p;->getCurrentState()I

    .line 4
    .line 5
    .line 6
    move-result v4

    .line 7
    const/4 v0, -0x1

    .line 8
    if-ne v4, v0, :cond_0

    .line 9
    .line 10
    goto/16 :goto_5

    .line 11
    .line 12
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->c:Ljava/util/HashSet;

    .line 13
    .line 14
    if-nez v0, :cond_3

    .line 15
    .line 16
    new-instance v0, Ljava/util/HashSet;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->c:Ljava/util/HashSet;

    .line 22
    .line 23
    iget-object v0, p0, Landroidx/constraintlayout/motion/widget/v;->b:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_3

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    check-cast v1, Landroidx/constraintlayout/motion/widget/u;

    .line 40
    .line 41
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 42
    .line 43
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 44
    .line 45
    .line 46
    move-result v2

    .line 47
    const/4 v3, 0x0

    .line 48
    :goto_0
    if-ge v3, v2, :cond_1

    .line 49
    .line 50
    iget-object v5, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 51
    .line 52
    invoke-virtual {v5, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 53
    .line 54
    .line 55
    move-result-object v5

    .line 56
    invoke-virtual {v1, v5}, Landroidx/constraintlayout/motion/widget/u;->j(Landroid/view/View;)Z

    .line 57
    .line 58
    .line 59
    move-result v6

    .line 60
    if-eqz v6, :cond_2

    .line 61
    .line 62
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    .line 63
    .line 64
    .line 65
    iget-object v6, p0, Landroidx/constraintlayout/motion/widget/v;->c:Ljava/util/HashSet;

    .line 66
    .line 67
    invoke-virtual {v6, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 78
    .line 79
    .line 80
    move-result v7

    .line 81
    new-instance v8, Landroid/graphics/Rect;

    .line 82
    .line 83
    invoke-direct {v8}, Landroid/graphics/Rect;-><init>()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 91
    .line 92
    if-eqz v1, :cond_4

    .line 93
    .line 94
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    if-nez v1, :cond_4

    .line 99
    .line 100
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/v;->e:Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_4

    .line 111
    .line 112
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    check-cast v2, Landroidx/constraintlayout/motion/widget/u$b;

    .line 117
    .line 118
    invoke-virtual {v2, p1, v0, v7}, Landroidx/constraintlayout/motion/widget/u$b;->d(IFF)V

    .line 119
    .line 120
    .line 121
    goto :goto_1

    .line 122
    :cond_4
    if-eqz p1, :cond_5

    .line 123
    .line 124
    const/4 v1, 0x1

    .line 125
    if-eq p1, v1, :cond_5

    .line 126
    .line 127
    goto :goto_5

    .line 128
    :cond_5
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 129
    .line 130
    invoke-virtual {v1, v4}, Landroidx/constraintlayout/motion/widget/p;->u(I)Landroidx/constraintlayout/widget/d;

    .line 131
    .line 132
    .line 133
    move-result-object v5

    .line 134
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/v;->b:Ljava/util/ArrayList;

    .line 135
    .line 136
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 137
    .line 138
    .line 139
    move-result-object v9

    .line 140
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    .line 141
    .line 142
    .line 143
    move-result v1

    .line 144
    if-eqz v1, :cond_9

    .line 145
    .line 146
    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    check-cast v1, Landroidx/constraintlayout/motion/widget/u;

    .line 151
    .line 152
    invoke-virtual {v1, p1}, Landroidx/constraintlayout/motion/widget/u;->l(I)Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-eqz v2, :cond_8

    .line 157
    .line 158
    iget-object v2, p0, Landroidx/constraintlayout/motion/widget/v;->c:Ljava/util/HashSet;

    .line 159
    .line 160
    invoke-virtual {v2}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 161
    .line 162
    .line 163
    move-result-object v10

    .line 164
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    if-eqz v2, :cond_8

    .line 169
    .line 170
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    check-cast v2, Landroid/view/View;

    .line 175
    .line 176
    invoke-virtual {v1, v2}, Landroidx/constraintlayout/motion/widget/u;->j(Landroid/view/View;)Z

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    if-nez v3, :cond_6

    .line 181
    .line 182
    goto :goto_3

    .line 183
    :cond_6
    invoke-virtual {v2, v8}, Landroid/view/View;->getHitRect(Landroid/graphics/Rect;)V

    .line 184
    .line 185
    .line 186
    float-to-int v3, v0

    .line 187
    float-to-int v6, v7

    .line 188
    invoke-virtual {v8, v3, v6}, Landroid/graphics/Rect;->contains(II)Z

    .line 189
    .line 190
    .line 191
    move-result v3

    .line 192
    if-eqz v3, :cond_7

    .line 193
    .line 194
    iget-object v3, p0, Landroidx/constraintlayout/motion/widget/v;->a:Landroidx/constraintlayout/motion/widget/p;

    .line 195
    .line 196
    filled-new-array {v2}, [Landroid/view/View;

    .line 197
    .line 198
    .line 199
    move-result-object v6

    .line 200
    move-object v2, p0

    .line 201
    invoke-virtual/range {v1 .. v6}, Landroidx/constraintlayout/motion/widget/u;->c(Landroidx/constraintlayout/motion/widget/v;Landroidx/constraintlayout/motion/widget/p;ILandroidx/constraintlayout/widget/d;[Landroid/view/View;)V

    .line 202
    .line 203
    .line 204
    goto :goto_4

    .line 205
    :cond_7
    move-object v2, p0

    .line 206
    :goto_4
    move-object p0, v2

    .line 207
    goto :goto_3

    .line 208
    :cond_8
    move-object v2, p0

    .line 209
    move-object p0, v2

    .line 210
    goto :goto_2

    .line 211
    :cond_9
    :goto_5
    return-void
.end method

.method varargs h(I[Landroid/view/View;)V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Landroidx/constraintlayout/motion/widget/v;->b:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x0

    .line 13
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    if-eqz v3, :cond_4

    .line 18
    .line 19
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    check-cast v3, Landroidx/constraintlayout/motion/widget/u;

    .line 24
    .line 25
    invoke-virtual {v3}, Landroidx/constraintlayout/motion/widget/u;->e()I

    .line 26
    .line 27
    .line 28
    move-result v4

    .line 29
    if-ne v4, p1, :cond_0

    .line 30
    .line 31
    array-length v2, p2

    .line 32
    const/4 v4, 0x0

    .line 33
    move v5, v4

    .line 34
    :goto_1
    if-ge v5, v2, :cond_2

    .line 35
    .line 36
    aget-object v6, p2, v5

    .line 37
    .line 38
    invoke-virtual {v3, v6}, Landroidx/constraintlayout/motion/widget/u;->d(Landroid/view/View;)Z

    .line 39
    .line 40
    .line 41
    move-result v7

    .line 42
    if-eqz v7, :cond_1

    .line 43
    .line 44
    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_3

    .line 55
    .line 56
    new-array v2, v4, [Landroid/view/View;

    .line 57
    .line 58
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    check-cast v2, [Landroid/view/View;

    .line 63
    .line 64
    invoke-direct {p0, v3, v2}, Landroidx/constraintlayout/motion/widget/v;->i(Landroidx/constraintlayout/motion/widget/u;[Landroid/view/View;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 68
    .line 69
    .line 70
    :cond_3
    move-object v2, v3

    .line 71
    goto :goto_0

    .line 72
    :cond_4
    if-nez v2, :cond_5

    .line 73
    .line 74
    iget-object p0, p0, Landroidx/constraintlayout/motion/widget/v;->d:Ljava/lang/String;

    .line 75
    .line 76
    const-string p1, " Could not find ViewTransition"

    .line 77
    .line 78
    invoke-static {p0, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    .line 80
    .line 81
    :cond_5
    return-void
.end method
