.class final LF4/D0;
.super LF4/K0;
.source "Builders.common.kt"


# instance fields
.field private final j:Ll4/d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll4/d<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll4/g;Lu4/p;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll4/g;",
            "Lu4/p<",
            "-",
            "LF4/I;",
            "-",
            "Ll4/d<",
            "-",
            "Lh4/t;",
            ">;+",
            "Ljava/lang/Object;",
            ">;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, LF4/K0;-><init>(Ll4/g;Z)V

    .line 3
    .line 4
    .line 5
    invoke-static {p2, p0, p0}, Lm4/b;->a(Lu4/p;Ljava/lang/Object;Ll4/d;)Ll4/d;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, LF4/D0;->j:Ll4/d;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method protected w0()V
    .locals 1

    .line 1
    iget-object v0, p0, LF4/D0;->j:Ll4/d;

    .line 2
    .line 3
    invoke-static {v0, p0}, LL4/a;->b(Ll4/d;Ll4/d;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
