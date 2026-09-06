.class public final LV1/b$d;
.super Ljava/lang/Object;
.source "BubbleAnimator.kt"

# interfaces
.implements Ly/d$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LV1/b;->h(LV1/b$b;)Ly/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic a:LV1/b$b;

.field final synthetic b:LV1/b;


# direct methods
.method constructor <init>(LV1/b$b;LV1/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, LV1/b$d;->a:LV1/b$b;

    .line 2
    .line 3
    iput-object p2, p0, LV1/b$d;->b:LV1/b;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a(Ly/d;)V
    .locals 0

    .line 1
    const-string p0, "animation"

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
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, LV1/b$d;->b:LV1/b;

    .line 7
    .line 8
    sget-object v0, LV1/b$c$c;->a:LV1/b$c$c;

    .line 9
    .line 10
    invoke-static {p1, v0}, LV1/b;->b(LV1/b;LV1/b$c;)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, LV1/b$d;->a:LV1/b$b;

    .line 14
    .line 15
    invoke-interface {p0}, LV1/b$b;->b()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public d(Ly/d;)V
    .locals 0

    .line 1
    const-string p0, "animation"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g(Ly/d;)V
    .locals 1

    .line 1
    const-string v0, "animation"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, LV1/b$d;->a:LV1/b$b;

    .line 7
    .line 8
    invoke-interface {p0}, LV1/b$b;->a()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
