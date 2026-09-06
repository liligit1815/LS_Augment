.class public abstract Lkotlin/jvm/internal/w;
.super Lkotlin/jvm/internal/y;
.source "PropertyReference1.java"

# interfaces
.implements LB4/k;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lkotlin/jvm/internal/y;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 2
    invoke-direct {p0, p1}, Lkotlin/jvm/internal/y;-><init>(Ljava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0

    .line 3
    invoke-direct/range {p0 .. p5}, Lkotlin/jvm/internal/y;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method protected computeReflected()LB4/b;
    .locals 0

    .line 1
    invoke-static {p0}, Lkotlin/jvm/internal/D;->f(Lkotlin/jvm/internal/w;)LB4/k;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getDelegate(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lkotlin/jvm/internal/y;->getReflected()LB4/i;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, LB4/k;

    .line 6
    .line 7
    invoke-interface {p0, p1}, LB4/k;->getDelegate(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public bridge synthetic getGetter()LB4/i$a;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lkotlin/jvm/internal/w;->getGetter()LB4/k$a;

    const/4 p0, 0x0

    return-object p0
.end method

.method public getGetter()LB4/k$a;
    .locals 0

    .line 2
    invoke-virtual {p0}, Lkotlin/jvm/internal/y;->getReflected()LB4/i;

    move-result-object p0

    check-cast p0, LB4/k;

    invoke-interface {p0}, LB4/k;->getGetter()LB4/k$a;

    const/4 p0, 0x0

    return-object p0
.end method

.method public invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-interface {p0, p1}, LB4/k;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
