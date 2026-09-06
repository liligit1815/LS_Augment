.class public final Lcom/google/gson/internal/bind/e;
.super Ljava/lang/Object;
.source "JsonAdapterAnnotationTypeAdapterFactory.java"

# interfaces
.implements Lcom/google/gson/A;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/gson/internal/bind/e$b;
    }
.end annotation


# static fields
.field private static final i:Lcom/google/gson/A;

.field private static final j:Lcom/google/gson/A;


# instance fields
.field private final g:LC3/w;

.field private final h:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/google/gson/A;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/gson/internal/bind/e$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/google/gson/internal/bind/e$b;-><init>(Lcom/google/gson/internal/bind/e$a;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/google/gson/internal/bind/e;->i:Lcom/google/gson/A;

    .line 8
    .line 9
    new-instance v0, Lcom/google/gson/internal/bind/e$b;

    .line 10
    .line 11
    invoke-direct {v0, v1}, Lcom/google/gson/internal/bind/e$b;-><init>(Lcom/google/gson/internal/bind/e$a;)V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/google/gson/internal/bind/e;->j:Lcom/google/gson/A;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(LC3/w;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/google/gson/internal/bind/e;->g:LC3/w;

    .line 5
    .line 6
    new-instance p1, Ljava/util/concurrent/ConcurrentHashMap;

    .line 7
    .line 8
    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/google/gson/internal/bind/e;->h:Ljava/util/concurrent/ConcurrentMap;

    .line 12
    .line 13
    return-void
.end method

.method private static b(LC3/w;Ljava/lang/Class;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC3/w;",
            "Ljava/lang/Class<",
            "*>;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/google/gson/reflect/a;->get(Ljava/lang/Class;)Lcom/google/gson/reflect/a;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, LC3/w;->v(Lcom/google/gson/reflect/a;)LC3/D;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, LC3/D;->a()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method private static c(Ljava/lang/Class;)LB3/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;)",
            "LB3/b;"
        }
    .end annotation

    .line 1
    const-class v0, LB3/b;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, LB3/b;

    .line 8
    .line 9
    return-object p0
.end method

.method private f(Ljava/lang/Class;Lcom/google/gson/A;)Lcom/google/gson/A;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "*>;",
            "Lcom/google/gson/A;",
            ")",
            "Lcom/google/gson/A;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/gson/internal/bind/e;->h:Ljava/util/concurrent/ConcurrentMap;

    .line 2
    .line 3
    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/google/gson/A;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    return-object p2
.end method


# virtual methods
.method public a(Lcom/google/gson/f;Lcom/google/gson/reflect/a;)Lcom/google/gson/z;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/gson/f;",
            "Lcom/google/gson/reflect/a<",
            "TT;>;)",
            "Lcom/google/gson/z<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Lcom/google/gson/reflect/a;->getRawType()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {v0}, Lcom/google/gson/internal/bind/e;->c(Ljava/lang/Class;)LB3/b;

    .line 6
    .line 7
    .line 8
    move-result-object v5

    .line 9
    if-nez v5, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x0

    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-object v2, p0, Lcom/google/gson/internal/bind/e;->g:LC3/w;

    .line 14
    .line 15
    const/4 v6, 0x1

    .line 16
    move-object v1, p0

    .line 17
    move-object v3, p1

    .line 18
    move-object v4, p2

    .line 19
    invoke-virtual/range {v1 .. v6}, Lcom/google/gson/internal/bind/e;->d(LC3/w;Lcom/google/gson/f;Lcom/google/gson/reflect/a;LB3/b;Z)Lcom/google/gson/z;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method d(LC3/w;Lcom/google/gson/f;Lcom/google/gson/reflect/a;LB3/b;Z)Lcom/google/gson/z;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "LC3/w;",
            "Lcom/google/gson/f;",
            "Lcom/google/gson/reflect/a<",
            "*>;",
            "LB3/b;",
            "Z)",
            "Lcom/google/gson/z<",
            "*>;"
        }
    .end annotation

    .line 1
    invoke-interface {p4}, LB3/b;->value()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p1, v0}, Lcom/google/gson/internal/bind/e;->b(LC3/w;Ljava/lang/Class;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {p4}, LB3/b;->nullSafe()Z

    .line 10
    .line 11
    .line 12
    move-result v6

    .line 13
    instance-of p4, p1, Lcom/google/gson/z;

    .line 14
    .line 15
    if-eqz p4, :cond_0

    .line 16
    .line 17
    check-cast p1, Lcom/google/gson/z;

    .line 18
    .line 19
    goto/16 :goto_4

    .line 20
    .line 21
    :cond_0
    instance-of p4, p1, Lcom/google/gson/A;

    .line 22
    .line 23
    if-eqz p4, :cond_2

    .line 24
    .line 25
    check-cast p1, Lcom/google/gson/A;

    .line 26
    .line 27
    if-eqz p5, :cond_1

    .line 28
    .line 29
    invoke-virtual {p3}, Lcom/google/gson/reflect/a;->getRawType()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object p4

    .line 33
    invoke-direct {p0, p4, p1}, Lcom/google/gson/internal/bind/e;->f(Ljava/lang/Class;Lcom/google/gson/A;)Lcom/google/gson/A;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    :cond_1
    invoke-interface {p1, p2, p3}, Lcom/google/gson/A;->a(Lcom/google/gson/f;Lcom/google/gson/reflect/a;)Lcom/google/gson/z;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    goto :goto_4

    .line 42
    :cond_2
    instance-of p0, p1, Lcom/google/gson/s;

    .line 43
    .line 44
    if-nez p0, :cond_4

    .line 45
    .line 46
    instance-of p4, p1, Lcom/google/gson/j;

    .line 47
    .line 48
    if-eqz p4, :cond_3

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 52
    .line 53
    new-instance p2, Ljava/lang/StringBuilder;

    .line 54
    .line 55
    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 56
    .line 57
    .line 58
    const-string p4, "Invalid attempt to bind an instance of "

    .line 59
    .line 60
    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    const-string p1, " as a @JsonAdapter for "

    .line 75
    .line 76
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p3}, Lcom/google/gson/reflect/a;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string p1, ". @JsonAdapter value must be a TypeAdapter, TypeAdapterFactory, JsonSerializer or JsonDeserializer."

    .line 87
    .line 88
    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    throw p0

    .line 99
    :cond_4
    :goto_0
    const/4 p4, 0x0

    .line 100
    if-eqz p0, :cond_5

    .line 101
    .line 102
    move-object p0, p1

    .line 103
    check-cast p0, Lcom/google/gson/s;

    .line 104
    .line 105
    move-object v1, p0

    .line 106
    goto :goto_1

    .line 107
    :cond_5
    move-object v1, p4

    .line 108
    :goto_1
    instance-of p0, p1, Lcom/google/gson/j;

    .line 109
    .line 110
    if-eqz p0, :cond_6

    .line 111
    .line 112
    move-object p4, p1

    .line 113
    check-cast p4, Lcom/google/gson/j;

    .line 114
    .line 115
    :cond_6
    move-object v2, p4

    .line 116
    if-eqz p5, :cond_7

    .line 117
    .line 118
    sget-object p0, Lcom/google/gson/internal/bind/e;->i:Lcom/google/gson/A;

    .line 119
    .line 120
    :goto_2
    move-object v5, p0

    .line 121
    goto :goto_3

    .line 122
    :cond_7
    sget-object p0, Lcom/google/gson/internal/bind/e;->j:Lcom/google/gson/A;

    .line 123
    .line 124
    goto :goto_2

    .line 125
    :goto_3
    new-instance v0, Lcom/google/gson/internal/bind/n;

    .line 126
    .line 127
    move-object v3, p2

    .line 128
    move-object v4, p3

    .line 129
    invoke-direct/range {v0 .. v6}, Lcom/google/gson/internal/bind/n;-><init>(Lcom/google/gson/s;Lcom/google/gson/j;Lcom/google/gson/f;Lcom/google/gson/reflect/a;Lcom/google/gson/A;Z)V

    .line 130
    .line 131
    .line 132
    const/4 v6, 0x0

    .line 133
    move-object p1, v0

    .line 134
    :goto_4
    if-eqz p1, :cond_8

    .line 135
    .line 136
    if-eqz v6, :cond_8

    .line 137
    .line 138
    invoke-virtual {p1}, Lcom/google/gson/z;->a()Lcom/google/gson/z;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    return-object p0

    .line 143
    :cond_8
    return-object p1
.end method

.method public e(Lcom/google/gson/reflect/a;Lcom/google/gson/A;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/gson/reflect/a<",
            "*>;",
            "Lcom/google/gson/A;",
            ")Z"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-static {p2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/google/gson/internal/bind/e;->i:Lcom/google/gson/A;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-ne p2, v0, :cond_0

    .line 11
    .line 12
    return v1

    .line 13
    :cond_0
    invoke-virtual {p1}, Lcom/google/gson/reflect/a;->getRawType()Ljava/lang/Class;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    iget-object v0, p0, Lcom/google/gson/internal/bind/e;->h:Ljava/util/concurrent/ConcurrentMap;

    .line 18
    .line 19
    invoke-interface {v0, p1}, Ljava/util/concurrent/ConcurrentMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Lcom/google/gson/A;

    .line 24
    .line 25
    const/4 v2, 0x0

    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    if-ne v0, p2, :cond_1

    .line 29
    .line 30
    return v1

    .line 31
    :cond_1
    return v2

    .line 32
    :cond_2
    invoke-static {p1}, Lcom/google/gson/internal/bind/e;->c(Ljava/lang/Class;)LB3/b;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    return v2

    .line 39
    :cond_3
    invoke-interface {v0}, LB3/b;->value()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const-class v3, Lcom/google/gson/A;

    .line 44
    .line 45
    invoke-virtual {v3, v0}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    if-nez v3, :cond_4

    .line 50
    .line 51
    return v2

    .line 52
    :cond_4
    iget-object v3, p0, Lcom/google/gson/internal/bind/e;->g:LC3/w;

    .line 53
    .line 54
    invoke-static {v3, v0}, Lcom/google/gson/internal/bind/e;->b(LC3/w;Ljava/lang/Class;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    check-cast v0, Lcom/google/gson/A;

    .line 59
    .line 60
    invoke-direct {p0, p1, v0}, Lcom/google/gson/internal/bind/e;->f(Ljava/lang/Class;Lcom/google/gson/A;)Lcom/google/gson/A;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    if-ne p0, p2, :cond_5

    .line 65
    .line 66
    return v1

    .line 67
    :cond_5
    return v2
.end method
