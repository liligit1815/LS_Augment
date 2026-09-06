.class final Landroidx/slice/widget/m$a;
.super Ljava/lang/Object;
.source "SliceView.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/m;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator<",
        "Lh0/d;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Lh0/d;Lh0/d;)I
    .locals 2

    .line 1
    invoke-interface {p1}, Lh0/d;->c()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-interface {p2}, Lh0/d;->c()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    const/4 p2, 0x0

    .line 10
    if-gez p0, :cond_0

    .line 11
    .line 12
    if-gez p1, :cond_0

    .line 13
    .line 14
    return p2

    .line 15
    :cond_0
    const/4 v0, 0x1

    .line 16
    if-gez p0, :cond_1

    .line 17
    .line 18
    return v0

    .line 19
    :cond_1
    const/4 v1, -0x1

    .line 20
    if-gez p1, :cond_2

    .line 21
    .line 22
    return v1

    .line 23
    :cond_2
    if-ge p1, p0, :cond_3

    .line 24
    .line 25
    return v0

    .line 26
    :cond_3
    if-le p1, p0, :cond_4

    .line 27
    .line 28
    return v1

    .line 29
    :cond_4
    return p2
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lh0/d;

    .line 2
    .line 3
    check-cast p2, Lh0/d;

    .line 4
    .line 5
    invoke-virtual {p0, p1, p2}, Landroidx/slice/widget/m$a;->a(Lh0/d;Lh0/d;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method
