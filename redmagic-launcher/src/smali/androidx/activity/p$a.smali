.class final Landroidx/activity/p$a;
.super Lkotlin/jvm/internal/p;
.source "OnBackPressedDispatcher.kt"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/activity/p;-><init>(Ljava/lang/Runnable;LI/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/l<",
        "Landroidx/activity/b;",
        "Lh4/t;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic h:Landroidx/activity/p;


# direct methods
.method constructor <init>(Landroidx/activity/p;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/activity/p$a;->h:Landroidx/activity/p;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a(Landroidx/activity/b;)V
    .locals 1

    .line 1
    const-string v0, "backEvent"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Landroidx/activity/p$a;->h:Landroidx/activity/p;

    .line 7
    .line 8
    invoke-static {p0, p1}, Landroidx/activity/p;->e(Landroidx/activity/p;Landroidx/activity/b;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Landroidx/activity/b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroidx/activity/p$a;->a(Landroidx/activity/b;)V

    .line 4
    .line 5
    .line 6
    sget-object p0, Lh4/t;->a:Lh4/t;

    .line 7
    .line 8
    return-object p0
.end method
