.class public LF0/G;
.super Ljava/lang/Object;
.source "ScaleXYParser.java"

# interfaces
.implements LF0/N;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LF0/N<",
        "LI0/d;",
        ">;"
    }
.end annotation


# static fields
.field public static final a:LF0/G;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LF0/G;

    .line 2
    .line 3
    invoke-direct {v0}, LF0/G;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LF0/G;->a:LF0/G;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public bridge synthetic a(LG0/c;F)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0, p1, p2}, LF0/G;->b(LG0/c;F)LI0/d;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public b(LG0/c;F)LI0/d;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p1}, LG0/c;->D()LG0/c$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, LG0/c$b;->g:LG0/c$b;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    if-eqz p0, :cond_1

    .line 13
    .line 14
    invoke-virtual {p1}, LG0/c;->c()V

    .line 15
    .line 16
    .line 17
    :cond_1
    invoke-virtual {p1}, LG0/c;->v()D

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    double-to-float v0, v0

    .line 22
    invoke-virtual {p1}, LG0/c;->v()D

    .line 23
    .line 24
    .line 25
    move-result-wide v1

    .line 26
    double-to-float v1, v1

    .line 27
    :goto_1
    invoke-virtual {p1}, LG0/c;->n()Z

    .line 28
    .line 29
    .line 30
    move-result v2

    .line 31
    if-eqz v2, :cond_2

    .line 32
    .line 33
    invoke-virtual {p1}, LG0/c;->J()V

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_2
    if-eqz p0, :cond_3

    .line 38
    .line 39
    invoke-virtual {p1}, LG0/c;->e()V

    .line 40
    .line 41
    .line 42
    :cond_3
    new-instance p0, LI0/d;

    .line 43
    .line 44
    const/high16 p1, 0x42c80000    # 100.0f

    .line 45
    .line 46
    div-float/2addr v0, p1

    .line 47
    mul-float/2addr v0, p2

    .line 48
    div-float/2addr v1, p1

    .line 49
    mul-float/2addr v1, p2

    .line 50
    invoke-direct {p0, v0, v1}, LI0/d;-><init>(FF)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method
