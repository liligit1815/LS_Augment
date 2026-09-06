.class final LU/B$b$a;
.super Lkotlin/jvm/internal/p;
.source "SvgPathParser.kt"

# interfaces
.implements Lu4/p;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LU/B$b;->b(Ljava/lang/String;)Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/p<",
        "LU/c;",
        "LU/c;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# static fields
.field public static final h:LU/B$b$a;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LU/B$b$a;

    .line 2
    .line 3
    invoke-direct {v0}, LU/B$b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LU/B$b$a;->h:LU/B$b$a;

    .line 7
    .line 8
    return-void
.end method

.method constructor <init>()V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-direct {p0, v0}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 3
    .line 4
    .line 5
    return-void
.end method


# virtual methods
.method public final a(LU/c;LU/c;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string p0, "first"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p0, "second"

    .line 7
    .line 8
    invoke-static {p2, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2}, LU/c;->b()F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-virtual {p1}, LU/c;->d()F

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    sub-float/2addr p0, v0

    .line 20
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    const v0, 0x38d1b717    # 1.0E-4f

    .line 25
    .line 26
    .line 27
    cmpg-float p0, p0, v0

    .line 28
    .line 29
    if-gez p0, :cond_0

    .line 30
    .line 31
    invoke-virtual {p2}, LU/c;->c()F

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-virtual {p1}, LU/c;->e()F

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    sub-float/2addr p0, p1

    .line 40
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    cmpg-float p0, p0, v0

    .line 45
    .line 46
    if-gez p0, :cond_0

    .line 47
    .line 48
    const/4 p0, 0x1

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    const/4 p0, 0x0

    .line 51
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, LU/c;

    .line 2
    .line 3
    check-cast p2, LU/c;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, LU/B$b$a;->a(LU/c;LU/c;)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
