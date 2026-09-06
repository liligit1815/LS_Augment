.class public final LW1/D;
.super Ljava/lang/Object;
.source "FlyoutScheduler.kt"

# interfaces
.implements LW1/B;


# instance fields
.field private final a:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "view"

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
    iput-object p1, p0, LW1/D;->a:Landroid/view/View;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic b(Lu4/a;)V
    .locals 0

    .line 1
    invoke-static {p0}, LW1/D;->c(Lu4/a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static final c(Lu4/a;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lu4/a;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lu4/a<",
            "Lh4/t;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "block"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LW1/D;->a:Landroid/view/View;

    .line 7
    .line 8
    new-instance v0, LW1/C;

    .line 9
    .line 10
    invoke-direct {v0, p1}, LW1/C;-><init>(Lu4/a;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 14
    .line 15
    .line 16
    return-void
.end method
