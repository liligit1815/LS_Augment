.class public final LW1/l$d;
.super Ljava/lang/Object;
.source "AnimatorExtensions.kt"

# interfaces
.implements Ly/d$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LW1/l;->v(LW1/l$a;Lu4/a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic a:Lu4/a;

.field final synthetic b:LW1/z;

.field final synthetic c:LW1/l$a;


# direct methods
.method public constructor <init>(Lu4/a;LW1/z;LW1/l$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, LW1/l$d;->a:Lu4/a;

    .line 2
    .line 3
    iput-object p2, p0, LW1/l$d;->b:LW1/z;

    .line 4
    .line 5
    iput-object p3, p0, LW1/l$d;->c:LW1/l$a;

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
    .locals 1

    .line 1
    const-string v0, "animator"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LW1/l$d;->b:LW1/z;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, LW1/l$d;->c:LW1/l$a;

    .line 13
    .line 14
    sget-object v0, LW1/l$a;->g:LW1/l$a;

    .line 15
    .line 16
    if-ne p1, v0, :cond_0

    .line 17
    .line 18
    iget-object p0, p0, LW1/l$d;->b:LW1/z;

    .line 19
    .line 20
    invoke-virtual {p0}, LW1/z;->L()V

    .line 21
    .line 22
    .line 23
    :cond_0
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
    iget-object p0, p0, LW1/l$d;->a:Lu4/a;

    .line 7
    .line 8
    invoke-interface {p0}, Lu4/a;->invoke()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
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
