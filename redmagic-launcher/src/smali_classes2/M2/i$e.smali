.class public final LM2/i$e;
.super Ljava/lang/Object;
.source "PhysicsAnimator.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LM2/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "e"
.end annotation


# instance fields
.field private final a:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private b:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "+",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;>;"
        }
    .end annotation
.end field

.field private c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "LM2/i$g<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "LM2/i$c<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Lu4/a<",
            "Lh4/t;",
            ">;>;"
        }
    .end annotation
.end field

.field private f:I

.field private final g:Landroid/util/ArrayMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/ArrayMap<",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;",
            "LM2/i$a;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic h:LM2/i;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LM2/i<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(LM2/i;Ljava/lang/Object;Ljava/util/Set;Ljava/util/List;Ljava/util/List;Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/util/Set<",
            "+",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;>;",
            "Ljava/util/List<",
            "+",
            "LM2/i$g<",
            "TT;>;>;",
            "Ljava/util/List<",
            "+",
            "LM2/i$c<",
            "TT;>;>;",
            "Ljava/util/List<",
            "+",
            "Lu4/a<",
            "Lh4/t;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    const-string v0, "properties"

    .line 2
    .line 3
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "updateListeners"

    .line 7
    .line 8
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "endListeners"

    .line 12
    .line 13
    invoke-static {p5, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "endActions"

    .line 17
    .line 18
    invoke-static {p6, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, LM2/i$e;->h:LM2/i;

    .line 22
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p2, p0, LM2/i$e;->a:Ljava/lang/Object;

    .line 27
    .line 28
    iput-object p3, p0, LM2/i$e;->b:Ljava/util/Set;

    .line 29
    .line 30
    iput-object p4, p0, LM2/i$e;->c:Ljava/util/List;

    .line 31
    .line 32
    iput-object p5, p0, LM2/i$e;->d:Ljava/util/List;

    .line 33
    .line 34
    iput-object p6, p0, LM2/i$e;->e:Ljava/util/List;

    .line 35
    .line 36
    invoke-interface {p3}, Ljava/util/Set;->size()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iput p1, p0, LM2/i$e;->f:I

    .line 41
    .line 42
    new-instance p1, Landroid/util/ArrayMap;

    .line 43
    .line 44
    invoke-direct {p1}, Landroid/util/ArrayMap;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 48
    .line 49
    return-void
.end method

.method private final a()V
    .locals 5

    .line 1
    iget-object v0, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget v1, p0, LM2/i$e;->f:I

    .line 8
    .line 9
    if-lt v0, v1, :cond_1

    .line 10
    .line 11
    iget-object v0, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 12
    .line 13
    invoke-virtual {v0}, Landroid/util/ArrayMap;->size()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, LM2/i$e;->c:Ljava/util/List;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, LM2/i$g;

    .line 36
    .line 37
    iget-object v2, p0, LM2/i$e;->a:Ljava/lang/Object;

    .line 38
    .line 39
    new-instance v3, Landroid/util/ArrayMap;

    .line 40
    .line 41
    iget-object v4, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 42
    .line 43
    invoke-direct {v3, v4}, Landroid/util/ArrayMap;-><init>(Landroid/util/ArrayMap;)V

    .line 44
    .line 45
    .line 46
    invoke-interface {v1, v2, v3}, LM2/i$g;->a(Ljava/lang/Object;Landroid/util/ArrayMap;)V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p0, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 51
    .line 52
    invoke-virtual {p0}, Landroid/util/ArrayMap;->clear()V

    .line 53
    .line 54
    .line 55
    :cond_1
    return-void
.end method


# virtual methods
.method public final b(Landroidx/dynamicanimation/animation/g;ZFFZ)Z
    .locals 12
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;ZFFZ)Z"
        }
    .end annotation

    .line 1
    const-string v0, "property"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/i$e;->b:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    return v1

    .line 16
    :cond_0
    iget v0, p0, LM2/i$e;->f:I

    .line 17
    .line 18
    add-int/lit8 v0, v0, -0x1

    .line 19
    .line 20
    iput v0, p0, LM2/i$e;->f:I

    .line 21
    .line 22
    invoke-direct {p0}, LM2/i$e;->a()V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 26
    .line 27
    invoke-interface {v0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget-object v0, p0, LM2/i$e;->c:Ljava/util/List;

    .line 34
    .line 35
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, LM2/i$g;

    .line 50
    .line 51
    iget-object v3, p0, LM2/i$e;->a:Ljava/lang/Object;

    .line 52
    .line 53
    new-instance v4, Landroid/util/ArrayMap;

    .line 54
    .line 55
    invoke-direct {v4}, Landroid/util/ArrayMap;-><init>()V

    .line 56
    .line 57
    .line 58
    iget-object v5, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 59
    .line 60
    invoke-virtual {v5, p1}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v5

    .line 64
    invoke-interface {v4, p1, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    sget-object v5, Lh4/t;->a:Lh4/t;

    .line 68
    .line 69
    invoke-interface {v2, v3, v4}, LM2/i$g;->a(Ljava/lang/Object;Landroid/util/ArrayMap;)V

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_1
    iget-object v0, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 74
    .line 75
    invoke-virtual {v0, p1}, Landroid/util/ArrayMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    :cond_2
    iget-object v0, p0, LM2/i$e;->h:LM2/i;

    .line 79
    .line 80
    iget-object v2, p0, LM2/i$e;->b:Ljava/util/Set;

    .line 81
    .line 82
    invoke-virtual {v0, v2}, LM2/i;->j(Ljava/util/Set;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    xor-int/lit8 v9, v0, 0x1

    .line 87
    .line 88
    iget-object v2, p0, LM2/i$e;->d:Ljava/util/List;

    .line 89
    .line 90
    iget-object v10, p0, LM2/i$e;->h:LM2/i;

    .line 91
    .line 92
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 93
    .line 94
    .line 95
    move-result-object v11

    .line 96
    :cond_3
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    .line 97
    .line 98
    .line 99
    move-result v2

    .line 100
    if-eqz v2, :cond_4

    .line 101
    .line 102
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    check-cast v2, LM2/i$c;

    .line 107
    .line 108
    iget-object v3, p0, LM2/i$e;->a:Ljava/lang/Object;

    .line 109
    .line 110
    move-object v4, p1

    .line 111
    move v6, p2

    .line 112
    move v7, p3

    .line 113
    move/from16 v8, p4

    .line 114
    .line 115
    move/from16 v5, p5

    .line 116
    .line 117
    invoke-interface/range {v2 .. v9}, LM2/i$c;->a(Ljava/lang/Object;Landroidx/dynamicanimation/animation/g;ZZFFZ)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v10, p1}, LM2/i;->w(Landroidx/dynamicanimation/animation/g;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_3

    .line 125
    .line 126
    return v1

    .line 127
    :cond_4
    if-nez v0, :cond_5

    .line 128
    .line 129
    if-nez p2, :cond_5

    .line 130
    .line 131
    iget-object p0, p0, LM2/i$e;->e:Ljava/util/List;

    .line 132
    .line 133
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 138
    .line 139
    .line 140
    move-result p1

    .line 141
    if-eqz p1, :cond_5

    .line 142
    .line 143
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    check-cast p1, Lu4/a;

    .line 148
    .line 149
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    goto :goto_1

    .line 153
    :cond_5
    return v9
.end method

.method public final c(Landroidx/dynamicanimation/animation/g;FF)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/dynamicanimation/animation/g<",
            "-TT;>;FF)V"
        }
    .end annotation

    .line 1
    const-string v0, "property"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, LM2/i$e;->b:Ljava/util/Set;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    iget-object v0, p0, LM2/i$e;->g:Landroid/util/ArrayMap;

    .line 16
    .line 17
    new-instance v1, LM2/i$a;

    .line 18
    .line 19
    invoke-direct {v1, p2, p3}, LM2/i$a;-><init>(FF)V

    .line 20
    .line 21
    .line 22
    invoke-interface {v0, p1, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    invoke-direct {p0}, LM2/i$e;->a()V

    .line 26
    .line 27
    .line 28
    return-void
.end method
