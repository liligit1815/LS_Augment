.class Landroidx/fragment/app/n$j;
.super Landroidx/fragment/app/n$n;
.source "Fragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/fragment/app/n;->prepareCallInternal(Ld/a;Lm/a;Lc/b;)Lc/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lm/a;

.field final synthetic b:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic c:Ld/a;

.field final synthetic d:Lc/b;

.field final synthetic e:Landroidx/fragment/app/n;


# direct methods
.method constructor <init>(Landroidx/fragment/app/n;Lm/a;Ljava/util/concurrent/atomic/AtomicReference;Ld/a;Lc/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/n$j;->e:Landroidx/fragment/app/n;

    .line 2
    .line 3
    iput-object p2, p0, Landroidx/fragment/app/n$j;->a:Lm/a;

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/fragment/app/n$j;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 6
    .line 7
    iput-object p4, p0, Landroidx/fragment/app/n$j;->c:Ld/a;

    .line 8
    .line 9
    iput-object p5, p0, Landroidx/fragment/app/n$j;->d:Lc/b;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-direct {p0, p1}, Landroidx/fragment/app/n$n;-><init>(Landroidx/fragment/app/n$b;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method a()V
    .locals 5

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/n$j;->e:Landroidx/fragment/app/n;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/fragment/app/n;->generateActivityResultKey()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Landroidx/fragment/app/n$j;->a:Lm/a;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-interface {v1, v2}, Lm/a;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Lc/d;

    .line 15
    .line 16
    iget-object v2, p0, Landroidx/fragment/app/n$j;->b:Ljava/util/concurrent/atomic/AtomicReference;

    .line 17
    .line 18
    iget-object v3, p0, Landroidx/fragment/app/n$j;->e:Landroidx/fragment/app/n;

    .line 19
    .line 20
    iget-object v4, p0, Landroidx/fragment/app/n$j;->c:Ld/a;

    .line 21
    .line 22
    iget-object p0, p0, Landroidx/fragment/app/n$j;->d:Lc/b;

    .line 23
    .line 24
    invoke-virtual {v1, v0, v3, v4, p0}, Lc/d;->i(Ljava/lang/String;LW/d;Ld/a;Lc/b;)Lc/c;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {v2, p0}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method
