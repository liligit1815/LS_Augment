.class final Lo0/s$f;
.super Lkotlin/jvm/internal/p;
.source "ExtensionEmbeddingBackend.kt"

# interfaces
.implements Lu4/a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lo0/s;-><init>(Landroid/content/Context;Lo0/q;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/jvm/internal/p;",
        "Lu4/a<",
        "Lo0/C$b;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic h:Lo0/s;


# direct methods
.method constructor <init>(Lo0/s;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lo0/s$f;->h:Lo0/s;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/p;-><init>(I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public final a()Lo0/C$b;
    .locals 1

    .line 1
    iget-object v0, p0, Lo0/s$f;->h:Lo0/s;

    .line 2
    .line 3
    invoke-static {v0}, Lo0/s;->c(Lo0/s;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lo0/C$b;->d:Lo0/C$b;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    sget-object v0, Lo0/s$a;->a:Lo0/s$a;

    .line 13
    .line 14
    iget-object p0, p0, Lo0/s$f;->h:Lo0/s;

    .line 15
    .line 16
    invoke-static {p0}, Lo0/s;->d(Lo0/s;)Landroid/content/Context;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {v0, p0}, Lo0/s$a;->a(Landroid/content/Context;)Lo0/C$b;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    return-object p0
.end method

.method public bridge synthetic invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lo0/s$f;->a()Lo0/C$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
