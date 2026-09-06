.class final LW/k$a;
.super Lkotlin/jvm/internal/p;
.source "SavedStateHandleSupport.kt"

# interfaces
.implements Lu4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW/k;-><init>(Le0/d;LW/p;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/a<",
        "LW/l;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic h:LW/p;


# direct methods
.method constructor <init>(LW/p;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW/k$a;->h:LW/p;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a()LW/l;
    .locals 0

    .line 1
    iget-object p0, p0, LW/k$a;->h:LW/p;

    .line 2
    .line 3
    invoke-static {p0}, Landroidx/lifecycle/q;->e(LW/p;)LW/l;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, LW/k$a;->a()LW/l;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
