.class public Lrx/a;
.super Ljava/lang/Object;
.source "Completable.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/a$e;,
        Lrx/a$d;
    }
.end annotation


# static fields
.field static final b:Lrx/a;

.field static final c:Lrx/a;

.field static final d:LZ4/a;


# instance fields
.field private final a:Lrx/a$d;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lrx/a$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lrx/a$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/a;->a(Lrx/a$d;)Lrx/a;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    sput-object v0, Lrx/a;->b:Lrx/a;

    .line 11
    .line 12
    new-instance v0, Lrx/a$c;

    .line 13
    .line 14
    invoke-direct {v0}, Lrx/a$c;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-static {v0}, Lrx/a;->a(Lrx/a$d;)Lrx/a;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    sput-object v0, Lrx/a;->c:Lrx/a;

    .line 22
    .line 23
    invoke-static {}, LZ4/d;->b()LZ4/d;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, LZ4/d;->a()LZ4/a;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lrx/a;->d:LZ4/a;

    .line 32
    .line 33
    return-void
.end method

.method protected constructor <init>(Lrx/a$d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/a;->a:Lrx/a$d;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lrx/a$d;)Lrx/a;
    .locals 1

    .line 1
    invoke-static {p0}, Lrx/a;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance v0, Lrx/a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lrx/a;-><init>(Lrx/a$d;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    return-object v0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    sget-object v0, Lrx/a;->d:LZ4/a;

    .line 12
    .line 13
    invoke-virtual {v0, p0}, LZ4/a;->a(Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    invoke-static {p0}, Lrx/a;->d(Ljava/lang/Throwable;)Ljava/lang/NullPointerException;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    throw p0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    throw p0
.end method

.method static b(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    const/4 p0, 0x0

    .line 5
    throw p0
.end method

.method static d(Ljava/lang/Throwable;)Ljava/lang/NullPointerException;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/NullPointerException;

    .line 2
    .line 3
    const-string v1, "Actually not, but can\'t pass out an exception otherwise..."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/NullPointerException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public final c(Lrx/e;)Lrx/a;
    .locals 1

    .line 1
    invoke-static {p1}, Lrx/a;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lrx/a$b;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lrx/a$b;-><init>(Lrx/a;Lrx/e;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/a;->a(Lrx/a$d;)Lrx/a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
