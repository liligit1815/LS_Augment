.class public final LE2/d;
.super Ljava/lang/Object;
.source "RotationChangeProvider_Factory.java"


# instance fields
.field private final a:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Landroid/hardware/display/DisplayManager;",
            ">;"
        }
    .end annotation
.end field

.field private final b:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Lf4/f;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lf4/f<",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lf4/f;Lf4/f;Lf4/f;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Landroid/hardware/display/DisplayManager;",
            ">;",
            "Lf4/f<",
            "Landroid/content/Context;",
            ">;",
            "Lf4/f<",
            "Landroid/os/Handler;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LE2/d;->a:Lf4/f;

    .line 5
    .line 6
    iput-object p2, p0, LE2/d;->b:Lf4/f;

    .line 7
    .line 8
    iput-object p3, p0, LE2/d;->c:Lf4/f;

    .line 9
    .line 10
    return-void
.end method

.method public static a(Lf4/f;Lf4/f;Lf4/f;)LE2/d;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lf4/f<",
            "Landroid/hardware/display/DisplayManager;",
            ">;",
            "Lf4/f<",
            "Landroid/content/Context;",
            ">;",
            "Lf4/f<",
            "Landroid/os/Handler;",
            ">;)",
            "LE2/d;"
        }
    .end annotation

    .line 1
    new-instance v0, LE2/d;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2}, LE2/d;-><init>(Lf4/f;Lf4/f;Lf4/f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static c(Landroid/hardware/display/DisplayManager;Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)LE2/c;
    .locals 1

    .line 1
    new-instance v0, LE2/c;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1, p2, p3}, LE2/c;-><init>(Landroid/hardware/display/DisplayManager;Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public b(Landroid/os/Handler;)LE2/c;
    .locals 2

    .line 1
    iget-object v0, p0, LE2/d;->a:Lf4/f;

    .line 2
    .line 3
    invoke-interface {v0}, Lg4/a;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/hardware/display/DisplayManager;

    .line 8
    .line 9
    iget-object v1, p0, LE2/d;->b:Lf4/f;

    .line 10
    .line 11
    invoke-interface {v1}, Lg4/a;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Landroid/content/Context;

    .line 16
    .line 17
    iget-object p0, p0, LE2/d;->c:Lf4/f;

    .line 18
    .line 19
    invoke-interface {p0}, Lg4/a;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/os/Handler;

    .line 24
    .line 25
    invoke-static {v0, v1, p0, p1}, LE2/d;->c(Landroid/hardware/display/DisplayManager;Landroid/content/Context;Landroid/os/Handler;Landroid/os/Handler;)LE2/c;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method
