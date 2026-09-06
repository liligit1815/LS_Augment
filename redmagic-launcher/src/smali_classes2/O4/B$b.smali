.class public final LO4/B$b;
.super Ljava/lang/Object;
.source "OkHttpClient.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LO4/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field A:I

.field a:LO4/p;

.field b:Ljava/net/Proxy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field c:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/C;",
            ">;"
        }
    .end annotation
.end field

.field d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/m;",
            ">;"
        }
    .end annotation
.end field

.field final e:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/y;",
            ">;"
        }
    .end annotation
.end field

.field final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/y;",
            ">;"
        }
    .end annotation
.end field

.field g:LO4/t$b;

.field h:Ljava/net/ProxySelector;

.field i:LO4/o;

.field j:Lokhttp3/internal/cache/InternalCache;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field k:Ljavax/net/SocketFactory;

.field l:Ljavax/net/ssl/SSLSocketFactory;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field m:Lokhttp3/internal/tls/CertificateChainCleaner;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field n:Ljavax/net/ssl/HostnameVerifier;

.field o:LO4/g;

.field p:LO4/c;

.field q:LO4/c;

.field r:LO4/l;

.field s:LO4/r;

.field t:Z

.field u:Z

.field v:Z

.field w:I

.field x:I

.field y:I

.field z:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, LO4/B$b;->e:Ljava/util/List;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, LO4/B$b;->f:Ljava/util/List;

    .line 4
    new-instance v0, LO4/p;

    invoke-direct {v0}, LO4/p;-><init>()V

    iput-object v0, p0, LO4/B$b;->a:LO4/p;

    .line 5
    sget-object v0, LO4/B;->H:Ljava/util/List;

    iput-object v0, p0, LO4/B$b;->c:Ljava/util/List;

    .line 6
    sget-object v0, LO4/B;->I:Ljava/util/List;

    iput-object v0, p0, LO4/B$b;->d:Ljava/util/List;

    .line 7
    sget-object v0, LO4/t;->a:LO4/t;

    invoke-static {v0}, LO4/t;->l(LO4/t;)LO4/t$b;

    move-result-object v0

    iput-object v0, p0, LO4/B$b;->g:LO4/t$b;

    .line 8
    invoke-static {}, Ljava/net/ProxySelector;->getDefault()Ljava/net/ProxySelector;

    move-result-object v0

    iput-object v0, p0, LO4/B$b;->h:Ljava/net/ProxySelector;

    if-nez v0, :cond_0

    .line 9
    new-instance v0, Lokhttp3/internal/proxy/NullProxySelector;

    invoke-direct {v0}, Lokhttp3/internal/proxy/NullProxySelector;-><init>()V

    iput-object v0, p0, LO4/B$b;->h:Ljava/net/ProxySelector;

    .line 10
    :cond_0
    sget-object v0, LO4/o;->a:LO4/o;

    iput-object v0, p0, LO4/B$b;->i:LO4/o;

    .line 11
    invoke-static {}, Ljavax/net/SocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    iput-object v0, p0, LO4/B$b;->k:Ljavax/net/SocketFactory;

    .line 12
    sget-object v0, Lokhttp3/internal/tls/OkHostnameVerifier;->INSTANCE:Lokhttp3/internal/tls/OkHostnameVerifier;

    iput-object v0, p0, LO4/B$b;->n:Ljavax/net/ssl/HostnameVerifier;

    .line 13
    sget-object v0, LO4/g;->c:LO4/g;

    iput-object v0, p0, LO4/B$b;->o:LO4/g;

    .line 14
    sget-object v0, LO4/c;->a:LO4/c;

    iput-object v0, p0, LO4/B$b;->p:LO4/c;

    .line 15
    iput-object v0, p0, LO4/B$b;->q:LO4/c;

    .line 16
    new-instance v0, LO4/l;

    invoke-direct {v0}, LO4/l;-><init>()V

    iput-object v0, p0, LO4/B$b;->r:LO4/l;

    .line 17
    sget-object v0, LO4/r;->a:LO4/r;

    iput-object v0, p0, LO4/B$b;->s:LO4/r;

    const/4 v0, 0x1

    .line 18
    iput-boolean v0, p0, LO4/B$b;->t:Z

    .line 19
    iput-boolean v0, p0, LO4/B$b;->u:Z

    .line 20
    iput-boolean v0, p0, LO4/B$b;->v:Z

    const/4 v0, 0x0

    .line 21
    iput v0, p0, LO4/B$b;->w:I

    const/16 v1, 0x2710

    .line 22
    iput v1, p0, LO4/B$b;->x:I

    .line 23
    iput v1, p0, LO4/B$b;->y:I

    .line 24
    iput v1, p0, LO4/B$b;->z:I

    .line 25
    iput v0, p0, LO4/B$b;->A:I

    return-void
.end method

.method constructor <init>(LO4/B;)V
    .locals 3

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, LO4/B$b;->e:Ljava/util/List;

    .line 28
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, LO4/B$b;->f:Ljava/util/List;

    .line 29
    iget-object v2, p1, LO4/B;->g:LO4/p;

    iput-object v2, p0, LO4/B$b;->a:LO4/p;

    .line 30
    iget-object v2, p1, LO4/B;->h:Ljava/net/Proxy;

    iput-object v2, p0, LO4/B$b;->b:Ljava/net/Proxy;

    .line 31
    iget-object v2, p1, LO4/B;->i:Ljava/util/List;

    iput-object v2, p0, LO4/B$b;->c:Ljava/util/List;

    .line 32
    iget-object v2, p1, LO4/B;->j:Ljava/util/List;

    iput-object v2, p0, LO4/B$b;->d:Ljava/util/List;

    .line 33
    iget-object v2, p1, LO4/B;->k:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 34
    iget-object v0, p1, LO4/B;->l:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 35
    iget-object v0, p1, LO4/B;->m:LO4/t$b;

    iput-object v0, p0, LO4/B$b;->g:LO4/t$b;

    .line 36
    iget-object v0, p1, LO4/B;->n:Ljava/net/ProxySelector;

    iput-object v0, p0, LO4/B$b;->h:Ljava/net/ProxySelector;

    .line 37
    iget-object v0, p1, LO4/B;->o:LO4/o;

    iput-object v0, p0, LO4/B$b;->i:LO4/o;

    .line 38
    iget-object v0, p1, LO4/B;->p:Lokhttp3/internal/cache/InternalCache;

    iput-object v0, p0, LO4/B$b;->j:Lokhttp3/internal/cache/InternalCache;

    .line 39
    iget-object v0, p1, LO4/B;->q:Ljavax/net/SocketFactory;

    iput-object v0, p0, LO4/B$b;->k:Ljavax/net/SocketFactory;

    .line 40
    iget-object v0, p1, LO4/B;->r:Ljavax/net/ssl/SSLSocketFactory;

    iput-object v0, p0, LO4/B$b;->l:Ljavax/net/ssl/SSLSocketFactory;

    .line 41
    iget-object v0, p1, LO4/B;->s:Lokhttp3/internal/tls/CertificateChainCleaner;

    iput-object v0, p0, LO4/B$b;->m:Lokhttp3/internal/tls/CertificateChainCleaner;

    .line 42
    iget-object v0, p1, LO4/B;->t:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p0, LO4/B$b;->n:Ljavax/net/ssl/HostnameVerifier;

    .line 43
    iget-object v0, p1, LO4/B;->u:LO4/g;

    iput-object v0, p0, LO4/B$b;->o:LO4/g;

    .line 44
    iget-object v0, p1, LO4/B;->v:LO4/c;

    iput-object v0, p0, LO4/B$b;->p:LO4/c;

    .line 45
    iget-object v0, p1, LO4/B;->w:LO4/c;

    iput-object v0, p0, LO4/B$b;->q:LO4/c;

    .line 46
    iget-object v0, p1, LO4/B;->x:LO4/l;

    iput-object v0, p0, LO4/B$b;->r:LO4/l;

    .line 47
    iget-object v0, p1, LO4/B;->y:LO4/r;

    iput-object v0, p0, LO4/B$b;->s:LO4/r;

    .line 48
    iget-boolean v0, p1, LO4/B;->z:Z

    iput-boolean v0, p0, LO4/B$b;->t:Z

    .line 49
    iget-boolean v0, p1, LO4/B;->A:Z

    iput-boolean v0, p0, LO4/B$b;->u:Z

    .line 50
    iget-boolean v0, p1, LO4/B;->B:Z

    iput-boolean v0, p0, LO4/B$b;->v:Z

    .line 51
    iget v0, p1, LO4/B;->C:I

    iput v0, p0, LO4/B$b;->w:I

    .line 52
    iget v0, p1, LO4/B;->D:I

    iput v0, p0, LO4/B$b;->x:I

    .line 53
    iget v0, p1, LO4/B;->E:I

    iput v0, p0, LO4/B$b;->y:I

    .line 54
    iget v0, p1, LO4/B;->F:I

    iput v0, p0, LO4/B$b;->z:I

    .line 55
    iget p1, p1, LO4/B;->G:I

    iput p1, p0, LO4/B$b;->A:I

    return-void
.end method


# virtual methods
.method public a()LO4/B;
    .locals 1

    .line 1
    new-instance v0, LO4/B;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LO4/B;-><init>(LO4/B$b;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public b(LO4/t;)LO4/B$b;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, LO4/t;->l(LO4/t;)LO4/t$b;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    iput-object p1, p0, LO4/B$b;->g:LO4/t$b;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    .line 11
    .line 12
    const-string p1, "eventListener == null"

    .line 13
    .line 14
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    throw p0
.end method

.method public c(Ljava/util/List;)LO4/B$b;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "LO4/C;",
            ">;)",
            "LO4/B$b;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 4
    .line 5
    .line 6
    sget-object p1, LO4/C;->l:LO4/C;

    .line 7
    .line 8
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    if-nez v1, :cond_1

    .line 13
    .line 14
    sget-object v1, LO4/C;->i:LO4/C;

    .line 15
    .line 16
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 24
    .line 25
    new-instance p1, Ljava/lang/StringBuilder;

    .line 26
    .line 27
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 28
    .line 29
    .line 30
    const-string v1, "protocols must contain h2_prior_knowledge or http/1.1: "

    .line 31
    .line 32
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    throw p0

    .line 46
    :cond_1
    :goto_0
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    if-eqz p1, :cond_3

    .line 51
    .line 52
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    const/4 v1, 0x1

    .line 57
    if-gt p1, v1, :cond_2

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 61
    .line 62
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 65
    .line 66
    .line 67
    const-string v1, "protocols containing h2_prior_knowledge cannot use other protocols: "

    .line 68
    .line 69
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    throw p0

    .line 83
    :cond_3
    :goto_1
    sget-object p1, LO4/C;->h:LO4/C;

    .line 84
    .line 85
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result p1

    .line 89
    if-nez p1, :cond_5

    .line 90
    .line 91
    const/4 p1, 0x0

    .line 92
    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-nez p1, :cond_4

    .line 97
    .line 98
    sget-object p1, LO4/C;->j:LO4/C;

    .line 99
    .line 100
    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    iput-object p1, p0, LO4/B$b;->c:Ljava/util/List;

    .line 108
    .line 109
    return-object p0

    .line 110
    :cond_4
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 111
    .line 112
    const-string p1, "protocols must not contain null"

    .line 113
    .line 114
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 115
    .line 116
    .line 117
    throw p0

    .line 118
    :cond_5
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 119
    .line 120
    new-instance p1, Ljava/lang/StringBuilder;

    .line 121
    .line 122
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 123
    .line 124
    .line 125
    const-string v1, "protocols must not contain http/1.0: "

    .line 126
    .line 127
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    throw p0
.end method
