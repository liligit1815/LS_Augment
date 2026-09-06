.class public final LF4/m0$a;
.super Ll4/b;
.source "Executors.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LF4/m0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll4/b<",
        "LF4/E;",
        "LF4/m0;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    .line 2
    sget-object v0, LF4/E;->h:LF4/E$a;

    new-instance v1, LF4/l0;

    invoke-direct {v1}, LF4/l0;-><init>()V

    .line 3
    invoke-direct {p0, v0, v1}, Ll4/b;-><init>(Ll4/g$c;Lu4/l;)V

    return-void
.end method

.method public synthetic constructor <init>(Lkotlin/jvm/internal/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LF4/m0$a;-><init>()V

    return-void
.end method

.method public static synthetic c(Ll4/g$b;)LF4/m0;
    .locals 0

    .line 1
    invoke-static {p0}, LF4/m0$a;->d(Ll4/g$b;)LF4/m0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private static final d(Ll4/g$b;)LF4/m0;
    .locals 1

    .line 1
    instance-of v0, p0, LF4/m0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, LF4/m0;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method
