.class public final LM4/c;
.super LM4/f;
.source "Dispatcher.kt"


# static fields
.field public static final o:LM4/c;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, LM4/c;

    .line 2
    .line 3
    invoke-direct {v0}, LM4/c;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, LM4/c;->o:LM4/c;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 6

    .line 1
    sget v1, LM4/j;->c:I

    .line 2
    .line 3
    sget v2, LM4/j;->d:I

    .line 4
    .line 5
    sget-wide v3, LM4/j;->e:J

    .line 6
    .line 7
    sget-object v5, LM4/j;->a:Ljava/lang/String;

    .line 8
    .line 9
    move-object v0, p0

    .line 10
    invoke-direct/range {v0 .. v5}, LM4/f;-><init>(IIJLjava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    .line 2
    .line 3
    const-string v0, "Dispatchers.Default cannot be closed"

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    throw p0
.end method

.method public d0(ILjava/lang/String;)LF4/E;
    .locals 1

    .line 1
    invoke-static {p1}, LK4/l;->a(I)V

    .line 2
    .line 3
    .line 4
    sget v0, LM4/j;->c:I

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
    const-string p0, "Dispatchers.Default"

    .line 2
    .line 3
    return-object p0
.end method
