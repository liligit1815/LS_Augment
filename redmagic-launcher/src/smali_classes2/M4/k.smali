.class final LM4/k;
.super LF4/E;
.source "Dispatcher.kt"


# static fields
.field public static final i:LM4/k;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LM4/k;

    .line 2
    .line 3
    invoke-direct {v0}, LM4/k;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM4/k;->i:LM4/k;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, LF4/E;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a0(Ll4/g;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    sget-object p0, LM4/c;->o:LM4/c;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p2, p1, v0}, LM4/f;->g0(Ljava/lang/Runnable;ZZ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b0(Ll4/g;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    sget-object p0, LM4/c;->o:LM4/c;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p2, p1, p1}, LM4/f;->g0(Ljava/lang/Runnable;ZZ)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public d0(ILjava/lang/String;)LF4/E;
    .locals 1

    .line 1
    invoke-static {p1}, LK4/l;->a(I)V

    .line 2
    .line 3
    .line 4
    sget v0, LM4/j;->d:I

    .line 5
    .line 6
    if-lt p1, v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0, p2}, LK4/l;->b(LF4/E;Ljava/lang/String;)LF4/E;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-super {p0, p1, p2}, LF4/E;->d0(ILjava/lang/String;)LF4/E;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "Dispatchers.IO"

    .line 2
    .line 3
    return-object p0
.end method
