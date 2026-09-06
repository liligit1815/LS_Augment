.class LO/a$b;
.super Ljava/lang/Object;
.source "ExploreByTouchHelper.java"

# interfaces
.implements LO/b$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LO/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "LO/b$b<",
        "Lo/s<",
        "LK/d;",
        ">;",
        "LK/d;",
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
.method public bridge synthetic a(Ljava/lang/Object;I)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Lo/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, LO/a$b;->c(Lo/s;I)LK/d;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic b(Ljava/lang/Object;)I
    .locals 0

    .line 1
    check-cast p1, Lo/s;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LO/a$b;->d(Lo/s;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public c(Lo/s;I)LK/d;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lo/s<",
            "LK/d;",
            ">;I)",
            "LK/d;"
        }
    .end annotation

    .line 1
    invoke-virtual {p1, p2}, Lo/s;->l(I)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, LK/d;

    .line 6
    .line 7
    return-object p0
.end method

.method public d(Lo/s;)I
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lo/s<",
            "LK/d;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Lo/s;->k()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method
