.class public final Landroidx/lifecycle/b;
.super Ljava/lang/Object;
.source "CompositeGeneratedAdaptersObserver.jvm.kt"

# interfaces
.implements Landroidx/lifecycle/h;


# instance fields
.field private final g:[Landroidx/lifecycle/d;


# direct methods
.method public constructor <init>([Landroidx/lifecycle/d;)V
    .locals 1

    .line 1
    const-string v0, "generatedAdapters"

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
    iput-object p1, p0, Landroidx/lifecycle/b;->g:[Landroidx/lifecycle/d;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public b(LW/d;Landroidx/lifecycle/g$a;)V
    .locals 6

    .line 1
    const-string v0, "source"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    const-string v0, "event"

    .line 7
    .line 8
    invoke-static {p2, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    new-instance v0, LW/g;

    .line 12
    .line 13
    invoke-direct {v0}, LW/g;-><init>()V

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Landroidx/lifecycle/b;->g:[Landroidx/lifecycle/d;

    .line 17
    .line 18
    array-length v2, v1

    .line 19
    const/4 v3, 0x0

    .line 20
    move v4, v3

    .line 21
    :goto_0
    if-ge v4, v2, :cond_0

    .line 22
    .line 23
    aget-object v5, v1, v4

    .line 24
    .line 25
    invoke-interface {v5, p1, p2, v3, v0}, Landroidx/lifecycle/d;->a(LW/d;Landroidx/lifecycle/g$a;ZLW/g;)V

    .line 26
    .line 27
    .line 28
    add-int/lit8 v4, v4, 0x1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p0, p0, Landroidx/lifecycle/b;->g:[Landroidx/lifecycle/d;

    .line 32
    .line 33
    array-length v1, p0

    .line 34
    :goto_1
    if-ge v3, v1, :cond_1

    .line 35
    .line 36
    aget-object v2, p0, v3

    .line 37
    .line 38
    const/4 v4, 0x1

    .line 39
    invoke-interface {v2, p1, p2, v4, v0}, Landroidx/lifecycle/d;->a(LW/d;Landroidx/lifecycle/g$a;ZLW/g;)V

    .line 40
    .line 41
    .line 42
    add-int/lit8 v3, v3, 0x1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    return-void
.end method
