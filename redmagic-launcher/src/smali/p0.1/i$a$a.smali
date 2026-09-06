.class final Lp0/i$a$a;
.super Lkotlin/jvm/internal/p;
.source "WindowInfoTrackerImpl.kt"

# interfaces
.implements Lu4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lp0/i$a;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/a<",
        "Lh4/t;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic h:Lp0/i;

.field final synthetic i:LI/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "LI/a<",
            "Lp0/j;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lp0/i;LI/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lp0/i;",
            "LI/a<",
            "Lp0/j;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lp0/i$a$a;->h:Lp0/i;

    .line 2
    .line 3
    iput-object p2, p0, Lp0/i$a$a;->i:LI/a;

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object v0, p0, Lp0/i$a$a;->h:Lp0/i;

    .line 2
    .line 3
    invoke-static {v0}, Lp0/i;->c(Lp0/i;)Lq0/a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object p0, p0, Lp0/i$a$a;->i:LI/a;

    .line 8
    .line 9
    invoke-interface {v0, p0}, Lq0/a;->b(LI/a;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lp0/i$a$a;->a()V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 5
    .line 6
    return-object p0
.end method
