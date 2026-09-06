.class final Lo0/i$b$e;
.super Lkotlin/jvm/internal/p;
.source "EmbeddingAdapter.kt"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lo0/i$b;->l(Landroid/content/Context;Lo0/H;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/l<",
        "Landroid/view/WindowMetrics;",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic h:Lo0/H;

.field final synthetic i:Landroid/content/Context;


# direct methods
.method constructor <init>(Lo0/H;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lo0/i$b$e;->h:Lo0/H;

    .line 2
    .line 3
    iput-object p2, p0, Lo0/i$b$e;->i:Landroid/content/Context;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public final a(Landroid/view/WindowMetrics;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "windowMetrics"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lo0/i$b$e;->h:Lo0/H;

    .line 7
    .line 8
    iget-object p0, p0, Lo0/i$b$e;->i:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {v0, p0, p1}, Lo0/H;->c(Landroid/content/Context;Landroid/view/WindowMetrics;)Z

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Landroid/view/WindowMetrics;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lo0/i$b$e;->a(Landroid/view/WindowMetrics;)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
