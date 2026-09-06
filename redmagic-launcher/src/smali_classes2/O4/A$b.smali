.class public final LO4/A$b;
.super Ljava/lang/Object;
.source "MultipartBody.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LO4/A;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
.end annotation


# instance fields
.field final a:LO4/w;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final b:LO4/F;


# direct methods
.method private constructor <init>(LO4/w;LO4/F;)V
    .locals 0
    .param p1    # LO4/w;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO4/A$b;->a:LO4/w;

    .line 5
    .line 6
    iput-object p2, p0, LO4/A$b;->b:LO4/F;

    .line 7
    .line 8
    return-void
.end method

.method public static a(LO4/w;LO4/F;)LO4/A$b;
    .locals 1
    .param p0    # LO4/w;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    if-eqz p1, :cond_4

    .line 2
    .line 3
    if-eqz p0, :cond_1

    .line 4
    .line 5
    const-string v0, "Content-Type"

    .line 6
    .line 7
    invoke-virtual {p0, v0}, LO4/w;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 15
    .line 16
    const-string p1, "Unexpected header: Content-Type"

    .line 17
    .line 18
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    throw p0

    .line 22
    :cond_1
    :goto_0
    if-eqz p0, :cond_3

    .line 23
    .line 24
    const-string v0, "Content-Length"

    .line 25
    .line 26
    invoke-virtual {p0, v0}, LO4/w;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-nez v0, :cond_2

    .line 31
    .line 32
    goto :goto_1

    .line 33
    :cond_2
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 34
    .line 35
    const-string p1, "Unexpected header: Content-Length"

    .line 36
    .line 37
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    throw p0

    .line 41
    :cond_3
    :goto_1
    new-instance v0, LO4/A$b;

    .line 42
    .line 43
    invoke-direct {v0, p0, p1}, LO4/A$b;-><init>(LO4/w;LO4/F;)V

    .line 44
    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_4
    new-instance p0, Ljava/lang/NullPointerException;

    .line 48
    .line 49
    const-string p1, "body == null"

    .line 50
    .line 51
    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    throw p0
.end method
