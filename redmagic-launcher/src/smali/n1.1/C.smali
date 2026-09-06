.class public final Ln1/C;
.super Ljava/lang/Object;
.source "ThemeManager.kt"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ln1/C$a;,
        Ln1/C$b;,
        Ln1/C$c;,
        Ln1/C$d;
    }
.end annotation


# static fields
.field public static final f:Ln1/C$a;

.field public static final g:Lcom/android/launcher3/util/I;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/util/I<",
            "Ln1/C;",
            ">;"
        }
    .end annotation
.end field

.field public static final h:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation
.end field

.field public static final i:Lcom/android/launcher3/X;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/X<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static final j:I

.field private static final k:Lu1/a;


# instance fields
.field private final a:Landroid/content/Context;

.field private final b:Lcom/android/launcher3/J3;

.field private final c:Ln1/C$b;

.field private d:Ln1/C$c;

.field private final e:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList<",
            "Ln1/C$d;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    new-instance v0, Ln1/C$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ln1/C$a;-><init>(Lkotlin/jvm/internal/j;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Ln1/C;->f:Ln1/C$a;

    .line 8
    .line 9
    new-instance v0, Lcom/android/launcher3/util/I;

    .line 10
    .line 11
    new-instance v2, Ln1/y;

    .line 12
    .line 13
    invoke-direct {v2}, Ln1/y;-><init>()V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v2}, Lcom/android/launcher3/util/I;-><init>(Ljava/util/function/Function;)V

    .line 17
    .line 18
    .line 19
    sput-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 20
    .line 21
    sget-object v0, Lcom/android/launcher3/J3;->c:Lcom/android/launcher3/J3$a;

    .line 22
    .line 23
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 24
    .line 25
    sget-object v3, Lcom/android/launcher3/r0;->g:Lcom/android/launcher3/r0;

    .line 26
    .line 27
    const-string v4, "themed_icons"

    .line 28
    .line 29
    invoke-virtual {v0, v4, v2, v3}, Lcom/android/launcher3/J3$a;->h(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    sput-object v2, Ln1/C;->h:Lcom/android/launcher3/X;

    .line 34
    .line 35
    const-string v2, "icon_shape_model"

    .line 36
    .line 37
    const-string v4, ""

    .line 38
    .line 39
    invoke-virtual {v0, v2, v4, v3}, Lcom/android/launcher3/J3$a;->a(Ljava/lang/String;Ljava/lang/Object;Lcom/android/launcher3/r0;)Lcom/android/launcher3/X;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    sput-object v0, Ln1/C;->i:Lcom/android/launcher3/X;

    .line 44
    .line 45
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v2, "string"

    .line 50
    .line 51
    const-string v3, "android"

    .line 52
    .line 53
    const-string v4, "config_icon_mask"

    .line 54
    .line 55
    invoke-virtual {v0, v4, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    sput v0, Ln1/C;->j:I

    .line 60
    .line 61
    new-instance v0, Lu1/a;

    .line 62
    .line 63
    const/4 v2, 0x1

    .line 64
    invoke-direct {v0, v1, v2, v1}, Lu1/a;-><init>(Lu4/l;ILkotlin/jvm/internal/j;)V

    .line 65
    .line 66
    .line 67
    sput-object v0, Ln1/C;->k:Lu1/a;

    .line 68
    .line 69
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/android/launcher3/J3;Ln1/C$b;Lcom/android/launcher3/util/K;)V
    .locals 2

    .line 1
    const-string v0, "context"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "prefs"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    const-string v0, "iconControllerFactory"

    .line 12
    .line 13
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const-string v0, "lifecycle"

    .line 17
    .line 18
    invoke-static {p4, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ln1/C;->a:Landroid/content/Context;

    .line 25
    .line 26
    iput-object p2, p0, Ln1/C;->b:Lcom/android/launcher3/J3;

    .line 27
    .line 28
    iput-object p3, p0, Ln1/C;->c:Ln1/C$b;

    .line 29
    .line 30
    const/4 p2, 0x0

    .line 31
    invoke-direct {p0, p2}, Ln1/C;->o(Ln1/C$c;)Ln1/C$c;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    iput-object p2, p0, Ln1/C;->d:Ln1/C$c;

    .line 36
    .line 37
    new-instance p2, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 38
    .line 39
    invoke-direct {p2}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p2, p0, Ln1/C;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 43
    .line 44
    new-instance p2, Lcom/android/launcher3/util/x2;

    .line 45
    .line 46
    sget-object v0, Lcom/android/launcher3/util/m0;->e:Lcom/android/launcher3/util/p1;

    .line 47
    .line 48
    new-instance v1, Ln1/z;

    .line 49
    .line 50
    invoke-direct {v1, p0}, Ln1/z;-><init>(Ln1/C;)V

    .line 51
    .line 52
    .line 53
    invoke-direct {p2, p1, v0, v1}, Lcom/android/launcher3/util/x2;-><init>(Landroid/content/Context;Lcom/android/launcher3/util/p1;Ljava/util/function/Consumer;)V

    .line 54
    .line 55
    .line 56
    const-string p1, "android.intent.action.OVERLAY_CHANGED"

    .line 57
    .line 58
    filled-new-array {p1}, [Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    const-string v0, "android"

    .line 63
    .line 64
    invoke-virtual {p2, v0, p1}, Lcom/android/launcher3/util/x2;->u(Ljava/lang/String;[Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p3}, Ln1/C$b;->b()Ljava/util/List;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    sget-object p3, Ln1/C;->i:Lcom/android/launcher3/X;

    .line 72
    .line 73
    invoke-static {p1, p3}, Li4/m;->s0(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/List;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    const/4 p3, 0x0

    .line 78
    new-array p3, p3, [Lcom/android/launcher3/H1;

    .line 79
    .line 80
    invoke-interface {p1, p3}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p3

    .line 84
    check-cast p3, [Lcom/android/launcher3/H1;

    .line 85
    .line 86
    new-instance v0, Ljava/util/ArrayList;

    .line 87
    .line 88
    const/16 v1, 0xa

    .line 89
    .line 90
    invoke-static {p1, v1}, Li4/m;->s(Ljava/lang/Iterable;I)I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 95
    .line 96
    .line 97
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    if-eqz v1, :cond_0

    .line 106
    .line 107
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    check-cast v1, Lcom/android/launcher3/H1;

    .line 112
    .line 113
    invoke-virtual {v1}, Lcom/android/launcher3/H1;->c()Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object v1

    .line 117
    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_0
    new-instance p1, Ln1/A;

    .line 122
    .line 123
    invoke-direct {p1, v0, p0}, Ln1/A;-><init>(Ljava/util/List;Ln1/C;)V

    .line 124
    .line 125
    .line 126
    iget-object v0, p0, Ln1/C;->b:Lcom/android/launcher3/J3;

    .line 127
    .line 128
    array-length v1, p3

    .line 129
    invoke-static {p3, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    check-cast v1, [Lcom/android/launcher3/H1;

    .line 134
    .line 135
    invoke-virtual {v0, p1, v1}, Lcom/android/launcher3/J3;->d(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 136
    .line 137
    .line 138
    new-instance v0, Ln1/B;

    .line 139
    .line 140
    invoke-direct {v0, p2, p0, p1, p3}, Ln1/B;-><init>(Lcom/android/launcher3/util/x2;Ln1/C;Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p4, v0}, Lcom/android/launcher3/util/K;->c(Lcom/android/launcher3/util/a2;)V

    .line 144
    .line 145
    .line 146
    return-void
.end method

.method public static synthetic a(Ljava/util/List;Ln1/C;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ln1/C;->e(Ljava/util/List;Ln1/C;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b(Ln1/C;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ln1/C;->d(Ln1/C;Landroid/content/Intent;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Lcom/android/launcher3/util/x2;Ln1/C;Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2, p3}, Ln1/C;->f(Lcom/android/launcher3/util/x2;Ln1/C;Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final d(Ln1/C;Landroid/content/Intent;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ln1/C;->r()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final e(Ljava/util/List;Ln1/C;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    invoke-direct {p1}, Ln1/C;->r()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method private static final f(Lcom/android/launcher3/util/x2;Ln1/C;Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/util/x2;->v()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p1, Ln1/C;->b:Lcom/android/launcher3/J3;

    .line 5
    .line 6
    array-length p1, p3

    .line 7
    invoke-static {p3, p1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, [Lcom/android/launcher3/H1;

    .line 12
    .line 13
    invoke-virtual {p0, p2, p1}, Lcom/android/launcher3/J3;->x(Lcom/android/launcher3/F3;[Lcom/android/launcher3/H1;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static final synthetic g()Lu1/a;
    .locals 1

    .line 1
    sget-object v0, Ln1/C;->k:Lu1/a;

    .line 2
    .line 3
    return-object v0
.end method

.method private final o(Ln1/C$c;)Ln1/C$c;
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ln1/C;->b:Lcom/android/launcher3/J3;

    .line 4
    .line 5
    sget-object v2, Ln1/C;->i:Lcom/android/launcher3/X;

    .line 6
    .line 7
    invoke-virtual {v1, v2}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    check-cast v1, Ljava/lang/String;

    .line 12
    .line 13
    sget-object v2, LM1/b;->a:LM1/b;

    .line 14
    .line 15
    invoke-virtual {v2}, LM1/b;->a()[LM1/a;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    array-length v3, v2

    .line 20
    const/4 v4, 0x0

    .line 21
    :goto_0
    if-ge v4, v3, :cond_1

    .line 22
    .line 23
    aget-object v5, v2, v4

    .line 24
    .line 25
    invoke-virtual {v5}, LM1/a;->c()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    invoke-static {v6, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-eqz v6, :cond_0

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/4 v5, 0x0

    .line 40
    :goto_1
    if-eqz v5, :cond_2

    .line 41
    .line 42
    invoke-virtual {v5}, LM1/a;->d()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    :goto_2
    move-object v7, v1

    .line 47
    goto :goto_3

    .line 48
    :cond_2
    sget v1, Ln1/C;->j:I

    .line 49
    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    const-string v1, ""

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_3
    iget-object v2, v0, Ln1/C;->a:Landroid/content/Context;

    .line 56
    .line 57
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 58
    .line 59
    .line 60
    move-result-object v2

    .line 61
    invoke-virtual {v2, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "getString(...)"

    .line 66
    .line 67
    invoke-static {v1, v2}, Lkotlin/jvm/internal/o;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    goto :goto_2

    .line 71
    :goto_3
    if-eqz p1, :cond_4

    .line 72
    .line 73
    invoke-virtual/range {p1 .. p1}, Ln1/C$c;->c()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    invoke-static {v1, v7}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 78
    .line 79
    .line 80
    move-result v1

    .line 81
    if-eqz v1, :cond_4

    .line 82
    .line 83
    invoke-virtual/range {p1 .. p1}, Ln1/C$c;->e()Ln1/t;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    :goto_4
    move-object v12, v1

    .line 88
    goto :goto_5

    .line 89
    :cond_4
    sget-object v1, Ln1/t;->a:Ln1/t$c;

    .line 90
    .line 91
    invoke-virtual {v1, v7}, Ln1/t$c;->f(Ljava/lang/String;)Ln1/t;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    goto :goto_4

    .line 96
    :goto_5
    if-eqz v5, :cond_6

    .line 97
    .line 98
    invoke-virtual {v5}, LM1/a;->a()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    if-nez v1, :cond_5

    .line 103
    .line 104
    goto :goto_6

    .line 105
    :cond_5
    move-object v8, v1

    .line 106
    goto :goto_7

    .line 107
    :cond_6
    :goto_6
    move-object v8, v7

    .line 108
    :goto_7
    if-eqz p1, :cond_7

    .line 109
    .line 110
    invoke-virtual/range {p1 .. p1}, Ln1/C$c;->b()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    invoke-static {v1, v8}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_7

    .line 119
    .line 120
    invoke-virtual/range {p1 .. p1}, Ln1/C$c;->a()Ln1/t;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    :goto_8
    move-object v13, v1

    .line 125
    goto :goto_a

    .line 126
    :cond_7
    invoke-static {v8, v7}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v1

    .line 130
    if-nez v1, :cond_9

    .line 131
    .line 132
    invoke-interface {v8}, Ljava/lang/CharSequence;->length()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    if-nez v1, :cond_8

    .line 137
    .line 138
    goto :goto_9

    .line 139
    :cond_8
    sget-object v1, Ln1/t;->a:Ln1/t$c;

    .line 140
    .line 141
    invoke-virtual {v1, v8}, Ln1/t$c;->f(Ljava/lang/String;)Ln1/t;

    .line 142
    .line 143
    .line 144
    move-result-object v1

    .line 145
    goto :goto_8

    .line 146
    :cond_9
    :goto_9
    move-object v13, v12

    .line 147
    :goto_a
    new-instance v6, Ln1/C$c;

    .line 148
    .line 149
    iget-object v0, v0, Ln1/C;->c:Ln1/C$b;

    .line 150
    .line 151
    invoke-virtual {v0}, Ln1/C$b;->a()Ls1/U;

    .line 152
    .line 153
    .line 154
    move-result-object v9

    .line 155
    if-eqz v5, :cond_a

    .line 156
    .line 157
    invoke-virtual {v5}, LM1/a;->b()F

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    :goto_b
    move v11, v0

    .line 162
    goto :goto_c

    .line 163
    :cond_a
    const/high16 v0, 0x3f800000    # 1.0f

    .line 164
    .line 165
    goto :goto_b

    .line 166
    :goto_c
    const/16 v14, 0x8

    .line 167
    .line 168
    const/4 v15, 0x0

    .line 169
    const/4 v10, 0x0

    .line 170
    invoke-direct/range {v6 .. v15}, Ln1/C$c;-><init>(Ljava/lang/String;Ljava/lang/String;Ls1/U;Ljava/lang/String;FLn1/t;Ln1/t;ILkotlin/jvm/internal/j;)V

    .line 171
    .line 172
    .line 173
    return-object v6
.end method

.method private final r()V
    .locals 2

    .line 1
    iget-object v0, p0, Ln1/C;->d:Ln1/C$c;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ln1/C;->o(Ln1/C$c;)Ln1/C$c;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ln1/C;->d:Ln1/C$c;

    .line 8
    .line 9
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    iput-object v0, p0, Ln1/C;->d:Ln1/C$c;

    .line 17
    .line 18
    iget-object p0, p0, Ln1/C;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 19
    .line 20
    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Ln1/C$d;

    .line 35
    .line 36
    invoke-interface {v0}, Ln1/C$d;->onThemeChanged()V

    .line 37
    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    :goto_1
    return-void
.end method


# virtual methods
.method public final h(Ln1/C$d;)Z
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ln1/C;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final i()Ln1/t;
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/C;->d:Ln1/C$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ln1/C$c;->a()Ln1/t;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final j()Ln1/t;
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/C;->d:Ln1/C$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ln1/C$c;->e()Ln1/t;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final k()Ln1/C$c;
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/C;->d:Ln1/C$c;

    .line 2
    .line 3
    return-object p0
.end method

.method public final l()Ls1/U;
    .locals 0

    .line 1
    iget-object p0, p0, Ln1/C;->d:Ln1/C$c;

    .line 2
    .line 3
    invoke-virtual {p0}, Ln1/C$c;->f()Ls1/U;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final m()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ln1/C;->l()Ls1/U;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public final n()Z
    .locals 1

    .line 1
    iget-object p0, p0, Ln1/C;->b:Lcom/android/launcher3/J3;

    .line 2
    .line 3
    sget-object v0, Ln1/C;->h:Lcom/android/launcher3/X;

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/android/launcher3/J3;->h(Lcom/android/launcher3/X;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ljava/lang/Boolean;

    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public final p(Ln1/C$d;)Z
    .locals 1

    .line 1
    const-string v0, "listener"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ln1/C;->e:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final q(Z)V
    .locals 1

    .line 1
    iget-object p0, p0, Ln1/C;->b:Lcom/android/launcher3/J3;

    .line 2
    .line 3
    sget-object v0, Ln1/C;->h:Lcom/android/launcher3/X;

    .line 4
    .line 5
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/J3;->s(Lcom/android/launcher3/H1;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
