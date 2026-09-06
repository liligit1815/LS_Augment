.class public LM4/f;
.super LF4/m0;
.source "Dispatcher.kt"


# instance fields
.field private final j:I

.field private final k:I

.field private final l:J

.field private final m:Ljava/lang/String;

.field private n:LM4/a;


# direct methods
.method public constructor <init>(IIJLjava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LF4/m0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, LM4/f;->j:I

    .line 5
    .line 6
    iput p2, p0, LM4/f;->k:I

    .line 7
    .line 8
    iput-wide p3, p0, LM4/f;->l:J

    .line 9
    .line 10
    iput-object p5, p0, LM4/f;->m:Ljava/lang/String;

    .line 11
    .line 12
    invoke-direct {p0}, LM4/f;->f0()LM4/a;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, LM4/f;->n:LM4/a;

    .line 17
    .line 18
    return-void
.end method

.method private final f0()LM4/a;
    .locals 6

    .line 1
    new-instance v0, LM4/a;

    .line 2
    .line 3
    iget v1, p0, LM4/f;->j:I

    .line 4
    .line 5
    iget v2, p0, LM4/f;->k:I

    .line 6
    .line 7
    iget-wide v3, p0, LM4/f;->l:J

    .line 8
    .line 9
    iget-object v5, p0, LM4/f;->m:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct/range {v0 .. v5}, LM4/a;-><init>(IIJLjava/lang/String;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method


# virtual methods
.method public a0(Ll4/g;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    iget-object v0, p0, LM4/f;->n:LM4/a;

    .line 2
    .line 3
    const/4 v4, 0x6

    .line 4
    const/4 v5, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x0

    .line 7
    move-object v1, p2

    .line 8
    invoke-static/range {v0 .. v5}, LM4/a;->t(LM4/a;Ljava/lang/Runnable;ZZILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public b0(Ll4/g;Ljava/lang/Runnable;)V
    .locals 6

    .line 1
    iget-object v0, p0, LM4/f;->n:LM4/a;

    .line 2
    .line 3
    const/4 v4, 0x2

    .line 4
    const/4 v5, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    move-object v1, p2

    .line 8
    invoke-static/range {v0 .. v5}, LM4/a;->t(LM4/a;Ljava/lang/Runnable;ZZILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final g0(Ljava/lang/Runnable;ZZ)V
    .locals 0

    .line 1
    iget-object p0, p0, LM4/f;->n:LM4/a;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3}, LM4/a;->n(Ljava/lang/Runnable;ZZ)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
