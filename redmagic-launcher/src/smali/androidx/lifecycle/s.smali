.class public final Landroidx/lifecycle/s;
.super Ljava/lang/Object;
.source "SingleGeneratedAdapterObserver.jvm.kt"

# interfaces
.implements Landroidx/lifecycle/h;


# instance fields
.field private final g:Landroidx/lifecycle/d;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/d;)V
    .locals 1

    .line 1
    const-string v0, "generatedAdapter"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Landroidx/lifecycle/s;->g:Landroidx/lifecycle/d;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(LW/d;Landroidx/lifecycle/g$a;)V
    .locals 3

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "event"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/lifecycle/s;->g:Landroidx/lifecycle/d;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    const/4 v2, 0x0

    .line 15
    invoke-interface {v0, p1, p2, v1, v2}, Landroidx/lifecycle/d;->a(LW/d;Landroidx/lifecycle/g$a;ZLW/g;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Landroidx/lifecycle/s;->g:Landroidx/lifecycle/d;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-interface {p0, p1, p2, v0, v2}, Landroidx/lifecycle/d;->a(LW/d;Landroidx/lifecycle/g$a;ZLW/g;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method
