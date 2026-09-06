.class public Ly/w;
.super Ljava/lang/Object;
.source "PropertyValuesHolder.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ly/w$a;
    }
.end annotation


# static fields
.field private static final q:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final r:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field private static final s:[Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field static final t:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation
.end field

.field private static final u:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field g:Ljava/lang/String;

.field h:Landroid/util/Property;

.field i:Ljava/lang/reflect/Method;

.field private j:Ljava/lang/reflect/Method;

.field k:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "*>;"
        }
    .end annotation
.end field

.field l:Ly/q;

.field final m:[Ljava/lang/Object;

.field private n:Ly/y;

.field private o:Ljava/lang/Object;

.field private p:Ly/x;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    sget-object v2, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 2
    .line 3
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    .line 4
    .line 5
    sget-object v3, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 6
    .line 7
    const-class v4, Ljava/lang/Double;

    .line 8
    .line 9
    const-class v5, Ljava/lang/Integer;

    .line 10
    .line 11
    const-class v1, Ljava/lang/Float;

    .line 12
    .line 13
    move-object v6, v2

    .line 14
    move-object v2, v0

    .line 15
    move-object v0, v6

    .line 16
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Class;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    move-object v6, v2

    .line 21
    move-object v2, v0

    .line 22
    move-object v0, v6

    .line 23
    sput-object v1, Ly/w;->q:[Ljava/lang/Class;

    .line 24
    .line 25
    const-class v4, Ljava/lang/Float;

    .line 26
    .line 27
    const-class v5, Ljava/lang/Double;

    .line 28
    .line 29
    const-class v1, Ljava/lang/Integer;

    .line 30
    .line 31
    move-object v6, v3

    .line 32
    move-object v3, v0

    .line 33
    move-object v0, v6

    .line 34
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    move-object v6, v3

    .line 39
    move-object v3, v0

    .line 40
    move-object v0, v6

    .line 41
    sput-object v1, Ly/w;->r:[Ljava/lang/Class;

    .line 42
    .line 43
    const-class v4, Ljava/lang/Float;

    .line 44
    .line 45
    const-class v5, Ljava/lang/Integer;

    .line 46
    .line 47
    const-class v1, Ljava/lang/Double;

    .line 48
    .line 49
    filled-new-array/range {v0 .. v5}, [Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    sput-object v0, Ly/w;->s:[Ljava/lang/Class;

    .line 54
    .line 55
    new-instance v0, Ljava/util/HashMap;

    .line 56
    .line 57
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 58
    .line 59
    .line 60
    sput-object v0, Ly/w;->t:Ljava/util/HashMap;

    .line 61
    .line 62
    new-instance v0, Ljava/util/HashMap;

    .line 63
    .line 64
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 65
    .line 66
    .line 67
    sput-object v0, Ly/w;->u:Ljava/util/HashMap;

    .line 68
    .line 69
    return-void
.end method

.method constructor <init>(Landroid/util/Property;)V
    .locals 1

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 9
    iput-object v0, p0, Ly/w;->j:Ljava/lang/reflect/Method;

    .line 10
    iput-object v0, p0, Ly/w;->l:Ly/q;

    const/4 v0, 0x1

    .line 11
    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Ly/w;->m:[Ljava/lang/Object;

    .line 12
    iput-object p1, p0, Ly/w;->h:Landroid/util/Property;

    if-eqz p1, :cond_0

    .line 13
    invoke-virtual {p1}, Landroid/util/Property;->getName()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Ly/w;->g:Ljava/lang/String;

    :cond_0
    return-void
.end method

.method constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 3
    iput-object v0, p0, Ly/w;->j:Ljava/lang/reflect/Method;

    .line 4
    iput-object v0, p0, Ly/w;->l:Ly/q;

    const/4 v0, 0x1

    .line 5
    new-array v0, v0, [Ljava/lang/Object;

    iput-object v0, p0, Ly/w;->m:[Ljava/lang/Object;

    .line 6
    iput-object p1, p0, Ly/w;->g:Ljava/lang/String;

    return-void
.end method

.method private c(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Ly/w;->p:Ly/x;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    instance-of v1, v0, Ly/g;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    check-cast v0, Ly/g;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ly/g;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0

    .line 16
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    const-string v1, "Converter "

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-object p0, p0, Ly/w;->p:Ly/x;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    const-string p0, " must be a BidirectionalTypeConverter"

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    throw p1

    .line 54
    :cond_1
    return-object p1
.end method

.method static f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    :cond_1
    :goto_0
    return-object p0
.end method

.method private h(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ly/w;->g:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p2, v0}, Ly/w;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez p3, :cond_0

    .line 9
    .line 10
    :try_start_0
    invoke-virtual {p1, v0, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 11
    .line 12
    .line 13
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2

    .line 14
    goto :goto_2

    .line 15
    :cond_0
    const-class v2, Ljava/lang/Float;

    .line 16
    .line 17
    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x0

    .line 22
    const/4 v4, 0x1

    .line 23
    if-eqz v2, :cond_1

    .line 24
    .line 25
    sget-object v2, Ly/w;->q:[Ljava/lang/Class;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    const-class v2, Ljava/lang/Integer;

    .line 29
    .line 30
    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    sget-object v2, Ly/w;->r:[Ljava/lang/Class;

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    const-class v2, Ljava/lang/Double;

    .line 40
    .line 41
    invoke-virtual {p3, v2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_3

    .line 46
    .line 47
    sget-object v2, Ly/w;->s:[Ljava/lang/Class;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_3
    new-array v2, v4, [Ljava/lang/Class;

    .line 51
    .line 52
    aput-object p3, v2, v3

    .line 53
    .line 54
    :goto_0
    array-length v5, v2

    .line 55
    :goto_1
    if-ge v3, v5, :cond_6

    .line 56
    .line 57
    aget-object v6, v2, v3

    .line 58
    .line 59
    filled-new-array {v6}, [Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    :try_start_1
    invoke-virtual {p1, v0, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    iget-object v8, p0, Ly/w;->p:Ly/x;

    .line 68
    .line 69
    if-nez v8, :cond_4

    .line 70
    .line 71
    iput-object v6, p0, Ly/w;->k:Ljava/lang/Class;
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_0

    .line 72
    .line 73
    :cond_4
    return-object v1

    .line 74
    :catch_0
    :try_start_2
    invoke-virtual {p1, v0, v7}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v1, v4}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 79
    .line 80
    .line 81
    iget-object v7, p0, Ly/w;->p:Ly/x;

    .line 82
    .line 83
    if-nez v7, :cond_5

    .line 84
    .line 85
    iput-object v6, p0, Ly/w;->k:Ljava/lang/Class;
    :try_end_2
    .catch Ljava/lang/NoSuchMethodException; {:try_start_2 .. :try_end_2} :catch_1

    .line 86
    .line 87
    :cond_5
    return-object v1

    .line 88
    :catch_1
    add-int/lit8 v3, v3, 0x1

    .line 89
    .line 90
    goto :goto_1

    .line 91
    :catch_2
    :cond_6
    :goto_2
    if-nez v1, :cond_7

    .line 92
    .line 93
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    const-string v2, "Method "

    .line 99
    .line 100
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Ly/w;->g:Ljava/lang/String;

    .line 104
    .line 105
    invoke-static {p2, p0}, Ly/w;->f(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object p0

    .line 109
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p0, "() with type "

    .line 113
    .line 114
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    const-string p0, " not found on target class "

    .line 121
    .line 122
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    const-string p1, "PropertyValuesHolder"

    .line 133
    .line 134
    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    .line 136
    .line 137
    :cond_7
    return-object v1
.end method

.method public static varargs l(Landroid/util/Property;[F)Ly/w;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/util/Property<",
            "*",
            "Ljava/lang/Float;",
            ">;[F)",
            "Ly/w;"
        }
    .end annotation

    .line 1
    new-instance v0, Ly/w$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ly/w$a;-><init>(Landroid/util/Property;[F)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static varargs m(Ljava/lang/String;[F)Ly/w;
    .locals 1

    .line 1
    new-instance v0, Ly/w$a;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ly/w$a;-><init>(Ljava/lang/String;[F)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method private q(Ljava/lang/Class;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 1
    sget-object v0, Ly/w;->u:Ljava/util/HashMap;

    .line 2
    .line 3
    const-string v1, "get"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    invoke-direct {p0, p1, v0, v1, v2}, Ly/w;->t(Ljava/lang/Class;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ly/w;->j:Ljava/lang/reflect/Method;

    .line 11
    .line 12
    return-void
.end method

.method private t(Ljava/lang/Class;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/reflect/Method;",
            ">;>;",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/reflect/Method;"
        }
    .end annotation

    .line 1
    monitor-enter p2

    .line 2
    :try_start_0
    invoke-virtual {p2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    check-cast v0, Ljava/util/HashMap;

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v2, p0, Ly/w;->g:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    iget-object v1, p0, Ly/w;->g:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Ljava/lang/reflect/Method;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    const/4 v2, 0x0

    .line 31
    :cond_1
    :goto_0
    if-nez v2, :cond_3

    .line 32
    .line 33
    invoke-direct {p0, p1, p3, p4}, Ly/w;->h(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    if-nez v0, :cond_2

    .line 38
    .line 39
    new-instance v0, Ljava/util/HashMap;

    .line 40
    .line 41
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p2, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p0, Ly/w;->g:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v0, p0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_3
    monitor-exit p2

    .line 53
    return-object v1

    .line 54
    :goto_1
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 55
    throw p0
.end method


# virtual methods
.method a(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ly/w;->l:Ly/q;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ly/q;->getValue(F)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iget-object v0, p0, Ly/w;->p:Ly/x;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {v0, p1}, Ly/x;->a(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    :goto_0
    iput-object p1, p0, Ly/w;->o:Ljava/lang/Object;

    .line 17
    .line 18
    return-void
.end method

.method public b()Ly/w;
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .line 1
    :try_start_0
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ly/w;

    .line 6
    .line 7
    iget-object v1, p0, Ly/w;->g:Ljava/lang/String;

    .line 8
    .line 9
    iput-object v1, v0, Ly/w;->g:Ljava/lang/String;

    .line 10
    .line 11
    iget-object v1, p0, Ly/w;->h:Landroid/util/Property;

    .line 12
    .line 13
    iput-object v1, v0, Ly/w;->h:Landroid/util/Property;

    .line 14
    .line 15
    iget-object v1, p0, Ly/w;->l:Ly/q;

    .line 16
    .line 17
    invoke-interface {v1}, Ly/q;->clone()Ly/q;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, v0, Ly/w;->l:Ly/q;

    .line 22
    .line 23
    iget-object p0, p0, Ly/w;->n:Ly/y;

    .line 24
    .line 25
    iput-object p0, v0, Ly/w;->n:Ly/y;
    :try_end_0
    .catch Ljava/lang/CloneNotSupportedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 26
    .line 27
    return-object v0

    .line 28
    :catch_0
    const/4 p0, 0x0

    .line 29
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/w;->b()Ly/w;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method d()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ly/w;->o:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ly/w;->g:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method k()V
    .locals 2

    .line 1
    iget-object v0, p0, Ly/w;->n:Ly/y;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ly/w;->k:Ljava/lang/Class;

    .line 6
    .line 7
    const-class v1, Ljava/lang/Integer;

    .line 8
    .line 9
    if-ne v0, v1, :cond_0

    .line 10
    .line 11
    invoke-static {}, Ly/m;->b()Ly/m;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-class v1, Ljava/lang/Float;

    .line 17
    .line 18
    if-ne v0, v1, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ly/j;->b()Ly/j;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    goto :goto_0

    .line 25
    :cond_1
    const/4 v0, 0x0

    .line 26
    :goto_0
    iput-object v0, p0, Ly/w;->n:Ly/y;

    .line 27
    .line 28
    :cond_2
    iget-object v0, p0, Ly/w;->n:Ly/y;

    .line 29
    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    iget-object p0, p0, Ly/w;->l:Ly/q;

    .line 33
    .line 34
    invoke-interface {p0, v0}, Ly/q;->j(Ly/y;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    return-void
.end method

.method n(Ljava/lang/Object;)V
    .locals 4

    .line 1
    const-string v0, "PropertyValuesHolder"

    .line 2
    .line 3
    iget-object v1, p0, Ly/w;->h:Landroid/util/Property;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    invoke-virtual {p0}, Ly/w;->d()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v1, p1, v2}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 15
    .line 16
    if-eqz v1, :cond_1

    .line 17
    .line 18
    :try_start_0
    iget-object v1, p0, Ly/w;->m:[Ljava/lang/Object;

    .line 19
    .line 20
    invoke-virtual {p0}, Ly/w;->d()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/4 v3, 0x0

    .line 25
    aput-object v2, v1, v3

    .line 26
    .line 27
    iget-object v1, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 28
    .line 29
    iget-object p0, p0, Ly/w;->m:[Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {v1, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p0

    .line 36
    goto :goto_0

    .line 37
    :catch_1
    move-exception p0

    .line 38
    goto :goto_1

    .line 39
    :goto_0
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    goto :goto_2

    .line 47
    :goto_1
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    :cond_1
    :goto_2
    return-void
.end method

.method public varargs o([F)V
    .locals 1

    .line 1
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    .line 2
    .line 3
    iput-object v0, p0, Ly/w;->k:Ljava/lang/Class;

    .line 4
    .line 5
    invoke-static {p1}, Ly/p;->a([F)Ly/p;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ly/w;->l:Ly/q;

    .line 10
    .line 11
    return-void
.end method

.method public p(Landroid/util/Property;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly/w;->h:Landroid/util/Property;

    .line 2
    .line 3
    return-void
.end method

.method r(Ljava/lang/Class;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ly/w;->p:Ly/x;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Ly/w;->k:Ljava/lang/Class;

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ly/x;->b()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    sget-object v1, Ly/w;->t:Ljava/util/HashMap;

    .line 13
    .line 14
    const-string v2, "set"

    .line 15
    .line 16
    invoke-direct {p0, p1, v1, v2, v0}, Ly/w;->t(Ljava/lang/Class;Ljava/util/HashMap;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    iput-object p1, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 21
    .line 22
    return-void
.end method

.method s(Ljava/lang/Object;)V
    .locals 10

    .line 1
    iget-object v0, p0, Ly/w;->h:Landroid/util/Property;

    .line 2
    .line 3
    const-string v1, "PropertyValuesHolder"

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz v0, :cond_4

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    :try_start_0
    iget-object v4, p0, Ly/w;->l:Ly/q;

    .line 11
    .line 12
    invoke-interface {v4}, Ly/q;->getKeyframes()Ljava/util/List;

    .line 13
    .line 14
    .line 15
    move-result-object v4

    .line 16
    if-nez v4, :cond_0

    .line 17
    .line 18
    move v5, v3

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 21
    .line 22
    .line 23
    move-result v5

    .line 24
    :goto_0
    move-object v7, v0

    .line 25
    move v6, v3

    .line 26
    :goto_1
    if-ge v6, v5, :cond_a

    .line 27
    .line 28
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v8

    .line 32
    check-cast v8, Ly/o;

    .line 33
    .line 34
    invoke-virtual {v8}, Ly/o;->f()Z

    .line 35
    .line 36
    .line 37
    move-result v9

    .line 38
    if-eqz v9, :cond_1

    .line 39
    .line 40
    invoke-virtual {v8}, Ly/o;->n()Z

    .line 41
    .line 42
    .line 43
    move-result v9

    .line 44
    if-eqz v9, :cond_3

    .line 45
    .line 46
    :cond_1
    if-nez v7, :cond_2

    .line 47
    .line 48
    iget-object v7, p0, Ly/w;->h:Landroid/util/Property;

    .line 49
    .line 50
    invoke-virtual {v7, p1}, Landroid/util/Property;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v7

    .line 54
    invoke-direct {p0, v7}, Ly/w;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    :cond_2
    invoke-virtual {v8, v7}, Ly/o;->l(Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v8, v2}, Ly/o;->m(Z)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :cond_3
    add-int/lit8 v6, v6, 0x1

    .line 65
    .line 66
    goto :goto_1

    .line 67
    :catch_0
    new-instance v4, Ljava/lang/StringBuilder;

    .line 68
    .line 69
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 70
    .line 71
    .line 72
    const-string v5, "No such property ("

    .line 73
    .line 74
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-object v5, p0, Ly/w;->h:Landroid/util/Property;

    .line 78
    .line 79
    invoke-virtual {v5}, Landroid/util/Property;->getName()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v5, ") on target object "

    .line 87
    .line 88
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    const-string v5, ". Trying reflection instead"

    .line 95
    .line 96
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-static {v1, v4}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 104
    .line 105
    .line 106
    iput-object v0, p0, Ly/w;->h:Landroid/util/Property;

    .line 107
    .line 108
    :cond_4
    iget-object v0, p0, Ly/w;->h:Landroid/util/Property;

    .line 109
    .line 110
    if-nez v0, :cond_a

    .line 111
    .line 112
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iget-object v4, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 117
    .line 118
    if-nez v4, :cond_5

    .line 119
    .line 120
    invoke-virtual {p0, v0}, Ly/w;->r(Ljava/lang/Class;)V

    .line 121
    .line 122
    .line 123
    :cond_5
    iget-object v4, p0, Ly/w;->l:Ly/q;

    .line 124
    .line 125
    invoke-interface {v4}, Ly/q;->getKeyframes()Ljava/util/List;

    .line 126
    .line 127
    .line 128
    move-result-object v4

    .line 129
    if-nez v4, :cond_6

    .line 130
    .line 131
    move v5, v3

    .line 132
    goto :goto_2

    .line 133
    :cond_6
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 134
    .line 135
    .line 136
    move-result v5

    .line 137
    :goto_2
    move v6, v3

    .line 138
    :goto_3
    if-ge v6, v5, :cond_a

    .line 139
    .line 140
    invoke-interface {v4, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    check-cast v7, Ly/o;

    .line 145
    .line 146
    invoke-virtual {v7}, Ly/o;->f()Z

    .line 147
    .line 148
    .line 149
    move-result v8

    .line 150
    if-eqz v8, :cond_7

    .line 151
    .line 152
    invoke-virtual {v7}, Ly/o;->n()Z

    .line 153
    .line 154
    .line 155
    move-result v8

    .line 156
    if-eqz v8, :cond_9

    .line 157
    .line 158
    :cond_7
    iget-object v8, p0, Ly/w;->j:Ljava/lang/reflect/Method;

    .line 159
    .line 160
    if-nez v8, :cond_8

    .line 161
    .line 162
    invoke-direct {p0, v0}, Ly/w;->q(Ljava/lang/Class;)V

    .line 163
    .line 164
    .line 165
    iget-object v8, p0, Ly/w;->j:Ljava/lang/reflect/Method;

    .line 166
    .line 167
    if-nez v8, :cond_8

    .line 168
    .line 169
    goto :goto_7

    .line 170
    :cond_8
    :try_start_1
    iget-object v8, p0, Ly/w;->j:Ljava/lang/reflect/Method;

    .line 171
    .line 172
    new-array v9, v3, [Ljava/lang/Object;

    .line 173
    .line 174
    invoke-virtual {v8, p1, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v8

    .line 178
    invoke-direct {p0, v8}, Ly/w;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v8

    .line 182
    invoke-virtual {v7, v8}, Ly/o;->l(Ljava/lang/Object;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v7, v2}, Ly/o;->m(Z)V
    :try_end_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_1

    .line 186
    .line 187
    .line 188
    goto :goto_6

    .line 189
    :catch_1
    move-exception v7

    .line 190
    goto :goto_4

    .line 191
    :catch_2
    move-exception v7

    .line 192
    goto :goto_5

    .line 193
    :goto_4
    invoke-virtual {v7}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v7

    .line 197
    invoke-static {v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 198
    .line 199
    .line 200
    goto :goto_6

    .line 201
    :goto_5
    invoke-virtual {v7}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v7

    .line 205
    invoke-static {v1, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    :cond_9
    :goto_6
    add-int/lit8 v6, v6, 0x1

    .line 209
    .line 210
    goto :goto_3

    .line 211
    :cond_a
    :goto_7
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Ly/w;->g:Ljava/lang/String;

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ": "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ly/w;->l:Ly/q;

    .line 17
    .line 18
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
