.class final LC3/B$c;
.super Ljava/util/AbstractSet;
.source "LinkedTreeMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LC3/B;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic g:LC3/B;


# direct methods
.method constructor <init>(LC3/B;)V
    .locals 0

    .line 1
    iput-object p1, p0, LC3/B$c;->g:LC3/B;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .line 1
    iget-object p0, p0, LC3/B$c;->g:LC3/B;

    .line 2
    .line 3
    invoke-virtual {p0}, LC3/B;->clear()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public contains(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LC3/B$c;->g:LC3/B;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LC3/B;->containsKey(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TK;>;"
        }
    .end annotation

    .line 1
    new-instance v0, LC3/B$c$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, LC3/B$c$a;-><init>(LC3/B$c;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .locals 0

    .line 1
    iget-object p0, p0, LC3/B$c;->g:LC3/B;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, LC3/B;->g(Ljava/lang/Object;)LC3/B$e;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public size()I
    .locals 0

    .line 1
    iget-object p0, p0, LC3/B$c;->g:LC3/B;

    .line 2
    .line 3
    iget p0, p0, LC3/B;->j:I

    .line 4
    .line 5
    return p0
.end method
