.class final Landroidx/activity/p$i;
.super Ljava/lang/Object;
.source "OnBackPressedDispatcher.kt"

# interfaces
.implements Landroidx/activity/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/activity/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "i"
.end annotation


# instance fields
.field private final g:Landroidx/activity/o;

.field final synthetic h:Landroidx/activity/p;


# direct methods
.method public constructor <init>(Landroidx/activity/p;Landroidx/activity/o;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/activity/o;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "onBackPressedCallback"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iput-object p1, p0, Landroidx/activity/p$i;->h:Landroidx/activity/p;

    .line 7
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p2, p0, Landroidx/activity/p$i;->g:Landroidx/activity/o;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/activity/p$i;->h:Landroidx/activity/p;

    .line 2
    .line 3
    invoke-static {v0}, Landroidx/activity/p;->b(Landroidx/activity/p;)Li4/f;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Landroidx/activity/p$i;->g:Landroidx/activity/o;

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Li4/f;->remove(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Landroidx/activity/p$i;->h:Landroidx/activity/p;

    .line 13
    .line 14
    invoke-static {v0}, Landroidx/activity/p;->a(Landroidx/activity/p;)Landroidx/activity/o;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iget-object v1, p0, Landroidx/activity/p$i;->g:Landroidx/activity/o;

    .line 19
    .line 20
    invoke-static {v0, v1}, Lkotlin/jvm/internal/o;->b(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    const/4 v1, 0x0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p0, Landroidx/activity/p$i;->g:Landroidx/activity/o;

    .line 28
    .line 29
    invoke-virtual {v0}, Landroidx/activity/o;->f()V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Landroidx/activity/p$i;->h:Landroidx/activity/p;

    .line 33
    .line 34
    invoke-static {v0, v1}, Landroidx/activity/p;->f(Landroidx/activity/p;Landroidx/activity/o;)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object v0, p0, Landroidx/activity/p$i;->g:Landroidx/activity/o;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Landroidx/activity/o;->l(Landroidx/activity/c;)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Landroidx/activity/p$i;->g:Landroidx/activity/o;

    .line 43
    .line 44
    invoke-virtual {v0}, Landroidx/activity/o;->e()Lu4/a;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    invoke-interface {v0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    :cond_1
    iget-object p0, p0, Landroidx/activity/p$i;->g:Landroidx/activity/o;

    .line 54
    .line 55
    invoke-virtual {p0, v1}, Landroidx/activity/o;->n(Lu4/a;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
