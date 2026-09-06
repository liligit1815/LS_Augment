.class final LF4/A0$a;
.super LF4/z0;
.source "JobSupport.kt"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LF4/A0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "a"
.end annotation


# instance fields
.field private final k:LF4/A0;

.field private final l:LF4/A0$b;

.field private final m:LF4/r;

.field private final n:Ljava/lang/Object;


# direct methods
.method public constructor <init>(LF4/A0;LF4/A0$b;LF4/r;Ljava/lang/Object;)V
    .locals 0

    .line 1
    invoke-direct {p0}, LF4/z0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LF4/A0$a;->k:LF4/A0;

    .line 5
    .line 6
    iput-object p2, p0, LF4/A0$a;->l:LF4/A0$b;

    .line 7
    .line 8
    iput-object p3, p0, LF4/A0$a;->m:LF4/r;

    .line 9
    .line 10
    iput-object p4, p0, LF4/A0$a;->n:Ljava/lang/Object;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public t()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public u(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    iget-object p1, p0, LF4/A0$a;->k:LF4/A0;

    .line 2
    .line 3
    iget-object v0, p0, LF4/A0$a;->l:LF4/A0$b;

    .line 4
    .line 5
    iget-object v1, p0, LF4/A0$a;->m:LF4/r;

    .line 6
    .line 7
    iget-object p0, p0, LF4/A0$a;->n:Ljava/lang/Object;

    .line 8
    .line 9
    invoke-static {p1, v0, v1, p0}, LF4/A0;->u(LF4/A0;LF4/A0$b;LF4/r;Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
