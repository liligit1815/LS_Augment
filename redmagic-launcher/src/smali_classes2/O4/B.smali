.class public LO4/B;
.super Ljava/lang/Object;
.source "OkHttpClient.java"

# interfaces
.implements Ljava/lang/Cloneable;
.implements LO4/e$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LO4/B$b;
    }
.end annotation


# static fields
.field static final H:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/C;",
            ">;"
        }
    .end annotation
.end field

.field static final I:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/m;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final A:Z

.field final B:Z

.field final C:I

.field final D:I

.field final E:I

.field final F:I

.field final G:I

.field final g:LO4/p;

.field final h:Ljava/net/Proxy;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final i:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/C;",
            ">;"
        }
    .end annotation
.end field

.field final j:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/m;",
            ">;"
        }
    .end annotation
.end field

.field final k:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/y;",
            ">;"
        }
    .end annotation
.end field

.field final l:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "LO4/y;",
            ">;"
        }
    .end annotation
.end field

.field final m:LO4/t$b;

.field final n:Ljava/net/ProxySelector;

.field final o:LO4/o;

.field final p:Lokhttp3/internal/cache/InternalCache;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final q:Ljavax/net/SocketFactory;

.field final r:Ljavax/net/ssl/SSLSocketFactory;

.field final s:Lokhttp3/internal/tls/CertificateChainCleaner;

.field final t:Ljavax/net/ssl/HostnameVerifier;

.field final u:LO4/g;

.field final v:LO4/c;

.field final w:LO4/c;

.field final x:LO4/l;

.field final y:LO4/r;

.field final z:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    sget-object v0, LO4/C;->k:LO4/C;

    .line 2
    .line 3
    sget-object v1, LO4/C;->i:LO4/C;

    .line 4
    .line 5
    filled-new-array {v0, v1}, [LO4/C;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lokhttp3/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    sput-object v0, LO4/B;->H:Ljava/util/List;

    .line 14
    .line 15
    sget-object v0, LO4/m;->h:LO4/m;

    .line 16
    .line 17
    sget-object v1, LO4/m;->j:LO4/m;

    .line 18
    .line 19
    filled-new-array {v0, v1}, [LO4/m;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Lokhttp3/internal/Util;->immutableList([Ljava/lang/Object;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    sput-object v0, LO4/B;->I:Ljava/util/List;

    .line 28
    .line 29
    new-instance v0, LO4/B$a;

    .line 30
    .line 31
    invoke-direct {v0}, LO4/B$a;-><init>()V

    .line 32
    .line 33
    .line 34
    sput-object v0, Lokhttp3/internal/Internal;->instance:Lokhttp3/internal/Internal;

    .line 35
    .line 36
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    new-instance v0, LO4/B$b;

    invoke-direct {v0}, LO4/B$b;-><init>()V

    invoke-direct {p0, v0}, LO4/B;-><init>(LO4/B$b;)V

    return-void
.end method

.method constructor <init>(LO4/B$b;)V
    .locals 4

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iget-object v0, p1, LO4/B$b;->a:LO4/p;

    iput-object v0, p0, LO4/B;->g:LO4/p;

    .line 4
    iget-object v0, p1, LO4/B$b;->b:Ljava/net/Proxy;

    iput-object v0, p0, LO4/B;->h:Ljava/net/Proxy;

    .line 5
    iget-object v0, p1, LO4/B$b;->c:Ljava/util/List;

    iput-object v0, p0, LO4/B;->i:Ljava/util/List;

    .line 6
    iget-object v0, p1, LO4/B$b;->d:Ljava/util/List;

    iput-object v0, p0, LO4/B;->j:Ljava/util/List;

    .line 7
    iget-object v1, p1, LO4/B$b;->e:Ljava/util/List;

    invoke-static {v1}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, LO4/B;->k:Ljava/util/List;

    .line 8
    iget-object v1, p1, LO4/B$b;->f:Ljava/util/List;

    invoke-static {v1}, Lokhttp3/internal/Util;->immutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    iput-object v1, p0, LO4/B;->l:Ljava/util/List;

    .line 9
    iget-object v1, p1, LO4/B$b;->g:LO4/t$b;

    iput-object v1, p0, LO4/B;->m:LO4/t$b;

    .line 10
    iget-object v1, p1, LO4/B$b;->h:Ljava/net/ProxySelector;

    iput-object v1, p0, LO4/B;->n:Ljava/net/ProxySelector;

    .line 11
    iget-object v1, p1, LO4/B$b;->i:LO4/o;

    iput-object v1, p0, LO4/B;->o:LO4/o;

    .line 12
    iget-object v1, p1, LO4/B$b;->j:Lokhttp3/internal/cache/InternalCache;

    iput-object v1, p0, LO4/B;->p:Lokhttp3/internal/cache/InternalCache;

    .line 13
    iget-object v1, p1, LO4/B$b;->k:Ljavax/net/SocketFactory;

    iput-object v1, p0, LO4/B;->q:Ljavax/net/SocketFactory;

    .line 14
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    move v2, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, LO4/m;

    if-nez v2, :cond_1

    .line 15
    invoke-virtual {v3}, LO4/m;->d()Z

    move-result v2

    if-eqz v2, :cond_0

    :cond_1
    const/4 v2, 0x1

    goto :goto_0

    .line 16
    :cond_2
    iget-object v0, p1, LO4/B$b;->l:Ljavax/net/ssl/SSLSocketFactory;

    if-nez v0, :cond_4

    if-nez v2, :cond_3

    goto :goto_1

    .line 17
    :cond_3
    invoke-static {}, Lokhttp3/internal/Util;->platformTrustManager()Ljavax/net/ssl/X509TrustManager;

    move-result-object v0

    .line 18
    invoke-static {v0}, LO4/B;->v(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;

    move-result-object v1

    iput-object v1, p0, LO4/B;->r:Ljavax/net/ssl/SSLSocketFactory;

    .line 19
    invoke-static {v0}, Lokhttp3/internal/tls/CertificateChainCleaner;->get(Ljavax/net/ssl/X509TrustManager;)Lokhttp3/internal/tls/CertificateChainCleaner;

    move-result-object v0

    iput-object v0, p0, LO4/B;->s:Lokhttp3/internal/tls/CertificateChainCleaner;

    goto :goto_2

    .line 20
    :cond_4
    :goto_1
    iput-object v0, p0, LO4/B;->r:Ljavax/net/ssl/SSLSocketFactory;

    .line 21
    iget-object v0, p1, LO4/B$b;->m:Lokhttp3/internal/tls/CertificateChainCleaner;

    iput-object v0, p0, LO4/B;->s:Lokhttp3/internal/tls/CertificateChainCleaner;

    .line 22
    :goto_2
    iget-object v0, p0, LO4/B;->r:Ljavax/net/ssl/SSLSocketFactory;

    if-eqz v0, :cond_5

    .line 23
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    move-result-object v0

    iget-object v1, p0, LO4/B;->r:Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v0, v1}, Lokhttp3/internal/platform/Platform;->configureSslSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 24
    :cond_5
    iget-object v0, p1, LO4/B$b;->n:Ljavax/net/ssl/HostnameVerifier;

    iput-object v0, p0, LO4/B;->t:Ljavax/net/ssl/HostnameVerifier;

    .line 25
    iget-object v0, p1, LO4/B$b;->o:LO4/g;

    iget-object v1, p0, LO4/B;->s:Lokhttp3/internal/tls/CertificateChainCleaner;

    invoke-virtual {v0, v1}, LO4/g;->f(Lokhttp3/internal/tls/CertificateChainCleaner;)LO4/g;

    move-result-object v0

    iput-object v0, p0, LO4/B;->u:LO4/g;

    .line 26
    iget-object v0, p1, LO4/B$b;->p:LO4/c;

    iput-object v0, p0, LO4/B;->v:LO4/c;

    .line 27
    iget-object v0, p1, LO4/B$b;->q:LO4/c;

    iput-object v0, p0, LO4/B;->w:LO4/c;

    .line 28
    iget-object v0, p1, LO4/B$b;->r:LO4/l;

    iput-object v0, p0, LO4/B;->x:LO4/l;

    .line 29
    iget-object v0, p1, LO4/B$b;->s:LO4/r;

    iput-object v0, p0, LO4/B;->y:LO4/r;

    .line 30
    iget-boolean v0, p1, LO4/B$b;->t:Z

    iput-boolean v0, p0, LO4/B;->z:Z

    .line 31
    iget-boolean v0, p1, LO4/B$b;->u:Z

    iput-boolean v0, p0, LO4/B;->A:Z

    .line 32
    iget-boolean v0, p1, LO4/B$b;->v:Z

    iput-boolean v0, p0, LO4/B;->B:Z

    .line 33
    iget v0, p1, LO4/B$b;->w:I

    iput v0, p0, LO4/B;->C:I

    .line 34
    iget v0, p1, LO4/B$b;->x:I

    iput v0, p0, LO4/B;->D:I

    .line 35
    iget v0, p1, LO4/B$b;->y:I

    iput v0, p0, LO4/B;->E:I

    .line 36
    iget v0, p1, LO4/B$b;->z:I

    iput v0, p0, LO4/B;->F:I

    .line 37
    iget p1, p1, LO4/B$b;->A:I

    iput p1, p0, LO4/B;->G:I

    .line 38
    iget-object p1, p0, LO4/B;->k:Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_7

    .line 39
    iget-object p1, p0, LO4/B;->l:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_6

    return-void

    .line 40
    :cond_6
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Null network interceptor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, LO4/B;->l:Ljava/util/List;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 41
    :cond_7
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Null interceptor: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, LO4/B;->k:Ljava/util/List;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private static v(Ljavax/net/ssl/X509TrustManager;)Ljavax/net/ssl/SSLSocketFactory;
    .locals 3

    .line 1
    :try_start_0
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lokhttp3/internal/platform/Platform;->getSSLContext()Ljavax/net/ssl/SSLContext;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const/4 v1, 0x1

    .line 10
    new-array v1, v1, [Ljavax/net/ssl/TrustManager;

    .line 11
    .line 12
    const/4 v2, 0x0

    .line 13
    aput-object p0, v1, v2

    .line 14
    .line 15
    const/4 p0, 0x0

    .line 16
    invoke-virtual {v0, p0, v1, p0}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    .line 20
    .line 21
    .line 22
    move-result-object p0
    :try_end_0
    .catch Ljava/security/GeneralSecurityException; {:try_start_0 .. :try_end_0} :catch_0

    .line 23
    return-object p0

    .line 24
    :catch_0
    move-exception p0

    .line 25
    new-instance v0, Ljava/lang/AssertionError;

    .line 26
    .line 27
    const-string v1, "No System TLS"

    .line 28
    .line 29
    invoke-direct {v0, v1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    throw v0
.end method


# virtual methods
.method public A()Ljava/net/ProxySelector;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->n:Ljava/net/ProxySelector;

    .line 2
    .line 3
    return-object p0
.end method

.method public B()I
    .locals 0

    .line 1
    iget p0, p0, LO4/B;->E:I

    .line 2
    .line 3
    return p0
.end method

.method public C()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LO4/B;->B:Z

    .line 2
    .line 3
    return p0
.end method

.method public D()Ljavax/net/SocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->q:Ljavax/net/SocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public E()Ljavax/net/ssl/SSLSocketFactory;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->r:Ljavax/net/ssl/SSLSocketFactory;

    .line 2
    .line 3
    return-object p0
.end method

.method public F()I
    .locals 0

    .line 1
    iget p0, p0, LO4/B;->F:I

    .line 2
    .line 3
    return p0
.end method

.method public a(LO4/E;)LO4/e;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, v0}, LO4/D;->d(LO4/B;LO4/E;Z)LO4/D;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public b()LO4/c;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->w:LO4/c;

    .line 2
    .line 3
    return-object p0
.end method

.method public c()I
    .locals 0

    .line 1
    iget p0, p0, LO4/B;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public d()LO4/g;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->u:LO4/g;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()I
    .locals 0

    .line 1
    iget p0, p0, LO4/B;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public h()LO4/l;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->x:LO4/l;

    .line 2
    .line 3
    return-object p0
.end method

.method public i()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LO4/m;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LO4/B;->j:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public k()LO4/o;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->o:LO4/o;

    .line 2
    .line 3
    return-object p0
.end method

.method public l()LO4/p;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->g:LO4/p;

    .line 2
    .line 3
    return-object p0
.end method

.method public m()LO4/r;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->y:LO4/r;

    .line 2
    .line 3
    return-object p0
.end method

.method public n()LO4/t$b;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->m:LO4/t$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LO4/B;->A:Z

    .line 2
    .line 3
    return p0
.end method

.method public p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LO4/B;->z:Z

    .line 2
    .line 3
    return p0
.end method

.method public q()Ljavax/net/ssl/HostnameVerifier;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->t:Ljavax/net/ssl/HostnameVerifier;

    .line 2
    .line 3
    return-object p0
.end method

.method public r()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LO4/y;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LO4/B;->k:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method s()Lokhttp3/internal/cache/InternalCache;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/B;->p:Lokhttp3/internal/cache/InternalCache;

    .line 2
    .line 3
    return-object p0
.end method

.method public t()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LO4/y;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LO4/B;->l:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public u()LO4/B$b;
    .locals 1

    .line 1
    new-instance v0, LO4/B$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LO4/B$b;-><init>(LO4/B;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public w()I
    .locals 0

    .line 1
    iget p0, p0, LO4/B;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public x()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "LO4/C;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, LO4/B;->i:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public y()Ljava/net/Proxy;
    .locals 0
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, LO4/B;->h:Ljava/net/Proxy;

    .line 2
    .line 3
    return-object p0
.end method

.method public z()LO4/c;
    .locals 0

    .line 1
    iget-object p0, p0, LO4/B;->v:LO4/c;

    .line 2
    .line 3
    return-object p0
.end method
