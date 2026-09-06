.class LL0/n$c;
.super Ljava/lang/Object;
.source "ViewCapture.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnDrawListener;
.implements Landroid/content/ComponentCallbacks2;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LL0/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "c"
.end annotation


# instance fields
.field public g:Landroid/view/View;

.field public final h:Ljava/lang/String;

.field private i:LL0/n$b;

.field private final j:LL0/n$b;

.field private k:I

.field private l:Z

.field private m:[J

.field private n:[LL0/n$b;

.field private o:Z

.field private final p:Ljava/util/function/Consumer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Consumer<",
            "LL0/n$b;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic q:LL0/n;


# direct methods
.method constructor <init>(LL0/n;Landroid/view/View;Ljava/lang/String;)V
    .locals 2

    .line 1
    iput-object p1, p0, LL0/n$c;->q:LL0/n;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v0, LL0/n$b;

    .line 7
    .line 8
    invoke-direct {v0}, LL0/n$b;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, LL0/n$c;->i:LL0/n$b;

    .line 12
    .line 13
    new-instance v0, LL0/n$b;

    .line 14
    .line 15
    invoke-direct {v0}, LL0/n$b;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, LL0/n$c;->j:LL0/n$b;

    .line 19
    .line 20
    const/4 v0, -0x1

    .line 21
    iput v0, p0, LL0/n$c;->k:I

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    iput-boolean v0, p0, LL0/n$c;->l:Z

    .line 25
    .line 26
    invoke-static {p1}, LL0/n;->g(LL0/n;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    new-array v1, v1, [J

    .line 31
    .line 32
    iput-object v1, p0, LL0/n$c;->m:[J

    .line 33
    .line 34
    invoke-static {p1}, LL0/n;->g(LL0/n;)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    new-array v1, v1, [LL0/n$b;

    .line 39
    .line 40
    iput-object v1, p0, LL0/n$c;->n:[LL0/n$b;

    .line 41
    .line 42
    iput-boolean v0, p0, LL0/n$c;->o:Z

    .line 43
    .line 44
    new-instance v0, LL0/o;

    .line 45
    .line 46
    invoke-direct {v0, p0}, LL0/o;-><init>(LL0/n$c;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, LL0/n$c;->p:Ljava/util/function/Consumer;

    .line 50
    .line 51
    iput-object p2, p0, LL0/n$c;->g:Landroid/view/View;

    .line 52
    .line 53
    iput-object p3, p0, LL0/n$c;->h:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1}, LL0/n;->f(LL0/n;)I

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    invoke-direct {p0, p1}, LL0/n$c;->p(I)V

    .line 60
    .line 61
    .line 62
    return-void
.end method

.method public static synthetic a(LL0/n$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LL0/n$c;->s()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(LL0/n$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LL0/n$c;->q()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(LL0/n$c;LL0/n$b;LL0/n$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LL0/n$c;->r(LL0/n$b;LL0/n$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(LL0/n$c;LL0/n$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, LL0/n$c;->k(LL0/n$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method static bridge synthetic e(LL0/n$c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LL0/n$c;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method static bridge synthetic f(LL0/n$c;LL0/n$a;Ljava/util/ArrayList;)LM0/d;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LL0/n$c;->m(LL0/n$a;Ljava/util/ArrayList;)LM0/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method static bridge synthetic g(LL0/n$c;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LL0/n$c;->t()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private h(LL0/n$b;LL0/n$b;)V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/n$c;->i:LL0/n$b;

    .line 2
    .line 3
    iput-object v0, p2, LL0/n$b;->A:LL0/n$b;

    .line 4
    .line 5
    iput-object p1, p0, LL0/n$c;->i:LL0/n$b;

    .line 6
    .line 7
    return-void
.end method

.method private j(Landroid/view/View;LL0/n$b;)LL0/n$b;
    .locals 4

    .line 1
    invoke-direct {p0}, LL0/n$c;->o()LL0/n$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iput-object v0, p2, LL0/n$b;->A:LL0/n$b;

    .line 6
    .line 7
    instance-of p2, p1, Landroid/view/ViewGroup;

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    if-eqz p2, :cond_2

    .line 11
    .line 12
    move-object p2, p1

    .line 13
    check-cast p2, Landroid/view/ViewGroup;

    .line 14
    .line 15
    iget v2, p1, Landroid/view/View;->mPrivateFlags:I

    .line 16
    .line 17
    const/high16 v3, -0x7fe00000

    .line 18
    .line 19
    and-int/2addr v2, v3

    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    iget-boolean v2, p0, LL0/n$c;->l:Z

    .line 23
    .line 24
    if-nez v2, :cond_0

    .line 25
    .line 26
    const/4 p0, -0x1

    .line 27
    iput p0, v0, LL0/n$b;->z:I

    .line 28
    .line 29
    iput-object p1, v0, LL0/n$b;->g:Landroid/view/View;

    .line 30
    .line 31
    return-object v0

    .line 32
    :cond_0
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iput v2, v0, LL0/n$b;->z:I

    .line 37
    .line 38
    invoke-virtual {v0, p1}, LL0/n$b;->c(Landroid/view/View;)V

    .line 39
    .line 40
    .line 41
    :goto_0
    if-ge v1, v2, :cond_1

    .line 42
    .line 43
    invoke-virtual {p2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-direct {p0, p1, v0}, LL0/n$c;->j(Landroid/view/View;LL0/n$b;)LL0/n$b;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    add-int/lit8 v1, v1, 0x1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    return-object v0

    .line 55
    :cond_2
    iput v1, v0, LL0/n$b;->z:I

    .line 56
    .line 57
    invoke-virtual {v0, p1}, LL0/n$b;->c(Landroid/view/View;)V

    .line 58
    .line 59
    .line 60
    return-object v0
.end method

.method private k(LL0/n$b;)V
    .locals 12

    .line 1
    const-string v0, "vc#copyCleanViewsFromLastFrameBg"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-wide v0, p1, LL0/n$b;->C:J

    .line 7
    .line 8
    iget v2, p0, LL0/n$c;->k:I

    .line 9
    .line 10
    add-int/lit8 v2, v2, 0x1

    .line 11
    .line 12
    iput v2, p0, LL0/n$c;->k:I

    .line 13
    .line 14
    iget-object v3, p0, LL0/n$c;->q:LL0/n;

    .line 15
    .line 16
    invoke-static {v3}, LL0/n;->g(LL0/n;)I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    const/4 v4, 0x0

    .line 21
    if-lt v2, v3, :cond_0

    .line 22
    .line 23
    iput v4, p0, LL0/n$c;->k:I

    .line 24
    .line 25
    :cond_0
    iget-object v2, p0, LL0/n$c;->m:[J

    .line 26
    .line 27
    iget v3, p0, LL0/n$c;->k:I

    .line 28
    .line 29
    aput-wide v0, v2, v3

    .line 30
    .line 31
    iget-object v2, p0, LL0/n$c;->n:[LL0/n$b;

    .line 32
    .line 33
    aget-object v2, v2, v3

    .line 34
    .line 35
    const/4 v3, 0x0

    .line 36
    move-object v5, p1

    .line 37
    move-object v6, v3

    .line 38
    move-object v7, v6

    .line 39
    :goto_0
    if-eqz v5, :cond_8

    .line 40
    .line 41
    invoke-virtual {v5}, LL0/n$b;->a()V

    .line 42
    .line 43
    .line 44
    if-nez v2, :cond_1

    .line 45
    .line 46
    new-instance v8, LL0/n$b;

    .line 47
    .line 48
    invoke-direct {v8}, LL0/n$b;-><init>()V

    .line 49
    .line 50
    .line 51
    move-object v11, v8

    .line 52
    move-object v8, v2

    .line 53
    move-object v2, v11

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v8, v2, LL0/n$b;->A:LL0/n$b;

    .line 56
    .line 57
    iput-object v3, v2, LL0/n$b;->A:LL0/n$b;

    .line 58
    .line 59
    :goto_1
    iget v9, v5, LL0/n$b;->z:I

    .line 60
    .line 61
    if-gez v9, :cond_3

    .line 62
    .line 63
    iget v9, v5, LL0/n$b;->i:I

    .line 64
    .line 65
    invoke-direct {p0, v9}, LL0/n$c;->n(I)LL0/n$b;

    .line 66
    .line 67
    .line 68
    move-result-object v9

    .line 69
    if-eqz v9, :cond_2

    .line 70
    .line 71
    invoke-virtual {v9, v5}, LL0/n$b;->d(LL0/n$b;)V

    .line 72
    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_2
    iput v4, v5, LL0/n$b;->z:I

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_3
    move-object v9, v3

    .line 79
    :goto_2
    invoke-virtual {v5, v2}, LL0/n$b;->d(LL0/n$b;)V

    .line 80
    .line 81
    .line 82
    if-nez v6, :cond_4

    .line 83
    .line 84
    move-object v6, v2

    .line 85
    goto :goto_3

    .line 86
    :cond_4
    iput-object v2, v7, LL0/n$b;->A:LL0/n$b;

    .line 87
    .line 88
    :goto_3
    if-eqz v9, :cond_6

    .line 89
    .line 90
    iget v7, v9, LL0/n$b;->z:I

    .line 91
    .line 92
    :goto_4
    if-lez v7, :cond_6

    .line 93
    .line 94
    iget-object v9, v9, LL0/n$b;->A:LL0/n$b;

    .line 95
    .line 96
    add-int/lit8 v7, v7, -0x1

    .line 97
    .line 98
    iget v10, v9, LL0/n$b;->z:I

    .line 99
    .line 100
    add-int/2addr v7, v10

    .line 101
    if-nez v8, :cond_5

    .line 102
    .line 103
    new-instance v10, LL0/n$b;

    .line 104
    .line 105
    invoke-direct {v10}, LL0/n$b;-><init>()V

    .line 106
    .line 107
    .line 108
    move-object v11, v10

    .line 109
    move-object v10, v8

    .line 110
    move-object v8, v11

    .line 111
    goto :goto_5

    .line 112
    :cond_5
    iget-object v10, v8, LL0/n$b;->A:LL0/n$b;

    .line 113
    .line 114
    iput-object v3, v8, LL0/n$b;->A:LL0/n$b;

    .line 115
    .line 116
    :goto_5
    invoke-virtual {v9, v8}, LL0/n$b;->d(LL0/n$b;)V

    .line 117
    .line 118
    .line 119
    iput-object v8, v2, LL0/n$b;->A:LL0/n$b;

    .line 120
    .line 121
    move-object v2, v8

    .line 122
    move-object v8, v10

    .line 123
    goto :goto_4

    .line 124
    :cond_6
    move-object v7, v2

    .line 125
    move-object v2, v8

    .line 126
    iget-object v8, v5, LL0/n$b;->A:LL0/n$b;

    .line 127
    .line 128
    if-nez v8, :cond_7

    .line 129
    .line 130
    iget-object v2, p0, LL0/n$c;->q:LL0/n;

    .line 131
    .line 132
    new-instance v3, LL0/r;

    .line 133
    .line 134
    invoke-direct {v3, p0, p1, v5}, LL0/r;-><init>(LL0/n$c;LL0/n$b;LL0/n$b;)V

    .line 135
    .line 136
    .line 137
    iget-object p1, p0, LL0/n$c;->g:Landroid/view/View;

    .line 138
    .line 139
    invoke-virtual {v2, v3, p1}, LL0/n;->p(Ljava/lang/Runnable;Landroid/view/View;)V

    .line 140
    .line 141
    .line 142
    goto :goto_6

    .line 143
    :cond_7
    move-object v5, v8

    .line 144
    goto :goto_0

    .line 145
    :cond_8
    :goto_6
    iget-object p1, p0, LL0/n$c;->n:[LL0/n$b;

    .line 146
    .line 147
    iget v2, p0, LL0/n$c;->k:I

    .line 148
    .line 149
    aput-object v6, p1, v2

    .line 150
    .line 151
    iget-object p1, p0, LL0/n$c;->q:LL0/n;

    .line 152
    .line 153
    iget-object p0, p0, LL0/n$c;->h:Ljava/lang/String;

    .line 154
    .line 155
    invoke-virtual {p1, v0, v1, p0, v6}, LL0/n;->o(JLjava/lang/String;LL0/n$b;)V

    .line 156
    .line 157
    .line 158
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 159
    .line 160
    .line 161
    return-void
.end method

.method private m(LL0/n$a;Ljava/util/ArrayList;)LM0/d;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LL0/n$a;",
            "Ljava/util/ArrayList<",
            "Ljava/lang/Class;",
            ">;)",
            "LM0/d;"
        }
    .end annotation

    .line 1
    invoke-static {}, LM0/d;->f()LM0/d$b;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, LL0/n$c;->h:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, LM0/d$b;->b(Ljava/lang/String;)LM0/d$b;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, LL0/n$c;->n:[LL0/n$b;

    .line 12
    .line 13
    iget-object v2, p0, LL0/n$c;->q:LL0/n;

    .line 14
    .line 15
    invoke-static {v2}, LL0/n;->g(LL0/n;)I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    add-int/lit8 v2, v2, -0x1

    .line 20
    .line 21
    aget-object v1, v1, v2

    .line 22
    .line 23
    if-nez v1, :cond_0

    .line 24
    .line 25
    iget v1, p0, LL0/n$c;->k:I

    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v1, p0, LL0/n$c;->q:LL0/n;

    .line 31
    .line 32
    invoke-static {v1}, LL0/n;->g(LL0/n;)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :goto_0
    add-int/lit8 v1, v1, -0x1

    .line 37
    .line 38
    :goto_1
    if-ltz v1, :cond_1

    .line 39
    .line 40
    iget-object v2, p0, LL0/n$c;->q:LL0/n;

    .line 41
    .line 42
    invoke-static {v2}, LL0/n;->g(LL0/n;)I

    .line 43
    .line 44
    .line 45
    move-result v2

    .line 46
    iget v3, p0, LL0/n$c;->k:I

    .line 47
    .line 48
    add-int/2addr v2, v3

    .line 49
    sub-int/2addr v2, v1

    .line 50
    iget-object v3, p0, LL0/n$c;->q:LL0/n;

    .line 51
    .line 52
    invoke-static {v3}, LL0/n;->g(LL0/n;)I

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    rem-int/2addr v2, v3

    .line 57
    invoke-static {}, LM0/c;->w()LM0/c$b;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    iget-object v4, p0, LL0/n$c;->n:[LL0/n$b;

    .line 62
    .line 63
    aget-object v4, v4, v2

    .line 64
    .line 65
    invoke-virtual {v4, p1, p2, v3}, LL0/n$b;->b(LL0/n$a;Ljava/util/ArrayList;LM0/c$b;)LL0/n$b;

    .line 66
    .line 67
    .line 68
    invoke-static {}, LM0/b;->d()LM0/b$b;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v4, v3}, LM0/b$b;->a(LM0/c$b;)LM0/b$b;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    iget-object v4, p0, LL0/n$c;->m:[J

    .line 77
    .line 78
    aget-wide v4, v4, v2

    .line 79
    .line 80
    invoke-virtual {v3, v4, v5}, LM0/b$b;->b(J)LM0/b$b;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-virtual {v0, v2}, LM0/d$b;->a(LM0/b$b;)LM0/d$b;

    .line 85
    .line 86
    .line 87
    add-int/lit8 v1, v1, -0x1

    .line 88
    .line 89
    goto :goto_1

    .line 90
    :cond_1
    invoke-virtual {v0}, Lcom/google/protobuf/y$a;->build()Lcom/google/protobuf/y;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, LM0/d;

    .line 95
    .line 96
    return-object p0
.end method

.method private n(I)LL0/n$b;
    .locals 1

    .line 1
    iget v0, p0, LL0/n$c;->k:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, LL0/n$c;->q:LL0/n;

    .line 6
    .line 7
    invoke-static {v0}, LL0/n;->g(LL0/n;)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    :cond_0
    add-int/lit8 v0, v0, -0x1

    .line 12
    .line 13
    iget-object p0, p0, LL0/n$c;->n:[LL0/n$b;

    .line 14
    .line 15
    aget-object p0, p0, v0

    .line 16
    .line 17
    :goto_0
    if-eqz p0, :cond_1

    .line 18
    .line 19
    iget v0, p0, LL0/n$b;->i:I

    .line 20
    .line 21
    if-eq v0, p1, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, LL0/n$b;->A:LL0/n$b;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_1
    return-object p0
.end method

.method private o()LL0/n$b;
    .locals 2

    .line 1
    iget-object v0, p0, LL0/n$c;->i:LL0/n$b;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, v0, LL0/n$b;->A:LL0/n$b;

    .line 6
    .line 7
    iput-object v1, p0, LL0/n$c;->i:LL0/n$b;

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    iput-object p0, v0, LL0/n$b;->A:LL0/n$b;

    .line 11
    .line 12
    return-object v0

    .line 13
    :cond_0
    new-instance p0, LL0/n$b;

    .line 14
    .line 15
    invoke-direct {p0}, LL0/n$b;-><init>()V

    .line 16
    .line 17
    .line 18
    return-object p0
.end method

.method private p(I)V
    .locals 4

    .line 1
    new-instance v0, LL0/n$b;

    .line 2
    .line 3
    invoke-direct {v0}, LL0/n$b;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    move-object v2, v0

    .line 8
    :goto_0
    if-ge v1, p1, :cond_0

    .line 9
    .line 10
    new-instance v3, LL0/n$b;

    .line 11
    .line 12
    invoke-direct {v3}, LL0/n$b;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v3, v2, LL0/n$b;->A:LL0/n$b;

    .line 16
    .line 17
    add-int/lit8 v1, v1, 0x1

    .line 18
    .line 19
    move-object v2, v3

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    invoke-direct {p0, v0, v2}, LL0/n$c;->h(LL0/n$b;LL0/n$b;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method private synthetic q()V
    .locals 2

    .line 1
    iget-object v0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, LL0/n$c;->t()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 14
    .line 15
    new-instance v1, LL0/n$c$a;

    .line 16
    .line 17
    invoke-direct {v1, p0}, LL0/n$c$a;-><init>(LL0/n$c;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->addOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method private synthetic r(LL0/n$b;LL0/n$b;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, LL0/n$c;->h(LL0/n$b;LL0/n$b;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private synthetic s()V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method private t()V
    .locals 1

    .line 1
    iget-object v0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->addOnDrawListener(Landroid/view/ViewTreeObserver$OnDrawListener;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method


# virtual methods
.method i()V
    .locals 2

    .line 1
    iget-object v0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, LL0/n$c;->o:Z

    .line 8
    .line 9
    iget-object v0, p0, LL0/n$c;->q:LL0/n;

    .line 10
    .line 11
    new-instance v1, LL0/p;

    .line 12
    .line 13
    invoke-direct {v1, p0}, LL0/p;-><init>(LL0/n$c;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 17
    .line 18
    invoke-virtual {v0, v1, p0}, LL0/n;->p(Ljava/lang/Runnable;Landroid/view/View;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method l()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, LL0/n$c;->o:Z

    .line 3
    .line 4
    iget-object v0, p0, LL0/n$c;->q:LL0/n;

    .line 5
    .line 6
    new-instance v1, LL0/q;

    .line 7
    .line 8
    invoke-direct {v1, p0}, LL0/q;-><init>(LL0/n$c;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, LL0/n$c;->g:Landroid/view/View;

    .line 12
    .line 13
    invoke-virtual {v0, v1, p0}, LL0/n;->p(Ljava/lang/Runnable;Landroid/view/View;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onDraw()V
    .locals 3

    .line 1
    const-string v0, "vc#onDraw"

    .line 2
    .line 3
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object v0, p0, LL0/n$c;->g:Landroid/view/View;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    :try_start_1
    iget-object v1, p0, LL0/n$c;->j:LL0/n$b;

    .line 15
    .line 16
    invoke-direct {p0, v0, v1}, LL0/n$c;->j(Landroid/view/View;LL0/n$b;)LL0/n$b;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, LL0/n$c;->j:LL0/n$b;

    .line 20
    .line 21
    iget-object v0, v0, LL0/n$b;->A:LL0/n$b;

    .line 22
    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v1, p0, LL0/n$c;->p:Ljava/util/function/Consumer;

    .line 26
    .line 27
    iput-object v1, v0, LL0/n$b;->B:Ljava/util/function/Consumer;

    .line 28
    .line 29
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtimeNanos()J

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    iput-wide v1, v0, LL0/n$b;->C:J

    .line 34
    .line 35
    iget-object v1, p0, LL0/n$c;->q:LL0/n;

    .line 36
    .line 37
    iget-object v1, v1, LL0/n;->d:Ljava/util/concurrent/Executor;

    .line 38
    .line 39
    invoke-interface {v1, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 40
    .line 41
    .line 42
    :cond_1
    const/4 v0, 0x0

    .line 43
    iput-boolean v0, p0, LL0/n$c;->l:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception p0

    .line 50
    invoke-static {}, Landroid/os/Trace;->endSection()V

    .line 51
    .line 52
    .line 53
    throw p0
.end method

.method public onLowMemory()V
    .locals 1

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    invoke-virtual {p0, v0}, LL0/n$c;->onTrimMemory(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onTrimMemory(I)V
    .locals 1

    .line 1
    const/16 v0, 0x28

    .line 2
    .line 3
    if-lt p1, v0, :cond_1

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    new-array v0, p1, [LL0/n$b;

    .line 7
    .line 8
    iput-object v0, p0, LL0/n$c;->n:[LL0/n$b;

    .line 9
    .line 10
    new-array p1, p1, [J

    .line 11
    .line 12
    iput-object p1, p0, LL0/n$c;->m:[J

    .line 13
    .line 14
    iget-object p1, p0, LL0/n$c;->g:Landroid/view/View;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    if-eqz p1, :cond_0

    .line 23
    .line 24
    iget-object p1, p0, LL0/n$c;->g:Landroid/view/View;

    .line 25
    .line 26
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    invoke-virtual {p0}, LL0/n$c;->l()V

    .line 34
    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, LL0/n$c;->g:Landroid/view/View;

    .line 38
    .line 39
    :cond_1
    return-void
.end method
