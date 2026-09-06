.class public Lc4/h;
.super Ljava/lang/Object;
.source "OverScrollDecoratorHelper.java"


# instance fields
.field private a:Landroid/view/VelocityTracker;

.field private b:Landroidx/dynamicanimation/animation/j;

.field private c:Z

.field private d:F

.field private final e:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lc4/h;->c:Z

    .line 6
    .line 7
    sget v0, Lb4/e;->s:F

    .line 8
    .line 9
    iput v0, p0, Lc4/h;->d:F

    .line 10
    .line 11
    iput-object p1, p0, Lc4/h;->e:Landroid/view/View;

    .line 12
    .line 13
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iput-object v0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 18
    .line 19
    sget-object v0, Landroidx/dynamicanimation/animation/e;->o:Landroidx/dynamicanimation/animation/e$s;

    .line 20
    .line 21
    instance-of v1, p1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    move-object v1, p1

    .line 26
    check-cast v1, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 27
    .line 28
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    .line 35
    .line 36
    .line 37
    move-result v2

    .line 38
    if-eqz v2, :cond_0

    .line 39
    .line 40
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-nez v1, :cond_0

    .line 45
    .line 46
    sget-object v0, Landroidx/dynamicanimation/animation/e;->n:Landroidx/dynamicanimation/animation/e$s;

    .line 47
    .line 48
    :cond_0
    invoke-direct {p0, p1, v0}, Lc4/h;->a(Landroid/view/View;Landroidx/dynamicanimation/animation/g;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method private a(Landroid/view/View;Landroidx/dynamicanimation/animation/g;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Landroidx/dynamicanimation/animation/g<",
            "Landroid/view/View;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lb4/e;->q(Landroid/content/Context;)F

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-instance v1, Landroidx/dynamicanimation/animation/j;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-direct {v1, p1, p2, v2}, Landroidx/dynamicanimation/animation/j;-><init>(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;F)V

    .line 13
    .line 14
    .line 15
    iput-object v1, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 16
    .line 17
    invoke-virtual {v1}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1, v0}, Landroidx/dynamicanimation/animation/k;->h(F)Landroidx/dynamicanimation/animation/k;

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroidx/dynamicanimation/animation/j;->y()Landroidx/dynamicanimation/animation/k;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    iget p2, p0, Lc4/h;->d:F

    .line 31
    .line 32
    invoke-virtual {p1, p2}, Landroidx/dynamicanimation/animation/k;->f(F)Landroidx/dynamicanimation/animation/k;

    .line 33
    .line 34
    .line 35
    new-instance p1, Ljava/lang/StringBuilder;

    .line 36
    .line 37
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 38
    .line 39
    .line 40
    const-string p2, "set Spring Animation Property out. stiffness = "

    .line 41
    .line 42
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    const-string p2, ", mDampingRatio = "

    .line 49
    .line 50
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget p0, p0, Lc4/h;->d:F

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const-string p1, "Z#QScroll-DecoHelper"

    .line 63
    .line 64
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public b()Lc4/c;
    .locals 3

    .line 1
    iget-object v0, p0, Lc4/h;->e:Landroid/view/View;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 4
    .line 5
    if-eqz v1, :cond_1

    .line 6
    .line 7
    check-cast v0, Lcom/zte/mifavor/androidx/widget/RecyclerView;

    .line 8
    .line 9
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->getLayoutManager()Landroidx/recyclerview/widget/RecyclerView$LayoutManager;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollHorizontally()Z

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$LayoutManager;->canScrollVertically()Z

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    if-nez v1, :cond_0

    .line 26
    .line 27
    new-instance v1, Lc4/b;

    .line 28
    .line 29
    new-instance v2, Ld4/e;

    .line 30
    .line 31
    invoke-direct {v2, v0}, Ld4/e;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 35
    .line 36
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 37
    .line 38
    invoke-direct {v1, v2, v0, p0}, Lc4/b;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 39
    .line 40
    .line 41
    return-object v1

    .line 42
    :cond_0
    new-instance v1, Lc4/i;

    .line 43
    .line 44
    new-instance v2, Ld4/e;

    .line 45
    .line 46
    invoke-direct {v2, v0}, Ld4/e;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 50
    .line 51
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 52
    .line 53
    invoke-direct {v1, v2, v0, p0}, Lc4/i;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 54
    .line 55
    .line 56
    return-object v1

    .line 57
    :cond_1
    instance-of v1, v0, Lcom/zte/mifavor/widget/ListView;

    .line 58
    .line 59
    if-eqz v1, :cond_2

    .line 60
    .line 61
    check-cast v0, Lcom/zte/mifavor/widget/ListView;

    .line 62
    .line 63
    new-instance v1, Lc4/i;

    .line 64
    .line 65
    new-instance v2, Ld4/a;

    .line 66
    .line 67
    invoke-direct {v2, v0}, Ld4/a;-><init>(Landroid/widget/AbsListView;)V

    .line 68
    .line 69
    .line 70
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 71
    .line 72
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 73
    .line 74
    invoke-direct {v1, v2, v0, p0}, Lc4/i;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 75
    .line 76
    .line 77
    return-object v1

    .line 78
    :cond_2
    instance-of v1, v0, Landroidx/appcompat/app/RecycleListView;

    .line 79
    .line 80
    if-eqz v1, :cond_3

    .line 81
    .line 82
    check-cast v0, Landroidx/appcompat/app/RecycleListView;

    .line 83
    .line 84
    new-instance v1, Lc4/i;

    .line 85
    .line 86
    new-instance v2, Ld4/a;

    .line 87
    .line 88
    invoke-direct {v2, v0}, Ld4/a;-><init>(Landroid/widget/AbsListView;)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 92
    .line 93
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 94
    .line 95
    invoke-direct {v1, v2, v0, p0}, Lc4/i;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 96
    .line 97
    .line 98
    return-object v1

    .line 99
    :cond_3
    instance-of v1, v0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;

    .line 100
    .line 101
    if-eqz v1, :cond_4

    .line 102
    .line 103
    check-cast v0, Lcom/zte/mifavor/custom/internal/app/RecycleListView;

    .line 104
    .line 105
    new-instance v1, Lc4/i;

    .line 106
    .line 107
    new-instance v2, Ld4/a;

    .line 108
    .line 109
    invoke-direct {v2, v0}, Ld4/a;-><init>(Landroid/widget/AbsListView;)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 113
    .line 114
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 115
    .line 116
    invoke-direct {v1, v2, v0, p0}, Lc4/i;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 117
    .line 118
    .line 119
    return-object v1

    .line 120
    :cond_4
    instance-of v1, v0, Lcom/zte/mifavor/widget/i;

    .line 121
    .line 122
    if-eqz v1, :cond_5

    .line 123
    .line 124
    check-cast v0, Lcom/zte/mifavor/widget/i;

    .line 125
    .line 126
    new-instance v1, Lc4/i;

    .line 127
    .line 128
    new-instance v2, Ld4/a;

    .line 129
    .line 130
    invoke-direct {v2, v0}, Ld4/a;-><init>(Landroid/widget/AbsListView;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 134
    .line 135
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 136
    .line 137
    invoke-direct {v1, v2, v0, p0}, Lc4/i;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 138
    .line 139
    .line 140
    return-object v1

    .line 141
    :cond_5
    instance-of v1, v0, Lcom/zte/mifavor/widget/ScrollView;

    .line 142
    .line 143
    if-eqz v1, :cond_6

    .line 144
    .line 145
    check-cast v0, Lcom/zte/mifavor/widget/ScrollView;

    .line 146
    .line 147
    new-instance v1, Lc4/i;

    .line 148
    .line 149
    new-instance v2, Ld4/f;

    .line 150
    .line 151
    invoke-direct {v2, v0}, Ld4/f;-><init>(Landroid/widget/ScrollView;)V

    .line 152
    .line 153
    .line 154
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 155
    .line 156
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 157
    .line 158
    invoke-direct {v1, v2, v0, p0}, Lc4/i;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 159
    .line 160
    .line 161
    return-object v1

    .line 162
    :cond_6
    instance-of v1, v0, Landroid/widget/HorizontalScrollView;

    .line 163
    .line 164
    if-eqz v1, :cond_7

    .line 165
    .line 166
    check-cast v0, Landroid/widget/HorizontalScrollView;

    .line 167
    .line 168
    new-instance v1, Lc4/b;

    .line 169
    .line 170
    new-instance v2, Ld4/b;

    .line 171
    .line 172
    invoke-direct {v2, v0}, Ld4/b;-><init>(Landroid/widget/HorizontalScrollView;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 176
    .line 177
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 178
    .line 179
    invoke-direct {v1, v2, v0, p0}, Lc4/b;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 180
    .line 181
    .line 182
    return-object v1

    .line 183
    :cond_7
    instance-of v1, v0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 184
    .line 185
    if-eqz v1, :cond_8

    .line 186
    .line 187
    check-cast v0, Lcom/zte/mifavor/androidx/widget/NestedScrollView;

    .line 188
    .line 189
    new-instance v1, Lc4/i;

    .line 190
    .line 191
    new-instance v2, Ld4/d;

    .line 192
    .line 193
    invoke-direct {v2, v0}, Ld4/d;-><init>(Landroidx/core/widget/NestedScrollView;)V

    .line 194
    .line 195
    .line 196
    iget-object v0, p0, Lc4/h;->b:Landroidx/dynamicanimation/animation/j;

    .line 197
    .line 198
    iget-object p0, p0, Lc4/h;->a:Landroid/view/VelocityTracker;

    .line 199
    .line 200
    invoke-direct {v1, v2, v0, p0}, Lc4/i;-><init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    .line 201
    .line 202
    .line 203
    return-object v1

    .line 204
    :cond_8
    new-instance v0, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    const-string v1, "setUpOverScroll error. mView = "

    .line 210
    .line 211
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    iget-object p0, p0, Lc4/h;->e:Landroid/view/View;

    .line 215
    .line 216
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object p0

    .line 223
    const-string v0, "Z#QScroll-DecoHelper"

    .line 224
    .line 225
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 226
    .line 227
    .line 228
    const/4 p0, 0x0

    .line 229
    return-object p0
.end method
