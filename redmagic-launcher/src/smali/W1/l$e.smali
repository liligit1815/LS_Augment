.class public final LW1/l$e;
.super Ljava/lang/Object;
.source "AnimatorExtensions.kt"

# interfaces
.implements Ly/d$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW1/l;->A(LW1/l$a;Lu4/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic a:Lu4/a;

.field final synthetic b:LW1/z;

.field final synthetic c:LW1/l;


# direct methods
.method public constructor <init>(Lu4/a;LW1/z;LW1/l;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW1/l$e;->a:Lu4/a;

    .line 2
    .line 3
    iput-object p2, p0, LW1/l$e;->b:LW1/z;

    .line 4
    .line 5
    iput-object p3, p0, LW1/l$e;->c:LW1/l;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a(Ly/d;)V
    .locals 0

    .line 1
    const-string p0, "animator"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public c(Ly/d;)V
    .locals 1

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LW1/l$e;->a:Lu4/a;

    .line 7
    .line 8
    invoke-interface {p1}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, LW1/l$e;->b:LW1/z;

    .line 12
    .line 13
    new-instance v0, LW1/l$f;

    .line 14
    .line 15
    iget-object p0, p0, LW1/l$e;->c:LW1/l;

    .line 16
    .line 17
    invoke-direct {v0, p0}, LW1/l$f;-><init>(LW1/l;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public d(Ly/d;)V
    .locals 0

    .line 1
    const-string p0, "animator"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Ly/d;)V
    .locals 0

    .line 1
    const-string p0, "animator"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
