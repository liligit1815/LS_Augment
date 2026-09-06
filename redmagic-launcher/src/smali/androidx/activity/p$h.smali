.class final Landroidx/activity/p$h;
.super Ljava/lang/Object;
.source "OnBackPressedDispatcher.kt"

# interfaces
.implements Landroidx/lifecycle/h;
.implements Landroidx/activity/c;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/activity/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "h"
.end annotation


# instance fields
.field private final g:Landroidx/lifecycle/g;

.field private final h:Landroidx/activity/o;

.field private i:Landroidx/activity/c;

.field final synthetic j:Landroidx/activity/p;


# direct methods
.method public constructor <init>(Landroidx/activity/p;Landroidx/lifecycle/g;Landroidx/activity/o;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/lifecycle/g;",
            "Landroidx/activity/o;",
            ")V"
        }
    .end annotation

    .line 1
    const-string v0, "lifecycle"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "onBackPressedCallback"

    .line 7
    .line 8
    invoke-static {p3, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Landroidx/activity/p$h;->j:Landroidx/activity/p;

    .line 12
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Landroidx/activity/p$h;->g:Landroidx/lifecycle/g;

    .line 17
    .line 18
    iput-object p3, p0, Landroidx/activity/p$h;->h:Landroidx/activity/o;

    .line 19
    .line 20
    invoke-virtual {p2, p0}, Landroidx/lifecycle/g;->a(LW/c;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public b(LW/d;Landroidx/lifecycle/g$a;)V
    .locals 1

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string p1, "event"

    .line 7
    .line 8
    invoke-static {p2, p1}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p1, Landroidx/lifecycle/g$a;->ON_START:Landroidx/lifecycle/g$a;

    .line 12
    .line 13
    if-ne p2, p1, :cond_0

    .line 14
    .line 15
    iget-object p1, p0, Landroidx/activity/p$h;->j:Landroidx/activity/p;

    .line 16
    .line 17
    iget-object p2, p0, Landroidx/activity/p$h;->h:Landroidx/activity/o;

    .line 18
    .line 19
    invoke-virtual {p1, p2}, Landroidx/activity/p;->i(Landroidx/activity/o;)Landroidx/activity/c;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iput-object p1, p0, Landroidx/activity/p$h;->i:Landroidx/activity/c;

    .line 24
    .line 25
    return-void

    .line 26
    :cond_0
    sget-object p1, Landroidx/lifecycle/g$a;->ON_STOP:Landroidx/lifecycle/g$a;

    .line 27
    .line 28
    if-ne p2, p1, :cond_1

    .line 29
    .line 30
    iget-object p0, p0, Landroidx/activity/p$h;->i:Landroidx/activity/c;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    invoke-interface {p0}, Landroidx/activity/c;->cancel()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    sget-object p1, Landroidx/lifecycle/g$a;->ON_DESTROY:Landroidx/lifecycle/g$a;

    .line 39
    .line 40
    if-ne p2, p1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p0}, Landroidx/activity/p$h;->cancel()V

    .line 43
    .line 44
    .line 45
    :cond_2
    return-void
.end method

.method public cancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/activity/p$h;->g:Landroidx/lifecycle/g;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Landroidx/lifecycle/g;->c(LW/c;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Landroidx/activity/p$h;->h:Landroidx/activity/o;

    .line 7
    .line 8
    invoke-virtual {v0, p0}, Landroidx/activity/o;->l(Landroidx/activity/c;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Landroidx/activity/p$h;->i:Landroidx/activity/c;

    .line 12
    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0}, Landroidx/activity/c;->cancel()V

    .line 16
    .line 17
    .line 18
    :cond_0
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Landroidx/activity/p$h;->i:Landroidx/activity/c;

    .line 20
    .line 21
    return-void
.end method
