.class public final Landroidx/activity/p$g$a;
.super Ljava/lang/Object;
.source "OnBackPressedDispatcher.kt"

# interfaces
.implements Landroid/window/OnBackAnimationCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/activity/p$g;->a(Lu4/l;Lu4/l;Lu4/a;Lu4/a;)Landroid/window/OnBackInvokedCallback;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroidx/activity/b;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic h:Lu4/l;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/l<",
            "Landroidx/activity/b;",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic i:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic j:Lu4/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lu4/a<",
            "Lh4/t;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lu4/l;Lu4/l;Lu4/a;Lu4/a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/l<",
            "-",
            "Landroidx/activity/b;",
            "Lh4/t;",
            ">;",
            "Lu4/l<",
            "-",
            "Landroidx/activity/b;",
            "Lh4/t;",
            ">;",
            "Lu4/a<",
            "Lh4/t;",
            ">;",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/activity/p$g$a;->g:Lu4/l;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/activity/p$g$a;->h:Lu4/l;

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/activity/p$g$a;->i:Lu4/a;

    .line 6
    .line 7
    iput-object p4, p0, Landroidx/activity/p$g$a;->j:Lu4/a;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onBackCancelled()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/activity/p$g$a;->j:Lu4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onBackInvoked()V
    .locals 0

    .line 1
    iget-object p0, p0, Landroidx/activity/p$g$a;->i:Lu4/a;

    .line 2
    .line 3
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onBackProgressed(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    const-string v0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroidx/activity/p$g$a;->h:Lu4/l;

    .line 7
    .line 8
    new-instance v0, Landroidx/activity/b;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroidx/activity/b;-><init>(Landroid/window/BackEvent;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0, v0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public onBackStarted(Landroid/window/BackEvent;)V
    .locals 1

    .line 1
    const-string v0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroidx/activity/p$g$a;->g:Lu4/l;

    .line 7
    .line 8
    new-instance v0, Landroidx/activity/b;

    .line 9
    .line 10
    invoke-direct {v0, p1}, Landroidx/activity/b;-><init>(Landroid/window/BackEvent;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {p0, v0}, Lu4/l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    return-void
.end method
