.class public final Lokhttp3/internal/http2/Header;
.super Ljava/lang/Object;
.source "Header.java"


# static fields
.field public static final PSEUDO_PREFIX:Lokio/h;

.field public static final RESPONSE_STATUS:Lokio/h;

.field public static final RESPONSE_STATUS_UTF8:Ljava/lang/String; = ":status"

.field public static final TARGET_AUTHORITY:Lokio/h;

.field public static final TARGET_AUTHORITY_UTF8:Ljava/lang/String; = ":authority"

.field public static final TARGET_METHOD:Lokio/h;

.field public static final TARGET_METHOD_UTF8:Ljava/lang/String; = ":method"

.field public static final TARGET_PATH:Lokio/h;

.field public static final TARGET_PATH_UTF8:Ljava/lang/String; = ":path"

.field public static final TARGET_SCHEME:Lokio/h;

.field public static final TARGET_SCHEME_UTF8:Ljava/lang/String; = ":scheme"


# instance fields
.field final hpackSize:I

.field public final name:Lokio/h;

.field public final value:Lokio/h;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, ":"

    .line 2
    .line 3
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lokhttp3/internal/http2/Header;->PSEUDO_PREFIX:Lokio/h;

    .line 8
    .line 9
    const-string v0, ":status"

    .line 10
    .line 11
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sput-object v0, Lokhttp3/internal/http2/Header;->RESPONSE_STATUS:Lokio/h;

    .line 16
    .line 17
    const-string v0, ":method"

    .line 18
    .line 19
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_METHOD:Lokio/h;

    .line 24
    .line 25
    const-string v0, ":path"

    .line 26
    .line 27
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_PATH:Lokio/h;

    .line 32
    .line 33
    const-string v0, ":scheme"

    .line 34
    .line 35
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_SCHEME:Lokio/h;

    .line 40
    .line 41
    const-string v0, ":authority"

    .line 42
    .line 43
    invoke-static {v0}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    sput-object v0, Lokhttp3/internal/http2/Header;->TARGET_AUTHORITY:Lokio/h;

    .line 48
    .line 49
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    move-result-object p1

    invoke-static {p2}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http2/Header;-><init>(Lokio/h;Lokio/h;)V

    return-void
.end method

.method public constructor <init>(Lokio/h;Ljava/lang/String;)V
    .locals 0

    .line 2
    invoke-static {p2}, Lokio/h;->f(Ljava/lang/String;)Lokio/h;

    move-result-object p2

    invoke-direct {p0, p1, p2}, Lokhttp3/internal/http2/Header;-><init>(Lokio/h;Lokio/h;)V

    return-void
.end method

.method public constructor <init>(Lokio/h;Lokio/h;)V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    iput-object p1, p0, Lokhttp3/internal/http2/Header;->name:Lokio/h;

    .line 5
    iput-object p2, p0, Lokhttp3/internal/http2/Header;->value:Lokio/h;

    .line 6
    invoke-virtual {p1}, Lokio/h;->z()I

    move-result p1

    add-int/lit8 p1, p1, 0x20

    invoke-virtual {p2}, Lokio/h;->z()I

    move-result p2

    add-int/2addr p1, p2

    iput p1, p0, Lokhttp3/internal/http2/Header;->hpackSize:I

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lokhttp3/internal/http2/Header;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lokhttp3/internal/http2/Header;

    .line 7
    .line 8
    iget-object v0, p0, Lokhttp3/internal/http2/Header;->name:Lokio/h;

    .line 9
    .line 10
    iget-object v2, p1, Lokhttp3/internal/http2/Header;->name:Lokio/h;

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Lokio/h;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, Lokhttp3/internal/http2/Header;->value:Lokio/h;

    .line 19
    .line 20
    iget-object p1, p1, Lokhttp3/internal/http2/Header;->value:Lokio/h;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lokio/h;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Lokhttp3/internal/http2/Header;->name:Lokio/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Lokio/h;->hashCode()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x20f

    .line 8
    .line 9
    add-int/2addr v1, v0

    .line 10
    mul-int/lit8 v1, v1, 0x1f

    .line 11
    .line 12
    iget-object p0, p0, Lokhttp3/internal/http2/Header;->value:Lokio/h;

    .line 13
    .line 14
    invoke-virtual {p0}, Lokio/h;->hashCode()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    add-int/2addr v1, p0

    .line 19
    return v1
.end method

.method public toString()Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lokhttp3/internal/http2/Header;->name:Lokio/h;

    .line 2
    .line 3
    invoke-virtual {v0}, Lokio/h;->D()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lokhttp3/internal/http2/Header;->value:Lokio/h;

    .line 8
    .line 9
    invoke-virtual {p0}, Lokio/h;->D()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    filled-new-array {v0, p0}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string v0, "%s: %s"

    .line 18
    .line 19
    invoke-static {v0, p0}, Lokhttp3/internal/Util;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method
